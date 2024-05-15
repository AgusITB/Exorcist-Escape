// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/DE Environment/Terrain/Standard AddPass"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Header(SURFACE OPTIONS)][DE_DrawerTextureSingleLine]_GlobalTerrainNoise("Global Terrain Noise", 2D) = "white" {}
		_Global_Brightness("Global Brightness", Range( 0 , 2)) = 0.95
		[Toggle(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)] _EnableInstancedPerPixelNormal("Enable Instanced Per-Pixel Normal", Float) = 0
		_TerrainWetnessBiasGlobal("Terrain Wetness Bias Global", Range( 0 , 1)) = 0
		_TerrainWetnessIntensity("Terrain Wetness Intensity", Float) = 0.95
		_TerrainWetnessMask("Terrain Wetness Mask", Float) = 0.75
		[DE_DrawerToggleNoKeyword]_TerrainWetnessAffectLayer4("Affect Layer 4", Float) = 0
		[DE_DrawerToggleNoKeyword]_TerrainWetnessAffectLayer5("Affect Layer 5", Float) = 0
		[DE_DrawerToggleNoKeyword]_TerrainWetnessAffectLayer6("Affect Layer 6", Float) = 0
		[DE_DrawerToggleNoKeyword]_TerrainWetnessAffectLayer7("Affect Layer 7", Float) = 0
		[HideInInspector]_Control("Control", 2D) = "white" {}
		[HideInInspector]_Splat0("Splat0", 2D) = "white" {}
		[HideInInspector]_Normal0("Normal0", 2D) = "bump" {}
		[HideInInspector]_Mask0("Mask0", 2D) = "white" {}
		_Splat0_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[HideInInspector]_Splat1("Splat1", 2D) = "white" {}
		[HideInInspector]_Normal1("Normal1", 2D) = "bump" {}
		[HideInInspector]_Mask1("Mask1", 2D) = "white" {}
		_Splat1_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[HideInInspector]_Splat2("Splat2", 2D) = "white" {}
		[HideInInspector]_Normal2("Normal2", 2D) = "bump" {}
		[HideInInspector]_Mask2("Mask2", 2D) = "white" {}
		_Splat2_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[HideInInspector]_Splat3("Splat3", 2D) = "white" {}
		[HideInInspector]_Normal3("Normal3", 2D) = "bump" {}
		[HideInInspector]_Mask3("Mask3", 2D) = "white" {}
		_Splat3_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[Header(LAYER 4)]_Splat4_Color("Tint", Color) = (1,1,1,0)
		_Splat4_Brightness("Brightness", Range( 0 , 2)) = 1
		_Splat4_NormalScale("Normal Strength", Float) = 1
		_Splat4_Metallic("Metallic Strength", Range( 0 , 1)) = 0
		_Splat4_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		_Splat4_Saturation("Saturation", Range( 0 , 1)) = 1
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_Splat4_SmoothnessType("Smoothness Source", Float) = 0
		_Splat4_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_Splat4_EnableNoise("Enable Noise", Float) = 0
		[DE_DrawerToggleNoKeyword]_Splat4_NoiseInvert("Noise Invert", Float) = 0
		_Splat4_NoiseScale("Noise Scale", Range( 0 , 10)) = 2
		_Splat4_NoiseDarken("Noise Darken", Range( 0 , 1)) = 0.75
		[Header(LAYER 5)]_Splat5_Color("Tint", Color) = (1,1,1,0)
		_Splat5_Brightness("Brightness", Range( 0 , 2)) = 1
		_Splat5_NormalScale("Normal Strength", Float) = 1
		_Splat5_Metallic("Metallic Strength", Range( 0 , 1)) = 0
		_Splat5_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		_Splat5_Saturation("Saturation", Range( 0 , 1)) = 1
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_Splat5_SmoothnessType("Smoothness Source", Float) = 0
		_Splat5_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_Splat5_EnableNoise("Enable Noise", Float) = 0
		[DE_DrawerToggleNoKeyword]_Splat5_NoiseInvert("Noise Invert", Float) = 0
		_Splat5_NoiseScale("Noise Scale", Range( 0 , 10)) = 2
		_Splat5_NoiseDarken("Noise Darken", Range( 0 , 1)) = 0.75
		[Header(LAYER 6)]_Splat6_Color("Tint", Color) = (1,1,1,0)
		_Splat6_Brightness("Brightness", Range( 0 , 2)) = 1
		_Splat6_NormalScale("Normal Strength", Float) = 1
		_Splat6_Metallic("Metallic Strength", Range( 0 , 1)) = 0
		_Splat6_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		_Splat6_Saturation("Saturation", Range( 0 , 1)) = 1
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_Splat6_SmoothnessType("Smoothness Source", Float) = 0
		_Splat6_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_Splat6_EnableNoise("Enable Noise", Float) = 0
		[DE_DrawerToggleNoKeyword]_Splat6_NoiseInvert("Noise Invert", Float) = 0
		_Splat6_NoiseScale("Noise Scale", Range( 0 , 10)) = 2
		_Splat6_NoiseDarken("Noise Darken", Range( 0 , 1)) = 0.75
		[Header(LAYER 7)]_Splat7_Color("Tint", Color) = (1,1,1,0)
		_Splat7_Brightness("Brightness", Range( 0 , 2)) = 1
		_Splat7_NormalScale("Normal Strength", Float) = 1
		_Splat7_Metallic("Metallic Strength", Range( 0 , 1)) = 0
		_Splat7_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		_Splat7_Saturation("Saturation", Range( 0 , 1)) = 1
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_Splat7_SmoothnessType("Smoothness Source", Float) = 0
		_Splat7_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_Splat7_EnableNoise("Enable Noise", Float) = 0
		[DE_DrawerToggleNoKeyword]_Splat7_NoiseInvert("Noise Invert", Float) = 0
		_Splat7_NoiseScale("Noise Scale", Range( 0 , 10)) = 2
		_Splat7_NoiseDarken("Noise Darken", Range( 0 , 1)) = 0.75
		[Header(COVER MAP)]_CoverMapTint("Cover Map Tint", Color) = (1,1,1,0)
		_CoverMapBrightness("Brightness", Range( 0 , 5)) = 1.25
		[DE_DrawerTextureSingleLine]_CoverMapAlbedo("Cover Map Albedo", 2D) = "white" {}
		[Normal][DE_DrawerTextureSingleLine]_CoverMapNormal("Cover Map Normal", 2D) = "bump" {}
		_CoverMapNormalStrength("Normal Strength", Range( 0 , 2)) = 1
		[DE_DrawerToggleNoKeyword]_CoverMapAffectL4("Affect Layer 4", Float) = 0
		_CoverMapRangeL4("Range", Range( 0 , 1)) = 0.75
		_CoverMapFuzzinessL4("Fuzziness", Range( 0 , 1)) = 0.5
		[DE_DrawerToggleNoKeyword]_CoverMapAffectL5("Affect Layer 5", Float) = 0
		_CoverMapRangeL5("Range", Range( 0 , 1)) = 0.75
		_CoverMapFuzzinessL5("Fuzziness", Range( 0 , 1)) = 0.5
		[DE_DrawerToggleNoKeyword]_CoverMapAffectL6("Affect Layer 6", Float) = 0
		_CoverMapRangeL6("Range", Range( 0 , 1)) = 0.75
		_CoverMapFuzzinessL6("Fuzziness", Range( 0 , 1)) = 0.5
		[DE_DrawerToggleNoKeyword]_CoverMapAffectL7("Affect Layer 7", Float) = 0
		_CoverMapRangeL7("Range", Range( 0 , 1)) = 0.75
		_CoverMapFuzzinessL7("Fuzziness", Range( 0 , 1)) = 0.5
		[HideInInspector]_TerrainHolesTexture("_TerrainHolesTexture", 2D) = "white" {}
		[Header(BASEPASS)][DE_DrawerToggleNoKeyword]_EnableBasePassCoverMap("Enable BasePass Cover Map", Float) = 1
		_BasePassBrightness("BasePass Brightness", Range( 0 , 2)) = 1
		_BasePassSmoothness("BasePass Smoothness", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent-99" "UniversalMaterialType"="Lit" "TerrainCompatible"="True" "IgnoreProjector"="True" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
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

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" "TerrainCompatible"="True" "IgnoreProjector"="True" }

			Blend One One, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS

			
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
		

			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS
		
			

			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			
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

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _TERRAIN_INSTANCED_PERPIXEL_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float4 ase_texcoord12 : TEXCOORD12;
				float4 ase_texcoord13 : TEXCOORD13;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			TEXTURE2D(_Splat0);
			SAMPLER(sampler_Splat0);
			half _GlobalWetnessTerrainIntensity;
			float _GlobalWetnessTerrainEnabled;
			TEXTURE2D(_CoverMapAlbedo);
			TEXTURE2D(_GlobalTerrainNoise);
			TEXTURE2D(_Splat1);
			TEXTURE2D(_Splat2);
			TEXTURE2D(_Splat3);
			TEXTURE2D(_TerrainHolesTexture);
			SAMPLER(sampler_TerrainHolesTexture);
			TEXTURE2D(_Normal0);
			SAMPLER(sampler_Normal0);
			TEXTURE2D(_CoverMapNormal);
			TEXTURE2D(_Normal1);
			TEXTURE2D(_Normal2);
			TEXTURE2D(_Normal3);
			TEXTURE2D(_Mask0);
			SAMPLER(sampler_Mask0);
			TEXTURE2D(_Mask1);
			TEXTURE2D(_Mask2);
			TEXTURE2D(_Mask3);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			half4 CalculateShadowMask497_g58848( half2 LightmapUV )
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
			
			float3 AdditionalLightsFlatMask14x( float3 WorldPosition, float2 ScreenUV, float4 ShadowMask )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					#define SUM_LIGHTFLAT(Light)\
						Color += Light.color * ( Light.distanceAttenuation * Light.shadowAttenuation );
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
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				v = ApplyMeshModification(v);
				float4 appendResult10975_g45716 = (float4(cross( v.normalOS , float3(0,0,1) ) , -1.0));
				
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord8.xy = vertexToFrag27_g58045;
				float2 Offset235_g58046 = _Splat0_ST.zw;
				float2 temp_output_41_0_g58046 = ( ( v.texcoord.xy * _Splat0_ST.xy ) + Offset235_g58046 );
				float2 vertexToFrag70_g58046 = temp_output_41_0_g58046;
				o.ase_texcoord8.zw = vertexToFrag70_g58046;
				float2 Offset235_g45976 = float2( 1,0 );
				float2 temp_output_41_0_g45976 = ( ( v.texcoord.xy * float2( 1,1 ) ) + Offset235_g45976 );
				float2 vertexToFrag70_g45976 = temp_output_41_0_g45976;
				o.ase_texcoord9.xy = vertexToFrag70_g45976;
				float temp_output_23_0_g58193 = _Splat4_NoiseScale;
				float2 appendResult3_g58193 = (float2(temp_output_23_0_g58193 , temp_output_23_0_g58193));
				float2 vertexToFrag81_g58193 = ( v.texcoord.xy * appendResult3_g58193 );
				o.ase_texcoord9.zw = vertexToFrag81_g58193;
				float2 Offset235_g58082 = _Splat1_ST.zw;
				float2 temp_output_41_0_g58082 = ( ( v.texcoord.xy * _Splat1_ST.xy ) + Offset235_g58082 );
				float2 vertexToFrag70_g58082 = temp_output_41_0_g58082;
				o.ase_texcoord10.xy = vertexToFrag70_g58082;
				float temp_output_34_0_g58193 = _Splat5_NoiseScale;
				float2 appendResult30_g58193 = (float2(temp_output_34_0_g58193 , temp_output_34_0_g58193));
				float2 vertexToFrag83_g58193 = ( v.texcoord.xy * appendResult30_g58193 );
				o.ase_texcoord10.zw = vertexToFrag83_g58193;
				float2 Offset235_g58064 = _Splat2_ST.zw;
				float2 temp_output_41_0_g58064 = ( ( v.texcoord.xy * _Splat2_ST.xy ) + Offset235_g58064 );
				float2 vertexToFrag70_g58064 = temp_output_41_0_g58064;
				o.ase_texcoord11.xy = vertexToFrag70_g58064;
				float temp_output_50_0_g58193 = _Splat6_NoiseScale;
				float2 appendResult43_g58193 = (float2(temp_output_50_0_g58193 , temp_output_50_0_g58193));
				float2 vertexToFrag85_g58193 = ( v.texcoord.xy * appendResult43_g58193 );
				o.ase_texcoord11.zw = vertexToFrag85_g58193;
				float2 Offset235_g58100 = _Splat3_ST.zw;
				float2 temp_output_41_0_g58100 = ( ( v.texcoord.xy * _Splat3_ST.xy ) + Offset235_g58100 );
				float2 vertexToFrag70_g58100 = temp_output_41_0_g58100;
				o.ase_texcoord12.xy = vertexToFrag70_g58100;
				float temp_output_63_0_g58193 = _Splat7_NoiseScale;
				float2 appendResult56_g58193 = (float2(temp_output_63_0_g58193 , temp_output_63_0_g58193));
				float2 vertexToFrag87_g58193 = ( v.texcoord.xy * appendResult56_g58193 );
				o.ase_texcoord12.zw = vertexToFrag87_g58193;
				
				o.ase_texcoord13.xy = v.texcoord.xy;
				o.ase_texcoord13.zw = v.texcoord2.xy;

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
				v.tangentOS = appendResult10975_g45716;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 vertexToFrag27_g58045 = IN.ase_texcoord8.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				float localSplatClip1046_g45716 = ( dotResult1044_g45716 );
				float SplatWeight1046_g45716 = dotResult1044_g45716;
				{
				#if !defined(SHADER_API_MOBILE) && defined(TERRAIN_SPLAT_ADDPASS)
				clip(SplatWeight1046_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				float4 temp_output_1048_0_g45716 = ( tex2DNode3739_g45716 / ( localSplatClip1046_g45716 + 0.001 ) );
				float4 Control00Weight403_g45716 = temp_output_1048_0_g45716;
				float2 vertexToFrag70_g58046 = IN.ase_texcoord8.zw;
				float2 temp_output_6_0_g58294 = vertexToFrag70_g58046;
				float3 temp_output_10901_32_g45716 = (SAMPLE_TEXTURE2D( _Splat0, sampler_Splat0, temp_output_6_0_g58294 )).rgb;
				float3 SPLAT_0_FINAL2805_g45716 = temp_output_10901_32_g45716;
				float3 temp_output_3375_0_g45716 = ( (_Splat4_Color).rgb * SPLAT_0_FINAL2805_g45716 * _Splat4_Brightness );
				float3 temp_output_12_0_g58224 = temp_output_3375_0_g45716;
				float dotResult28_g58224 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58224 );
				float3 temp_cast_1 = (dotResult28_g58224).xxx;
				float temp_output_21_0_g58224 = ( 1.0 - _Splat4_Saturation );
				float3 lerpResult31_g58224 = lerp( temp_cast_1 , temp_output_12_0_g58224 , temp_output_21_0_g58224);
				float3 temp_output_11_0_g58025 = lerpResult31_g58224;
				float3 temp_output_12_0_g58026 = temp_output_11_0_g58025;
				float dotResult28_g58026 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58026 );
				float3 temp_cast_2 = (dotResult28_g58026).xxx;
				float temp_output_21_0_g58026 = 1.5;
				float3 lerpResult31_g58026 = lerp( temp_cast_2 , temp_output_12_0_g58026 , temp_output_21_0_g58026);
				float3 temp_output_4_0_g58025 = ( saturate( lerpResult31_g58026 ) * 0.2 );
				float lerpResult23_g58025 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58025 = lerp( _TerrainWetnessIntensity , lerpResult23_g58025 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58025 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58025 = lerp( temp_output_11_0_g58025 , temp_output_4_0_g58025 , saturate( ( saturate( max( 0.0 , lerpResult22_g58025 ) ) * temp_output_29_0_g58025 ) ));
				float temp_output_38_0_g58025 = _TerrainWetnessAffectLayer4;
				float3 lerpResult9_g58025 = lerp( temp_output_11_0_g58025 , lerpResult6_g58025 , temp_output_38_0_g58025);
				float2 vertexToFrag70_g45976 = IN.ase_texcoord9.xy;
				float2 temp_output_189_0_g45972 = vertexToFrag70_g45976;
				float3 temp_output_11_0_g45972 = ( (_CoverMapTint).rgb * (SAMPLE_TEXTURE2D( _CoverMapAlbedo, sampler_Splat0, temp_output_189_0_g45972 )).rgb * _CoverMapBrightness );
				float3 CoverMap_Albedo8425_g45716 = temp_output_11_0_g45972;
				float3 temp_output_27_0_g58188 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58188 = lerpResult9_g58025;
				float3 lerpResult29_g58188 = lerp( temp_output_27_0_g58188 , temp_output_28_0_g58188 , saturate( ( ( distance( temp_output_28_0_g58188 , temp_output_27_0_g58188 ) - _CoverMapRangeL4 ) / max( _CoverMapFuzzinessL4 , 1E-05 ) ) ));
				float3 temp_output_10877_20_g45716 = lerpResult29_g58188;
				float3 lerpResult8455_g45716 = lerp( lerpResult9_g58025 , temp_output_10877_20_g45716 , _CoverMapAffectL4);
				float3 temp_output_13_0_g58193 = lerpResult8455_g45716;
				float2 vertexToFrag81_g58193 = IN.ase_texcoord9.zw;
				float4 tex2DNode11_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag81_g58193 );
				float lerpResult71_g58193 = lerp( tex2DNode11_g58193.r , ( 1.0 - tex2DNode11_g58193.r ) , _Splat4_NoiseInvert);
				float3 lerpResult6_g58193 = lerp( temp_output_13_0_g58193 , ( temp_output_13_0_g58193 * ( 1.0 - _Splat4_NoiseDarken ) ) , lerpResult71_g58193);
				float3 lerpResult4_g58193 = lerp( temp_output_13_0_g58193 , lerpResult6_g58193 , _Splat4_EnableNoise);
				float2 vertexToFrag70_g58082 = IN.ase_texcoord10.xy;
				float2 temp_output_6_0_g58276 = vertexToFrag70_g58082;
				float3 temp_output_10898_32_g45716 = (SAMPLE_TEXTURE2D( _Splat1, sampler_Splat0, temp_output_6_0_g58276 )).rgb;
				float3 SPLAT_1_FINAL2809_g45716 = temp_output_10898_32_g45716;
				float3 temp_output_3633_0_g45716 = ( (_Splat5_Color).rgb * SPLAT_1_FINAL2809_g45716 * _Splat5_Brightness );
				float3 temp_output_12_0_g58225 = temp_output_3633_0_g45716;
				float dotResult28_g58225 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58225 );
				float3 temp_cast_3 = (dotResult28_g58225).xxx;
				float temp_output_21_0_g58225 = ( 1.0 - _Splat5_Saturation );
				float3 lerpResult31_g58225 = lerp( temp_cast_3 , temp_output_12_0_g58225 , temp_output_21_0_g58225);
				float3 temp_output_11_0_g58190 = lerpResult31_g58225;
				float3 temp_output_12_0_g58191 = temp_output_11_0_g58190;
				float dotResult28_g58191 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58191 );
				float3 temp_cast_4 = (dotResult28_g58191).xxx;
				float temp_output_21_0_g58191 = 1.5;
				float3 lerpResult31_g58191 = lerp( temp_cast_4 , temp_output_12_0_g58191 , temp_output_21_0_g58191);
				float3 temp_output_4_0_g58190 = ( saturate( lerpResult31_g58191 ) * 0.2 );
				float lerpResult23_g58190 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58190 = lerp( _TerrainWetnessIntensity , lerpResult23_g58190 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58190 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58190 = lerp( temp_output_11_0_g58190 , temp_output_4_0_g58190 , saturate( ( saturate( max( 0.0 , lerpResult22_g58190 ) ) * temp_output_29_0_g58190 ) ));
				float temp_output_38_0_g58190 = _TerrainWetnessAffectLayer5;
				float3 lerpResult9_g58190 = lerp( temp_output_11_0_g58190 , lerpResult6_g58190 , temp_output_38_0_g58190);
				float3 temp_output_27_0_g58186 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58186 = lerpResult9_g58190;
				float3 lerpResult29_g58186 = lerp( temp_output_27_0_g58186 , temp_output_28_0_g58186 , saturate( ( ( distance( temp_output_28_0_g58186 , temp_output_27_0_g58186 ) - _CoverMapRangeL5 ) / max( _CoverMapFuzzinessL5 , 1E-05 ) ) ));
				float3 temp_output_10875_20_g45716 = lerpResult29_g58186;
				float3 lerpResult8463_g45716 = lerp( lerpResult9_g58190 , temp_output_10875_20_g45716 , _CoverMapAffectL5);
				float3 temp_output_37_0_g58193 = lerpResult8463_g45716;
				float2 vertexToFrag83_g58193 = IN.ase_texcoord10.zw;
				float4 tex2DNode32_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag83_g58193 );
				float lerpResult72_g58193 = lerp( tex2DNode32_g58193.r , ( 1.0 - tex2DNode32_g58193.r ) , _Splat5_NoiseInvert);
				float3 lerpResult28_g58193 = lerp( temp_output_37_0_g58193 , ( temp_output_37_0_g58193 * ( 1.0 - _Splat5_NoiseDarken ) ) , lerpResult72_g58193);
				float3 lerpResult38_g58193 = lerp( temp_output_37_0_g58193 , lerpResult28_g58193 , _Splat5_EnableNoise);
				float2 vertexToFrag70_g58064 = IN.ase_texcoord11.xy;
				float2 temp_output_6_0_g58282 = vertexToFrag70_g58064;
				float3 temp_output_10899_32_g45716 = (SAMPLE_TEXTURE2D( _Splat2, sampler_Splat0, temp_output_6_0_g58282 )).rgb;
				float3 SPLAT_2_FINAL2812_g45716 = temp_output_10899_32_g45716;
				float3 temp_output_3637_0_g45716 = ( (_Splat6_Color).rgb * SPLAT_2_FINAL2812_g45716 * _Splat6_Brightness );
				float3 temp_output_12_0_g58226 = temp_output_3637_0_g45716;
				float dotResult28_g58226 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58226 );
				float3 temp_cast_5 = (dotResult28_g58226).xxx;
				float temp_output_21_0_g58226 = ( 1.0 - _Splat6_Saturation );
				float3 lerpResult31_g58226 = lerp( temp_cast_5 , temp_output_12_0_g58226 , temp_output_21_0_g58226);
				float3 temp_output_11_0_g58183 = lerpResult31_g58226;
				float3 temp_output_12_0_g58184 = temp_output_11_0_g58183;
				float dotResult28_g58184 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58184 );
				float3 temp_cast_6 = (dotResult28_g58184).xxx;
				float temp_output_21_0_g58184 = 1.5;
				float3 lerpResult31_g58184 = lerp( temp_cast_6 , temp_output_12_0_g58184 , temp_output_21_0_g58184);
				float3 temp_output_4_0_g58183 = ( saturate( lerpResult31_g58184 ) * 0.2 );
				float lerpResult23_g58183 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58183 = lerp( _TerrainWetnessIntensity , lerpResult23_g58183 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58183 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58183 = lerp( temp_output_11_0_g58183 , temp_output_4_0_g58183 , saturate( ( saturate( max( 0.0 , lerpResult22_g58183 ) ) * temp_output_29_0_g58183 ) ));
				float temp_output_38_0_g58183 = _TerrainWetnessAffectLayer6;
				float3 lerpResult9_g58183 = lerp( temp_output_11_0_g58183 , lerpResult6_g58183 , temp_output_38_0_g58183);
				float3 temp_output_27_0_g58189 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58189 = lerpResult9_g58183;
				float3 lerpResult29_g58189 = lerp( temp_output_27_0_g58189 , temp_output_28_0_g58189 , saturate( ( ( distance( temp_output_28_0_g58189 , temp_output_27_0_g58189 ) - _CoverMapRangeL6 ) / max( _CoverMapFuzzinessL6 , 1E-05 ) ) ));
				float3 temp_output_10878_20_g45716 = lerpResult29_g58189;
				float3 lerpResult8469_g45716 = lerp( lerpResult9_g58183 , temp_output_10878_20_g45716 , _CoverMapAffectL6);
				float3 temp_output_48_0_g58193 = lerpResult8469_g45716;
				float2 vertexToFrag85_g58193 = IN.ase_texcoord11.zw;
				float4 tex2DNode45_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag85_g58193 );
				float lerpResult73_g58193 = lerp( tex2DNode45_g58193.r , ( 1.0 - tex2DNode45_g58193.r ) , _Splat6_NoiseInvert);
				float3 lerpResult42_g58193 = lerp( temp_output_48_0_g58193 , ( temp_output_48_0_g58193 * ( 1.0 - _Splat6_NoiseDarken ) ) , lerpResult73_g58193);
				float3 lerpResult46_g58193 = lerp( temp_output_48_0_g58193 , lerpResult42_g58193 , _Splat6_EnableNoise);
				float2 vertexToFrag70_g58100 = IN.ase_texcoord12.xy;
				float2 temp_output_6_0_g58288 = vertexToFrag70_g58100;
				float3 temp_output_10900_32_g45716 = (SAMPLE_TEXTURE2D( _Splat3, sampler_Splat0, temp_output_6_0_g58288 )).rgb;
				float3 SPLAT_3_FINAL2814_g45716 = temp_output_10900_32_g45716;
				float3 temp_output_3642_0_g45716 = ( (_Splat7_Color).rgb * SPLAT_3_FINAL2814_g45716 * _Splat7_Brightness );
				float3 temp_output_12_0_g58227 = temp_output_3642_0_g45716;
				float dotResult28_g58227 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58227 );
				float3 temp_cast_7 = (dotResult28_g58227).xxx;
				float temp_output_21_0_g58227 = ( 1.0 - _Splat7_Saturation );
				float3 lerpResult31_g58227 = lerp( temp_cast_7 , temp_output_12_0_g58227 , temp_output_21_0_g58227);
				float3 temp_output_11_0_g58016 = lerpResult31_g58227;
				float3 temp_output_12_0_g58017 = temp_output_11_0_g58016;
				float dotResult28_g58017 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58017 );
				float3 temp_cast_8 = (dotResult28_g58017).xxx;
				float temp_output_21_0_g58017 = 1.5;
				float3 lerpResult31_g58017 = lerp( temp_cast_8 , temp_output_12_0_g58017 , temp_output_21_0_g58017);
				float3 temp_output_4_0_g58016 = ( saturate( lerpResult31_g58017 ) * 0.2 );
				float lerpResult23_g58016 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58016 = lerp( _TerrainWetnessIntensity , lerpResult23_g58016 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58016 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58016 = lerp( temp_output_11_0_g58016 , temp_output_4_0_g58016 , saturate( ( saturate( max( 0.0 , lerpResult22_g58016 ) ) * temp_output_29_0_g58016 ) ));
				float temp_output_38_0_g58016 = _TerrainWetnessAffectLayer7;
				float3 lerpResult9_g58016 = lerp( temp_output_11_0_g58016 , lerpResult6_g58016 , temp_output_38_0_g58016);
				float3 temp_output_27_0_g58187 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58187 = lerpResult9_g58016;
				float3 lerpResult29_g58187 = lerp( temp_output_27_0_g58187 , temp_output_28_0_g58187 , saturate( ( ( distance( temp_output_28_0_g58187 , temp_output_27_0_g58187 ) - _CoverMapRangeL7 ) / max( _CoverMapFuzzinessL7 , 1E-05 ) ) ));
				float3 temp_output_10876_20_g45716 = lerpResult29_g58187;
				float3 lerpResult8475_g45716 = lerp( lerpResult9_g58016 , temp_output_10876_20_g45716 , _CoverMapAffectL7);
				float3 temp_output_61_0_g58193 = lerpResult8475_g45716;
				float2 vertexToFrag87_g58193 = IN.ase_texcoord12.zw;
				float4 tex2DNode58_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag87_g58193 );
				float lerpResult74_g58193 = lerp( tex2DNode58_g58193.r , ( 1.0 - tex2DNode58_g58193.r ) , _Splat7_NoiseInvert);
				float3 lerpResult55_g58193 = lerp( temp_output_61_0_g58193 , ( temp_output_61_0_g58193 * ( 1.0 - _Splat7_NoiseDarken ) ) , lerpResult74_g58193);
				float3 lerpResult59_g58193 = lerp( temp_output_61_0_g58193 , lerpResult55_g58193 , _Splat7_EnableNoise);
				float4 weightedBlendVar7863_g45716 = Control00Weight403_g45716;
				float3 weightedBlend7863_g45716 = ( weightedBlendVar7863_g45716.x*lerpResult4_g58193 + weightedBlendVar7863_g45716.y*lerpResult38_g58193 + weightedBlendVar7863_g45716.z*lerpResult46_g58193 + weightedBlendVar7863_g45716.w*lerpResult59_g58193 );
				float3 temp_output_2894_0_g45716 = ( saturate( weightedBlend7863_g45716 ) * _Global_Brightness );
				float3 localClipHoles4536_g45716 = ( temp_output_2894_0_g45716 );
				float2 uv_TerrainHolesTexture = IN.ase_texcoord13.xy * _TerrainHolesTexture_ST.xy + _TerrainHolesTexture_ST.zw;
				float Hole4536_g45716 = SAMPLE_TEXTURE2D( _TerrainHolesTexture, sampler_TerrainHolesTexture, uv_TerrainHolesTexture ).r;
				{
				#ifdef _ALPHATEST_ON
				clip(Hole4536_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				
				float4 temp_output_10901_33_g45716 = SAMPLE_TEXTURE2D( _Normal0, sampler_Normal0, temp_output_6_0_g58294 );
				float4 NORMAL_0_FINAL3070_g45716 = temp_output_10901_33_g45716;
				float3 unpack10077_g45716 = UnpackNormalScale( NORMAL_0_FINAL3070_g45716, _Splat4_NormalScale );
				unpack10077_g45716.z = lerp( 1, unpack10077_g45716.z, saturate(_Splat4_NormalScale) );
				float3 unpack163_g45972 = UnpackNormalScale( SAMPLE_TEXTURE2D( _CoverMapNormal, sampler_Normal0, temp_output_189_0_g45972 ), _CoverMapNormalStrength );
				unpack163_g45972.z = lerp( 1, unpack163_g45972.z, saturate(_CoverMapNormalStrength) );
				float3 CoverMap_Normal8436_g45716 = unpack163_g45972;
				float3 temp_output_30_0_g57934 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57934 = unpack10077_g45716;
				float Layer0Range10428_g45716 = _CoverMapRangeL4;
				float Layer0Fuzziness10429_g45716 = _CoverMapFuzzinessL4;
				float3 lerpResult38_g57934 = lerp( temp_output_30_0_g57934 , temp_output_46_0_g57934 , saturate( ( ( distance( temp_output_46_0_g57934 , temp_output_30_0_g57934 ) - Layer0Range10428_g45716 ) / max( Layer0Fuzziness10429_g45716 , 1E-05 ) ) ));
				float3 temp_output_10527_48_g45716 = lerpResult38_g57934;
				float CoverMapLayer08450_g45716 = _CoverMapAffectL4;
				float3 lerpResult8458_g45716 = lerp( unpack10077_g45716 , temp_output_10527_48_g45716 , CoverMapLayer08450_g45716);
				float4 temp_output_10898_33_g45716 = SAMPLE_TEXTURE2D( _Normal1, sampler_Normal0, temp_output_6_0_g58276 );
				float4 NORMAL_1_FINAL3071_g45716 = temp_output_10898_33_g45716;
				float3 unpack10076_g45716 = UnpackNormalScale( NORMAL_1_FINAL3071_g45716, _Splat5_NormalScale );
				unpack10076_g45716.z = lerp( 1, unpack10076_g45716.z, saturate(_Splat5_NormalScale) );
				float3 temp_output_30_0_g57932 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57932 = unpack10076_g45716;
				float Layer1Range10423_g45716 = _CoverMapRangeL5;
				float Layer1Fuzziness10424_g45716 = _CoverMapFuzzinessL5;
				float3 lerpResult38_g57932 = lerp( temp_output_30_0_g57932 , temp_output_46_0_g57932 , saturate( ( ( distance( temp_output_46_0_g57932 , temp_output_30_0_g57932 ) - Layer1Range10423_g45716 ) / max( Layer1Fuzziness10424_g45716 , 1E-05 ) ) ));
				float3 temp_output_10529_48_g45716 = lerpResult38_g57932;
				float CoverMapLayer18465_g45716 = _CoverMapAffectL5;
				float3 lerpResult8505_g45716 = lerp( unpack10076_g45716 , temp_output_10529_48_g45716 , CoverMapLayer18465_g45716);
				float4 temp_output_10899_33_g45716 = SAMPLE_TEXTURE2D( _Normal2, sampler_Normal0, temp_output_6_0_g58282 );
				float4 NORMAL_2_FINAL3072_g45716 = temp_output_10899_33_g45716;
				float3 unpack10075_g45716 = UnpackNormalScale( NORMAL_2_FINAL3072_g45716, _Splat6_NormalScale );
				unpack10075_g45716.z = lerp( 1, unpack10075_g45716.z, saturate(_Splat6_NormalScale) );
				float3 temp_output_30_0_g57938 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57938 = unpack10075_g45716;
				float Layer2Fuzziness10422_g45716 = _CoverMapFuzzinessL6;
				float3 lerpResult38_g57938 = lerp( temp_output_30_0_g57938 , temp_output_46_0_g57938 , saturate( ( ( distance( temp_output_46_0_g57938 , temp_output_30_0_g57938 ) - Layer2Fuzziness10422_g45716 ) / max( Layer2Fuzziness10422_g45716 , 1E-05 ) ) ));
				float3 temp_output_10526_48_g45716 = lerpResult38_g57938;
				float CoverMaptLayer28471_g45716 = _CoverMapAffectL6;
				float3 lerpResult8510_g45716 = lerp( unpack10075_g45716 , temp_output_10526_48_g45716 , CoverMaptLayer28471_g45716);
				float4 temp_output_10900_33_g45716 = SAMPLE_TEXTURE2D( _Normal3, sampler_Normal0, temp_output_6_0_g58288 );
				float4 NORMAL_3_FINAL3073_g45716 = temp_output_10900_33_g45716;
				float3 unpack10074_g45716 = UnpackNormalScale( NORMAL_3_FINAL3073_g45716, _Splat7_NormalScale );
				unpack10074_g45716.z = lerp( 1, unpack10074_g45716.z, saturate(_Splat7_NormalScale) );
				float3 temp_output_30_0_g57955 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57955 = unpack10074_g45716;
				float Layer3Range10418_g45716 = _CoverMapRangeL7;
				float Layer3Fuzziness10419_g45716 = _CoverMapFuzzinessL7;
				float3 lerpResult38_g57955 = lerp( temp_output_30_0_g57955 , temp_output_46_0_g57955 , saturate( ( ( distance( temp_output_46_0_g57955 , temp_output_30_0_g57955 ) - Layer3Range10418_g45716 ) / max( Layer3Fuzziness10419_g45716 , 1E-05 ) ) ));
				float3 temp_output_10528_48_g45716 = lerpResult38_g57955;
				float CoverMapLayer38477_g45716 = _CoverMapAffectL7;
				float3 lerpResult8515_g45716 = lerp( unpack10074_g45716 , temp_output_10528_48_g45716 , CoverMapLayer38477_g45716);
				float4 weightedBlendVar504_g45716 = Control00Weight403_g45716;
				float3 weightedBlend504_g45716 = ( weightedBlendVar504_g45716.x*lerpResult8458_g45716 + weightedBlendVar504_g45716.y*lerpResult8505_g45716 + weightedBlendVar504_g45716.z*lerpResult8510_g45716 + weightedBlendVar504_g45716.w*lerpResult8515_g45716 );
				float3 worldPosValue187_g58848 = WorldPosition;
				float3 WorldPosition434_g58848 = worldPosValue187_g58848;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g58848 = (ase_screenPosNorm).xy;
				float2 ScreenUV434_g58848 = ScreenUV190_g58848;
				half2 LightmapUV497_g58848 = (IN.ase_texcoord13.zw*(unity_DynamicLightmapST).xy + (unity_DynamicLightmapST).zw);
				half4 localCalculateShadowMask497_g58848 = CalculateShadowMask497_g58848( LightmapUV497_g58848 );
				float4 shadowMaskValue180_g58848 = localCalculateShadowMask497_g58848;
				float4 ShadowMask434_g58848 = shadowMaskValue180_g58848;
				float3 localAdditionalLightsFlatMask14x434_g58848 = AdditionalLightsFlatMask14x( WorldPosition434_g58848 , ScreenUV434_g58848 , ShadowMask434_g58848 );
				float3 Final_Normal10668_g45716 = ( weightedBlend504_g45716 + localAdditionalLightsFlatMask14x434_g58848 );
				#ifdef _TERRAIN_INSTANCED_PERPIXEL_NORMAL
				float3 staticSwitch10602_g45716 = Final_Normal10668_g45716;
				#else
				float3 staticSwitch10602_g45716 = Final_Normal10668_g45716;
				#endif
				
				float4 temp_output_10901_34_g45716 = SAMPLE_TEXTURE2D( _Mask0, sampler_Mask0, temp_output_6_0_g58294 );
				float4 break3588_g45716 = temp_output_10901_34_g45716;
				float MASK_0_R3697_g45716 = break3588_g45716.r;
				float temp_output_5306_0_g45716 = ( ( 1.0 - MASK_0_R3697_g45716 ) * _Splat4_Metallic );
				float4 temp_output_10898_34_g45716 = SAMPLE_TEXTURE2D( _Mask1, sampler_Mask0, temp_output_6_0_g58276 );
				float4 break3781_g45716 = temp_output_10898_34_g45716;
				float MASK_1_R4919_g45716 = break3781_g45716.r;
				float temp_output_5313_0_g45716 = ( ( 1.0 - MASK_1_R4919_g45716 ) * _Splat5_Metallic );
				float4 temp_output_10899_34_g45716 = SAMPLE_TEXTURE2D( _Mask2, sampler_Mask0, temp_output_6_0_g58282 );
				float4 break3792_g45716 = temp_output_10899_34_g45716;
				float MASK_2_R4938_g45716 = break3792_g45716.r;
				float temp_output_5319_0_g45716 = ( ( 1.0 - MASK_2_R4938_g45716 ) * _Splat6_Metallic );
				float4 temp_output_10900_34_g45716 = SAMPLE_TEXTURE2D( _Mask3, sampler_Mask0, temp_output_6_0_g58288 );
				float4 break3802_g45716 = temp_output_10900_34_g45716;
				float MASK_3_R4955_g45716 = break3802_g45716.r;
				float temp_output_5327_0_g45716 = ( ( 1.0 - MASK_3_R4955_g45716 ) * _Splat7_Metallic );
				float4 weightedBlendVar2871_g45716 = Control00Weight403_g45716;
				float weightedBlend2871_g45716 = ( weightedBlendVar2871_g45716.x*temp_output_5306_0_g45716 + weightedBlendVar2871_g45716.y*temp_output_5313_0_g45716 + weightedBlendVar2871_g45716.z*temp_output_5319_0_g45716 + weightedBlendVar2871_g45716.w*temp_output_5327_0_g45716 );
				float Final_Metallic10670_g45716 = weightedBlend2871_g45716;
				
				float MASK_0_A5087_g45716 = break3588_g45716.a;
				float lerpResult11001_g45716 = lerp( MASK_0_A5087_g45716 , ( 1.0 - MASK_0_A5087_g45716 ) , _Splat4_SmoothnessType);
				float temp_output_11003_0_g45716 = ( _Splat4_Smoothness * lerpResult11001_g45716 );
				float temp_output_32_0_g58867 = temp_output_11003_0_g45716;
				float temp_output_29_0_g58867 = saturate( _TerrainWetnessMask );
				float lerpResult31_g58867 = lerp( temp_output_32_0_g58867 , 0.9 , temp_output_29_0_g58867);
				float WetnesstLayer08726_g45716 = _TerrainWetnessAffectLayer4;
				float temp_output_38_0_g58867 = WetnesstLayer08726_g45716;
				float lerpResult33_g58867 = lerp( temp_output_32_0_g58867 , lerpResult31_g58867 , temp_output_38_0_g58867);
				float MASK_1_A5085_g45716 = break3781_g45716.a;
				float lerpResult11004_g45716 = lerp( MASK_1_A5085_g45716 , ( 1.0 - MASK_1_A5085_g45716 ) , _Splat5_SmoothnessType);
				float temp_output_11006_0_g45716 = ( _Splat5_Smoothness * lerpResult11004_g45716 );
				float temp_output_32_0_g58864 = temp_output_11006_0_g45716;
				float temp_output_29_0_g58864 = saturate( _TerrainWetnessMask );
				float lerpResult31_g58864 = lerp( temp_output_32_0_g58864 , 0.9 , temp_output_29_0_g58864);
				float WetnessLayer18788_g45716 = _TerrainWetnessAffectLayer5;
				float temp_output_38_0_g58864 = WetnessLayer18788_g45716;
				float lerpResult33_g58864 = lerp( temp_output_32_0_g58864 , lerpResult31_g58864 , temp_output_38_0_g58864);
				float MASK_2_A5083_g45716 = break3792_g45716.a;
				float lerpResult11007_g45716 = lerp( MASK_2_A5083_g45716 , ( 1.0 - MASK_2_A5083_g45716 ) , _Splat6_SmoothnessType);
				float temp_output_11009_0_g45716 = ( _Splat6_Smoothness * lerpResult11007_g45716 );
				float temp_output_32_0_g58870 = temp_output_11009_0_g45716;
				float temp_output_29_0_g58870 = saturate( _TerrainWetnessMask );
				float lerpResult31_g58870 = lerp( temp_output_32_0_g58870 , 0.9 , temp_output_29_0_g58870);
				float WetnessLayer28790_g45716 = _TerrainWetnessAffectLayer6;
				float temp_output_38_0_g58870 = WetnessLayer28790_g45716;
				float lerpResult33_g58870 = lerp( temp_output_32_0_g58870 , lerpResult31_g58870 , temp_output_38_0_g58870);
				float MASK_3_A5081_g45716 = break3802_g45716.a;
				float lerpResult11010_g45716 = lerp( MASK_3_A5081_g45716 , ( 1.0 - MASK_3_A5081_g45716 ) , _Splat7_SmoothnessType);
				float temp_output_11012_0_g45716 = ( _Splat7_Smoothness * lerpResult11010_g45716 );
				float temp_output_32_0_g58873 = temp_output_11012_0_g45716;
				float temp_output_29_0_g58873 = saturate( _TerrainWetnessMask );
				float lerpResult31_g58873 = lerp( temp_output_32_0_g58873 , 0.9 , temp_output_29_0_g58873);
				float WetnessLayer38792_g45716 = _TerrainWetnessAffectLayer7;
				float temp_output_38_0_g58873 = WetnessLayer38792_g45716;
				float lerpResult33_g58873 = lerp( temp_output_32_0_g58873 , lerpResult31_g58873 , temp_output_38_0_g58873);
				float4 weightedBlendVar2861_g45716 = Control00Weight403_g45716;
				float weightedBlend2861_g45716 = ( weightedBlendVar2861_g45716.x*lerpResult33_g58867 + weightedBlendVar2861_g45716.y*lerpResult33_g58864 + weightedBlendVar2861_g45716.z*lerpResult33_g58870 + weightedBlendVar2861_g45716.w*lerpResult33_g58873 );
				float Final_Smoothness10672_g45716 = weightedBlend2861_g45716;
				
				float MASK_0_G3698_g45716 = break3588_g45716.g;
				float temp_output_10983_0_g45716 = saturate( ( ( 1.0 - _Splat4_OcclusionStrengthAO ) * MASK_0_G3698_g45716 ) );
				float MASK_1_G4917_g45716 = break3781_g45716.g;
				float temp_output_10986_0_g45716 = saturate( ( ( 1.0 - _Splat5_OcclusionStrengthAO ) * MASK_1_G4917_g45716 ) );
				float MASK_2_G4936_g45716 = break3792_g45716.g;
				float temp_output_10989_0_g45716 = saturate( ( ( 1.0 - _Splat6_OcclusionStrengthAO ) * MASK_2_G4936_g45716 ) );
				float MASK_3_G4957_g45716 = break3802_g45716.g;
				float temp_output_10994_0_g45716 = saturate( ( ( 1.0 - _Splat7_OcclusionStrengthAO ) * MASK_3_G4957_g45716 ) );
				float4 weightedBlendVar2880_g45716 = Control00Weight403_g45716;
				float weightedBlend2880_g45716 = ( weightedBlendVar2880_g45716.x*temp_output_10983_0_g45716 + weightedBlendVar2880_g45716.y*temp_output_10986_0_g45716 + weightedBlendVar2880_g45716.z*temp_output_10989_0_g45716 + weightedBlendVar2880_g45716.w*temp_output_10994_0_g45716 );
				float Final_Oclusion10671_g45716 = saturate( weightedBlend2880_g45716 );
				

				float3 BaseColor = localClipHoles4536_g45716;
				float3 Normal = staticSwitch10602_g45716;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = Final_Metallic10670_g45716;
				float Smoothness = Final_Smoothness10672_g45716;
				float Occlusion = Final_Oclusion10671_g45716;
				float Alpha = saturate( dotResult1044_g45716 );
				float AlphaClipThreshold = 0.0;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.ase_texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				v = ApplyMeshModification(v);
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.ase_texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord3.xy = vertexToFrag27_g58045;
				
				o.ase_texcoord4 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

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

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

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

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag27_g58045 = IN.ase_texcoord3.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				

				float Alpha = saturate( dotResult1044_g45716 );
				float AlphaClipThreshold = 0.0;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			TEXTURE2D(_Splat0);
			SAMPLER(sampler_Splat0);
			half _GlobalWetnessTerrainIntensity;
			float _GlobalWetnessTerrainEnabled;
			TEXTURE2D(_CoverMapAlbedo);
			TEXTURE2D(_GlobalTerrainNoise);
			TEXTURE2D(_Splat1);
			TEXTURE2D(_Splat2);
			TEXTURE2D(_Splat3);
			TEXTURE2D(_TerrainHolesTexture);
			SAMPLER(sampler_TerrainHolesTexture);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.texcoord0.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				v = ApplyMeshModification(v);
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.texcoord0.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord4.xy = vertexToFrag27_g58045;
				float2 Offset235_g58046 = _Splat0_ST.zw;
				float2 temp_output_41_0_g58046 = ( ( v.texcoord0.xy * _Splat0_ST.xy ) + Offset235_g58046 );
				float2 vertexToFrag70_g58046 = temp_output_41_0_g58046;
				o.ase_texcoord4.zw = vertexToFrag70_g58046;
				float2 Offset235_g45976 = float2( 1,0 );
				float2 temp_output_41_0_g45976 = ( ( v.texcoord0.xy * float2( 1,1 ) ) + Offset235_g45976 );
				float2 vertexToFrag70_g45976 = temp_output_41_0_g45976;
				o.ase_texcoord5.xy = vertexToFrag70_g45976;
				float temp_output_23_0_g58193 = _Splat4_NoiseScale;
				float2 appendResult3_g58193 = (float2(temp_output_23_0_g58193 , temp_output_23_0_g58193));
				float2 vertexToFrag81_g58193 = ( v.texcoord0.xy * appendResult3_g58193 );
				o.ase_texcoord5.zw = vertexToFrag81_g58193;
				float2 Offset235_g58082 = _Splat1_ST.zw;
				float2 temp_output_41_0_g58082 = ( ( v.texcoord0.xy * _Splat1_ST.xy ) + Offset235_g58082 );
				float2 vertexToFrag70_g58082 = temp_output_41_0_g58082;
				o.ase_texcoord6.xy = vertexToFrag70_g58082;
				float temp_output_34_0_g58193 = _Splat5_NoiseScale;
				float2 appendResult30_g58193 = (float2(temp_output_34_0_g58193 , temp_output_34_0_g58193));
				float2 vertexToFrag83_g58193 = ( v.texcoord0.xy * appendResult30_g58193 );
				o.ase_texcoord6.zw = vertexToFrag83_g58193;
				float2 Offset235_g58064 = _Splat2_ST.zw;
				float2 temp_output_41_0_g58064 = ( ( v.texcoord0.xy * _Splat2_ST.xy ) + Offset235_g58064 );
				float2 vertexToFrag70_g58064 = temp_output_41_0_g58064;
				o.ase_texcoord7.xy = vertexToFrag70_g58064;
				float temp_output_50_0_g58193 = _Splat6_NoiseScale;
				float2 appendResult43_g58193 = (float2(temp_output_50_0_g58193 , temp_output_50_0_g58193));
				float2 vertexToFrag85_g58193 = ( v.texcoord0.xy * appendResult43_g58193 );
				o.ase_texcoord7.zw = vertexToFrag85_g58193;
				float2 Offset235_g58100 = _Splat3_ST.zw;
				float2 temp_output_41_0_g58100 = ( ( v.texcoord0.xy * _Splat3_ST.xy ) + Offset235_g58100 );
				float2 vertexToFrag70_g58100 = temp_output_41_0_g58100;
				o.ase_texcoord8.xy = vertexToFrag70_g58100;
				float temp_output_63_0_g58193 = _Splat7_NoiseScale;
				float2 appendResult56_g58193 = (float2(temp_output_63_0_g58193 , temp_output_63_0_g58193));
				float2 vertexToFrag87_g58193 = ( v.texcoord0.xy * appendResult56_g58193 );
				o.ase_texcoord8.zw = vertexToFrag87_g58193;
				
				o.ase_texcoord9.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;

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

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

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
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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

				float2 vertexToFrag27_g58045 = IN.ase_texcoord4.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				float localSplatClip1046_g45716 = ( dotResult1044_g45716 );
				float SplatWeight1046_g45716 = dotResult1044_g45716;
				{
				#if !defined(SHADER_API_MOBILE) && defined(TERRAIN_SPLAT_ADDPASS)
				clip(SplatWeight1046_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				float4 temp_output_1048_0_g45716 = ( tex2DNode3739_g45716 / ( localSplatClip1046_g45716 + 0.001 ) );
				float4 Control00Weight403_g45716 = temp_output_1048_0_g45716;
				float2 vertexToFrag70_g58046 = IN.ase_texcoord4.zw;
				float2 temp_output_6_0_g58294 = vertexToFrag70_g58046;
				float3 temp_output_10901_32_g45716 = (SAMPLE_TEXTURE2D( _Splat0, sampler_Splat0, temp_output_6_0_g58294 )).rgb;
				float3 SPLAT_0_FINAL2805_g45716 = temp_output_10901_32_g45716;
				float3 temp_output_3375_0_g45716 = ( (_Splat4_Color).rgb * SPLAT_0_FINAL2805_g45716 * _Splat4_Brightness );
				float3 temp_output_12_0_g58224 = temp_output_3375_0_g45716;
				float dotResult28_g58224 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58224 );
				float3 temp_cast_1 = (dotResult28_g58224).xxx;
				float temp_output_21_0_g58224 = ( 1.0 - _Splat4_Saturation );
				float3 lerpResult31_g58224 = lerp( temp_cast_1 , temp_output_12_0_g58224 , temp_output_21_0_g58224);
				float3 temp_output_11_0_g58025 = lerpResult31_g58224;
				float3 temp_output_12_0_g58026 = temp_output_11_0_g58025;
				float dotResult28_g58026 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58026 );
				float3 temp_cast_2 = (dotResult28_g58026).xxx;
				float temp_output_21_0_g58026 = 1.5;
				float3 lerpResult31_g58026 = lerp( temp_cast_2 , temp_output_12_0_g58026 , temp_output_21_0_g58026);
				float3 temp_output_4_0_g58025 = ( saturate( lerpResult31_g58026 ) * 0.2 );
				float lerpResult23_g58025 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58025 = lerp( _TerrainWetnessIntensity , lerpResult23_g58025 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58025 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58025 = lerp( temp_output_11_0_g58025 , temp_output_4_0_g58025 , saturate( ( saturate( max( 0.0 , lerpResult22_g58025 ) ) * temp_output_29_0_g58025 ) ));
				float temp_output_38_0_g58025 = _TerrainWetnessAffectLayer4;
				float3 lerpResult9_g58025 = lerp( temp_output_11_0_g58025 , lerpResult6_g58025 , temp_output_38_0_g58025);
				float2 vertexToFrag70_g45976 = IN.ase_texcoord5.xy;
				float2 temp_output_189_0_g45972 = vertexToFrag70_g45976;
				float3 temp_output_11_0_g45972 = ( (_CoverMapTint).rgb * (SAMPLE_TEXTURE2D( _CoverMapAlbedo, sampler_Splat0, temp_output_189_0_g45972 )).rgb * _CoverMapBrightness );
				float3 CoverMap_Albedo8425_g45716 = temp_output_11_0_g45972;
				float3 temp_output_27_0_g58188 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58188 = lerpResult9_g58025;
				float3 lerpResult29_g58188 = lerp( temp_output_27_0_g58188 , temp_output_28_0_g58188 , saturate( ( ( distance( temp_output_28_0_g58188 , temp_output_27_0_g58188 ) - _CoverMapRangeL4 ) / max( _CoverMapFuzzinessL4 , 1E-05 ) ) ));
				float3 temp_output_10877_20_g45716 = lerpResult29_g58188;
				float3 lerpResult8455_g45716 = lerp( lerpResult9_g58025 , temp_output_10877_20_g45716 , _CoverMapAffectL4);
				float3 temp_output_13_0_g58193 = lerpResult8455_g45716;
				float2 vertexToFrag81_g58193 = IN.ase_texcoord5.zw;
				float4 tex2DNode11_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag81_g58193 );
				float lerpResult71_g58193 = lerp( tex2DNode11_g58193.r , ( 1.0 - tex2DNode11_g58193.r ) , _Splat4_NoiseInvert);
				float3 lerpResult6_g58193 = lerp( temp_output_13_0_g58193 , ( temp_output_13_0_g58193 * ( 1.0 - _Splat4_NoiseDarken ) ) , lerpResult71_g58193);
				float3 lerpResult4_g58193 = lerp( temp_output_13_0_g58193 , lerpResult6_g58193 , _Splat4_EnableNoise);
				float2 vertexToFrag70_g58082 = IN.ase_texcoord6.xy;
				float2 temp_output_6_0_g58276 = vertexToFrag70_g58082;
				float3 temp_output_10898_32_g45716 = (SAMPLE_TEXTURE2D( _Splat1, sampler_Splat0, temp_output_6_0_g58276 )).rgb;
				float3 SPLAT_1_FINAL2809_g45716 = temp_output_10898_32_g45716;
				float3 temp_output_3633_0_g45716 = ( (_Splat5_Color).rgb * SPLAT_1_FINAL2809_g45716 * _Splat5_Brightness );
				float3 temp_output_12_0_g58225 = temp_output_3633_0_g45716;
				float dotResult28_g58225 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58225 );
				float3 temp_cast_3 = (dotResult28_g58225).xxx;
				float temp_output_21_0_g58225 = ( 1.0 - _Splat5_Saturation );
				float3 lerpResult31_g58225 = lerp( temp_cast_3 , temp_output_12_0_g58225 , temp_output_21_0_g58225);
				float3 temp_output_11_0_g58190 = lerpResult31_g58225;
				float3 temp_output_12_0_g58191 = temp_output_11_0_g58190;
				float dotResult28_g58191 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58191 );
				float3 temp_cast_4 = (dotResult28_g58191).xxx;
				float temp_output_21_0_g58191 = 1.5;
				float3 lerpResult31_g58191 = lerp( temp_cast_4 , temp_output_12_0_g58191 , temp_output_21_0_g58191);
				float3 temp_output_4_0_g58190 = ( saturate( lerpResult31_g58191 ) * 0.2 );
				float lerpResult23_g58190 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58190 = lerp( _TerrainWetnessIntensity , lerpResult23_g58190 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58190 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58190 = lerp( temp_output_11_0_g58190 , temp_output_4_0_g58190 , saturate( ( saturate( max( 0.0 , lerpResult22_g58190 ) ) * temp_output_29_0_g58190 ) ));
				float temp_output_38_0_g58190 = _TerrainWetnessAffectLayer5;
				float3 lerpResult9_g58190 = lerp( temp_output_11_0_g58190 , lerpResult6_g58190 , temp_output_38_0_g58190);
				float3 temp_output_27_0_g58186 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58186 = lerpResult9_g58190;
				float3 lerpResult29_g58186 = lerp( temp_output_27_0_g58186 , temp_output_28_0_g58186 , saturate( ( ( distance( temp_output_28_0_g58186 , temp_output_27_0_g58186 ) - _CoverMapRangeL5 ) / max( _CoverMapFuzzinessL5 , 1E-05 ) ) ));
				float3 temp_output_10875_20_g45716 = lerpResult29_g58186;
				float3 lerpResult8463_g45716 = lerp( lerpResult9_g58190 , temp_output_10875_20_g45716 , _CoverMapAffectL5);
				float3 temp_output_37_0_g58193 = lerpResult8463_g45716;
				float2 vertexToFrag83_g58193 = IN.ase_texcoord6.zw;
				float4 tex2DNode32_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag83_g58193 );
				float lerpResult72_g58193 = lerp( tex2DNode32_g58193.r , ( 1.0 - tex2DNode32_g58193.r ) , _Splat5_NoiseInvert);
				float3 lerpResult28_g58193 = lerp( temp_output_37_0_g58193 , ( temp_output_37_0_g58193 * ( 1.0 - _Splat5_NoiseDarken ) ) , lerpResult72_g58193);
				float3 lerpResult38_g58193 = lerp( temp_output_37_0_g58193 , lerpResult28_g58193 , _Splat5_EnableNoise);
				float2 vertexToFrag70_g58064 = IN.ase_texcoord7.xy;
				float2 temp_output_6_0_g58282 = vertexToFrag70_g58064;
				float3 temp_output_10899_32_g45716 = (SAMPLE_TEXTURE2D( _Splat2, sampler_Splat0, temp_output_6_0_g58282 )).rgb;
				float3 SPLAT_2_FINAL2812_g45716 = temp_output_10899_32_g45716;
				float3 temp_output_3637_0_g45716 = ( (_Splat6_Color).rgb * SPLAT_2_FINAL2812_g45716 * _Splat6_Brightness );
				float3 temp_output_12_0_g58226 = temp_output_3637_0_g45716;
				float dotResult28_g58226 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58226 );
				float3 temp_cast_5 = (dotResult28_g58226).xxx;
				float temp_output_21_0_g58226 = ( 1.0 - _Splat6_Saturation );
				float3 lerpResult31_g58226 = lerp( temp_cast_5 , temp_output_12_0_g58226 , temp_output_21_0_g58226);
				float3 temp_output_11_0_g58183 = lerpResult31_g58226;
				float3 temp_output_12_0_g58184 = temp_output_11_0_g58183;
				float dotResult28_g58184 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58184 );
				float3 temp_cast_6 = (dotResult28_g58184).xxx;
				float temp_output_21_0_g58184 = 1.5;
				float3 lerpResult31_g58184 = lerp( temp_cast_6 , temp_output_12_0_g58184 , temp_output_21_0_g58184);
				float3 temp_output_4_0_g58183 = ( saturate( lerpResult31_g58184 ) * 0.2 );
				float lerpResult23_g58183 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58183 = lerp( _TerrainWetnessIntensity , lerpResult23_g58183 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58183 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58183 = lerp( temp_output_11_0_g58183 , temp_output_4_0_g58183 , saturate( ( saturate( max( 0.0 , lerpResult22_g58183 ) ) * temp_output_29_0_g58183 ) ));
				float temp_output_38_0_g58183 = _TerrainWetnessAffectLayer6;
				float3 lerpResult9_g58183 = lerp( temp_output_11_0_g58183 , lerpResult6_g58183 , temp_output_38_0_g58183);
				float3 temp_output_27_0_g58189 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58189 = lerpResult9_g58183;
				float3 lerpResult29_g58189 = lerp( temp_output_27_0_g58189 , temp_output_28_0_g58189 , saturate( ( ( distance( temp_output_28_0_g58189 , temp_output_27_0_g58189 ) - _CoverMapRangeL6 ) / max( _CoverMapFuzzinessL6 , 1E-05 ) ) ));
				float3 temp_output_10878_20_g45716 = lerpResult29_g58189;
				float3 lerpResult8469_g45716 = lerp( lerpResult9_g58183 , temp_output_10878_20_g45716 , _CoverMapAffectL6);
				float3 temp_output_48_0_g58193 = lerpResult8469_g45716;
				float2 vertexToFrag85_g58193 = IN.ase_texcoord7.zw;
				float4 tex2DNode45_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag85_g58193 );
				float lerpResult73_g58193 = lerp( tex2DNode45_g58193.r , ( 1.0 - tex2DNode45_g58193.r ) , _Splat6_NoiseInvert);
				float3 lerpResult42_g58193 = lerp( temp_output_48_0_g58193 , ( temp_output_48_0_g58193 * ( 1.0 - _Splat6_NoiseDarken ) ) , lerpResult73_g58193);
				float3 lerpResult46_g58193 = lerp( temp_output_48_0_g58193 , lerpResult42_g58193 , _Splat6_EnableNoise);
				float2 vertexToFrag70_g58100 = IN.ase_texcoord8.xy;
				float2 temp_output_6_0_g58288 = vertexToFrag70_g58100;
				float3 temp_output_10900_32_g45716 = (SAMPLE_TEXTURE2D( _Splat3, sampler_Splat0, temp_output_6_0_g58288 )).rgb;
				float3 SPLAT_3_FINAL2814_g45716 = temp_output_10900_32_g45716;
				float3 temp_output_3642_0_g45716 = ( (_Splat7_Color).rgb * SPLAT_3_FINAL2814_g45716 * _Splat7_Brightness );
				float3 temp_output_12_0_g58227 = temp_output_3642_0_g45716;
				float dotResult28_g58227 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58227 );
				float3 temp_cast_7 = (dotResult28_g58227).xxx;
				float temp_output_21_0_g58227 = ( 1.0 - _Splat7_Saturation );
				float3 lerpResult31_g58227 = lerp( temp_cast_7 , temp_output_12_0_g58227 , temp_output_21_0_g58227);
				float3 temp_output_11_0_g58016 = lerpResult31_g58227;
				float3 temp_output_12_0_g58017 = temp_output_11_0_g58016;
				float dotResult28_g58017 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58017 );
				float3 temp_cast_8 = (dotResult28_g58017).xxx;
				float temp_output_21_0_g58017 = 1.5;
				float3 lerpResult31_g58017 = lerp( temp_cast_8 , temp_output_12_0_g58017 , temp_output_21_0_g58017);
				float3 temp_output_4_0_g58016 = ( saturate( lerpResult31_g58017 ) * 0.2 );
				float lerpResult23_g58016 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58016 = lerp( _TerrainWetnessIntensity , lerpResult23_g58016 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58016 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58016 = lerp( temp_output_11_0_g58016 , temp_output_4_0_g58016 , saturate( ( saturate( max( 0.0 , lerpResult22_g58016 ) ) * temp_output_29_0_g58016 ) ));
				float temp_output_38_0_g58016 = _TerrainWetnessAffectLayer7;
				float3 lerpResult9_g58016 = lerp( temp_output_11_0_g58016 , lerpResult6_g58016 , temp_output_38_0_g58016);
				float3 temp_output_27_0_g58187 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58187 = lerpResult9_g58016;
				float3 lerpResult29_g58187 = lerp( temp_output_27_0_g58187 , temp_output_28_0_g58187 , saturate( ( ( distance( temp_output_28_0_g58187 , temp_output_27_0_g58187 ) - _CoverMapRangeL7 ) / max( _CoverMapFuzzinessL7 , 1E-05 ) ) ));
				float3 temp_output_10876_20_g45716 = lerpResult29_g58187;
				float3 lerpResult8475_g45716 = lerp( lerpResult9_g58016 , temp_output_10876_20_g45716 , _CoverMapAffectL7);
				float3 temp_output_61_0_g58193 = lerpResult8475_g45716;
				float2 vertexToFrag87_g58193 = IN.ase_texcoord8.zw;
				float4 tex2DNode58_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag87_g58193 );
				float lerpResult74_g58193 = lerp( tex2DNode58_g58193.r , ( 1.0 - tex2DNode58_g58193.r ) , _Splat7_NoiseInvert);
				float3 lerpResult55_g58193 = lerp( temp_output_61_0_g58193 , ( temp_output_61_0_g58193 * ( 1.0 - _Splat7_NoiseDarken ) ) , lerpResult74_g58193);
				float3 lerpResult59_g58193 = lerp( temp_output_61_0_g58193 , lerpResult55_g58193 , _Splat7_EnableNoise);
				float4 weightedBlendVar7863_g45716 = Control00Weight403_g45716;
				float3 weightedBlend7863_g45716 = ( weightedBlendVar7863_g45716.x*lerpResult4_g58193 + weightedBlendVar7863_g45716.y*lerpResult38_g58193 + weightedBlendVar7863_g45716.z*lerpResult46_g58193 + weightedBlendVar7863_g45716.w*lerpResult59_g58193 );
				float3 temp_output_2894_0_g45716 = ( saturate( weightedBlend7863_g45716 ) * _Global_Brightness );
				float3 localClipHoles4536_g45716 = ( temp_output_2894_0_g45716 );
				float2 uv_TerrainHolesTexture = IN.ase_texcoord9.xy * _TerrainHolesTexture_ST.xy + _TerrainHolesTexture_ST.zw;
				float Hole4536_g45716 = SAMPLE_TEXTURE2D( _TerrainHolesTexture, sampler_TerrainHolesTexture, uv_TerrainHolesTexture ).r;
				{
				#ifdef _ALPHATEST_ON
				clip(Hole4536_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				

				float3 BaseColor = localClipHoles4536_g45716;
				float3 Emission = 0;
				float Alpha = saturate( dotResult1044_g45716 );
				float AlphaClipThreshold = 0.0;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One One, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			TEXTURE2D(_Splat0);
			SAMPLER(sampler_Splat0);
			half _GlobalWetnessTerrainIntensity;
			float _GlobalWetnessTerrainEnabled;
			TEXTURE2D(_CoverMapAlbedo);
			TEXTURE2D(_GlobalTerrainNoise);
			TEXTURE2D(_Splat1);
			TEXTURE2D(_Splat2);
			TEXTURE2D(_Splat3);
			TEXTURE2D(_TerrainHolesTexture);
			SAMPLER(sampler_TerrainHolesTexture);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.ase_texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				v = ApplyMeshModification(v);
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.ase_texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord2.xy = vertexToFrag27_g58045;
				float2 Offset235_g58046 = _Splat0_ST.zw;
				float2 temp_output_41_0_g58046 = ( ( v.ase_texcoord.xy * _Splat0_ST.xy ) + Offset235_g58046 );
				float2 vertexToFrag70_g58046 = temp_output_41_0_g58046;
				o.ase_texcoord2.zw = vertexToFrag70_g58046;
				float2 Offset235_g45976 = float2( 1,0 );
				float2 temp_output_41_0_g45976 = ( ( v.ase_texcoord.xy * float2( 1,1 ) ) + Offset235_g45976 );
				float2 vertexToFrag70_g45976 = temp_output_41_0_g45976;
				o.ase_texcoord3.xy = vertexToFrag70_g45976;
				float temp_output_23_0_g58193 = _Splat4_NoiseScale;
				float2 appendResult3_g58193 = (float2(temp_output_23_0_g58193 , temp_output_23_0_g58193));
				float2 vertexToFrag81_g58193 = ( v.ase_texcoord.xy * appendResult3_g58193 );
				o.ase_texcoord3.zw = vertexToFrag81_g58193;
				float2 Offset235_g58082 = _Splat1_ST.zw;
				float2 temp_output_41_0_g58082 = ( ( v.ase_texcoord.xy * _Splat1_ST.xy ) + Offset235_g58082 );
				float2 vertexToFrag70_g58082 = temp_output_41_0_g58082;
				o.ase_texcoord4.xy = vertexToFrag70_g58082;
				float temp_output_34_0_g58193 = _Splat5_NoiseScale;
				float2 appendResult30_g58193 = (float2(temp_output_34_0_g58193 , temp_output_34_0_g58193));
				float2 vertexToFrag83_g58193 = ( v.ase_texcoord.xy * appendResult30_g58193 );
				o.ase_texcoord4.zw = vertexToFrag83_g58193;
				float2 Offset235_g58064 = _Splat2_ST.zw;
				float2 temp_output_41_0_g58064 = ( ( v.ase_texcoord.xy * _Splat2_ST.xy ) + Offset235_g58064 );
				float2 vertexToFrag70_g58064 = temp_output_41_0_g58064;
				o.ase_texcoord5.xy = vertexToFrag70_g58064;
				float temp_output_50_0_g58193 = _Splat6_NoiseScale;
				float2 appendResult43_g58193 = (float2(temp_output_50_0_g58193 , temp_output_50_0_g58193));
				float2 vertexToFrag85_g58193 = ( v.ase_texcoord.xy * appendResult43_g58193 );
				o.ase_texcoord5.zw = vertexToFrag85_g58193;
				float2 Offset235_g58100 = _Splat3_ST.zw;
				float2 temp_output_41_0_g58100 = ( ( v.ase_texcoord.xy * _Splat3_ST.xy ) + Offset235_g58100 );
				float2 vertexToFrag70_g58100 = temp_output_41_0_g58100;
				o.ase_texcoord6.xy = vertexToFrag70_g58100;
				float temp_output_63_0_g58193 = _Splat7_NoiseScale;
				float2 appendResult56_g58193 = (float2(temp_output_63_0_g58193 , temp_output_63_0_g58193));
				float2 vertexToFrag87_g58193 = ( v.ase_texcoord.xy * appendResult56_g58193 );
				o.ase_texcoord6.zw = vertexToFrag87_g58193;
				
				o.ase_texcoord7.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;

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

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

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

				float2 vertexToFrag27_g58045 = IN.ase_texcoord2.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				float localSplatClip1046_g45716 = ( dotResult1044_g45716 );
				float SplatWeight1046_g45716 = dotResult1044_g45716;
				{
				#if !defined(SHADER_API_MOBILE) && defined(TERRAIN_SPLAT_ADDPASS)
				clip(SplatWeight1046_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				float4 temp_output_1048_0_g45716 = ( tex2DNode3739_g45716 / ( localSplatClip1046_g45716 + 0.001 ) );
				float4 Control00Weight403_g45716 = temp_output_1048_0_g45716;
				float2 vertexToFrag70_g58046 = IN.ase_texcoord2.zw;
				float2 temp_output_6_0_g58294 = vertexToFrag70_g58046;
				float3 temp_output_10901_32_g45716 = (SAMPLE_TEXTURE2D( _Splat0, sampler_Splat0, temp_output_6_0_g58294 )).rgb;
				float3 SPLAT_0_FINAL2805_g45716 = temp_output_10901_32_g45716;
				float3 temp_output_3375_0_g45716 = ( (_Splat4_Color).rgb * SPLAT_0_FINAL2805_g45716 * _Splat4_Brightness );
				float3 temp_output_12_0_g58224 = temp_output_3375_0_g45716;
				float dotResult28_g58224 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58224 );
				float3 temp_cast_1 = (dotResult28_g58224).xxx;
				float temp_output_21_0_g58224 = ( 1.0 - _Splat4_Saturation );
				float3 lerpResult31_g58224 = lerp( temp_cast_1 , temp_output_12_0_g58224 , temp_output_21_0_g58224);
				float3 temp_output_11_0_g58025 = lerpResult31_g58224;
				float3 temp_output_12_0_g58026 = temp_output_11_0_g58025;
				float dotResult28_g58026 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58026 );
				float3 temp_cast_2 = (dotResult28_g58026).xxx;
				float temp_output_21_0_g58026 = 1.5;
				float3 lerpResult31_g58026 = lerp( temp_cast_2 , temp_output_12_0_g58026 , temp_output_21_0_g58026);
				float3 temp_output_4_0_g58025 = ( saturate( lerpResult31_g58026 ) * 0.2 );
				float lerpResult23_g58025 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58025 = lerp( _TerrainWetnessIntensity , lerpResult23_g58025 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58025 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58025 = lerp( temp_output_11_0_g58025 , temp_output_4_0_g58025 , saturate( ( saturate( max( 0.0 , lerpResult22_g58025 ) ) * temp_output_29_0_g58025 ) ));
				float temp_output_38_0_g58025 = _TerrainWetnessAffectLayer4;
				float3 lerpResult9_g58025 = lerp( temp_output_11_0_g58025 , lerpResult6_g58025 , temp_output_38_0_g58025);
				float2 vertexToFrag70_g45976 = IN.ase_texcoord3.xy;
				float2 temp_output_189_0_g45972 = vertexToFrag70_g45976;
				float3 temp_output_11_0_g45972 = ( (_CoverMapTint).rgb * (SAMPLE_TEXTURE2D( _CoverMapAlbedo, sampler_Splat0, temp_output_189_0_g45972 )).rgb * _CoverMapBrightness );
				float3 CoverMap_Albedo8425_g45716 = temp_output_11_0_g45972;
				float3 temp_output_27_0_g58188 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58188 = lerpResult9_g58025;
				float3 lerpResult29_g58188 = lerp( temp_output_27_0_g58188 , temp_output_28_0_g58188 , saturate( ( ( distance( temp_output_28_0_g58188 , temp_output_27_0_g58188 ) - _CoverMapRangeL4 ) / max( _CoverMapFuzzinessL4 , 1E-05 ) ) ));
				float3 temp_output_10877_20_g45716 = lerpResult29_g58188;
				float3 lerpResult8455_g45716 = lerp( lerpResult9_g58025 , temp_output_10877_20_g45716 , _CoverMapAffectL4);
				float3 temp_output_13_0_g58193 = lerpResult8455_g45716;
				float2 vertexToFrag81_g58193 = IN.ase_texcoord3.zw;
				float4 tex2DNode11_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag81_g58193 );
				float lerpResult71_g58193 = lerp( tex2DNode11_g58193.r , ( 1.0 - tex2DNode11_g58193.r ) , _Splat4_NoiseInvert);
				float3 lerpResult6_g58193 = lerp( temp_output_13_0_g58193 , ( temp_output_13_0_g58193 * ( 1.0 - _Splat4_NoiseDarken ) ) , lerpResult71_g58193);
				float3 lerpResult4_g58193 = lerp( temp_output_13_0_g58193 , lerpResult6_g58193 , _Splat4_EnableNoise);
				float2 vertexToFrag70_g58082 = IN.ase_texcoord4.xy;
				float2 temp_output_6_0_g58276 = vertexToFrag70_g58082;
				float3 temp_output_10898_32_g45716 = (SAMPLE_TEXTURE2D( _Splat1, sampler_Splat0, temp_output_6_0_g58276 )).rgb;
				float3 SPLAT_1_FINAL2809_g45716 = temp_output_10898_32_g45716;
				float3 temp_output_3633_0_g45716 = ( (_Splat5_Color).rgb * SPLAT_1_FINAL2809_g45716 * _Splat5_Brightness );
				float3 temp_output_12_0_g58225 = temp_output_3633_0_g45716;
				float dotResult28_g58225 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58225 );
				float3 temp_cast_3 = (dotResult28_g58225).xxx;
				float temp_output_21_0_g58225 = ( 1.0 - _Splat5_Saturation );
				float3 lerpResult31_g58225 = lerp( temp_cast_3 , temp_output_12_0_g58225 , temp_output_21_0_g58225);
				float3 temp_output_11_0_g58190 = lerpResult31_g58225;
				float3 temp_output_12_0_g58191 = temp_output_11_0_g58190;
				float dotResult28_g58191 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58191 );
				float3 temp_cast_4 = (dotResult28_g58191).xxx;
				float temp_output_21_0_g58191 = 1.5;
				float3 lerpResult31_g58191 = lerp( temp_cast_4 , temp_output_12_0_g58191 , temp_output_21_0_g58191);
				float3 temp_output_4_0_g58190 = ( saturate( lerpResult31_g58191 ) * 0.2 );
				float lerpResult23_g58190 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58190 = lerp( _TerrainWetnessIntensity , lerpResult23_g58190 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58190 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58190 = lerp( temp_output_11_0_g58190 , temp_output_4_0_g58190 , saturate( ( saturate( max( 0.0 , lerpResult22_g58190 ) ) * temp_output_29_0_g58190 ) ));
				float temp_output_38_0_g58190 = _TerrainWetnessAffectLayer5;
				float3 lerpResult9_g58190 = lerp( temp_output_11_0_g58190 , lerpResult6_g58190 , temp_output_38_0_g58190);
				float3 temp_output_27_0_g58186 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58186 = lerpResult9_g58190;
				float3 lerpResult29_g58186 = lerp( temp_output_27_0_g58186 , temp_output_28_0_g58186 , saturate( ( ( distance( temp_output_28_0_g58186 , temp_output_27_0_g58186 ) - _CoverMapRangeL5 ) / max( _CoverMapFuzzinessL5 , 1E-05 ) ) ));
				float3 temp_output_10875_20_g45716 = lerpResult29_g58186;
				float3 lerpResult8463_g45716 = lerp( lerpResult9_g58190 , temp_output_10875_20_g45716 , _CoverMapAffectL5);
				float3 temp_output_37_0_g58193 = lerpResult8463_g45716;
				float2 vertexToFrag83_g58193 = IN.ase_texcoord4.zw;
				float4 tex2DNode32_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag83_g58193 );
				float lerpResult72_g58193 = lerp( tex2DNode32_g58193.r , ( 1.0 - tex2DNode32_g58193.r ) , _Splat5_NoiseInvert);
				float3 lerpResult28_g58193 = lerp( temp_output_37_0_g58193 , ( temp_output_37_0_g58193 * ( 1.0 - _Splat5_NoiseDarken ) ) , lerpResult72_g58193);
				float3 lerpResult38_g58193 = lerp( temp_output_37_0_g58193 , lerpResult28_g58193 , _Splat5_EnableNoise);
				float2 vertexToFrag70_g58064 = IN.ase_texcoord5.xy;
				float2 temp_output_6_0_g58282 = vertexToFrag70_g58064;
				float3 temp_output_10899_32_g45716 = (SAMPLE_TEXTURE2D( _Splat2, sampler_Splat0, temp_output_6_0_g58282 )).rgb;
				float3 SPLAT_2_FINAL2812_g45716 = temp_output_10899_32_g45716;
				float3 temp_output_3637_0_g45716 = ( (_Splat6_Color).rgb * SPLAT_2_FINAL2812_g45716 * _Splat6_Brightness );
				float3 temp_output_12_0_g58226 = temp_output_3637_0_g45716;
				float dotResult28_g58226 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58226 );
				float3 temp_cast_5 = (dotResult28_g58226).xxx;
				float temp_output_21_0_g58226 = ( 1.0 - _Splat6_Saturation );
				float3 lerpResult31_g58226 = lerp( temp_cast_5 , temp_output_12_0_g58226 , temp_output_21_0_g58226);
				float3 temp_output_11_0_g58183 = lerpResult31_g58226;
				float3 temp_output_12_0_g58184 = temp_output_11_0_g58183;
				float dotResult28_g58184 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58184 );
				float3 temp_cast_6 = (dotResult28_g58184).xxx;
				float temp_output_21_0_g58184 = 1.5;
				float3 lerpResult31_g58184 = lerp( temp_cast_6 , temp_output_12_0_g58184 , temp_output_21_0_g58184);
				float3 temp_output_4_0_g58183 = ( saturate( lerpResult31_g58184 ) * 0.2 );
				float lerpResult23_g58183 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58183 = lerp( _TerrainWetnessIntensity , lerpResult23_g58183 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58183 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58183 = lerp( temp_output_11_0_g58183 , temp_output_4_0_g58183 , saturate( ( saturate( max( 0.0 , lerpResult22_g58183 ) ) * temp_output_29_0_g58183 ) ));
				float temp_output_38_0_g58183 = _TerrainWetnessAffectLayer6;
				float3 lerpResult9_g58183 = lerp( temp_output_11_0_g58183 , lerpResult6_g58183 , temp_output_38_0_g58183);
				float3 temp_output_27_0_g58189 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58189 = lerpResult9_g58183;
				float3 lerpResult29_g58189 = lerp( temp_output_27_0_g58189 , temp_output_28_0_g58189 , saturate( ( ( distance( temp_output_28_0_g58189 , temp_output_27_0_g58189 ) - _CoverMapRangeL6 ) / max( _CoverMapFuzzinessL6 , 1E-05 ) ) ));
				float3 temp_output_10878_20_g45716 = lerpResult29_g58189;
				float3 lerpResult8469_g45716 = lerp( lerpResult9_g58183 , temp_output_10878_20_g45716 , _CoverMapAffectL6);
				float3 temp_output_48_0_g58193 = lerpResult8469_g45716;
				float2 vertexToFrag85_g58193 = IN.ase_texcoord5.zw;
				float4 tex2DNode45_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag85_g58193 );
				float lerpResult73_g58193 = lerp( tex2DNode45_g58193.r , ( 1.0 - tex2DNode45_g58193.r ) , _Splat6_NoiseInvert);
				float3 lerpResult42_g58193 = lerp( temp_output_48_0_g58193 , ( temp_output_48_0_g58193 * ( 1.0 - _Splat6_NoiseDarken ) ) , lerpResult73_g58193);
				float3 lerpResult46_g58193 = lerp( temp_output_48_0_g58193 , lerpResult42_g58193 , _Splat6_EnableNoise);
				float2 vertexToFrag70_g58100 = IN.ase_texcoord6.xy;
				float2 temp_output_6_0_g58288 = vertexToFrag70_g58100;
				float3 temp_output_10900_32_g45716 = (SAMPLE_TEXTURE2D( _Splat3, sampler_Splat0, temp_output_6_0_g58288 )).rgb;
				float3 SPLAT_3_FINAL2814_g45716 = temp_output_10900_32_g45716;
				float3 temp_output_3642_0_g45716 = ( (_Splat7_Color).rgb * SPLAT_3_FINAL2814_g45716 * _Splat7_Brightness );
				float3 temp_output_12_0_g58227 = temp_output_3642_0_g45716;
				float dotResult28_g58227 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58227 );
				float3 temp_cast_7 = (dotResult28_g58227).xxx;
				float temp_output_21_0_g58227 = ( 1.0 - _Splat7_Saturation );
				float3 lerpResult31_g58227 = lerp( temp_cast_7 , temp_output_12_0_g58227 , temp_output_21_0_g58227);
				float3 temp_output_11_0_g58016 = lerpResult31_g58227;
				float3 temp_output_12_0_g58017 = temp_output_11_0_g58016;
				float dotResult28_g58017 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g58017 );
				float3 temp_cast_8 = (dotResult28_g58017).xxx;
				float temp_output_21_0_g58017 = 1.5;
				float3 lerpResult31_g58017 = lerp( temp_cast_8 , temp_output_12_0_g58017 , temp_output_21_0_g58017);
				float3 temp_output_4_0_g58016 = ( saturate( lerpResult31_g58017 ) * 0.2 );
				float lerpResult23_g58016 = lerp( _TerrainWetnessIntensity , ( _TerrainWetnessIntensity * _GlobalWetnessTerrainIntensity ) , _GlobalWetnessTerrainEnabled);
				float lerpResult22_g58016 = lerp( _TerrainWetnessIntensity , lerpResult23_g58016 , _TerrainWetnessBiasGlobal);
				float temp_output_29_0_g58016 = saturate( _TerrainWetnessMask );
				float3 lerpResult6_g58016 = lerp( temp_output_11_0_g58016 , temp_output_4_0_g58016 , saturate( ( saturate( max( 0.0 , lerpResult22_g58016 ) ) * temp_output_29_0_g58016 ) ));
				float temp_output_38_0_g58016 = _TerrainWetnessAffectLayer7;
				float3 lerpResult9_g58016 = lerp( temp_output_11_0_g58016 , lerpResult6_g58016 , temp_output_38_0_g58016);
				float3 temp_output_27_0_g58187 = CoverMap_Albedo8425_g45716;
				float3 temp_output_28_0_g58187 = lerpResult9_g58016;
				float3 lerpResult29_g58187 = lerp( temp_output_27_0_g58187 , temp_output_28_0_g58187 , saturate( ( ( distance( temp_output_28_0_g58187 , temp_output_27_0_g58187 ) - _CoverMapRangeL7 ) / max( _CoverMapFuzzinessL7 , 1E-05 ) ) ));
				float3 temp_output_10876_20_g45716 = lerpResult29_g58187;
				float3 lerpResult8475_g45716 = lerp( lerpResult9_g58016 , temp_output_10876_20_g45716 , _CoverMapAffectL7);
				float3 temp_output_61_0_g58193 = lerpResult8475_g45716;
				float2 vertexToFrag87_g58193 = IN.ase_texcoord6.zw;
				float4 tex2DNode58_g58193 = SAMPLE_TEXTURE2D( _GlobalTerrainNoise, sampler_Splat0, vertexToFrag87_g58193 );
				float lerpResult74_g58193 = lerp( tex2DNode58_g58193.r , ( 1.0 - tex2DNode58_g58193.r ) , _Splat7_NoiseInvert);
				float3 lerpResult55_g58193 = lerp( temp_output_61_0_g58193 , ( temp_output_61_0_g58193 * ( 1.0 - _Splat7_NoiseDarken ) ) , lerpResult74_g58193);
				float3 lerpResult59_g58193 = lerp( temp_output_61_0_g58193 , lerpResult55_g58193 , _Splat7_EnableNoise);
				float4 weightedBlendVar7863_g45716 = Control00Weight403_g45716;
				float3 weightedBlend7863_g45716 = ( weightedBlendVar7863_g45716.x*lerpResult4_g58193 + weightedBlendVar7863_g45716.y*lerpResult38_g58193 + weightedBlendVar7863_g45716.z*lerpResult46_g58193 + weightedBlendVar7863_g45716.w*lerpResult59_g58193 );
				float3 temp_output_2894_0_g45716 = ( saturate( weightedBlend7863_g45716 ) * _Global_Brightness );
				float3 localClipHoles4536_g45716 = ( temp_output_2894_0_g45716 );
				float2 uv_TerrainHolesTexture = IN.ase_texcoord7.xy * _TerrainHolesTexture_ST.xy + _TerrainHolesTexture_ST.zw;
				float Hole4536_g45716 = SAMPLE_TEXTURE2D( _TerrainHolesTexture, sampler_TerrainHolesTexture, uv_TerrainHolesTexture ).r;
				{
				#ifdef _ALPHATEST_ON
				clip(Hole4536_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				

				float3 BaseColor = localClipHoles4536_g45716;
				float Alpha = saturate( dotResult1044_g45716 );
				float AlphaClipThreshold = 0.0;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			

			

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			
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

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _TERRAIN_INSTANCED_PERPIXEL_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			TEXTURE2D(_Normal0);
			TEXTURE2D(_Splat0);
			SAMPLER(sampler_Normal0);
			TEXTURE2D(_CoverMapNormal);
			TEXTURE2D(_Normal1);
			TEXTURE2D(_Splat1);
			TEXTURE2D(_Normal2);
			TEXTURE2D(_Splat2);
			TEXTURE2D(_Normal3);
			TEXTURE2D(_Splat3);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			half4 CalculateShadowMask497_g58848( half2 LightmapUV )
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
			
			float3 AdditionalLightsFlatMask14x( float3 WorldPosition, float2 ScreenUV, float4 ShadowMask )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					#define SUM_LIGHTFLAT(Light)\
						Color += Light.color * ( Light.distanceAttenuation * Light.shadowAttenuation );
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
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.ase_texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				v = ApplyMeshModification(v);
				float4 appendResult10975_g45716 = (float4(cross( v.normalOS , float3(0,0,1) ) , -1.0));
				
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.ase_texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord5.xy = vertexToFrag27_g58045;
				float2 Offset235_g58046 = _Splat0_ST.zw;
				float2 temp_output_41_0_g58046 = ( ( v.ase_texcoord.xy * _Splat0_ST.xy ) + Offset235_g58046 );
				float2 vertexToFrag70_g58046 = temp_output_41_0_g58046;
				o.ase_texcoord5.zw = vertexToFrag70_g58046;
				float2 Offset235_g45976 = float2( 1,0 );
				float2 temp_output_41_0_g45976 = ( ( v.ase_texcoord.xy * float2( 1,1 ) ) + Offset235_g45976 );
				float2 vertexToFrag70_g45976 = temp_output_41_0_g45976;
				o.ase_texcoord6.xy = vertexToFrag70_g45976;
				float2 Offset235_g58082 = _Splat1_ST.zw;
				float2 temp_output_41_0_g58082 = ( ( v.ase_texcoord.xy * _Splat1_ST.xy ) + Offset235_g58082 );
				float2 vertexToFrag70_g58082 = temp_output_41_0_g58082;
				o.ase_texcoord6.zw = vertexToFrag70_g58082;
				float2 Offset235_g58064 = _Splat2_ST.zw;
				float2 temp_output_41_0_g58064 = ( ( v.ase_texcoord.xy * _Splat2_ST.xy ) + Offset235_g58064 );
				float2 vertexToFrag70_g58064 = temp_output_41_0_g58064;
				o.ase_texcoord7.xy = vertexToFrag70_g58064;
				float2 Offset235_g58100 = _Splat3_ST.zw;
				float2 temp_output_41_0_g58100 = ( ( v.ase_texcoord.xy * _Splat3_ST.xy ) + Offset235_g58100 );
				float2 vertexToFrag70_g58100 = temp_output_41_0_g58100;
				o.ase_texcoord7.zw = vertexToFrag70_g58100;
				
				o.ase_texcoord8.xy = v.ase_texcoord2.xy;
				o.ase_texcoord9 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
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
				v.tangentOS = appendResult10975_g45716;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;

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
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
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

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag27_g58045 = IN.ase_texcoord5.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				float localSplatClip1046_g45716 = ( dotResult1044_g45716 );
				float SplatWeight1046_g45716 = dotResult1044_g45716;
				{
				#if !defined(SHADER_API_MOBILE) && defined(TERRAIN_SPLAT_ADDPASS)
				clip(SplatWeight1046_g45716 == 0.0f ? -1 : 1);
				#endif
				}
				float4 temp_output_1048_0_g45716 = ( tex2DNode3739_g45716 / ( localSplatClip1046_g45716 + 0.001 ) );
				float4 Control00Weight403_g45716 = temp_output_1048_0_g45716;
				float2 vertexToFrag70_g58046 = IN.ase_texcoord5.zw;
				float2 temp_output_6_0_g58294 = vertexToFrag70_g58046;
				float4 temp_output_10901_33_g45716 = SAMPLE_TEXTURE2D( _Normal0, sampler_Normal0, temp_output_6_0_g58294 );
				float4 NORMAL_0_FINAL3070_g45716 = temp_output_10901_33_g45716;
				float3 unpack10077_g45716 = UnpackNormalScale( NORMAL_0_FINAL3070_g45716, _Splat4_NormalScale );
				unpack10077_g45716.z = lerp( 1, unpack10077_g45716.z, saturate(_Splat4_NormalScale) );
				float2 vertexToFrag70_g45976 = IN.ase_texcoord6.xy;
				float2 temp_output_189_0_g45972 = vertexToFrag70_g45976;
				float3 unpack163_g45972 = UnpackNormalScale( SAMPLE_TEXTURE2D( _CoverMapNormal, sampler_Normal0, temp_output_189_0_g45972 ), _CoverMapNormalStrength );
				unpack163_g45972.z = lerp( 1, unpack163_g45972.z, saturate(_CoverMapNormalStrength) );
				float3 CoverMap_Normal8436_g45716 = unpack163_g45972;
				float3 temp_output_30_0_g57934 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57934 = unpack10077_g45716;
				float Layer0Range10428_g45716 = _CoverMapRangeL4;
				float Layer0Fuzziness10429_g45716 = _CoverMapFuzzinessL4;
				float3 lerpResult38_g57934 = lerp( temp_output_30_0_g57934 , temp_output_46_0_g57934 , saturate( ( ( distance( temp_output_46_0_g57934 , temp_output_30_0_g57934 ) - Layer0Range10428_g45716 ) / max( Layer0Fuzziness10429_g45716 , 1E-05 ) ) ));
				float3 temp_output_10527_48_g45716 = lerpResult38_g57934;
				float CoverMapLayer08450_g45716 = _CoverMapAffectL4;
				float3 lerpResult8458_g45716 = lerp( unpack10077_g45716 , temp_output_10527_48_g45716 , CoverMapLayer08450_g45716);
				float2 vertexToFrag70_g58082 = IN.ase_texcoord6.zw;
				float2 temp_output_6_0_g58276 = vertexToFrag70_g58082;
				float4 temp_output_10898_33_g45716 = SAMPLE_TEXTURE2D( _Normal1, sampler_Normal0, temp_output_6_0_g58276 );
				float4 NORMAL_1_FINAL3071_g45716 = temp_output_10898_33_g45716;
				float3 unpack10076_g45716 = UnpackNormalScale( NORMAL_1_FINAL3071_g45716, _Splat5_NormalScale );
				unpack10076_g45716.z = lerp( 1, unpack10076_g45716.z, saturate(_Splat5_NormalScale) );
				float3 temp_output_30_0_g57932 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57932 = unpack10076_g45716;
				float Layer1Range10423_g45716 = _CoverMapRangeL5;
				float Layer1Fuzziness10424_g45716 = _CoverMapFuzzinessL5;
				float3 lerpResult38_g57932 = lerp( temp_output_30_0_g57932 , temp_output_46_0_g57932 , saturate( ( ( distance( temp_output_46_0_g57932 , temp_output_30_0_g57932 ) - Layer1Range10423_g45716 ) / max( Layer1Fuzziness10424_g45716 , 1E-05 ) ) ));
				float3 temp_output_10529_48_g45716 = lerpResult38_g57932;
				float CoverMapLayer18465_g45716 = _CoverMapAffectL5;
				float3 lerpResult8505_g45716 = lerp( unpack10076_g45716 , temp_output_10529_48_g45716 , CoverMapLayer18465_g45716);
				float2 vertexToFrag70_g58064 = IN.ase_texcoord7.xy;
				float2 temp_output_6_0_g58282 = vertexToFrag70_g58064;
				float4 temp_output_10899_33_g45716 = SAMPLE_TEXTURE2D( _Normal2, sampler_Normal0, temp_output_6_0_g58282 );
				float4 NORMAL_2_FINAL3072_g45716 = temp_output_10899_33_g45716;
				float3 unpack10075_g45716 = UnpackNormalScale( NORMAL_2_FINAL3072_g45716, _Splat6_NormalScale );
				unpack10075_g45716.z = lerp( 1, unpack10075_g45716.z, saturate(_Splat6_NormalScale) );
				float3 temp_output_30_0_g57938 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57938 = unpack10075_g45716;
				float Layer2Fuzziness10422_g45716 = _CoverMapFuzzinessL6;
				float3 lerpResult38_g57938 = lerp( temp_output_30_0_g57938 , temp_output_46_0_g57938 , saturate( ( ( distance( temp_output_46_0_g57938 , temp_output_30_0_g57938 ) - Layer2Fuzziness10422_g45716 ) / max( Layer2Fuzziness10422_g45716 , 1E-05 ) ) ));
				float3 temp_output_10526_48_g45716 = lerpResult38_g57938;
				float CoverMaptLayer28471_g45716 = _CoverMapAffectL6;
				float3 lerpResult8510_g45716 = lerp( unpack10075_g45716 , temp_output_10526_48_g45716 , CoverMaptLayer28471_g45716);
				float2 vertexToFrag70_g58100 = IN.ase_texcoord7.zw;
				float2 temp_output_6_0_g58288 = vertexToFrag70_g58100;
				float4 temp_output_10900_33_g45716 = SAMPLE_TEXTURE2D( _Normal3, sampler_Normal0, temp_output_6_0_g58288 );
				float4 NORMAL_3_FINAL3073_g45716 = temp_output_10900_33_g45716;
				float3 unpack10074_g45716 = UnpackNormalScale( NORMAL_3_FINAL3073_g45716, _Splat7_NormalScale );
				unpack10074_g45716.z = lerp( 1, unpack10074_g45716.z, saturate(_Splat7_NormalScale) );
				float3 temp_output_30_0_g57955 = CoverMap_Normal8436_g45716;
				float3 temp_output_46_0_g57955 = unpack10074_g45716;
				float Layer3Range10418_g45716 = _CoverMapRangeL7;
				float Layer3Fuzziness10419_g45716 = _CoverMapFuzzinessL7;
				float3 lerpResult38_g57955 = lerp( temp_output_30_0_g57955 , temp_output_46_0_g57955 , saturate( ( ( distance( temp_output_46_0_g57955 , temp_output_30_0_g57955 ) - Layer3Range10418_g45716 ) / max( Layer3Fuzziness10419_g45716 , 1E-05 ) ) ));
				float3 temp_output_10528_48_g45716 = lerpResult38_g57955;
				float CoverMapLayer38477_g45716 = _CoverMapAffectL7;
				float3 lerpResult8515_g45716 = lerp( unpack10074_g45716 , temp_output_10528_48_g45716 , CoverMapLayer38477_g45716);
				float4 weightedBlendVar504_g45716 = Control00Weight403_g45716;
				float3 weightedBlend504_g45716 = ( weightedBlendVar504_g45716.x*lerpResult8458_g45716 + weightedBlendVar504_g45716.y*lerpResult8505_g45716 + weightedBlendVar504_g45716.z*lerpResult8510_g45716 + weightedBlendVar504_g45716.w*lerpResult8515_g45716 );
				float3 worldPosValue187_g58848 = WorldPosition;
				float3 WorldPosition434_g58848 = worldPosValue187_g58848;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g58848 = (ase_screenPosNorm).xy;
				float2 ScreenUV434_g58848 = ScreenUV190_g58848;
				half2 LightmapUV497_g58848 = (IN.ase_texcoord8.xy*(unity_DynamicLightmapST).xy + (unity_DynamicLightmapST).zw);
				half4 localCalculateShadowMask497_g58848 = CalculateShadowMask497_g58848( LightmapUV497_g58848 );
				float4 shadowMaskValue180_g58848 = localCalculateShadowMask497_g58848;
				float4 ShadowMask434_g58848 = shadowMaskValue180_g58848;
				float3 localAdditionalLightsFlatMask14x434_g58848 = AdditionalLightsFlatMask14x( WorldPosition434_g58848 , ScreenUV434_g58848 , ShadowMask434_g58848 );
				float3 Final_Normal10668_g45716 = ( weightedBlend504_g45716 + localAdditionalLightsFlatMask14x434_g58848 );
				#ifdef _TERRAIN_INSTANCED_PERPIXEL_NORMAL
				float3 staticSwitch10602_g45716 = Final_Normal10668_g45716;
				#else
				float3 staticSwitch10602_g45716 = Final_Normal10668_g45716;
				#endif
				

				float3 Normal = staticSwitch10602_g45716;
				float Alpha = saturate( dotResult1044_g45716 );
				float AlphaClipThreshold = 0.0;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.ase_texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
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

				v = ApplyMeshModification(v);
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.ase_texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord.xy = vertexToFrag27_g58045;
				
				o.ase_texcoord1 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

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

				float2 vertexToFrag27_g58045 = IN.ase_texcoord.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				

				surfaceDescription.Alpha = saturate( dotResult1044_g45716 );
				surfaceDescription.AlphaClipThreshold = 0.0;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		UsePass "Hidden/Nature/Terrain/Utilities/PICKING"
	UsePass "Hidden/Nature/Terrain/Utilities/SELECTION"

		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap forwardadd
			#define TERRAIN_SPLAT_ADDPASS 1


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _CoverMapTint;
			half4 _Splat4_Color;
			float4 _TerrainHolesTexture_ST;
			float4 _Splat3_ST;
			float4 _Splat2_ST;
			float4 _Splat1_ST;
			half4 _Splat5_Color;
			float4 _Control_ST;
			half4 _Splat6_Color;
			float4 _Splat0_ST;
			half4 _Splat7_Color;
			half _TerrainWetnessAffectLayer4;
			half _Splat6_EnableNoise;
			half _Splat5_OcclusionStrengthAO;
			half _CoverMapFuzzinessL4;
			half _Splat6_OcclusionStrengthAO;
			half _Splat4_OcclusionStrengthAO;
			half _CoverMapRangeL4;
			half _TerrainWetnessAffectLayer5;
			half _CoverMapRangeL5;
			half _Splat7_OcclusionStrengthAO;
			half _TerrainWetnessAffectLayer6;
			half _CoverMapFuzzinessL7;
			half _CoverMapRangeL7;
			half _CoverMapFuzzinessL5;
			half _Splat4_SmoothnessType;
			half _Splat6_SmoothnessType;
			half _Splat0_Smoothness;
			half _Global_Brightness;
			half _CoverMapBrightness;
			float _TerrainWetnessMask;
			half _TerrainWetnessBiasGlobal;
			float _TerrainWetnessIntensity;
			half _Splat7_SmoothnessType;
			half _Splat4_Smoothness;
			half _Splat7_Smoothness;
			half _Splat6_Smoothness;
			half _Splat2_Smoothness;
			half _CoverMapFuzzinessL6;
			half _Splat5_Smoothness;
			half _Splat1_Smoothness;
			half _Splat5_SmoothnessType;
			half _Splat3_Smoothness;
			half _CoverMapRangeL6;
			half _Splat6_NormalScale;
			half _Splat7_NormalScale;
			half _Splat7_EnableNoise;
			half _CoverMapAffectL6;
			half _CoverMapAffectL5;
			half _CoverMapAffectL4;
			half _Splat6_NoiseDarken;
			half _Splat6_Brightness;
			half _Splat7_Saturation;
			half _Splat4_NoiseInvert;
			half _Splat7_Brightness;
			half _EnableBasePassCoverMap;
			half _Splat5_Saturation;
			half _Splat5_Brightness;
			half _Splat4_Saturation;
			half _Splat4_Brightness;
			half _BasePassSmoothness;
			half _BasePassBrightness;
			half _Splat6_Saturation;
			half _TerrainWetnessAffectLayer7;
			half _Splat5_NoiseInvert;
			half _Splat7_NoiseInvert;
			half _Splat5_NormalScale;
			half _Splat4_NormalScale;
			half _Splat7_Metallic;
			half _Splat6_Metallic;
			half _Splat5_Metallic;
			half _Splat4_Metallic;
			half _Splat7_NoiseDarken;
			half _Splat6_NoiseInvert;
			half _CoverMapAffectL7;
			half _Splat4_EnableNoise;
			half _Splat5_EnableNoise;
			half _Splat5_NoiseDarken;
			half _Splat4_NoiseDarken;
			half _Splat7_NoiseScale;
			half _Splat6_NoiseScale;
			half _Splat4_NoiseScale;
			half _Splat5_NoiseScale;
			half _CoverMapNormalStrength;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_Control);
			SAMPLER(sampler_Control);
			#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
				TEXTURE2D(_TerrainHeightmapTexture);//ASE Terrain Instancing
				TEXTURE2D( _TerrainNormalmapTexture);//ASE Terrain Instancing
				SAMPLER(sampler_TerrainNormalmapTexture);//ASE Terrain Instancing
			#endif//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_START( Terrain )//ASE Terrain Instancing
				UNITY_DEFINE_INSTANCED_PROP( float4, _TerrainPatchInstanceData )//ASE Terrain Instancing
			UNITY_INSTANCING_BUFFER_END( Terrain)//ASE Terrain Instancing
			CBUFFER_START( UnityTerrain)//ASE Terrain Instancing
				#ifdef UNITY_INSTANCING_ENABLED//ASE Terrain Instancing
					float4 _TerrainHeightmapRecipSize;//ASE Terrain Instancing
					float4 _TerrainHeightmapScale;//ASE Terrain Instancing
				#endif//ASE Terrain Instancing
			CBUFFER_END//ASE Terrain Instancing


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			VertexInput ApplyMeshModification( VertexInput v )
			{
			#ifdef UNITY_INSTANCING_ENABLED
				float2 patchVertex = v.positionOS.xy;
				float4 instanceData = UNITY_ACCESS_INSTANCED_PROP( Terrain, _TerrainPatchInstanceData );
				float2 sampleCoords = ( patchVertex.xy + instanceData.xy ) * instanceData.z;
				float height = UnpackHeightmap( _TerrainHeightmapTexture.Load( int3( sampleCoords, 0 ) ) );
				v.positionOS.xz = sampleCoords* _TerrainHeightmapScale.xz;
				v.positionOS.y = height* _TerrainHeightmapScale.y;
				#ifdef ENABLE_TERRAIN_PERPIXEL_NORMAL
					v.normalOS = float3(0, 1, 0);
				#else
					v.normalOS = _TerrainNormalmapTexture.Load(int3(sampleCoords, 0)).rgb* 2 - 1;
				#endif
				v.ase_texcoord.xy = sampleCoords* _TerrainHeightmapRecipSize.zw;
			#endif
				return v;
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

				v = ApplyMeshModification(v);
				float2 break26_g58045 = _Control_ST.zw;
				float2 appendResult15_g58045 = (float2(( break26_g58045.x + 0.001 ) , ( break26_g58045.y + 0.0001 )));
				float2 vertexToFrag27_g58045 = ( ( v.ase_texcoord.xy * _Control_ST.xy ) + appendResult15_g58045 );
				o.ase_texcoord.xy = vertexToFrag27_g58045;
				
				o.ase_texcoord1 = v.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

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

				float2 vertexToFrag27_g58045 = IN.ase_texcoord.xy;
				float4 tex2DNode3739_g45716 = SAMPLE_TEXTURE2D( _Control, sampler_Control, vertexToFrag27_g58045 );
				float dotResult1044_g45716 = dot( tex2DNode3739_g45716 , half4(1,1,1,1) );
				

				surfaceDescription.Alpha = saturate( dotResult1044_g45716 );
				surfaceDescription.AlphaClipThreshold = 0.0;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "DE_ShaderGUITerrain"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/Universal Render Pipeline/FallbackError"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.RangedFloatNode;65;320,272;Inherit;False;Constant;_AlphaClipThreshold1;AlphaClipThreshold;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;66;224,0;Inherit;False;DESF Terrain 8 Layer;0;;45716;8162e294921788c47a27c2043589b3c8;200,4484,1,4485,1,10966,1,9368,1,10830,1,9357,1,9513,1,9514,1,9322,1,9340,1,9542,1,10105,1,10111,1,10190,1,9519,1,10108,1,9520,1,10118,1,9370,1,9316,1,9543,1,10843,1,10836,1,10824,1,10189,1,9324,1,9544,1,9517,1,9516,1,9327,1,9337,1,10410,1,10409,1,10407,1,10408,1,9344,1,10414,1,9353,1,10413,1,9319,1,9342,1,9334,1,10119,1,10176,1,9341,1,9511,1,9351,1,9510,1,9323,1,9545,1,9313,1,9312,1,9299,1,10411,1,9991,1,9992,1,9355,1,9310,1,10173,1,10120,1,10553,1,9922,1,10183,1,10122,1,10564,1,10565,1,9305,1,10174,1,10175,1,10107,1,10192,1,10209,1,10208,1,10123,1,10579,1,10191,1,10578,1,10124,1,9371,1,10552,1,9379,1,10412,1,9378,1,10212,1,9993,1,10112,1,9597,1,9486,1,9483,1,9480,1,9328,1,9360,1,9359,1,10114,1,10213,1,9361,1,9598,1,10110,1,10182,1,9347,1,10184,1,9369,1,9362,1,10116,1,9332,1,10181,1,9311,1,10115,1,2896,1,10368,1,3629,1,9506,0,3371,1,10826,1,3630,1,9507,0,9498,0,10825,0,3777,1,10835,1,3776,1,3635,1,3790,1,10828,1,3636,1,3788,1,10842,1,3800,1,3797,1,3641,1,9508,0,9499,0,9509,0,10837,0,9500,0,10829,0,9504,0,9505,0,9502,0,10844,0,9501,0,9503,0,9793,0,9780,0,9771,0,9772,0,9777,0,9791,0,9781,0,9776,0,9761,0,9775,0,9792,0,9773,0,9757,0,9759,0,9779,0,5124,1,5125,1,5126,1,5127,1,10147,1,10148,1,10149,1,10150,1,10198,0,8656,1,8654,1,8311,1,8655,1,8644,1,8643,1,8615,1,8645,1,9763,1,9751,1,9752,1,9762,1,9765,1,9749,1,9750,1,9764,1,10619,0,10610,0,10612,0,10618,0,10614,0,10617,0,10620,0,10616,0,5839,0,6624,1,5242,0,5260,0,10681,0,10680,0,10667,0,10679,0,10678,0,10682,0;0;9;FLOAT3;0;FLOAT3;549;FLOAT;550;FLOAT;551;FLOAT;552;FLOAT;2761;FLOAT3;553;FLOAT3;10968;FLOAT4;10960
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;54;644.0565,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;56;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;57;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;58;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;59;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;1;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;60;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;61;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;62;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;63;644.0565,42.11808;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;55;640,0;Float;False;True;-1;2;DE_ShaderGUITerrain;0;12;Hidden/DE Environment/Terrain/Standard AddPass;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;6;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=-99;UniversalMaterialType=Lit;TerrainCompatible=True;IgnoreProjector=True;True;5;True;12;all;0;False;True;1;1;False;;1;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;3;LightMode=UniversalForwardOnly;TerrainCompatible=True;IgnoreProjector=True;False;False;4;Include;;False;;Native;False;0;0;;Define;TERRAIN_SPLAT_ADDPASS 1;False;;Custom;False;0;0;;Pragma;instancing_options assumeuniformscaling nomatrices nolightprobe nolightmap;False;;Custom;True;0;0;Forward, GBuffer;Pragma;multi_compile_instancing;False;;Custom;True;0;0;Forward,GBuffer,ShadowCaster,DepthOnly,DepthNormals;Hidden/Universal Render Pipeline/FallbackError;0;0;Standard;39;Workflow;1;0;Surface;1;638162443384408054;  Refraction Model;0;0;  Blend;2;638162443425392252;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638162443315861800;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;0;638162454290526574;  Use Shadow Threshold;0;0;GPU Instancing;0;638162456918797600;LOD CrossFade;0;638162443532656889;Built-in Fog;0;638162443556014694;_FinalColorxAlpha;1;638162443637993649;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;False;True;True;True;True;False;True;True;True;;True;0
WireConnection;55;0;66;0
WireConnection;55;1;66;549
WireConnection;55;3;66;550
WireConnection;55;4;66;551
WireConnection;55;5;66;552
WireConnection;55;6;66;2761
WireConnection;55;7;65;0
WireConnection;55;10;66;10968
WireConnection;55;30;66;10960
ASEEND*/
//CHKSM=9CB73B9C2E01DCAB4E5B49BF3630147EE62D86B3