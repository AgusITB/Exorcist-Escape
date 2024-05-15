// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Vegetation Snow/Billboard Cross"
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
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(UV0 _UV1 _UV2 _UV3)]_UVMode("UV Mode", Float) = 0
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Space(10)]_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_SmoothnessFresnelEnable("Enable Fresnel", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 0
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(SNOW,true,_SnowEnable,0,0)]_CATEGORY_SNOW("CATEGORY_SNOW", Float) = 0
		[DE_DrawerToggleLeft]_SnowEnable("ENABLE SNOW", Float) = 0
		_SnowColorTop("Base Color", Color) = (1,1,1,1)
		_SnowBrightnessTop("Brightness", Range( 0 , 2)) = 1
		_SnowSaturation("Saturation", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_SnowColorMap("Base Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(Object Space _World Space)]_SnowUVSpace("Snow UV Space", Float) = 0
		[DE_DrawerTilingOffset]_SnowUVs("Snow UVs", Vector) = (1,1,0,0)
		_SnowBackFaceBias("BackFace Bias", Range( 0 , 1)) = 0
		_SnowMetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_SnowOcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		_SnowSmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_SnowNormalMap("Normal Map", 2D) = "bump" {}
		_SnowNormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SNOW("SPACE_SNOW", Float) = 0
		[DE_DrawerCategory(SNOW BLENDING,true,_SnowNoiseUV,0,0)]_CATEGORY_SNOWBLENDING("CATEGORY_SNOWBLENDING", Float) = 0
		[DE_DrawerTextureSingleLine]_SnowNoiseMap("Noise Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_SnowNoiseUV("Noise UVs", Vector) = (1,1,0,0)
		_SnowNoiseOffset("Noise Offset", Range( -1 , 1)) = 0.1
		_SnowNoiseLength("Noise Length", Range( 0.5 , 10)) = 6
		[Header(PROJECTION TOP DOWN)]_SnowBlendNormalInfluence("Blend Normal Influence", Range( 0 , 1)) = 1
		_SnowBlendStrength("Blend Strength", Range( 0.01 , 1)) = 1
		_SnowBlendStrengthHeight("Blend Strength Height ", Range( 0.01 , 10)) = 10
		_SnowBlendOffset("Blend Offset", Range( -20 , 20)) = -1
		[Header(PROJECTION SIDE)]_SnowBlendSideStrength("Blend Side Strength", Range( 0 , 1)) = 0.25
		[DE_DrawerSpace(10)]_SPACE_SNOWBLENDING("SPACE_SNOWBLENDING", Float) = 0
		[DE_DrawerCategory(SNOW HEIGHT,true,_SnowHeightEnable,0,0)]_CATEGORY_SNOWHEIGHT("CATEGORY_SNOWHEIGHT", Float) = 0
		[DE_DrawerToggleLeft]_SnowHeightEnable("ENABLE SNOW HEIGHT", Float) = 0
		_SnowHeightStrength("Height Strength", Range( 0 , 2)) = 0.5
		_SnowHeightClipFar("Height  Clip Far", Range( 0.1 , 1)) = 0.1
		_SnowHeightWeight("Height Weight", Range( 0 , 1)) = 0
		_SnowHeightDepth("Height Depth", Float) = 0
		_SnowHeightNoiseScale("Height Noise Scale", Float) = 100
		_SnowHeightNoiseShift("Height Noise Shift", Float) = 2
		[DE_DrawerSpace(10)]_SPACE_SNOWHEIGHT("SPACE_SNOW HEIGHT", Float) = 0
		[DE_DrawerCategory(WETNESS,true,_WetnessEnable,0,0)]_CATEGORY_WETNESS("CATEGORY_WETNESS", Float) = 1
		[DE_DrawerToggleLeft][Space(10)]_WetnessEnable("ENABLE WETNESS", Float) = 0
		[DE_DrawerToggleLeft]_WetnessGlobalInfluenceEnable("ENABLE GLOBAL INFLUENCE ", Float) = 0
		_Wetness("Wetness", Float) = 0.95
		_WetnessMask("Wetness Mask", Float) = 0.75
		[DE_DrawerSpace(10)]_SPACE_WETNESS("SPACE_WETNESS", Float) = 0


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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_Cull]
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

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_SnowColorMap);
			SAMPLER(sampler_SnowColorMap);
			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.tangentOS.xyz = normalize( mul( float4( v.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float4 appendResult986_g44292 = (float4(cross( v.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.texcoord.xy;
				float2 m_UV180_g57754 = v.texcoord1.xy;
				float2 m_UV280_g57754 = v.texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord8.xy = vertexToFrag70_g57754;
				o.ase_texcoord8.zw = vertexToFrag70_g57844;
				o.ase_texcoord9.xy = vertexToFrag70_g57847;
				
				o.ase_texcoord10 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = lerpResult989_g44292;
				v.tangentOS = appendResult986_g44292;

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
				float4 ase_color : COLOR;
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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord8.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float3 temp_output_28_0_g44292 = ( (_BaseColor).rgb * (tex2DNode3_g44292).rgb * _Brightness );
				float3 temp_output_72_0_g57764 = temp_output_28_0_g44292;
				float localStochasticTiling2_g57835 = ( 0.0 );
				float2 vertexToFrag70_g57844 = IN.ase_texcoord8.zw;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57835 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57835 = _SnowColorMap_TexelSize;
				float4 Offsets2_g57835 = float4( 0,0,0,0 );
				float2 Weights2_g57835 = float2( 0,0 );
				{
				UV2_g57835 = UV2_g57835 * TexelSize2_g57835.zw - 0.5;
				float2 f = frac( UV2_g57835 );
				UV2_g57835 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57835.x - 0.5, UV2_g57835.x + 1.5, UV2_g57835.y - 0.5, UV2_g57835.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57835 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57835.xyxy;
				Weights2_g57835 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57836 = Offsets2_g57835;
				float2 Input_FetchWeights200_g57836 = Weights2_g57835;
				float2 break187_g57836 = Input_FetchWeights200_g57836;
				float4 lerpResult181_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yw ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xw ) , break187_g57836.x);
				float4 lerpResult182_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yz ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xz ) , break187_g57836.x);
				float4 lerpResult176_g57836 = lerp( lerpResult181_g57836 , lerpResult182_g57836 , break187_g57836.y);
				float4 Output_Fetch2D202_g57836 = lerpResult176_g57836;
				float3 temp_output_1942_0_g57764 = (Output_Fetch2D202_g57836).rgb;
				float3 temp_output_12_0_g57852 = temp_output_1942_0_g57764;
				float dotResult28_g57852 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g57852 );
				float3 temp_cast_0 = (dotResult28_g57852).xxx;
				float temp_output_21_0_g57852 = ( 1.0 - _SnowSaturation );
				float3 lerpResult31_g57852 = lerp( temp_cast_0 , temp_output_12_0_g57852 , temp_output_21_0_g57852);
				float3 linearToGamma1933_g57764 = FastLinearToSRGB( ( ( (_SnowColorTop).rgb * lerpResult31_g57852 ) * lerpResult31_g57852 * _SnowBrightnessTop ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float2 vertexToFrag70_g57847 = IN.ase_texcoord9.xy;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord10);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_1 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_1 , lerpResult90_g57834 );
				float3 temp_cast_5 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord10.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_5 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * WorldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_6 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( WorldNormal ) - temp_cast_6 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57860 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57860 = lerp( temp_output_72_0_g57764 , linearToGamma1933_g57764 , temp_output_177_0_g57860);
				float3 switchResult24_g57853 = (((ase_vface>0)?(lerpResult197_g57860):(temp_output_72_0_g57764)));
				float temp_output_29_0_g57853 = _SnowBackFaceBias;
				float3 lerpResult25_g57853 = lerp( lerpResult197_g57860 , switchResult24_g57853 , temp_output_29_0_g57853);
				float3 temp_output_1559_31_g57764 = lerpResult25_g57853;
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1528_g57764 = lerp( temp_output_72_0_g57764 , temp_output_1559_31_g57764 , temp_output_1712_0_g57764);
				float3 temp_output_56_0_g57867 = lerpResult1528_g57764;
				float3 temp_output_128_0_g57867 = ( saturate( temp_output_56_0_g57867 ) * 0.2 );
				float4 temp_cast_7 = (_MetallicStrength).xxxx;
				float4 temp_output_269_0_g57764 = temp_cast_7;
				float4 temp_cast_8 = (_SnowMetallicStrength).xxxx;
				float temp_output_177_0_g57769 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57769 = lerp( temp_output_269_0_g57764 , temp_cast_8 , temp_output_177_0_g57769);
				float4 switchResult24_g57765 = (((ase_vface>0)?(lerpResult197_g57769):(temp_output_269_0_g57764)));
				float BackFaceBias1558_g57764 = _SnowBackFaceBias;
				float temp_output_29_0_g57765 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57765 = lerp( lerpResult197_g57769 , switchResult24_g57765 , temp_output_29_0_g57765);
				float4 temp_output_1571_31_g57764 = lerpResult25_g57765;
				float4 temp_cast_9 = (0.99).xxxx;
				float4 clampResult775_g57764 = clamp( temp_output_1571_31_g57764 , float4( 0,0,0,0 ) , temp_cast_9 );
				float4 temp_output_776_0_g57764 = ( temp_output_1571_31_g57764 + clampResult775_g57764 );
				float4 lerpResult1531_g57764 = lerp( temp_output_269_0_g57764 , temp_output_776_0_g57764 , temp_output_1712_0_g57764);
				float4 Metallic1960_g57764 = lerpResult1531_g57764;
				float lerpResult102_g57867 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult159_g57867 = lerp( _Wetness , lerpResult102_g57867 , _WetnessGlobalInfluenceEnable);
				float temp_output_218_0_g57867 = saturate( _WetnessMask );
				float3 lerpResult125_g57867 = lerp( temp_output_56_0_g57867 , temp_output_128_0_g57867 , saturate( ( saturate( max( Metallic1960_g57764.x , lerpResult159_g57867 ) ) * temp_output_218_0_g57867 ) ));
				float3 lerpResult74_g57867 = lerp( temp_output_56_0_g57867 , lerpResult125_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				
				float3 unpack748_g44292 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57754 ), _NormalStrength );
				unpack748_g44292.z = lerp( 1, unpack748_g44292.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57759 = unpack748_g44292;
				float temp_output_50_0_g57759 = _DoubleSidedNormalMode;
				float m_switch64_g57759 = temp_output_50_0_g57759;
				float3 m_Flip64_g57759 = float3(-1,-1,-1);
				float3 m_Mirror64_g57759 = float3(1,1,-1);
				float3 m_None64_g57759 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57759 = _NormalModefloat3switch( m_switch64_g57759 , m_Flip64_g57759 , m_Mirror64_g57759 , m_None64_g57759 );
				float3 switchResult58_g57759 = (((ase_vface>0)?(temp_output_24_0_g57759):(( temp_output_24_0_g57759 * local_NormalModefloat3switch64_g57759 ))));
				float3 temp_output_73_0_g57764 = switchResult58_g57759;
				float temp_output_177_0_g57783 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57783 = lerp( temp_output_73_0_g57764 , Map_Normal342_g57764 , temp_output_177_0_g57783);
				float3 switchResult24_g57779 = (((ase_vface>0)?(BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 )):(temp_output_73_0_g57764)));
				float temp_output_29_0_g57779 = BackFaceBias1558_g57764;
				float3 lerpResult25_g57779 = lerp( BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 ) , switchResult24_g57779 , temp_output_29_0_g57779);
				float3 temp_output_1563_31_g57764 = lerpResult25_g57779;
				float3 lerpResult1529_g57764 = lerp( temp_output_73_0_g57764 , temp_output_1563_31_g57764 , temp_output_1712_0_g57764);
				
				float2 appendResult899_g44292 = (float2(WorldViewDirection.xy));
				float3 appendResult898_g44292 = (float3(appendResult899_g44292 , ( WorldViewDirection.z / 1.06 )));
				float3 break928_g44292 = unpack748_g44292;
				float3 normalizeResult934_g44292 = normalize( ( ( WorldTangent * break928_g44292.x ) + ( WorldBiTangent * break928_g44292.y ) + ( WorldNormal * break928_g44292.z ) ) );
				float3 Normal_Per_Pixel937_g44292 = normalizeResult934_g44292;
				float fresnelNdotV896_g44292 = dot( normalize( Normal_Per_Pixel937_g44292 ), appendResult898_g44292 );
				float fresnelNode896_g44292 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g44292 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g44292 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g44292 ) , _SmoothnessFresnelEnable);
				float4 temp_cast_15 = (saturate( lerpResult895_g44292 )).xxxx;
				float4 temp_output_258_0_g57764 = temp_cast_15;
				float4 temp_cast_16 = (_SnowSmoothnessStrength).xxxx;
				float temp_output_177_0_g57792 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57792 = lerp( temp_output_258_0_g57764 , temp_cast_16 , temp_output_177_0_g57792);
				float4 switchResult24_g57863 = (((ase_vface>0)?(lerpResult197_g57792):(temp_output_258_0_g57764)));
				float temp_output_29_0_g57863 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57863 = lerp( lerpResult197_g57792 , switchResult24_g57863 , temp_output_29_0_g57863);
				float4 temp_output_298_0_g57764 = saturate( lerpResult25_g57863 );
				float4 lerpResult1530_g57764 = lerp( temp_output_258_0_g57764 , temp_output_298_0_g57764 , temp_output_1712_0_g57764);
				float4 Smoothnessf1958_g57764 = lerpResult1530_g57764;
				float temp_output_17_0_g57867 = Smoothnessf1958_g57764.x;
				float lerpResult132_g57867 = lerp( temp_output_17_0_g57867 , 0.9 , temp_output_218_0_g57867);
				float lerpResult152_g57867 = lerp( temp_output_17_0_g57867 , lerpResult132_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				float SmoothnessWet1962_g57764 = lerpResult152_g57867;
				
				float4 temp_cast_18 = (saturate( ( 1.0 - _OcclusionStrengthAO ) )).xxxx;
				float4 temp_output_801_0_g57764 = temp_cast_18;
				float temp_output_1803_0_g57764 = saturate( ( 1.0 - _SnowOcclusionStrengthAO ) );
				float4 temp_cast_19 = (temp_output_1803_0_g57764).xxxx;
				float temp_output_177_0_g57776 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57776 = lerp( temp_output_801_0_g57764 , temp_cast_19 , temp_output_177_0_g57776);
				float4 switchResult24_g57772 = (((ase_vface>0)?(lerpResult197_g57776):(temp_output_801_0_g57764)));
				float temp_output_29_0_g57772 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57772 = lerp( lerpResult197_g57776 , switchResult24_g57772 , temp_output_29_0_g57772);
				float4 temp_output_1574_31_g57764 = lerpResult25_g57772;
				float4 lerpResult1532_g57764 = lerp( temp_output_801_0_g57764 , temp_output_1574_31_g57764 , temp_output_1712_0_g57764);
				
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , WorldViewDirection );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float3 BaseColor = lerpResult74_g57867;
				float3 Normal = lerpResult1529_g57764;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult1531_g57764.x;
				float Smoothness = SmoothnessWet1962_g57764;
				float Occlusion = saturate( lerpResult1532_g57764 ).x;
				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
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

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord3.xy = vertexToFrag70_g57754;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

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
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord3.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
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

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord3.xy = vertexToFrag70_g57754;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord3.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;

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

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_SnowColorMap);
			SAMPLER(sampler_SnowColorMap);
			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord0.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.texcoord0.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord0.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.texcoord0.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.texcoord0.xy;
				float2 m_UV180_g57754 = v.texcoord1.xy;
				float2 m_UV280_g57754 = v.texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord4.xy = vertexToFrag70_g57754;
				o.ase_texcoord4.zw = vertexToFrag70_g57844;
				o.ase_texcoord5.xy = vertexToFrag70_g57847;
				o.ase_texcoord7.xyz = ase_worldNormal;
				
				o.ase_texcoord6 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord4.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float3 temp_output_28_0_g44292 = ( (_BaseColor).rgb * (tex2DNode3_g44292).rgb * _Brightness );
				float3 temp_output_72_0_g57764 = temp_output_28_0_g44292;
				float localStochasticTiling2_g57835 = ( 0.0 );
				float2 vertexToFrag70_g57844 = IN.ase_texcoord4.zw;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57835 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57835 = _SnowColorMap_TexelSize;
				float4 Offsets2_g57835 = float4( 0,0,0,0 );
				float2 Weights2_g57835 = float2( 0,0 );
				{
				UV2_g57835 = UV2_g57835 * TexelSize2_g57835.zw - 0.5;
				float2 f = frac( UV2_g57835 );
				UV2_g57835 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57835.x - 0.5, UV2_g57835.x + 1.5, UV2_g57835.y - 0.5, UV2_g57835.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57835 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57835.xyxy;
				Weights2_g57835 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57836 = Offsets2_g57835;
				float2 Input_FetchWeights200_g57836 = Weights2_g57835;
				float2 break187_g57836 = Input_FetchWeights200_g57836;
				float4 lerpResult181_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yw ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xw ) , break187_g57836.x);
				float4 lerpResult182_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yz ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xz ) , break187_g57836.x);
				float4 lerpResult176_g57836 = lerp( lerpResult181_g57836 , lerpResult182_g57836 , break187_g57836.y);
				float4 Output_Fetch2D202_g57836 = lerpResult176_g57836;
				float3 temp_output_1942_0_g57764 = (Output_Fetch2D202_g57836).rgb;
				float3 temp_output_12_0_g57852 = temp_output_1942_0_g57764;
				float dotResult28_g57852 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g57852 );
				float3 temp_cast_0 = (dotResult28_g57852).xxx;
				float temp_output_21_0_g57852 = ( 1.0 - _SnowSaturation );
				float3 lerpResult31_g57852 = lerp( temp_cast_0 , temp_output_12_0_g57852 , temp_output_21_0_g57852);
				float3 linearToGamma1933_g57764 = FastLinearToSRGB( ( ( (_SnowColorTop).rgb * lerpResult31_g57852 ) * lerpResult31_g57852 * _SnowBrightnessTop ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float2 vertexToFrag70_g57847 = IN.ase_texcoord5.xy;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord6);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_1 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_1 , lerpResult90_g57834 );
				float3 temp_cast_5 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord6.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_5 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_6 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_6 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57860 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57860 = lerp( temp_output_72_0_g57764 , linearToGamma1933_g57764 , temp_output_177_0_g57860);
				float3 switchResult24_g57853 = (((ase_vface>0)?(lerpResult197_g57860):(temp_output_72_0_g57764)));
				float temp_output_29_0_g57853 = _SnowBackFaceBias;
				float3 lerpResult25_g57853 = lerp( lerpResult197_g57860 , switchResult24_g57853 , temp_output_29_0_g57853);
				float3 temp_output_1559_31_g57764 = lerpResult25_g57853;
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1528_g57764 = lerp( temp_output_72_0_g57764 , temp_output_1559_31_g57764 , temp_output_1712_0_g57764);
				float3 temp_output_56_0_g57867 = lerpResult1528_g57764;
				float3 temp_output_128_0_g57867 = ( saturate( temp_output_56_0_g57867 ) * 0.2 );
				float4 temp_cast_7 = (_MetallicStrength).xxxx;
				float4 temp_output_269_0_g57764 = temp_cast_7;
				float4 temp_cast_8 = (_SnowMetallicStrength).xxxx;
				float temp_output_177_0_g57769 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57769 = lerp( temp_output_269_0_g57764 , temp_cast_8 , temp_output_177_0_g57769);
				float4 switchResult24_g57765 = (((ase_vface>0)?(lerpResult197_g57769):(temp_output_269_0_g57764)));
				float BackFaceBias1558_g57764 = _SnowBackFaceBias;
				float temp_output_29_0_g57765 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57765 = lerp( lerpResult197_g57769 , switchResult24_g57765 , temp_output_29_0_g57765);
				float4 temp_output_1571_31_g57764 = lerpResult25_g57765;
				float4 temp_cast_9 = (0.99).xxxx;
				float4 clampResult775_g57764 = clamp( temp_output_1571_31_g57764 , float4( 0,0,0,0 ) , temp_cast_9 );
				float4 temp_output_776_0_g57764 = ( temp_output_1571_31_g57764 + clampResult775_g57764 );
				float4 lerpResult1531_g57764 = lerp( temp_output_269_0_g57764 , temp_output_776_0_g57764 , temp_output_1712_0_g57764);
				float4 Metallic1960_g57764 = lerpResult1531_g57764;
				float lerpResult102_g57867 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult159_g57867 = lerp( _Wetness , lerpResult102_g57867 , _WetnessGlobalInfluenceEnable);
				float temp_output_218_0_g57867 = saturate( _WetnessMask );
				float3 lerpResult125_g57867 = lerp( temp_output_56_0_g57867 , temp_output_128_0_g57867 , saturate( ( saturate( max( Metallic1960_g57764.x , lerpResult159_g57867 ) ) * temp_output_218_0_g57867 ) ));
				float3 lerpResult74_g57867 = lerp( temp_output_56_0_g57867 , lerpResult125_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float3 BaseColor = lerpResult74_g57867;
				float3 Emission = 0;
				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;

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

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_SnowColorMap);
			SAMPLER(sampler_SnowColorMap);
			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord2.xy = vertexToFrag70_g57754;
				o.ase_texcoord2.zw = vertexToFrag70_g57844;
				o.ase_texcoord3.xy = vertexToFrag70_g57847;
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord4 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord2.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float3 temp_output_28_0_g44292 = ( (_BaseColor).rgb * (tex2DNode3_g44292).rgb * _Brightness );
				float3 temp_output_72_0_g57764 = temp_output_28_0_g44292;
				float localStochasticTiling2_g57835 = ( 0.0 );
				float2 vertexToFrag70_g57844 = IN.ase_texcoord2.zw;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57835 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57835 = _SnowColorMap_TexelSize;
				float4 Offsets2_g57835 = float4( 0,0,0,0 );
				float2 Weights2_g57835 = float2( 0,0 );
				{
				UV2_g57835 = UV2_g57835 * TexelSize2_g57835.zw - 0.5;
				float2 f = frac( UV2_g57835 );
				UV2_g57835 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57835.x - 0.5, UV2_g57835.x + 1.5, UV2_g57835.y - 0.5, UV2_g57835.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57835 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57835.xyxy;
				Weights2_g57835 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57836 = Offsets2_g57835;
				float2 Input_FetchWeights200_g57836 = Weights2_g57835;
				float2 break187_g57836 = Input_FetchWeights200_g57836;
				float4 lerpResult181_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yw ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xw ) , break187_g57836.x);
				float4 lerpResult182_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yz ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xz ) , break187_g57836.x);
				float4 lerpResult176_g57836 = lerp( lerpResult181_g57836 , lerpResult182_g57836 , break187_g57836.y);
				float4 Output_Fetch2D202_g57836 = lerpResult176_g57836;
				float3 temp_output_1942_0_g57764 = (Output_Fetch2D202_g57836).rgb;
				float3 temp_output_12_0_g57852 = temp_output_1942_0_g57764;
				float dotResult28_g57852 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g57852 );
				float3 temp_cast_0 = (dotResult28_g57852).xxx;
				float temp_output_21_0_g57852 = ( 1.0 - _SnowSaturation );
				float3 lerpResult31_g57852 = lerp( temp_cast_0 , temp_output_12_0_g57852 , temp_output_21_0_g57852);
				float3 linearToGamma1933_g57764 = FastLinearToSRGB( ( ( (_SnowColorTop).rgb * lerpResult31_g57852 ) * lerpResult31_g57852 * _SnowBrightnessTop ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float2 vertexToFrag70_g57847 = IN.ase_texcoord3.xy;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord4);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_1 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_1 , lerpResult90_g57834 );
				float3 temp_cast_5 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord4.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_5 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_6 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_6 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57860 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57860 = lerp( temp_output_72_0_g57764 , linearToGamma1933_g57764 , temp_output_177_0_g57860);
				float3 switchResult24_g57853 = (((ase_vface>0)?(lerpResult197_g57860):(temp_output_72_0_g57764)));
				float temp_output_29_0_g57853 = _SnowBackFaceBias;
				float3 lerpResult25_g57853 = lerp( lerpResult197_g57860 , switchResult24_g57853 , temp_output_29_0_g57853);
				float3 temp_output_1559_31_g57764 = lerpResult25_g57853;
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1528_g57764 = lerp( temp_output_72_0_g57764 , temp_output_1559_31_g57764 , temp_output_1712_0_g57764);
				float3 temp_output_56_0_g57867 = lerpResult1528_g57764;
				float3 temp_output_128_0_g57867 = ( saturate( temp_output_56_0_g57867 ) * 0.2 );
				float4 temp_cast_7 = (_MetallicStrength).xxxx;
				float4 temp_output_269_0_g57764 = temp_cast_7;
				float4 temp_cast_8 = (_SnowMetallicStrength).xxxx;
				float temp_output_177_0_g57769 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57769 = lerp( temp_output_269_0_g57764 , temp_cast_8 , temp_output_177_0_g57769);
				float4 switchResult24_g57765 = (((ase_vface>0)?(lerpResult197_g57769):(temp_output_269_0_g57764)));
				float BackFaceBias1558_g57764 = _SnowBackFaceBias;
				float temp_output_29_0_g57765 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57765 = lerp( lerpResult197_g57769 , switchResult24_g57765 , temp_output_29_0_g57765);
				float4 temp_output_1571_31_g57764 = lerpResult25_g57765;
				float4 temp_cast_9 = (0.99).xxxx;
				float4 clampResult775_g57764 = clamp( temp_output_1571_31_g57764 , float4( 0,0,0,0 ) , temp_cast_9 );
				float4 temp_output_776_0_g57764 = ( temp_output_1571_31_g57764 + clampResult775_g57764 );
				float4 lerpResult1531_g57764 = lerp( temp_output_269_0_g57764 , temp_output_776_0_g57764 , temp_output_1712_0_g57764);
				float4 Metallic1960_g57764 = lerpResult1531_g57764;
				float lerpResult102_g57867 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult159_g57867 = lerp( _Wetness , lerpResult102_g57867 , _WetnessGlobalInfluenceEnable);
				float temp_output_218_0_g57867 = saturate( _WetnessMask );
				float3 lerpResult125_g57867 = lerp( temp_output_56_0_g57867 , temp_output_128_0_g57867 , saturate( ( saturate( max( Metallic1960_g57764.x , lerpResult159_g57867 ) ) * temp_output_218_0_g57867 ) ));
				float3 lerpResult74_g57867 = lerp( temp_output_56_0_g57867 , lerpResult125_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float3 BaseColor = lerpResult74_g57867;
				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.tangentOS.xyz = normalize( mul( float4( v.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float4 appendResult986_g44292 = (float4(cross( v.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord5.xy = vertexToFrag70_g57754;
				o.ase_texcoord5.zw = vertexToFrag70_g57844;
				o.ase_texcoord6.xy = vertexToFrag70_g57847;
				
				o.ase_texcoord7 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;
				v.tangentOS = appendResult986_g44292;

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
				float4 ase_color : COLOR;
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
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord5.xy;
				float3 unpack748_g44292 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57754 ), _NormalStrength );
				unpack748_g44292.z = lerp( 1, unpack748_g44292.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57759 = unpack748_g44292;
				float temp_output_50_0_g57759 = _DoubleSidedNormalMode;
				float m_switch64_g57759 = temp_output_50_0_g57759;
				float3 m_Flip64_g57759 = float3(-1,-1,-1);
				float3 m_Mirror64_g57759 = float3(1,1,-1);
				float3 m_None64_g57759 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57759 = _NormalModefloat3switch( m_switch64_g57759 , m_Flip64_g57759 , m_Mirror64_g57759 , m_None64_g57759 );
				float3 switchResult58_g57759 = (((ase_vface>0)?(temp_output_24_0_g57759):(( temp_output_24_0_g57759 * local_NormalModefloat3switch64_g57759 ))));
				float3 temp_output_73_0_g57764 = switchResult58_g57759;
				float localStochasticTiling2_g57838 = ( 0.0 );
				float2 vertexToFrag70_g57844 = IN.ase_texcoord5.zw;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float2 vertexToFrag70_g57847 = IN.ase_texcoord6.xy;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord7);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_2 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_2 , lerpResult90_g57834 );
				float3 temp_cast_5 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord7.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_5 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * WorldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_6 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( WorldNormal ) - temp_cast_6 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57783 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57783 = lerp( temp_output_73_0_g57764 , Map_Normal342_g57764 , temp_output_177_0_g57783);
				float3 switchResult24_g57779 = (((ase_vface>0)?(BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 )):(temp_output_73_0_g57764)));
				float BackFaceBias1558_g57764 = _SnowBackFaceBias;
				float temp_output_29_0_g57779 = BackFaceBias1558_g57764;
				float3 lerpResult25_g57779 = lerp( BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 ) , switchResult24_g57779 , temp_output_29_0_g57779);
				float3 temp_output_1563_31_g57764 = lerpResult25_g57779;
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1529_g57764 = lerp( temp_output_73_0_g57764 , temp_output_1563_31_g57764 , temp_output_1712_0_g57764);
				
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float3 Normal = lerpResult1529_g57764;
				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;

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

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
      
			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_SnowColorMap);
			SAMPLER(sampler_SnowColorMap);
			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.tangentOS.xyz = normalize( mul( float4( v.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float4 appendResult986_g44292 = (float4(cross( v.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.texcoord.xy;
				float2 m_UV180_g57754 = v.texcoord1.xy;
				float2 m_UV280_g57754 = v.texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord8.xy = vertexToFrag70_g57754;
				o.ase_texcoord8.zw = vertexToFrag70_g57844;
				o.ase_texcoord9.xy = vertexToFrag70_g57847;
				
				o.ase_texcoord10 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;
				v.tangentOS = appendResult986_g44292;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

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
				float4 ase_color : COLOR;
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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, bool ase_vface : SV_IsFrontFace )
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
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 vertexToFrag70_g57754 = IN.ase_texcoord8.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float3 temp_output_28_0_g44292 = ( (_BaseColor).rgb * (tex2DNode3_g44292).rgb * _Brightness );
				float3 temp_output_72_0_g57764 = temp_output_28_0_g44292;
				float localStochasticTiling2_g57835 = ( 0.0 );
				float2 vertexToFrag70_g57844 = IN.ase_texcoord8.zw;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57835 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57835 = _SnowColorMap_TexelSize;
				float4 Offsets2_g57835 = float4( 0,0,0,0 );
				float2 Weights2_g57835 = float2( 0,0 );
				{
				UV2_g57835 = UV2_g57835 * TexelSize2_g57835.zw - 0.5;
				float2 f = frac( UV2_g57835 );
				UV2_g57835 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57835.x - 0.5, UV2_g57835.x + 1.5, UV2_g57835.y - 0.5, UV2_g57835.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57835 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57835.xyxy;
				Weights2_g57835 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57836 = Offsets2_g57835;
				float2 Input_FetchWeights200_g57836 = Weights2_g57835;
				float2 break187_g57836 = Input_FetchWeights200_g57836;
				float4 lerpResult181_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yw ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xw ) , break187_g57836.x);
				float4 lerpResult182_g57836 = lerp( SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).yz ) , SAMPLE_TEXTURE2D( _SnowColorMap, sampler_SnowColorMap, (Input_FetchOffsets197_g57836).xz ) , break187_g57836.x);
				float4 lerpResult176_g57836 = lerp( lerpResult181_g57836 , lerpResult182_g57836 , break187_g57836.y);
				float4 Output_Fetch2D202_g57836 = lerpResult176_g57836;
				float3 temp_output_1942_0_g57764 = (Output_Fetch2D202_g57836).rgb;
				float3 temp_output_12_0_g57852 = temp_output_1942_0_g57764;
				float dotResult28_g57852 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g57852 );
				float3 temp_cast_0 = (dotResult28_g57852).xxx;
				float temp_output_21_0_g57852 = ( 1.0 - _SnowSaturation );
				float3 lerpResult31_g57852 = lerp( temp_cast_0 , temp_output_12_0_g57852 , temp_output_21_0_g57852);
				float3 linearToGamma1933_g57764 = FastLinearToSRGB( ( ( (_SnowColorTop).rgb * lerpResult31_g57852 ) * lerpResult31_g57852 * _SnowBrightnessTop ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float2 vertexToFrag70_g57847 = IN.ase_texcoord9.xy;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord10);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_1 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz ) , SAMPLE_TEXTURE2D( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_1 , lerpResult90_g57834 );
				float3 temp_cast_5 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( IN.ase_texcoord10.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_5 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * WorldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_6 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( WorldNormal ) - temp_cast_6 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57860 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57860 = lerp( temp_output_72_0_g57764 , linearToGamma1933_g57764 , temp_output_177_0_g57860);
				float3 switchResult24_g57853 = (((ase_vface>0)?(lerpResult197_g57860):(temp_output_72_0_g57764)));
				float temp_output_29_0_g57853 = _SnowBackFaceBias;
				float3 lerpResult25_g57853 = lerp( lerpResult197_g57860 , switchResult24_g57853 , temp_output_29_0_g57853);
				float3 temp_output_1559_31_g57764 = lerpResult25_g57853;
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1528_g57764 = lerp( temp_output_72_0_g57764 , temp_output_1559_31_g57764 , temp_output_1712_0_g57764);
				float3 temp_output_56_0_g57867 = lerpResult1528_g57764;
				float3 temp_output_128_0_g57867 = ( saturate( temp_output_56_0_g57867 ) * 0.2 );
				float4 temp_cast_7 = (_MetallicStrength).xxxx;
				float4 temp_output_269_0_g57764 = temp_cast_7;
				float4 temp_cast_8 = (_SnowMetallicStrength).xxxx;
				float temp_output_177_0_g57769 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57769 = lerp( temp_output_269_0_g57764 , temp_cast_8 , temp_output_177_0_g57769);
				float4 switchResult24_g57765 = (((ase_vface>0)?(lerpResult197_g57769):(temp_output_269_0_g57764)));
				float BackFaceBias1558_g57764 = _SnowBackFaceBias;
				float temp_output_29_0_g57765 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57765 = lerp( lerpResult197_g57769 , switchResult24_g57765 , temp_output_29_0_g57765);
				float4 temp_output_1571_31_g57764 = lerpResult25_g57765;
				float4 temp_cast_9 = (0.99).xxxx;
				float4 clampResult775_g57764 = clamp( temp_output_1571_31_g57764 , float4( 0,0,0,0 ) , temp_cast_9 );
				float4 temp_output_776_0_g57764 = ( temp_output_1571_31_g57764 + clampResult775_g57764 );
				float4 lerpResult1531_g57764 = lerp( temp_output_269_0_g57764 , temp_output_776_0_g57764 , temp_output_1712_0_g57764);
				float4 Metallic1960_g57764 = lerpResult1531_g57764;
				float lerpResult102_g57867 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult159_g57867 = lerp( _Wetness , lerpResult102_g57867 , _WetnessGlobalInfluenceEnable);
				float temp_output_218_0_g57867 = saturate( _WetnessMask );
				float3 lerpResult125_g57867 = lerp( temp_output_56_0_g57867 , temp_output_128_0_g57867 , saturate( ( saturate( max( Metallic1960_g57764.x , lerpResult159_g57867 ) ) * temp_output_218_0_g57867 ) ));
				float3 lerpResult74_g57867 = lerp( temp_output_56_0_g57867 , lerpResult125_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				
				float3 unpack748_g44292 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57754 ), _NormalStrength );
				unpack748_g44292.z = lerp( 1, unpack748_g44292.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57759 = unpack748_g44292;
				float temp_output_50_0_g57759 = _DoubleSidedNormalMode;
				float m_switch64_g57759 = temp_output_50_0_g57759;
				float3 m_Flip64_g57759 = float3(-1,-1,-1);
				float3 m_Mirror64_g57759 = float3(1,1,-1);
				float3 m_None64_g57759 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57759 = _NormalModefloat3switch( m_switch64_g57759 , m_Flip64_g57759 , m_Mirror64_g57759 , m_None64_g57759 );
				float3 switchResult58_g57759 = (((ase_vface>0)?(temp_output_24_0_g57759):(( temp_output_24_0_g57759 * local_NormalModefloat3switch64_g57759 ))));
				float3 temp_output_73_0_g57764 = switchResult58_g57759;
				float temp_output_177_0_g57783 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57783 = lerp( temp_output_73_0_g57764 , Map_Normal342_g57764 , temp_output_177_0_g57783);
				float3 switchResult24_g57779 = (((ase_vface>0)?(BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 )):(temp_output_73_0_g57764)));
				float temp_output_29_0_g57779 = BackFaceBias1558_g57764;
				float3 lerpResult25_g57779 = lerp( BlendNormal( lerpResult197_g57783 , temp_output_73_0_g57764 ) , switchResult24_g57779 , temp_output_29_0_g57779);
				float3 temp_output_1563_31_g57764 = lerpResult25_g57779;
				float3 lerpResult1529_g57764 = lerp( temp_output_73_0_g57764 , temp_output_1563_31_g57764 , temp_output_1712_0_g57764);
				
				float2 appendResult899_g44292 = (float2(WorldViewDirection.xy));
				float3 appendResult898_g44292 = (float3(appendResult899_g44292 , ( WorldViewDirection.z / 1.06 )));
				float3 break928_g44292 = unpack748_g44292;
				float3 normalizeResult934_g44292 = normalize( ( ( WorldTangent * break928_g44292.x ) + ( WorldBiTangent * break928_g44292.y ) + ( WorldNormal * break928_g44292.z ) ) );
				float3 Normal_Per_Pixel937_g44292 = normalizeResult934_g44292;
				float fresnelNdotV896_g44292 = dot( normalize( Normal_Per_Pixel937_g44292 ), appendResult898_g44292 );
				float fresnelNode896_g44292 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g44292 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g44292 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g44292 ) , _SmoothnessFresnelEnable);
				float4 temp_cast_15 = (saturate( lerpResult895_g44292 )).xxxx;
				float4 temp_output_258_0_g57764 = temp_cast_15;
				float4 temp_cast_16 = (_SnowSmoothnessStrength).xxxx;
				float temp_output_177_0_g57792 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57792 = lerp( temp_output_258_0_g57764 , temp_cast_16 , temp_output_177_0_g57792);
				float4 switchResult24_g57863 = (((ase_vface>0)?(lerpResult197_g57792):(temp_output_258_0_g57764)));
				float temp_output_29_0_g57863 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57863 = lerp( lerpResult197_g57792 , switchResult24_g57863 , temp_output_29_0_g57863);
				float4 temp_output_298_0_g57764 = saturate( lerpResult25_g57863 );
				float4 lerpResult1530_g57764 = lerp( temp_output_258_0_g57764 , temp_output_298_0_g57764 , temp_output_1712_0_g57764);
				float4 Smoothnessf1958_g57764 = lerpResult1530_g57764;
				float temp_output_17_0_g57867 = Smoothnessf1958_g57764.x;
				float lerpResult132_g57867 = lerp( temp_output_17_0_g57867 , 0.9 , temp_output_218_0_g57867);
				float lerpResult152_g57867 = lerp( temp_output_17_0_g57867 , lerpResult132_g57867 , ( _WetnessEnable + ( ( _CATEGORY_WETNESS + _SPACE_WETNESS ) * 0.0 ) ));
				float SmoothnessWet1962_g57764 = lerpResult152_g57867;
				
				float4 temp_cast_18 = (saturate( ( 1.0 - _OcclusionStrengthAO ) )).xxxx;
				float4 temp_output_801_0_g57764 = temp_cast_18;
				float temp_output_1803_0_g57764 = saturate( ( 1.0 - _SnowOcclusionStrengthAO ) );
				float4 temp_cast_19 = (temp_output_1803_0_g57764).xxxx;
				float temp_output_177_0_g57776 = Blend_TopDown220_g57764;
				float4 lerpResult197_g57776 = lerp( temp_output_801_0_g57764 , temp_cast_19 , temp_output_177_0_g57776);
				float4 switchResult24_g57772 = (((ase_vface>0)?(lerpResult197_g57776):(temp_output_801_0_g57764)));
				float temp_output_29_0_g57772 = BackFaceBias1558_g57764;
				float4 lerpResult25_g57772 = lerp( lerpResult197_g57776 , switchResult24_g57772 , temp_output_29_0_g57772);
				float4 temp_output_1574_31_g57764 = lerpResult25_g57772;
				float4 lerpResult1532_g57764 = lerp( temp_output_801_0_g57764 , temp_output_1574_31_g57764 , temp_output_1712_0_g57764);
				
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 temp_output_95_0_g57739 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , WorldViewDirection );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				float3 BaseColor = lerpResult74_g57867;
				float3 Normal = lerpResult1529_g57764;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult1531_g57764.x;
				float Smoothness = SmoothnessWet1962_g57764;
				float Occlusion = saturate( lerpResult1532_g57764 ).x;
				float Alpha = temp_output_98_0_g57735;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
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

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
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

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord.xy = vertexToFrag70_g57754;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57739 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57735;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoffBias;

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

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ALPHATEST_SHADOW_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainUVs;
			half4 _BaseColor;
			float4 _SnowNormalMap_TexelSize;
			float4 _SnowColorMap_TexelSize;
			float4 _SnowNoiseUV;
			float4 _SnowUVs;
			half4 _SnowColorTop;
			float4 _AlphaRemap;
			half _SnowSaturation;
			float _SPACE_ALPHACLIP;
			half _SnowBrightnessTop;
			half _SnowBackFaceBias;
			float _MetallicStrength;
			float _SnowMetallicStrength;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			float _CATEGORY_WETNESS;
			float _SPACE_WETNESS;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			half _DoubleSidedNormalMode;
			half _SmoothnessStrength;
			float _AlphaRemapMax;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _SnowSmoothnessStrength;
			half _OcclusionStrengthAO;
			half _SnowOcclusionStrengthAO;
			half _NormalStrength;
			float _AlphaRemapMin;
			float _CATEGORY_SURFACEINPUTS;
			half _AlphaCutoffBias;
			float _SPACE_SURFACEINPUTS;
			int _Cull;
			half _SnowHeightWeight;
			half _SnowHeightStrength;
			half _SnowHeightClipFar;
			half _SnowHeightNoiseShift;
			half _SnowHeightNoiseScale;
			half _SnowHeightDepth;
			half _SnowBlendStrength;
			half _SnowUVSpace;
			float _CATEGORY_SNOWBLENDING;
			float _SPACE_SNOWBLENDING;
			half _Brightness;
			half _SnowNoiseOffset;
			half _SnowNormalStrength;
			half _SnowBlendNormalInfluence;
			half _SnowBlendOffset;
			half _SnowBlendStrengthHeight;
			half _SnowBlendSideStrength;
			half _SnowHeightEnable;
			float _CATEGORY_SNOWHEIGHT;
			float _SPACE_SNOWHEIGHT;
			half _SnowEnable;
			float _CATEGORY_SNOW;
			float _SPACE_SNOW;
			float _UVMode;
			half _SnowNoiseLength;
			half _AlphaCutoffBiasShadow;
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

			half _GlobalSnowIntensityTopDown;
			float _GlobalSnowEnabled;
			TEXTURE2D(_SnowNoiseMap);
			SAMPLER(sampler_SnowNoiseMap);
			TEXTURE2D(_SnowNormalMap);
			SAMPLER(sampler_SnowNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


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
			
			float2 float2switchUVMode80_g57754( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				v.normalOS = normalize( mul( float4( v.normalOS , 0 ), rotationCamMatrix )).xyz;
				v.ase_tangent.xyz = normalize( mul( float4( v.ase_tangent.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				v.positionOS = mul( v.positionOS , unity_ObjectToWorld );
				v.positionOS = mul( v.positionOS , rotationCamMatrix );
				v.positionOS = mul( v.positionOS , unity_WorldToObject );
				float3 temp_output_17_0_g57763 = 0;
				float3 localVetexOffsetSRP26_g57763 = ( temp_output_17_0_g57763 );
				float3 temp_output_18_0_g57763 = float3(0,0,0);
				{
				v.positionOS.xyz += temp_output_18_0_g57763;
				}
				float3 temp_output_1165_0_g57764 = localVetexOffsetSRP26_g57763;
				float3 temp_cast_0 = (_SnowHeightClipFar).xxx;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 p1_g57833 = ( float3( (ase_worldPos).xz ,  0.0 ) * _SnowHeightNoiseShift );
				float localSimpleNoise3D1_g57833 = SimpleNoise3D( p1_g57833 );
				float temp_output_966_0_g57764 = ( localSimpleNoise3D1_g57833 / _SnowHeightNoiseScale );
				float4 appendResult952_g57764 = (float4(temp_output_966_0_g57764 , temp_output_966_0_g57764 , temp_output_966_0_g57764 , 0.0));
				float3 temp_output_1327_0_g57764 = saturate( ( ( temp_cast_0 - (appendResult952_g57764).xyz ) / _SnowHeightClipFar ) );
				float3 normalizeResult881_g57764 = normalize( v.normalOS );
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float smoothstepResult1511_g57764 = smoothstep( -0.75 , 7.99 , saturate( ase_worldNormal.y ));
				float3 temp_output_874_0_g57764 = ( ( saturate( ( ( _SnowHeightWeight * v.ase_color.r ) + ( _SnowHeightStrength * v.ase_color.r * ( temp_output_1327_0_g57764 * _SnowHeightClipFar ) ) ) ) * normalizeResult881_g57764 ) - ( smoothstepResult1511_g57764 * normalizeResult881_g57764 * saturate( v.ase_color.r ) * _SnowHeightDepth ) );
				float temp_output_16_0_g57834 = _SnowBlendStrength;
				float temp_output_159_0_g57834 = _GlobalSnowEnabled;
				float lerpResult172_g57834 = lerp( temp_output_16_0_g57834 , ( temp_output_16_0_g57834 * _GlobalSnowIntensityTopDown ) , temp_output_159_0_g57834);
				float3 objToWorld286_g57847 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57847 = (float2(objToWorld286_g57847.x , ( objToWorld286_g57847.z + objToWorld286_g57847.y )));
				float2 temp_output_491_0_g57847 = ( appendResult242_g57847 * 2.0 );
				float SnowUVSpace1938_g57764 = _SnowUVSpace;
				float2 lerpResult244_g57847 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57847 , ( SnowUVSpace1938_g57764 + ( ( _CATEGORY_SNOWBLENDING + _SPACE_SNOWBLENDING ) * 0.0 ) ));
				float2 Offset235_g57847 = (_SnowNoiseUV).zw;
				float2 temp_output_41_0_g57847 = ( ( lerpResult244_g57847 * (_SnowNoiseUV).xy ) + Offset235_g57847 );
				float2 vertexToFrag70_g57847 = temp_output_41_0_g57847;
				float4 transform1607_g57764 = mul(GetObjectToWorldMatrix(),v.positionOS);
				float temp_output_79_0_g57834 = ( SAMPLE_TEXTURE2D_LOD( _SnowNoiseMap, sampler_SnowNoiseMap, vertexToFrag70_g57847, 0.0 ).r - ( ( (transform1607_g57764).w - _SnowNoiseOffset ) / _SnowNoiseLength ) );
				float temp_output_118_0_g57834 = saturate( temp_output_79_0_g57834 );
				float3 temp_cast_3 = (temp_output_118_0_g57834).xxx;
				float3 _NInfluence = float3(1,1,1);
				float localStochasticTiling2_g57838 = ( 0.0 );
				float3 objToWorld286_g57844 = mul( GetObjectToWorldMatrix(), float4( float3( v.ase_texcoord.xy ,  0.0 ), 1 ) ).xyz;
				float2 appendResult242_g57844 = (float2(objToWorld286_g57844.x , ( objToWorld286_g57844.z + objToWorld286_g57844.y )));
				float2 temp_output_491_0_g57844 = ( appendResult242_g57844 * 2.0 );
				float2 lerpResult244_g57844 = lerp( v.ase_texcoord.xy , temp_output_491_0_g57844 , _SnowUVSpace);
				float2 Offset235_g57844 = (_SnowUVs).zw;
				float2 temp_output_41_0_g57844 = ( ( lerpResult244_g57844 * (_SnowUVs).xy ) + Offset235_g57844 );
				float2 vertexToFrag70_g57844 = temp_output_41_0_g57844;
				float2 temp_output_1918_0_g57764 = vertexToFrag70_g57844;
				float2 UV2_g57838 = temp_output_1918_0_g57764;
				float4 TexelSize2_g57838 = _SnowNormalMap_TexelSize;
				float4 Offsets2_g57838 = float4( 0,0,0,0 );
				float2 Weights2_g57838 = float2( 0,0 );
				{
				UV2_g57838 = UV2_g57838 * TexelSize2_g57838.zw - 0.5;
				float2 f = frac( UV2_g57838 );
				UV2_g57838 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV2_g57838.x - 0.5, UV2_g57838.x + 1.5, UV2_g57838.y - 0.5, UV2_g57838.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets2_g57838 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g57838.xyxy;
				Weights2_g57838 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets197_g57837 = Offsets2_g57838;
				float2 Input_FetchWeights200_g57837 = Weights2_g57838;
				float2 break187_g57837 = Input_FetchWeights200_g57837;
				float4 lerpResult181_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yw, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xw, 0.0 ) , break187_g57837.x);
				float4 lerpResult182_g57837 = lerp( SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).yz, 0.0 ) , SAMPLE_TEXTURE2D_LOD( _SnowNormalMap, sampler_SnowNormalMap, (Input_FetchOffsets197_g57837).xz, 0.0 ) , break187_g57837.x);
				float4 lerpResult176_g57837 = lerp( lerpResult181_g57837 , lerpResult182_g57837 , break187_g57837.y);
				float4 Output_Fetch2D202_g57837 = lerpResult176_g57837;
				float3 unpack1690_g57764 = UnpackNormalScale( Output_Fetch2D202_g57837, _SnowNormalStrength );
				unpack1690_g57764.z = lerp( 1, unpack1690_g57764.z, saturate(_SnowNormalStrength) );
				float3 Map_Normal342_g57764 = unpack1690_g57764;
				float3 temp_output_80_0_g57834 = Map_Normal342_g57764;
				float3 lerpResult90_g57834 = lerp( _NInfluence , temp_output_80_0_g57834 , _SnowBlendNormalInfluence);
				float dotResult127_g57834 = dot( temp_cast_3 , lerpResult90_g57834 );
				float3 temp_cast_8 = (saturate( ( ( mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz.y - ( 1.0 - _SnowBlendOffset ) ) + temp_output_79_0_g57834 + temp_output_79_0_g57834 ) )).xxx;
				float dotResult93_g57834 = dot( temp_cast_8 , lerpResult90_g57834 );
				float HeightMask111_g57834 = saturate(pow(max( (((dotResult127_g57834*dotResult93_g57834)*4)+(dotResult93_g57834*2)), 0 ),_SnowBlendStrengthHeight));
				float temp_output_95_0_g57834 = ( lerpResult172_g57834 * HeightMask111_g57834 );
				float WORLD_NORMAL_Z136_g57834 = ( 1.0 * ase_worldNormal.y );
				float lerpResult110_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_Z136_g57834);
				float3 temp_cast_9 = (0.5).xxx;
				float WORLD_NORMAL_X144_g57834 = ( ( abs( ase_worldNormal ) - temp_cast_9 ).x + 1.3 );
				float lerpResult129_g57834 = lerp( 0.0 , temp_output_95_0_g57834 , WORLD_NORMAL_X144_g57834);
				float lerpResult170_g57834 = lerp( lerpResult110_g57834 , ( lerpResult110_g57834 + lerpResult129_g57834 ) , _SnowBlendSideStrength);
				float Blend_TopDown220_g57764 = saturate( lerpResult170_g57834 );
				float temp_output_177_0_g57789 = Blend_TopDown220_g57764;
				float3 lerpResult197_g57789 = lerp( temp_output_1165_0_g57764 , temp_output_874_0_g57764 , temp_output_177_0_g57789);
				float3 temp_output_17_0_g57861 = lerpResult197_g57789;
				float3 localVetexOffsetSRP26_g57861 = ( temp_output_17_0_g57861 );
				float3 temp_output_18_0_g57861 = temp_output_1165_0_g57764;
				{
				v.positionOS.xyz += temp_output_18_0_g57861;
				}
				float3 lerpResult1555_g57764 = lerp( temp_output_1165_0_g57764 , localVetexOffsetSRP26_g57861 , ( _SnowHeightEnable + ( ( _CATEGORY_SNOWHEIGHT + _SPACE_SNOWHEIGHT ) * 0.0 ) ));
				float temp_output_1712_0_g57764 = ( _SnowEnable + ( ( _CATEGORY_SNOW + _SPACE_SNOW ) * 0.0 ) );
				float3 lerpResult1846_g57764 = lerp( temp_output_1165_0_g57764 , lerpResult1555_g57764 , temp_output_1712_0_g57764);
				
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g44292 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g44292 = lerp( v.normalOS , -v.normalOS , step( dotResult982_g44292 , -1.0 ));
				
				float m_switch80_g57754 = _UVMode;
				float2 m_UV080_g57754 = v.ase_texcoord.xy;
				float2 m_UV180_g57754 = v.ase_texcoord1.xy;
				float2 m_UV280_g57754 = v.ase_texcoord2.xy;
				float2 m_UV380_g57754 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57754 = float2switchUVMode80_g57754( m_switch80_g57754 , m_UV080_g57754 , m_UV180_g57754 , m_UV280_g57754 , m_UV380_g57754 );
				float2 Offset235_g57754 = (_MainUVs).zw;
				float2 temp_output_41_0_g57754 = ( ( localfloat2switchUVMode80_g57754 * (_MainUVs).xy ) + Offset235_g57754 );
				float2 vertexToFrag70_g57754 = temp_output_41_0_g57754;
				o.ase_texcoord.xy = vertexToFrag70_g57754;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult1846_g57764;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult989_g44292;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57754 = IN.ase_texcoord.xy;
				float4 tex2DNode3_g44292 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57754 );
				float temp_output_22_0_g57735 = tex2DNode3_g44292.a;
				float temp_output_22_0_g57737 = temp_output_22_0_g57735;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57739 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57739 = normalize( temp_output_95_0_g57739 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57735 = dot( normalizeResult96_g57739 , ase_worldViewDir );
				float temp_output_76_0_g57735 = ( 1.0 - abs( dotResult74_g57735 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57735 = 1.0;
				#else
				float staticSwitch281_g57735 = ( 1.0 - ( temp_output_76_0_g57735 * temp_output_76_0_g57735 ) );
				#endif
				float lerpResult80_g57735 = lerp( 1.0 , staticSwitch281_g57735 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57735 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57737 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57737 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57735 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57735;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoffBias;

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
	
	CustomEditor "DE_ShaderGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/DE/Utility/Fallback"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.FunctionNode;448;-1088,256;Inherit;False;DESF Core Billboard;1;;44292;e3fce2294f3bde941a48e407ffdf732f;12,139,2,1010,0,999,0,998,0,1012,1,1002,1,1003,1,1007,1,865,0,69,0,885,1,969,0;1;457;FLOAT3;0,0,0;False;15;FLOAT3;0;FLOAT3;556;FLOAT;56;FLOAT3;770;FLOAT;50;FLOAT;57;FLOAT;49;FLOAT;351;FLOAT;649;FLOAT;996;FLOAT3;458;FLOAT3;967;FLOAT4;968;SAMPLERSTATE;703;SAMPLERSTATE;708
Node;AmplifyShaderEditor.IntNode;477;-384,176;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;470;-720,224;Inherit;False;DESF Weather Snow;68;;57764;334852d31bd793349b63dbd3c4d466de;24,908,2,1901,1,1892,1,1780,1,1792,1,1807,1,1818,1,1766,1,1861,1,1836,1,1858,1,1075,0,1070,0,1073,0,1681,0,1071,0,1074,0,1072,0,1685,0,1508,0,1199,1,238,0,1963,1,1964,1;6;72;FLOAT3;1,1,1;False;73;FLOAT3;1,1,1;False;269;FLOAT4;0.1,0,0,0;False;258;FLOAT4;0,0,0,0;False;801;FLOAT4;0,0,0,0;False;1165;FLOAT3;0,0,0;False;7;FLOAT3;0;FLOAT3;68;FLOAT3;1181;FLOAT4;270;FLOAT;259;FLOAT4;813;FLOAT3;860
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;492;63.95,384;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;494;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;495;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;496;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;497;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;498;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;499;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;500;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;501;63.95,341.8214;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;493;-384,256;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Vegetation Snow/Billboard Cross;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;1;638177048400030762;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;470;72;448;0
WireConnection;470;73;448;556
WireConnection;470;269;448;56
WireConnection;470;258;448;50
WireConnection;470;801;448;57
WireConnection;470;1165;448;458
WireConnection;493;0;470;0
WireConnection;493;1;470;68
WireConnection;493;3;470;270
WireConnection;493;4;470;259
WireConnection;493;5;470;813
WireConnection;493;6;448;49
WireConnection;493;7;448;351
WireConnection;493;16;448;649
WireConnection;493;8;470;860
WireConnection;493;10;448;967
WireConnection;493;30;448;968
ASEEND*/
//CHKSM=C9EED7F02F313AC21689A92903BFC9EC057D1088