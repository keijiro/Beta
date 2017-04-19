Shader "Beta/Wall"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Texture", 2D) = "white" {}
        _Metallic("Metallic", Range(0, 1)) = 0
        _Smoothness("Smoothness", Range(0, 1)) = 0
        _Emission("Emission", Float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM

        #pragma surface surf Standard
        #pragma target 3.0

        struct Input { float3 worldPos; };

        fixed4 _Color;

        sampler2D _MainTex;
        float4 _MainTex_ST;

        half _Metallic;
        half _Smoothness;
        half _Emission;


        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;

            float2 uv = IN.worldPos.xy * _MainTex_ST.xy + 0.5;
            o.Emission = tex2D(_MainTex, uv).rgb * _Emission;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
