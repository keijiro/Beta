Shader "Beta/KodeEmitter Opaque"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Metallic("Metallic", Range(0, 1)) = 0
        _Smoothness("Smoothness", Range(0, 1)) = 0
        _Emission("Emission Amplitude", Float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM

        #pragma surface surf Standard nolightmap
        #pragma target 3.0

        #include "Common.cginc"

        struct Input
        {
            float3 worldPos;
        };

        fixed4 _Color;
        half _Metallic;
        half _Smoothness;
        half _Emission;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;
            o.Emission = SampleKodeLifeOutput(IN.worldPos) * _Emission;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
