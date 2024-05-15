// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Toon/Toon"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector][Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 2
		[DE_DrawerCategory(ALPHA CLIPPING,true,_GlancingClipMode,0,0)]_CATEGORY_ALPHACLIPPING("CATEGORY_ALPHACLIPPING", Float) = 0
		[DE_DrawerToggleLeft]_GlancingClipMode("Enable Clip Glancing Angle", Float) = 0
		[DE_DrawerSliderSimple(_AlphaRemapMin, _AlphaRemapMax,0, 1)]_AlphaRemap("Alpha Remapping", Vector) = (0,1,0,0)
		[HideInInspector]_AlphaRemapMin("AlphaRemapMin", Float) = 0
		[HideInInspector]_AlphaRemapMax("AlphaRemapMax", Float) = 1
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.5
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_ALPHACLIP("SPACE_ALPHACLIP", Float) = 0
		[DE_DrawerCategory(COLOR,true,_BaseColor,0,0)]_CATEGORY_COLOR("CATEGORY_COLOR", Float) = 1
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_BaseColorSaturation("Saturation", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_COLOR("SPACE_COLOR", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(UV0 _UV1 _UV2 _UV3)]_UVMode("UV Mode", Float) = 0
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine][Space(10)]_BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 0
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(SPECULAR,true,_SpecularEnable,0,0)]_CATEGORY_SPECULAR("CATEGORY_SPECULAR", Float) = 0
		[DE_DrawerToggleLeft]_SpecularEnable("ENABLE SPECULAR", Float) = 0
		[HDR]_SpecularColor("Specular Color", Color) = (0.06666667,0.06666667,0.05882353,0)
		[DE_DrawerFloatEnum(Default _Dielectric _DielectricIOR)]_SpecularMode("Specular Mode", Float) = 3
		[DE_DrawerToggleLeft]_SpecularRound("Round", Float) = 0
		_SpecularWrapScale("Specular Wrap Scale", Range( 0 , 5)) = 0.85
		_SpecularWrapOffset("Specular Wrap Offset", Range( 0 , 3)) = 0
		_SpecularPower("Specular Power", Range( 0 , 35)) = 25
		_SpecularStrength("Specular Strength", Range( 0 , 15)) = 0.15
		_SpecularStrengthDielectric("Specular Strength Dielectric", Range( 0 , 1)) = 0
		_SpecularStrengthDielectricIOR("Specular Strength Dielectric IOR", Range( 1 , 2.5)) = 1.1
		[DE_DrawerSpace(10)]_SPACE_SPECULAR("SPACE_SPECULAR", Float) = 0
		[DE_DrawerCategory(DISSOLVE,true,_DissolveEnable,0,0)]_CATEGORY_DISSOLVE("CATEGORY_DISSOLVE", Float) = 0
		[DE_DrawerToggleLeft]_DissolveEnable("ENABLE DISSOLVE", Float) = 0
		[DE_DrawerTextureSingleLine]_DissolveMap("Dissolve Map", 2D) = "white" {}
		_DissolveScale("Dissolve Scale", Float) = 0
		_DissolveStrength("Dissolve Strength", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_DISSOLVE("SPACE_DISSOLVE", Float) = 0
		[DE_DrawerCategory(EMISSION,true,_EmissionEnable,0,0)]_CATEGORY_EMISSION("CATEGORY_EMISSION", Float) = 0
		[DE_DrawerToggleLeft]_EmissionEnable("ENABLE EMISSION", Float) = 0
		[DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
		[HDR][DE_DrawerTextureSingleLine]_EmissiveColorMap("Emissive Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensity("Emissive Intensity", Float) = 1
		_EmissiveRotation("Rotation", Float) = 0
		_EmissivePanningSpeedX("Panning Speed X", Float) = 0
		_EmissivePanningSpeedY("Panning Speed Y", Float) = 0
		[Space(10)][DE_DrawerToggleLeft]_EmissiveGlowEnable("ENABLE EMISSION GLOW", Float) = 0
		[HDR]_EmissiveGlowColor("Emissive Color Glow", Color) = (0,0,0,0)
		_EmissiveGlowIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerToggleLeft][Space(10)]_EmissiveMaskEnable("ENABLE EMISSION MASK", Float) = 0
		[HDR][DE_DrawerTextureSingleLine]_EmissiveMask("Emission Mask", 2D) = "black" {}
		[DE_DrawerTilingOffset]_EmissiveMaskUVs("EmissiveMask UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveMaskColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveMaskIntensity("Emissive Intensity", Float) = 1
		_EmissiveMaskRotation("Rotation", Float) = 0
		_EmissiveMaskPanningSpeedX("Panning Speed X", Float) = 0
		_EmissiveMaskPanningSpeedY("Panning Speed Y", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_EMISSION("SPACE_EMISSION", Float) = 0
		[DE_DrawerCategory(RIM LIGHT,true,_EnableRimLight,0,0)]_CATEGORY_RIMLIGHT("CATEGORY_RIMLIGHT", Float) = 0
		[DE_DrawerToggleLeft]_EnableRimLight("ENABLE RIM LIGHT", Float) = 0
		[DE_DrawerFloatEnum(World _Tangent)]_RimLightSpace("Rim Light Space", Float) = 1
		[HDR]_RimLightColor("Rim Light Color", Color) = (1,1,1,0)
		_RimLightIntensity("Rim Light Intensity", Float) = 1
		_RimLightThreshold("Rim Light Threshold", Range( 0 , 1)) = 0.1916215
		_RimLightSmoothing("Rim Light Smoothing", Range( 0 , 1)) = 0.3809822
		[DE_DrawerToggleLeft][Space(10)]_EnableRimLightNoise("ENABLE RIM LIGHT NOISE", Float) = 1
		[DE_DrawerTextureSingleLine]_RimLightNoiseNoiseMap("Rim Light Noise Map", 2D) = "white" {}
		[HDR]_RimLightNoiseColor("Rim Light Noise Color", Color) = (0.5424528,1,0.909801,0)
		_RimLightNoiseIntensity("Rim Light Noise Intensity", Float) = 1
		_RimLightNoiseStrength("Rim Light Noise Strength", Range( 0 , 2)) = 1
		[DE_DrawerSpace(10)]_SPACE_RIMLIGHT("SPACE_RIMLIGHT", Float) = 0
		[DE_DrawerCategory(TOON RAMP,true,_ToonMapRampEnable,0,0)]_CATEGORY_TOONRAMP("CATEGORY_TOONRAMP", Float) = 0
		[DE_DrawerToggleLeft]_ToonMapRampEnable("ENABLE TOON RAMP", Float) = 0
		[DE_DrawerTextureSingleLine]_ToonMapRamp("Toon Map", 2D) = "white" {}
		_ToonMapRampStrength("Strength", Range( 0 , 1)) = 0.1
		_ToonMapRampSaturation("Saturation", Range( 0 , 1)) = 0
		_ToonMapRampSmoothness("Smoothness", Range( 0 , 1)) = 0.65
		_ToonMapRampWrapScale("Wrap Scale", Float) = 0.5
		_ToonMapRampWrapOffset("Wrap Offset", Float) = 0.5
		_ToonMapRampSharpness("Sharpness", Range( 0.01 , 5)) = 1.5
		_ToonMapRampOffset("Offset", Range( 0 , 1)) = 0.1
		[DE_DrawerSpace(10)]_SPACE_TOONRAMP("SPACE_TOONRAMP", Float) = 0
		[DE_DrawerCategory(TOON MATCAP,true,_ToonMatCapEnable,0,0)]_CATEGORY_TOONMATCAP("CATEGORY_TOON MATCAP", Float) = 0
		[DE_DrawerToggleLeft]_ToonMatCapEnable("ENABLE TOON MATCAP", Float) = 0
		[DE_DrawerTextureSingleLine]_ToonMatCapMap("Toon Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(World _Tangent)]_ToonMatCapNormalSpace("Normal Space", Float) = 0
		_ToonMatCapColor("Color", Color) = (1,1,1,0)
		_ToonMatCapBrightness("Brightness", Range( 0 , 2)) = 1
		_ToonMatCapSaturation("Saturation", Range( 0 , 1)) = 0
		_ToonMatCapSmoothness("Smoothness", Range( 0 , 1)) = 0.65
		_ToonMatCapSharpness("Sharpness", Range( 0.01 , 5)) = 3
		_ToonMatCapOffset("Offset", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_TOONMAP("SPACE_TOONMAP", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(LIGHTING,true,_ShadowStrength,0,0)]_CATEGORY_LIGHTING("CATEGORY_LIGHTING", Float) = 0
		[Header(INDIRECT SPECULAR)][Space(5)]_IndirectSpecularColor("Indirect Specular Color", Color) = (1,0.9568627,0.8392157,0)
		_IndirectSpecularSmoothness("Indirect Specular Smoothness", Range( 0 , 1)) = 0.07062837
		[Header(INDIRECT DIFFUSE)][Space(5)]_IndirectDiffuse("Indirect Diffuse", Range( 0 , 1)) = 0.85
		[Header(SHADOWS)]_ShadowStrength("Shadow Strength", Range( 0 , 1)) = 0.65
		[DE_DrawerFloatEnum(Near _Exact)]_ShadowApproxmation("Shadow Approxmation", Float) = 1
		_ShadowSharpness("Shadow Sharpness", Range( 0.01 , 1)) = 0.7
		_ShadowOffset("Shadow Offset", Range( 0 , 1)) = 0.05
		[DE_DrawerToggleLeft]_ShadowColorEnable("Enable Shadow Color", Float) = 0
		[HDR]_ShadowColor("Shadow Color", Color) = (0.3113208,0.3113208,0.3113208,0)
		[DE_DrawerSpace(10)]_SPACE_LIGHTING("SPACE_LIGHTING", Float) = 0


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Unlit" }

		Cull [_Cull]
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile _ _FORWARD_PLUS


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ToonMapRamp);
			SAMPLER(sampler_ToonMapRamp);
			TEXTURE2D(_ToonMatCapMap);
			SAMPLER(sampler_ToonMatCapMap);
			TEXTURE2D(_RimLightNoiseNoiseMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
			TEXTURE2D(_EmissiveMask);
			SAMPLER(sampler_EmissiveMask);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			float3 _NormalModefloat3switch( float m_switch, float3 m_Flip, float3 m_Mirror, float3 m_None )
			{
				if(m_switch ==0)
					return m_Flip;
				else if(m_switch ==1)
					return m_Mirror;
				else if(m_switch ==2)
					return m_None;
				else
				return float3(0,0,0);
			}
			
			half4 CalculateShadowMask497_g59015( half2 LightmapUV )
			{
				#if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
				half4 shadowMask = inputData.shadowMask;
				#elif !defined (LIGHTMAP_ON)
				half4 shadowMask = unity_ProbesOcclusion;
				#else
				half4 shadowMask = half4(1, 1, 1, 1);
				#endif
				return shadowMask;
			}
			
			float3 AdditionalLightsHalfLambertMask14x( float3 WorldPosition, float2 ScreenUV, float3 WorldNormal, float4 ShadowMask )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					#define SUM_LIGHTHALFLAMBERT(Light)\
						half3 AttLightColor = Light.color * ( Light.distanceAttenuation * Light.shadowAttenuation );\
						Color += ( dot( Light.direction, WorldNormal ) * 0.5 + 0.5 )* AttLightColor;
					InputData inputData = (InputData)0;
					inputData.normalizedScreenSpaceUV = ScreenUV;
					inputData.positionWS = WorldPosition;
					uint meshRenderingLayers = GetMeshRenderingLayer();
					uint pixelLightCount = GetAdditionalLightsCount();	
					#if USE_FORWARD_PLUS
					for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
					{
						FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTHALFLAMBERT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTHALFLAMBERT( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			float3 ASEBakedGI( float3 normalWS, float2 uvStaticLightmap, bool applyScaling )
			{
			#ifdef LIGHTMAP_ON
				if( applyScaling )
					uvStaticLightmap = uvStaticLightmap * unity_LightmapST.xy + unity_LightmapST.zw;
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float SpecularModefloatswitch112_g58989( float m_switch, float m_Default, float m_Dielectric, float m_DielectricIOR )
			{
				if(m_switch ==0)
					return m_Default;
				else if(m_switch ==1)
					return m_Dielectric;
				else if(m_switch ==2)
					return m_DielectricIOR;
				else
				return float(0);
			}
			
			float3 AdditionalLightsSpecular14x( float3 WorldPosition, float2 ScreenUV, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					Smoothness = exp2(10 * Smoothness + 1);
					
					#define SUM_LIGHTSPECULAR(Light)\
						half3 AttLightColor = light.color * ( light.distanceAttenuation * light.shadowAttenuation );\
						Color += LightingSpecular( AttLightColor, light.direction, WorldNormal, WorldView, half4( SpecColor, 0 ), Smoothness );	
					InputData inputData = (InputData)0;
					inputData.normalizedScreenSpaceUV = ScreenUV;
					inputData.positionWS = WorldPosition;
					uint meshRenderingLayers = GetMeshRenderingLayer();		
					uint pixelLightCount = GetAdditionalLightsCount();	
					#if USE_FORWARD_PLUS
					for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
					{
						FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTSPECULAR( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTSPECULAR( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord4.xy = vertexToFrag258_g58588;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				float4 _NoiseUV = float4(2,2,0,0);
				float2 appendResult211_g58814 = (float2(-0.1 , 0.1));
				float2 vertexToFrag213_g58814 = ( ( v.ase_texcoord.xy * (_NoiseUV).xy ) + ( (_NoiseUV).zw + ( _TimeParameters.x * appendResult211_g58814 ) ) );
				o.ase_texcoord8.zw = vertexToFrag213_g58814;
				float temp_output_767_0_g58588 = radians( _EmissiveRotation );
				float temp_output_712_0_g58588 = cos( temp_output_767_0_g58588 );
				float2 _Anchor = float2(0.5,0.5);
				float2 break716_g58588 = ( v.ase_texcoord.xy - _Anchor );
				float temp_output_731_0_g58588 = sin( temp_output_767_0_g58588 );
				float2 appendResult707_g58588 = (float2(( ( temp_output_712_0_g58588 * break716_g58588.x ) + ( temp_output_731_0_g58588 * break716_g58588.y ) ) , ( ( temp_output_712_0_g58588 * break716_g58588.y ) - ( temp_output_731_0_g58588 * break716_g58588.x ) )));
				float2 temp_output_718_0_g58588 = ( (_EmissiveUVs).xy / 1.0 );
				float2 appendResult722_g58588 = (float2(_EmissivePanningSpeedX , _EmissivePanningSpeedY));
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag737_g58588 = ( ( ( ( appendResult707_g58588 * temp_output_718_0_g58588 ) + _Anchor ) + ( (_EmissiveUVs).zw + ( _TimeParameters.x * appendResult722_g58588 ) ) ) - ( ( temp_output_718_0_g58588 * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag737_g58588;
				float temp_output_6_0_g58963 = _EmissiveMaskRotation;
				float temp_output_200_0_g58963 = radians( temp_output_6_0_g58963 );
				float temp_output_13_0_g58963 = cos( temp_output_200_0_g58963 );
				float2 temp_output_9_0_g58963 = float2( 0.5,0.5 );
				float2 break39_g58963 = ( v.ase_texcoord.xy - temp_output_9_0_g58963 );
				float temp_output_14_0_g58963 = sin( temp_output_200_0_g58963 );
				float2 appendResult36_g58963 = (float2(( ( temp_output_13_0_g58963 * break39_g58963.x ) + ( temp_output_14_0_g58963 * break39_g58963.y ) ) , ( ( temp_output_13_0_g58963 * break39_g58963.y ) - ( temp_output_14_0_g58963 * break39_g58963.x ) )));
				float2 Offset235_g58963 = (_EmissiveMaskUVs).zw;
				float Time63_g58963 = _TimeParameters.x;
				float2 appendResult201_g58963 = (float2(_EmissiveMaskPanningSpeedX , _EmissiveMaskPanningSpeedY));
				float2 temp_output_41_0_g58963 = ( ( ( appendResult36_g58963 * ( (_EmissiveMaskUVs).xy / 1.0 ) ) + temp_output_9_0_g58963 ) + ( Offset235_g58963 + ( Time63_g58963 * appendResult201_g58963 ) ) );
				float2 vertexToFrag70_g58963 = ( temp_output_41_0_g58963 - ( ( ( (_EmissiveMaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.zw = vertexToFrag70_g58963;
				
				o.ase_texcoord4.zw = v.ase_texcoord2.xy;
				o.ase_texcoord8.xy = v.ase_texcoord1.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord10 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif

				o.positionCS = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 worldPosValue187_g59015 = WorldPosition;
				float3 WorldPosition446_g59015 = worldPosValue187_g59015;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g59015 = (ase_screenPosNorm).xy;
				float2 ScreenUV446_g59015 = ScreenUV190_g59015;
				float2 vertexToFrag258_g58588 = IN.ase_texcoord4.xy;
				float3 unpack656_g58588 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag258_g58588 ), _NormalStrength );
				unpack656_g58588.z = lerp( 1, unpack656_g58588.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58983 = unpack656_g58588;
				float temp_output_50_0_g58983 = _DoubleSidedNormalMode;
				float m_switch64_g58983 = temp_output_50_0_g58983;
				float3 m_Flip64_g58983 = float3(-1,-1,-1);
				float3 m_Mirror64_g58983 = float3(1,1,-1);
				float3 m_None64_g58983 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58983 = _NormalModefloat3switch( m_switch64_g58983 , m_Flip64_g58983 , m_Mirror64_g58983 , m_None64_g58983 );
				float3 switchResult58_g58983 = (((ase_vface>0)?(temp_output_24_0_g58983):(( temp_output_24_0_g58983 * local_NormalModefloat3switch64_g58983 ))));
				float3 Normal196_g58588 = switchResult58_g58983;
				float3 temp_output_33_0_g59011 = Normal196_g58588;
				float3 Normal552_g59011 = temp_output_33_0_g59011;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal183_g59015 = Normal552_g59011;
				float3 worldNormal183_g59015 = normalize( float3(dot(tanToWorld0,tanNormal183_g59015), dot(tanToWorld1,tanNormal183_g59015), dot(tanToWorld2,tanNormal183_g59015)) );
				float3 worldNormalValue184_g59015 = worldNormal183_g59015;
				float3 WorldNormal446_g59015 = worldNormalValue184_g59015;
				half2 LightmapUV497_g59015 = (IN.ase_texcoord4.zw*(unity_DynamicLightmapST).xy + (unity_DynamicLightmapST).zw);
				half4 localCalculateShadowMask497_g59015 = CalculateShadowMask497_g59015( LightmapUV497_g59015 );
				float4 shadowMaskValue180_g59015 = localCalculateShadowMask497_g59015;
				float4 ShadowMask446_g59015 = shadowMaskValue180_g59015;
				float3 localAdditionalLightsHalfLambertMask14x446_g59015 = AdditionalLightsHalfLambertMask14x( WorldPosition446_g59015 , ScreenUV446_g59015 , WorldNormal446_g59015 , ShadowMask446_g59015 );
				float3 SRP_Lambert_Half1358_g59011 = localAdditionalLightsHalfLambertMask14x446_g59015;
				float3 tanNormal1173_g59011 = Normal552_g59011;
				float3 worldNormal1173_g59011 = normalize( float3(dot(tanToWorld0,tanNormal1173_g59011), dot(tanToWorld1,tanNormal1173_g59011), dot(tanToWorld2,tanNormal1173_g59011)) );
				float2 UV1_Lightmap_Static_446_g58588 = (IN.ase_texcoord8.xy*(unity_LightmapST).xy + (unity_LightmapST).zw);
				float2 UV1_Lightmap_Static_1296_g59011 = UV1_Lightmap_Static_446_g58588;
				float2 UV2__Lightmap_Dynamic463_g58588 = (IN.ase_texcoord4.zw*(unity_DynamicLightmapST).xy + (unity_DynamicLightmapST).zw);
				float2 UV2__Lightmap_Dynamic1297_g59011 = UV2__Lightmap_Dynamic463_g58588;
				float3 bakedGI268_g59011 = ASEBakedGI( worldNormal1173_g59011, UV1_Lightmap_Static_1296_g59011, true);
				float3 lerpResult513_g59011 = lerp( float3( 1,1,1 ) , ( SRP_Lambert_Half1358_g59011 + bakedGI268_g59011 ) , _IndirectDiffuse);
				float3 temp_output_287_0_g59011 = ( lerpResult513_g59011 + step( float3( 1,1,1 ) , ( 1.0 - lerpResult513_g59011 ) ) );
				float3 tanNormal70_g58588 = Normal196_g58588;
				float3 worldNormal70_g58588 = normalize( float3(dot(tanToWorld0,tanNormal70_g58588), dot(tanToWorld1,tanNormal70_g58588), dot(tanToWorld2,tanNormal70_g58588)) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult56_g58588 = ASESafeNormalize( ( ase_worldViewDir + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult31_g58588 = dot( worldNormal70_g58588 , normalizeResult56_g58588 );
				float Dot_NdotH59_g58588 = dotResult31_g58588;
				float Dot_NdotH533_g59011 = Dot_NdotH59_g58588;
				float temp_output_472_0_g59011 = ( 1.0 - ( ( 1.0 - Dot_NdotH533_g59011 ) * _MainLightPosition.w ) );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float LightColorIntensity1306_g59011 = max( ase_lightColor.a , 0.0 );
				float3 temp_output_1307_0_g59011 = ( temp_output_287_0_g59011 * temp_output_472_0_g59011 * LightColorIntensity1306_g59011 );
				float Dot_NdotH15_g59013 = Dot_NdotH533_g59011;
				float dotResult39_g58588 = dot( worldNormal70_g58588 , SafeNormalize(_MainLightPosition.xyz) );
				float Dot_NdotL61_g58588 = dotResult39_g58588;
				float Dot_NdotL544_g59011 = Dot_NdotL61_g58588;
				float Dot_NdotL12_g59013 = Dot_NdotL544_g59011;
				float Shadow_Strength492_g59011 = ( _ShadowStrength + ( ( _CATEGORY_LIGHTING + _SPACE_LIGHTING ) * 0.0 ) );
				float lerpResult483_g59011 = lerp( ( Shadow_Strength492_g59011 * Shadow_Strength492_g59011 * 0.7978846 ) , ( Shadow_Strength492_g59011 * Shadow_Strength492_g59011 * sqrt( ( 2.0 / ( 2.0 * PI ) ) ) ) , _ShadowApproxmation);
				float temp_output_231_0_g59013 = lerpResult483_g59011;
				float temp_output_190_0_g59013 = ( ( max( Dot_NdotL12_g59013 , 0.0 ) * temp_output_231_0_g59013 ) + ( 1.0 - temp_output_231_0_g59013 ) );
				float temp_output_446_0_g59011 = saturate( ( ( ( max( Dot_NdotH15_g59013 , 0.0 ) * temp_output_190_0_g59013 * temp_output_190_0_g59013 ) + _ShadowOffset ) / _ShadowSharpness ) );
				float3 temp_cast_1 = (temp_output_446_0_g59011).xxx;
				float3 temp_cast_2 = (temp_output_446_0_g59011).xxx;
				float3 lerpResult1387_g59011 = lerp( (_ShadowColor).rgb , temp_cast_2 , temp_output_446_0_g59011);
				float3 lerpResult1394_g59011 = lerp( temp_cast_1 , lerpResult1387_g59011 , _ShadowColorEnable);
				float3 temp_cast_3 = (temp_output_472_0_g59011).xxx;
				float3 lerpResult450_g59011 = lerp( ( lerpResult1394_g59011 * Dot_NdotH533_g59011 ) , temp_cast_3 , ( _ShadowStrength + ( ( _CATEGORY_LIGHTING + _SPACE_LIGHTING ) * 0.0 ) ));
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float3 temp_output_117_0_g58588 = (tex2DNode72_g58588).rgb;
				float m_switch112_g58989 = _SpecularMode;
				float3 temp_output_143_0_g58990 = SafeNormalize(_MainLightPosition.xyz);
				float3 Normal_Raw1596_g58588 = unpack656_g58588;
				float3 tanNormal153_g58989 = Normal_Raw1596_g58588;
				float3 worldNormal153_g58989 = float3(dot(tanToWorld0,tanNormal153_g58989), dot(tanToWorld1,tanNormal153_g58989), dot(tanToWorld2,tanNormal153_g58989));
				float3 temp_output_144_0_g58990 = worldNormal153_g58989;
				float dotResult137_g58990 = dot( temp_output_143_0_g58990 , temp_output_144_0_g58990 );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult201_g58989 = dot( ( temp_output_143_0_g58990 - ( ( dotResult137_g58990 * 2.0 ) * temp_output_144_0_g58990 ) ) , -ase_worldViewDir );
				float temp_output_215_0_g58989 = max( saturate( dotResult201_g58989 ) , 0.0 );
				float lerpResult246_g58989 = lerp( temp_output_215_0_g58989 , round( temp_output_215_0_g58989 ) , _SpecularRound);
				float temp_output_54_0_g58989 = (lerpResult246_g58989*_SpecularWrapScale + _SpecularWrapOffset);
				float saferPower63_g58989 = abs( temp_output_54_0_g58989 );
				float temp_output_63_0_g58989 = pow( saferPower63_g58989 , _SpecularPower );
				float m_Default112_g58989 = ( temp_output_63_0_g58989 * _SpecularStrength );
				float temp_output_222_0_g58989 = ( temp_output_63_0_g58989 * 15.0 );
				float lerpResult102_g58989 = lerp( 0.034 , 0.048 , _SpecularStrengthDielectric);
				float m_Dielectric112_g58989 = ( temp_output_222_0_g58989 * lerpResult102_g58989 );
				float m_DielectricIOR112_g58989 = ( temp_output_222_0_g58989 * ( pow( ( _SpecularStrengthDielectricIOR - 1.0 ) , 2.0 ) / pow( ( _SpecularStrengthDielectricIOR + 1.0 ) , 2.0 ) ) );
				float localSpecularModefloatswitch112_g58989 = SpecularModefloatswitch112_g58989( m_switch112_g58989 , m_Default112_g58989 , m_Dielectric112_g58989 , m_DielectricIOR112_g58989 );
				float3 lerpResult80_g58989 = lerp( float3(0,0,0) , saturate( ( ( (_SpecularColor).rgb * ( ase_lightColor.rgb * max( ase_lightColor.a , 0.0 ) ) ) * localSpecularModefloatswitch112_g58989 ) ) , ( _SpecularEnable + ( ( _CATEGORY_SPECULAR + _SPACE_SPECULAR ) * 0.0 ) ));
				float3 temp_output_1620_32_g58588 = lerpResult80_g58989;
				float3 temp_output_112_0_g58588 = ( (_BaseColor).rgb * ( temp_output_117_0_g58588 + temp_output_1620_32_g58588 ) * _Brightness );
				float3 temp_output_12_0_g58982 = temp_output_112_0_g58588;
				float dotResult28_g58982 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58982 );
				float3 temp_cast_5 = (dotResult28_g58982).xxx;
				float temp_output_21_0_g58982 = ( 1.0 - _BaseColorSaturation );
				float3 lerpResult31_g58982 = lerp( temp_cast_5 , temp_output_12_0_g58982 , temp_output_21_0_g58982);
				float3 BaseColor330_g58588 = lerpResult31_g58982;
				float3 temp_output_218_0_g59011 = BaseColor330_g58588;
				float3 temp_output_467_0_g59011 = saturate( ( ( temp_output_1307_0_g59011 + lerpResult450_g59011 ) * temp_output_218_0_g59011 ) );
				float3 worldPosValue187_g59012 = WorldPosition;
				float3 WorldPosition449_g59012 = worldPosValue187_g59012;
				float2 ScreenUV190_g59012 = (ase_screenPosNorm).xy;
				float2 ScreenUV449_g59012 = ScreenUV190_g59012;
				float3 worldNormalValue184_g59012 = ase_worldViewDir;
				float3 WorldNormal449_g59012 = worldNormalValue184_g59012;
				float3 tanNormal1241_g59011 = Normal552_g59011;
				float3 worldNormal1241_g59011 = normalize( float3(dot(tanToWorld0,tanNormal1241_g59011), dot(tanToWorld1,tanNormal1241_g59011), dot(tanToWorld2,tanNormal1241_g59011)) );
				float3 temp_output_493_0_g59012 = worldNormal1241_g59011;
				float3 WorldView449_g59012 = temp_output_493_0_g59012;
				float3 temp_output_1215_0_g59011 = (_IndirectSpecularColor).rgb;
				float3 temp_output_89_0_g59012 = temp_output_1215_0_g59011;
				float3 SpecColor449_g59012 = temp_output_89_0_g59012;
				float temp_output_51_0_g59012 = _IndirectSpecularSmoothness;
				float Smoothness449_g59012 = temp_output_51_0_g59012;
				float3 localAdditionalLightsSpecular14x449_g59012 = AdditionalLightsSpecular14x( WorldPosition449_g59012 , ScreenUV449_g59012 , WorldNormal449_g59012 , WorldView449_g59012 , SpecColor449_g59012 , Smoothness449_g59012 );
				float3 LightColorAtten1165_g59011 = ( Dot_NdotH533_g59011 * ase_lightColor.rgb );
				float3 normalizeResult1218_g59011 = normalize( ( ase_worldViewDir + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult1198_g59011 = dot( normalizeResult1218_g59011 , worldNormal1241_g59011 );
				float3 temp_output_1210_0_g59011 = ( temp_output_1215_0_g59011 * LightColorAtten1165_g59011 * pow( max( dotResult1198_g59011 , 0.0 ) , exp2( (_IndirectSpecularSmoothness*10.0 + 1.0) ) ) );
				float3 temp_output_1223_0_g59011 = ( localAdditionalLightsSpecular14x449_g59012 + temp_output_1210_0_g59011 );
				float3 BaseColor1273_g59011 = temp_output_218_0_g59011;
				float3 switchResult1272_g59011 = (((ase_vface>0)?(( temp_output_1223_0_g59011 + 0.0 )):(BaseColor1273_g59011)));
				float fresnelNdotV1240_g59011 = dot( worldNormal1241_g59011, ase_worldViewDir );
				float fresnelNode1240_g59011 = ( 0.04 + _IndirectSpecularSmoothness * pow( 1.0 - fresnelNdotV1240_g59011, 5.0 ) );
				float3 lerpResult1233_g59011 = lerp( temp_output_467_0_g59011 , switchResult1272_g59011 , saturate( fresnelNode1240_g59011 ));
				float3 temp_output_49_0_g58995 = lerpResult1233_g59011;
				float2 temp_cast_6 = (( saturate( (Dot_NdotL61_g58588*_ToonMapRampWrapScale + _ToonMapRampWrapOffset) ) * saturate( ( ( Dot_NdotH59_g58588 + _ToonMapRampOffset ) / _ToonMapRampSharpness ) ) )).xx;
				float4 tex2DNode382_g58995 = SAMPLE_TEXTURE2D_LOD( _ToonMapRamp, sampler_ToonMapRamp, temp_cast_6, ( ( 1.0 - _ToonMapRampSmoothness ) * 10.0 ) );
				float3 temp_output_12_0_g58996 = ( (tex2DNode382_g58995).rgb * tex2DNode382_g58995.a );
				float dotResult28_g58996 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58996 );
				float3 temp_cast_7 = (dotResult28_g58996).xxx;
				float temp_output_21_0_g58996 = ( 1.0 - _ToonMapRampSaturation );
				float3 lerpResult31_g58996 = lerp( temp_cast_7 , temp_output_12_0_g58996 , temp_output_21_0_g58996);
				float3 blendOpSrc386_g58995 = temp_output_49_0_g58995;
				float3 blendOpDest386_g58995 = lerpResult31_g58996;
				float3 lerpBlendMode386_g58995 = lerp(blendOpDest386_g58995,(( blendOpDest386_g58995 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest386_g58995 ) * ( 1.0 - blendOpSrc386_g58995 ) ) : ( 2.0 * blendOpDest386_g58995 * blendOpSrc386_g58995 ) ),( 1.0 - _ToonMapRampStrength ));
				float3 lerpResult156_g58995 = lerp( temp_output_49_0_g58995 , ( saturate( lerpBlendMode386_g58995 )) , ( _ToonMapRampEnable + ( ( _CATEGORY_TOONRAMP + _SPACE_TOONRAMP ) * 0.0 ) ));
				float3 temp_output_49_0_g58998 = lerpResult156_g58995;
				float3 _ViewDir = float3(0,1,0);
				float dotResult396_g58998 = dot( _ViewDir , ase_worldViewDir );
				float3 normalizeResult393_g58998 = normalize( ( _ViewDir - ( dotResult396_g58998 * ase_worldViewDir ) ) );
				float3 normalizeResult391_g58998 = normalize( cross( ase_worldViewDir , normalizeResult393_g58998 ) );
				float3 worldToViewDir187_g58998 = ASESafeNormalize( mul( UNITY_MATRIX_V, float4( ase_worldNormal, 0 ) ).xyz );
				float3 temp_output_52_0_g58998 = Normal196_g58588;
				float3 Normal164_g58998 = temp_output_52_0_g58998;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir320_g58998 = ASESafeNormalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, Normal164_g58998 ), 0 ) ).xyz );
				float3 normalizeResult226_g58998 = normalize( tangentToViewDir320_g58998 );
				float3 lerpResult402_g58998 = lerp( worldToViewDir187_g58998 , normalizeResult226_g58998 , _ToonMatCapNormalSpace);
				float dotResult389_g58998 = dot( normalizeResult391_g58998 , lerpResult402_g58998 );
				float dotResult390_g58998 = dot( normalizeResult393_g58998 , lerpResult402_g58998 );
				float2 appendResult403_g58998 = (float2(dotResult389_g58998 , dotResult390_g58998));
				float2 break312_g58998 = appendResult403_g58998;
				float2 appendResult314_g58998 = (float2(( break312_g58998.y * -1.0 ) , break312_g58998.x));
				float2 UV_Legacy_Standard425_g58998 = ( ( appendResult314_g58998 * float2( 0.5,0.5 ) ) + float2( 0.5,0.5 ) );
				float3 tanNormal28_g58999 = temp_output_52_0_g58998;
				float3 worldNormal28_g58999 = normalize( float3(dot(tanToWorld0,tanNormal28_g58999), dot(tanToWorld1,tanNormal28_g58999), dot(tanToWorld2,tanNormal28_g58999)) );
				float3 normalizeResult20_g58999 = ASESafeNormalize( ( SafeNormalize(_MainLightPosition.xyz) + ase_worldViewDir ) );
				float dotResult13_g58999 = dot( worldNormal28_g58999 , normalizeResult20_g58999 );
				float4 tex2DNode382_g58998 = SAMPLE_TEXTURE2D_LOD( _ToonMatCapMap, sampler_ToonMatCapMap, ( UV_Legacy_Standard425_g58998 * saturate( ( ( dotResult13_g58999 + _ToonMatCapOffset ) / _ToonMatCapSharpness ) ) ), ( ( 1.0 - _ToonMatCapSmoothness ) * 10.0 ) );
				float3 temp_output_12_0_g59000 = ( (_ToonMatCapColor).rgb * (tex2DNode382_g58998).rgb * tex2DNode382_g58998.a * _ToonMatCapBrightness );
				float dotResult28_g59000 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g59000 );
				float3 temp_cast_8 = (dotResult28_g59000).xxx;
				float temp_output_21_0_g59000 = ( 1.0 - _ToonMatCapSaturation );
				float3 lerpResult31_g59000 = lerp( temp_cast_8 , temp_output_12_0_g59000 , temp_output_21_0_g59000);
				float3 lerpResult156_g58998 = lerp( temp_output_49_0_g58998 , saturate( ( temp_output_49_0_g58998 + lerpResult31_g59000 ) ) , ( _ToonMatCapEnable + ( ( _CATEGORY_TOONMATCAP + _SPACE_TOONMAP ) * 0.0 ) ));
				float3 temp_output_188_0_g58814 = lerpResult156_g58998;
				float3 temp_output_232_0_g58814 = (_RimLightColor).rgb;
				float3 temp_output_370_0_g58814 = ( temp_output_232_0_g58814 * _RimLightIntensity );
				float3 temp_cast_9 = (0.01).xxx;
				float3 tanNormal229_g58814 = Normal196_g58588;
				float3 worldNormal229_g58814 = float3(dot(tanToWorld0,tanNormal229_g58814), dot(tanToWorld1,tanNormal229_g58814), dot(tanToWorld2,tanNormal229_g58814));
				float3 BaseColor360_g58814 = temp_output_188_0_g58814;
				float3 lerpResult359_g58814 = lerp( ase_worldNormal , worldNormal229_g58814 , BaseColor360_g58814);
				float3 lerpResult357_g58814 = lerp( ase_worldNormal , lerpResult359_g58814 , _RimLightSpace);
				float dotResult223_g58814 = dot( lerpResult357_g58814 , ase_worldViewDir );
				float smoothstepResult222_g58814 = smoothstep( _RimLightThreshold , ( _RimLightThreshold + _RimLightSmoothing ) , dotResult223_g58814);
				float3 temp_output_234_0_g58814 = (float3( 0,0,0 ) + (step( temp_cast_9 , ( (IN.ase_color).rgb * ( 1.0 - smoothstepResult222_g58814 ) ) ) - float3( 0,0,0 )) * (float3( 0.05,0.05,0.05 ) - float3( 0,0,0 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 lerpResult194_g58814 = lerp( temp_output_188_0_g58814 , temp_output_370_0_g58814 , temp_output_234_0_g58814);
				float fresnelNdotV216_g58814 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode216_g58814 = ( 0.0 + 1.6 * pow( 1.0 - fresnelNdotV216_g58814, 2.0 ) );
				float3 temp_output_201_0_g58814 = (_RimLightNoiseColor).rgb;
				float3 temp_output_378_0_g58814 = ( temp_output_201_0_g58814 * _RimLightNoiseIntensity );
				float2 vertexToFrag213_g58814 = IN.ase_texcoord8.zw;
				float3 _Rim_Light_Noise333_g58814 = ( fresnelNode216_g58814 * temp_output_378_0_g58814 * (float3( 0,0,0 ) + ((SAMPLE_TEXTURE2D( _RimLightNoiseNoiseMap, sampler_MainTex, vertexToFrag213_g58814 )).rgb - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( 0,0,0 )) / (float3( 0.5,0.5,0.5 ) - float3( 0,0,0 ))) * _RimLightNoiseStrength );
				float3 lerpResult245_g58814 = lerp( lerpResult194_g58814 , ( lerpResult194_g58814 + _Rim_Light_Noise333_g58814 ) , _EnableRimLightNoise);
				float3 lerpResult247_g58814 = lerp( temp_output_188_0_g58814 , lerpResult245_g58814 , ( _EnableRimLight + ( ( _CATEGORY_RIMLIGHT + _SPACE_RIMLIGHT ) * 0.0 ) ));
				float3 Specular321_g58588 = temp_output_1620_32_g58588;
				float2 vertexToFrag737_g58588 = IN.ase_texcoord9.xy;
				float3 temp_output_701_0_g58588 = (_EmissiveColor).rgb;
				float3 temp_output_740_0_g58588 = ( temp_output_701_0_g58588 * _EmissiveIntensity );
				float3 temp_output_705_0_g58588 = ( (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, vertexToFrag737_g58588 )).rgb * temp_output_740_0_g58588 );
				float2 vertexToFrag70_g58963 = IN.ase_texcoord9.zw;
				float2 temp_output_1625_0_g58588 = vertexToFrag70_g58963;
				float3 temp_output_1648_0_g58588 = (_EmissiveMaskColor).rgb;
				float3 temp_output_1647_0_g58588 = ( temp_output_1648_0_g58588 * _EmissiveMaskIntensity );
				float3 lerpResult1654_g58588 = lerp( temp_output_705_0_g58588 , ( temp_output_705_0_g58588 + ( (SAMPLE_TEXTURE2D( _EmissiveMask, sampler_EmissiveMask, temp_output_1625_0_g58588 )).rgb * temp_output_1647_0_g58588 ) ) , _EmissiveMaskEnable);
				float3 temp_output_743_0_g58588 = (_EmissiveGlowColor).rgb;
				float3 temp_output_744_0_g58588 = ( temp_output_743_0_g58588 * _EmissiveGlowIntensity );
				float3 tanNormal761_g58588 = Normal196_g58588;
				float fresnelNdotV761_g58588 = dot( float3(dot(tanToWorld0,tanNormal761_g58588), dot(tanToWorld1,tanNormal761_g58588), dot(tanToWorld2,tanNormal761_g58588)), ase_worldViewDir );
				float fresnelNode761_g58588 = ( 0.0 + 0.17 * pow( max( 1.0 - fresnelNdotV761_g58588 , 0.0001 ), 5.0 ) );
				float3 lerpResult757_g58588 = lerp( lerpResult1654_g58588 , temp_output_744_0_g58588 , fresnelNode761_g58588);
				float3 lerpResult752_g58588 = lerp( lerpResult1654_g58588 , lerpResult757_g58588 , _EmissiveGlowEnable);
				float3 Emission754_g58588 = lerpResult752_g58588;
				float3 lerpResult779_g58588 = lerp( ( lerpResult247_g58814 + Specular321_g58588 ) , ( ( lerpResult247_g58814 + Specular321_g58588 ) + Emission754_g58588 ) , ( _EmissionEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION + _EmissionFlags ) * 0.0 ) ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 temp_output_95_0_g58973 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_11 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord10.xyz, IN.ase_normal, 1.0, temp_cast_11, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ( lerpResult779_g58588 * ase_lightAtten );
				float Alpha = temp_output_853_12_g58588;
				float AlphaClipThreshold = lerpResult139_g58588;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.positionCS, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord2.xy = vertexToFrag258_g58588;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord4 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir( v.normalOS );

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag258_g58588 = IN.ase_texcoord2.xy;
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 temp_output_95_0_g58973 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_1 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord4.xyz, IN.ase_normal, 1.0, temp_cast_1, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				

				float Alpha = temp_output_853_12_g58588;
				float AlphaClipThreshold = lerpResult139_g58588;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord2.xy = vertexToFrag258_g58588;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord4 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag258_g58588 = IN.ase_texcoord2.xy;
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 temp_output_95_0_g58973 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_1 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord4.xyz, IN.ase_normal, 1.0, temp_cast_1, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				

				float Alpha = temp_output_853_12_g58588;
				float AlphaClipThreshold = lerpResult139_g58588;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord.xy = vertexToFrag258_g58588;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_texcoord3 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 vertexToFrag258_g58588 = IN.ase_texcoord.xy;
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58973 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_1 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord3.xyz, IN.ase_normal, 1.0, temp_cast_1, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				

				surfaceDescription.Alpha = temp_output_853_12_g58588;
				surfaceDescription.AlphaClipThreshold = lerpResult139_g58588;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord.xy = vertexToFrag258_g58588;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_texcoord3 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 vertexToFrag258_g58588 = IN.ase_texcoord.xy;
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58973 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_1 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord3.xyz, IN.ase_normal, 1.0, temp_cast_1, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				

				surfaceDescription.Alpha = temp_output_853_12_g58588;
				surfaceDescription.AlphaClipThreshold = lerpResult139_g58588;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			float4 _EmissiveMaskUVs;
			half4 _BaseColor;
			half4 _SpecularColor;
			float4 _AlphaRemap;
			half4 _EmissiveGlowColor;
			float4 _RimLightNoiseColor;
			float4 _IndirectSpecularColor;
			float4 _ShadowColor;
			half4 _EmissiveMaskColor;
			float4 _ToonMatCapColor;
			float4 _RimLightColor;
			half4 _EmissiveColor;
			float4 _EmissiveUVs;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			int _Cull;
			float _EnableRimLight;
			float _SPACE_RIMLIGHT;
			float _CATEGORY_RIMLIGHT;
			float _EnableRimLightNoise;
			float _RimLightNoiseStrength;
			half _RimLightNoiseIntensity;
			float _RimLightSpace;
			float _RimLightSmoothing;
			float _RimLightThreshold;
			half _RimLightIntensity;
			float _SPACE_TOONMAP;
			half _EmissiveRotation;
			half _EmissiveIntensity;
			half _EmissiveMaskPanningSpeedY;
			half _EmissiveMaskPanningSpeedX;
			float _CATEGORY_DISSOLVE;
			half _DissolveEnable;
			float _DissolveScale;
			float _DissolveStrength;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _EmissionFlags;
			float _SPACE_EMISSION;
			float _CATEGORY_EMISSION;
			float _EmissionEnable;
			half _EmissiveGlowEnable;
			half _EmissiveGlowIntensity;
			half _EmissiveMaskEnable;
			half _EmissiveMaskIntensity;
			float _CATEGORY_TOONMATCAP;
			half _EmissiveMaskRotation;
			half _ToonMatCapEnable;
			half _ToonMatCapSharpness;
			half _ToonMatCapBrightness;
			half _SpecularWrapScale;
			float _SpecularRound;
			half _SpecularMode;
			float _ShadowColorEnable;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowApproxmation;
			float _SPACE_LIGHTING;
			float _CATEGORY_LIGHTING;
			half _SpecularWrapOffset;
			half _ShadowStrength;
			half _DoubleSidedNormalMode;
			half _NormalStrength;
			float _UVMode;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS;
			float _IndirectDiffuse;
			half _SpecularPower;
			half _SpecularStrength;
			half _SpecularStrengthDielectric;
			float _ToonMatCapSmoothness;
			float _SPACE_DISSOLVE;
			half _ToonMatCapOffset;
			float _ToonMatCapNormalSpace;
			float _SPACE_TOONRAMP;
			float _CATEGORY_TOONRAMP;
			half _ToonMapRampEnable;
			float _ToonMapRampStrength;
			float _ToonMapRampSaturation;
			float _ToonMapRampSmoothness;
			half _ToonMapRampSharpness;
			half _ToonMapRampOffset;
			float _ToonMapRampWrapOffset;
			float _ToonMapRampWrapScale;
			half _IndirectSpecularSmoothness;
			float _BaseColorSaturation;
			half _Brightness;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			float _ToonMatCapSaturation;
			half _AlphaCutoffBiasShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_DissolveMap);
			SAMPLER(sampler_DissolveMap);


			float2 float2switchUVMode265_g58588( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			
			inline float4 TriplanarSampling101_g58588( TEXTURE2D(topTexMap), SAMPLER(samplertopTexMap), float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = SAMPLE_TEXTURE2D( topTexMap, samplertopTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch265_g58588 = _UVMode;
				float2 m_UV0265_g58588 = v.ase_texcoord.xy;
				float2 m_UV1265_g58588 = v.ase_texcoord1.xy;
				float2 m_UV2265_g58588 = v.ase_texcoord2.xy;
				float2 m_UV3265_g58588 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode265_g58588 = float2switchUVMode265_g58588( m_switch265_g58588 , m_UV0265_g58588 , m_UV1265_g58588 , m_UV2265_g58588 , m_UV3265_g58588 );
				float2 vertexToFrag258_g58588 = ( ( localfloat2switchUVMode265_g58588 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.xy = vertexToFrag258_g58588;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord2.xyz = ase_worldPos;
				
				o.ase_texcoord3 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.normalOS);

				o.positionCS = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 vertexToFrag258_g58588 = IN.ase_texcoord1.xy;
				float4 tex2DNode72_g58588 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag258_g58588 );
				float temp_output_22_0_g58969 = tex2DNode72_g58588.a;
				float temp_output_22_0_g58971 = temp_output_22_0_g58969;
				float3 ase_worldPos = IN.ase_texcoord2.xyz;
				float3 temp_output_95_0_g58973 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58973 = normalize( temp_output_95_0_g58973 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58969 = dot( normalizeResult96_g58973 , ase_worldViewDir );
				float temp_output_76_0_g58969 = ( 1.0 - abs( dotResult74_g58969 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58969 = 1.0;
				#else
				float staticSwitch281_g58969 = ( 1.0 - ( temp_output_76_0_g58969 * temp_output_76_0_g58969 ) );
				#endif
				float lerpResult80_g58969 = lerp( 1.0 , staticSwitch281_g58969 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58969 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58971 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58971 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58969 );
				float temp_output_853_12_g58588 = temp_output_98_0_g58969;
				
				float temp_output_853_11_g58588 = _AlphaCutoffBias;
				float2 temp_cast_1 = (( _DissolveScale * ( 1.0 - _DissolveStrength ) )).xx;
				float4 triplanar101_g58588 = TriplanarSampling101_g58588( _DissolveMap, sampler_DissolveMap, IN.ase_texcoord3.xyz, IN.ase_normal, 1.0, temp_cast_1, 1.0, 0 );
				float smoothstepResult99_g58588 = smoothstep( _DissolveStrength , 1.0 , saturate( (triplanar101_g58588.x*0.5 + 0.5) ));
				float Dissolve110_g58588 = smoothstepResult99_g58588;
				float temp_output_1116_0_g58588 = ( _DissolveEnable + ( ( _CATEGORY_DISSOLVE + _SPACE_DISSOLVE ) * 0.0 ) );
				float lerpResult139_g58588 = lerp( temp_output_853_11_g58588 , ( temp_output_853_11_g58588 * Dissolve110_g58588 ) , temp_output_1116_0_g58588);
				

				surfaceDescription.Alpha = temp_output_853_12_g58588;
				surfaceDescription.AlphaClipThreshold = lerpResult139_g58588;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(IN.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = IN.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "DE_ShaderGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/DE/Utility/Fallback"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.IntNode;461;1408,-720;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;645;1024,-640;Inherit;False;DESF Core Unlit;1;;58588;3944efaa362116b4f940e5ea065ac456;27,671,0,682,0,688,0,684,0,681,0,669,0,1642,0,1353,0,1513,0,868,1,1613,0,125,1,1162,1,146,1,355,1,334,1,1487,1,1606,1,284,1,1500,0,1584,0,780,1,1658,1,753,1,1375,0,1374,0,332,1;0;4;FLOAT3;370;FLOAT;186;FLOAT;185;FLOAT;187
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;635;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;636;1408,-640;Float;False;True;-1;2;DE_ShaderGUI;0;13;DE Environment/Toon/Toon;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;21;Surface;0;0;  Blend;0;0;Two Sided;1;0;Forward Only;1;638324975706614806;Cast Shadows;1;0;  Use Shadow Threshold;1;638324975421067585;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Meta Pass;0;638324990093878231;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;True;True;False;False;True;True;True;False;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;637;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;638;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;639;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;640;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;641;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;642;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;643;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;644;1408,-640;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
WireConnection;636;2;645;370
WireConnection;636;3;645;186
WireConnection;636;4;645;185
WireConnection;636;7;645;187
ASEEND*/
//CHKSM=6C88C0102E95EA11A20BE1F966B083890B05F76B