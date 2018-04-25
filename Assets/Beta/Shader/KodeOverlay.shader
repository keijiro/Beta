Shader "Hidden/Beta/KodeOverlay"
{
    Properties
    {
        _MainTex("", 2D) = "white" {}
        _TextColor("", Color) = (1, 1, 1)
    }

    CGINCLUDE

    #include "Common.cginc"

    sampler2D _MainTex;
    half3 _TextColor;
    half _RenderOpacity;
    half _RenderThreshold;

    half4 frag(v2f_img i) : SV_Target
    {
        const half code_bg = 0.089;

        half3 code = tex2D(_MainTex, i.uv).rgb;
        code = (code - code_bg) / (1 - code_bg) * 1.25;
        code = _TextColor * saturate(max(max(code.r, code.g), code.b));

        half3 render = tex2D(_KodeLife_MainTex, i.uv).rgb;
        render = saturate(render - _RenderThreshold) / (1 - _RenderThreshold);
        render *= _RenderOpacity;

        half dither = (uvrand(i.uv + frac(_Time.y)) - 0.5) / 255;

        return half4(code + render + dither, 1);
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
