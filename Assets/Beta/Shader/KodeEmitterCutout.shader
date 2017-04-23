Shader "Beta/KodeEmitter Cutout"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Metallic("Metallic", Range(0, 1)) = 0
        _Smoothness("Smoothness", Range(0, 1)) = 0
        _Emission("Emission Amplitude", Float) = 1
        _Cutoff("Alpha Cutoff", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="TransparentCutout" "Queue"="AlphaTest" }

        CGPROGRAM

        #pragma surface surf Standard alphatest:_Cutoff addshadow nolightmap
        #pragma target 3.0

        #include "Common.cginc"

        struct Input
        {
            float3 worldPos;
            half vface : VFACE;
        };

        fixed4 _Color;
        half _Metallic;
        half _Smoothness;
        half _Emission;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            half3 kode = SampleKodeLifeOutput(IN.worldPos);
            o.Albedo = _Color.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;
            o.Normal = float3(0, 0, IN.vface < 0 ? -1 : 1);
            o.Emission = kode * _Emission;
            o.Alpha = max(max(max(kode.r, kode.g), kode.b), 0.01);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
