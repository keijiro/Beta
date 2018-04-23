Shader "Hidden/Beta/Scanner"
{
    Properties
    {
        _Color("", Color) = (1, 1, 1)
    }

    CGINCLUDE

    #include "Common.cginc"

    half3 _Color;
    half _Scale;

    half4 frag(v2f_img i) : SV_Target
    {
        float s = _Scale / abs(ddy(i.uv.y));

        float4 x = i.uv.y + _Time.y * float4(1009, 883, 743, 677) / 1949;

        float4 c = saturate(1 - abs(1 - frac(x) * s));

        return half4(_Color * dot(c, 1), 1);
    }

    ENDCG

    SubShader
    {
        Cull Off
        ZWrite Off
        ZTest Always
        Blend One One
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }
}
