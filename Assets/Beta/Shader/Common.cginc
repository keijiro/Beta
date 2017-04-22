#include "UnityCG.cginc"

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

float cnoise(float p)
{
    float ip = floor(p);
    float fp = frac(p);
    float d0 = phash(ip    ) *  fp;
    float d1 = phash(ip + 1) * (fp - 1);
    return lerp(d0, d1, fade(fp));
}

sampler2D _KodeLife_MainTex;
float3 _KodeLife_Params;

half3 SampleKodeLifeOutput(float3 wpos)
{
    float2 uv = wpos.xy * _KodeLife_Params.xy + 0.5;
    return tex2D(_KodeLife_MainTex, uv).rgb * _KodeLife_Params.z;
}
