Shader "Hidden/Beta/CodeOverlay"
{
    Properties
    {
        _MainTex("", 2D) = "white" {}
        _CodeTex("", 2D) = "black" {}
        _Color("", Color) = (1, 1, 1, 1)
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    sampler2D _MainTex;
    sampler2D _CodeTex;
    half4 _Color;
    half _Noise;

    float rand(float2 uv)
    {
        return frac(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453);
    }

    float fade(float x)
    {
        return x * x * x * (x * (x * 6 - 15) + 10);
    }

    float phash(float p)
    {
        p = frac(7.8233139 * p);
        p = ((2384.2345 * p - 1324.3438) * p + 3884.2243) * p - 4921.2354;
        return frac(p) * 2 - 1;
    }

    float gnoise(float p)
    {
        float ip = floor(p);
        float fp = frac(p);
        float d0 = phash(ip    ) *  fp;
        float d1 = phash(ip + 1) * (fp - 1);
        return lerp(d0, d1, fade(fp));
    }

    half4 frag(v2f_img i) : SV_Target
    {
        float y = i.uv.y;
        float t = _Time.y;

        // Make noise with sparse slow noise x dense fast noise.
        float d1 = gnoise(y - t);
        float d2 = gnoise(y * 200 - t * 100);
        float2 offs = float2((d1 * d2) * _Noise, 0);

        // Anti-aliased scrolling canlines.
        half scan = saturate(abs(0.5 - frac(i.pos.y / 4 + t * 77)) * 4 - 0.5);

        // Texture samples.
        half4 c1 = tex2D(_MainTex, i.uv);
        half4 c2 = tex2D(_CodeTex, i.uv + offs);

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
