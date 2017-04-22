Shader "Hidden/Beta/KodeOverlay"
{
    Properties
    {
        _MainTex("", 2D) = "white" {}
        _KodeTex("", 2D) = "black" {}
        _Color("", Color) = (1, 1, 1, 1)
    }

    CGINCLUDE

    #include "Common.cginc"

    sampler2D _MainTex;
    sampler2D _KodeTex;
    half4 _Color;
    half _Noise;

    half4 frag(v2f_img i) : SV_Target
    {
        float y = i.uv.y;
        float t = _Time.y;

        // Make noise with sparse slow noise x dense fast noise.
        float d1 = cnoise(y - t);
        float d2 = cnoise(y * 200 - t * 100);
        float2 offs = float2((d1 * d2) * _Noise, 0);

        // Anti-aliased scrolling canlines.
        half scan = saturate(abs(0.5 - frac(i.pos.y / 4 + t * 77)) * 4 - 0.5);

        // Texture samples.
        half4 c1 = tex2D(_MainTex, i.uv);
        half4 c2 = tex2D(_KodeTex, i.uv + offs);

        // Apply effects to c2.
        half br = saturate(dot(saturate(c2.rgb - 0.1), _Color.a));
        half3 rgb = _Color.rgb * br * scan;

        return half4(c1.rgb + rgb, c1.a);
    }

    ENDCG

    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }
}
