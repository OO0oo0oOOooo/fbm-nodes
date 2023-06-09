#ifndef FBMNODES_HLSL
#define FBMNODES_HLSL

#include "FractalBrownianMotion.hlsl"

void FBM_float(float2 uv, float2 offset, float octaves, float freq, float amp, float lacunarity, float gain, out float Out)
{
    Out = FractalBrownianMotion(uv, offset, octaves, freq, amp, lacunarity, gain);
}

void DomainWarp_float(float2 uv, float warpStrength, float2 offset, float octaves, float freq, float amp, float lacunarity, float gain, out float Out)
{
    float xOffset = FractalBrownianMotion(float2(uv.x + 0, uv.y + 0), offset, octaves, freq, amp, lacunarity, gain);
    float yOffset = FractalBrownianMotion(float2(uv.x + 5.2, uv.y + 2.4), offset, octaves, freq, amp, lacunarity, gain);

    Out = FractalBrownianMotion(float2(uv.x + warpStrength * xOffset, uv.y + warpStrength * yOffset), offset, octaves, freq, amp, lacunarity, gain);
}
#endif