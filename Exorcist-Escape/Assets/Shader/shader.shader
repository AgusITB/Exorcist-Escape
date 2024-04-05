Shader "Custom/LightColorShaderURP"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _SecondTex("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _LightColor ("Light Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        HLSLPROGRAM
        #pragma surface surf Standard fullforwardshadows

        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 texColor = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = texColor.rgb * _LightColor.rgb;
            o.Alpha = texColor.a;
        }
        ENDHLSL
    }
    FallBack "Diffuse"
}