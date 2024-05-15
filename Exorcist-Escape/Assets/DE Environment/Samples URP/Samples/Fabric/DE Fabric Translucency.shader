// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Fabric/Translucency"
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
		[DE_DrawerSpace(10)]_SPACE_ALPHACLIP("SPACE_ALPHACLIP", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		_BaseColor("Base Color Fornt Face", Color) = (0.7294118,0.7294118,0.7294118,0)
		_BaseBrightnessFrontFace("Brightness Front Face", Range( 0 , 2)) = 1
		_BaseColorBackFace("Base Color Back Face", Color) = (0.7294118,0.7294118,0.7294118,0)
		_BaseBrightnessBackFace("Brightness Back Face", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine][Space(10)]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerToggleLeft]_BaseAffectUVchannel0("Affect UV channel 0", Float) = 1
		[DE_DrawerToggleLeft]_BaseAffectUVchannel1("Affect UV channel 1", Float) = 0
		[DE_DrawerToggleLeft]_BaseAffectUVchannel2("Affect UV channel 2", Float) = 0
		[DE_DrawerToggleLeft]_BaseAffectUVchannel3("Affect UV channel 3", Float) = 0
		[DE_DrawerTilingOffset]_BaseMainUV("Base Main UV", Vector) = (1,1,0,0)
		[DE_DrawerTextureSingleLine][Space(10)]_MaskMap("Mask Map", 2D) = "white" {}
		[DE_DrawerSliderSimple(_OcclusionStrengthAORemapMin, _OcclusionStrengthAORemapMax,0, 1)]_OcclusionStrengthAO("Occlusion Strength", Vector) = (0,0,0,0)
		[HideInInspector]_OcclusionStrengthAORemapMin("OcclusionStrengthAORemapMin", Float) = 0
		[HideInInspector]_OcclusionStrengthAORemapMax("Occlusion StrengthAORemapMax", Float) = 0
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_SmoothnessSource("Smoothness Source", Float) = 1
		[DE_DrawerSliderSimple(_SmoothnessStrengthRemapMin, _SmoothnessStrengthRemapMax,0, 1)]_SmoothnessStrength("Smoothness Strength", Vector) = (0,0,0,0)
		[HideInInspector]_SmoothnessStrengthRemapMin("Smoothness StrengthRemapMin", Float) = 0
		[HideInInspector]_SmoothnessStrengthRemapMax("Smoothness StrengthRemapMax", Float) = 0
		[Normal][DE_DrawerTextureSingleLine][Space(10)]_BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 2
		_NormalStrength("Normal Strength", Range( 0 , 2)) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(SPECULAR,true,_SpecularEnable,0,0)]_CATEGORY_SPECULAR("CATEGORY_SPECULAR", Float) = 0
		[DE_DrawerToggleLeft]_SpecularEnable("ENABLE SPECULAR", Float) = 0
		[HDR]_SpecularColor("Specular Color", Color) = (0.06666667,0.06666667,0.05882353,0)
		[DE_DrawerFloatEnum(Default _Dielectric _DielectricIOR)]_SpecularMode("Specular Mode", Float) = 3
		_SpecularWrapScale("Specular Wrap Scale", Range( 0 , 5)) = 0.85
		_SpecularWrapOffset("Specular Wrap Offset", Range( 0 , 3)) = 0
		_SpecularPower("Specular Power", Range( 0 , 35)) = 25
		_SpecularStrength("Specular Strength", Range( 0 , 15)) = 0.15
		_SpecularStrengthDielectric("Specular Strength Dielectric", Range( 0 , 1)) = 0
		_SpecularStrengthDielectricIOR("Specular Strength Dielectric IOR", Range( 1 , 2.5)) = 1.1
		[DE_DrawerSpace(10)]_SPACE_SPECULAR("SPACE_SPECULAR", Float) = 0
		[DE_DrawerCategory(THREAD MASK,true,_ThreadMaskEnable,0,0)]_CATEGORY_THREADMASK("CATEGORY_THREADMASK", Float) = 0
		[DE_DrawerToggleLeft]_ThreadMaskEnable("Enable Thread Map", Float) = 0
		[Normal][DE_DrawerTextureSingleLine][Space(10)]_ThreadNormalMap("Thread Normal Map", 2D) = "bump" {}
		_ThreadNormalStrength("Thread Normal Strength", Range( 0 , 2)) = 0.5
		[DE_DrawerToggleLeft]_ThreadMaskUVAffectchannel0("Affect UV channel 0", Float) = 1
		[DE_DrawerToggleLeft]_ThreadMaskUVAffectchannel1("Affect UV channel 1", Float) = 0
		[DE_DrawerToggleLeft]_ThreadMaskUVAffectchannel2("Affect UV channel 2", Float) = 0
		[DE_DrawerToggleLeft]_ThreadMaskUVAffectchannel3("Affect UV channel 3", Float) = 0
		[DE_DrawerTilingOffset]_ThreadMaskUV("Thread Mask UV", Vector) = (1,1,0,0)
		[DE_DrawerTextureSingleLine][Space(10)]_ThreadMaskMap("Thread Mask Map", 2D) = "white" {}
		_ThreadMaskOcclusionStrengthAO("Thread Occlusion Strength", Range( 0 , 1)) = 0
		_ThreadMaskSmoothnessStrength("Thread Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_THREADMASK("SPACE_THREADMASK", Float) = 0
		[DE_DrawerCategory(FUZZ MASK,true,_FuzzMaskEnable,0,0)]_CATEGORY_FUZZMASK("CATEGORY_FUZZMASK", Float) = 0
		[DE_DrawerToggleLeft]_FuzzMaskEnable("Enable Fuzz Mask", Float) = 0
		[HDR][Space(10)]_FuzzMaskColor("Fuzz Mask Color", Color) = (0.7294118,0.7294118,0.7294118,0)
		[DE_DrawerTextureSingleLine]_FuzzMaskMap("Fuzz Mask Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_FuzzMaskUV("Fuzz Mask UV", Vector) = (4,4,0,0)
		_FuzzMaskStrength("Fuzz Mask Strength", Range( 0 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_FUZZMASK("SPACE_FUZZMASK", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(TRANSLUCENCY ASE,true,_ASETranslucencyStrength,0,0)]_CATEGORY_TRANSLUCENCYASE("CATEGORY_TRANSLUCENCY ASE", Float) = 0
		_ASETransmissionShadow("ASE Transmission Shadow", Range( 0 , 1)) = 0.5
		_ASETranslucencyStrength("ASE Translucency Strength", Range( 1 , 50)) = 1
		_ASETranslucencyNormalDistortion("ASE Translucency Normal Distortion ", Range( 0 , 1)) = 0.2735869
		_ASETranslucencyScattering("ASE Translucency Scattering ", Range( 1 , 50)) = 2
		_ASETranslucencyDirect("ASE Translucency Direct ", Range( 0 , 1)) = 0.9
		_ASETranslucencyAmbient("ASE Translucency Ambient", Range( 0 , 1)) = 0.8339342
		_ASETranslucencyShadow("ASE Translucency Shadow ", Range( 0 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCYASE("SPACE_TRANSLUCENCYASE", Float) = 0
		[DE_DrawerCategory(WIND,true,_WindEnable,0,0)]_CATEGORY_WIND("CATEGORY_WIND", Float) = 0
		[DE_DrawerToggleLeft]_WindEnable("ENABLE WIND", Float) = 0
		[DE_DrawerToggleNoKeyword]_WindFabricOscillating("Enable Wind Oscillating", Float) = 0
		[DE_DrawerTextureSingleLine]_WindFabricPatternMap("Wind Pattern Map", 2D) = "white" {}
		_WindFabricIntensity("Wind Intensity", Range( 0 , 1)) = 0.03
		_WindFabricSpeed("Wind Speed", Range( 0.01 , 1)) = 0.025
		_WindFabricPulseFrequency("Wind Pulse Frequency", Range( 0 , 1)) = 0.3
		_WindFabricDirection("Wind Direction", Range( -1 , 1)) = 1
		[DE_DrawerToggleLeft][Space(10)]_WindEnableMask("ENABLE WIND MASK", Float) = 0
		[DE_DrawerFloatEnum(Texture _Procedural)]_WindMaskType("Wind Mask Type", Float) = 0
		[DE_DrawerTextureSingleLine][Space(10)]_WindMaskMap("Wind Mask", 2D) = "white" {}
		_WindMaskMapIntensity("Mask Intensity", Range( 0 , 1)) = 0.5
		[Space(10)]_WindMaskProcedralTopDown("Top Down", Range( 0 , 2.5)) = 0.85
		_WindMaskProcedralBottomUp("Bottom Up", Range( 0 , 2.5)) = 0
		_WindMaskProcedralSpherical("Spherical", Range( 0 , 1)) = 0
		_WindMaskProcedralSphericalInverted("Spherical Inverted", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_WIND("SPACE_WIND", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
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
			Tags { "LightMode"="UniversalForwardOnly" }

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
			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_FuzzMaskMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_ThreadNormalMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_ThreadMaskMap);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
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
			
			float SpecularModefloatswitch112_g57754( float m_switch, float m_Default, float m_Dielectric, float m_DielectricIOR )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.tangentOS.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.texcoord.xy * _BaseAffectUVchannel0 ) + ( v.texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord8.xy = vertexToFrag607_g57399;
				float2 temp_output_383_0_g57399 = ( ( ( v.texcoord.xy * _ThreadMaskUVAffectchannel0 ) + ( v.texcoord1.xy * _ThreadMaskUVAffectchannel1 ) ) + ( ( v.texcoord2.xy * _ThreadMaskUVAffectchannel2 ) + ( v.ase_texcoord3.xy * _ThreadMaskUVAffectchannel3 ) ) );
				float2 vertexToFrag615_g57399 = ( ( temp_output_383_0_g57399 * (_FuzzMaskUV).xy ) + (_FuzzMaskUV).zw );
				o.ase_texcoord8.zw = vertexToFrag615_g57399;
				
				float2 vertexToFrag610_g57399 = ( ( temp_output_383_0_g57399 * (_ThreadMaskUV).xy ) + (_ThreadMaskUV).zw );
				o.ase_texcoord9.xy = vertexToFrag610_g57399;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord8.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float3 temp_output_352_0_g57399 = (Output_Fetch2D44_g57480).rgb;
				float dotResult8_g57733 = dot( WorldNormal , WorldViewDirection );
				float TwoSidedSign642_g57399 = (1.0 + (sign( dotResult8_g57733 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult638_g57399 = lerp( ( (_BaseColor).rgb * temp_output_352_0_g57399 * _BaseBrightnessFrontFace ) , ( (_BaseColorBackFace).rgb * temp_output_352_0_g57399 * _BaseBrightnessBackFace ) , TwoSidedSign642_g57399);
				float3 temp_cast_0 = (0.0).xxx;
				float localStochasticTiling159_g57719 = ( 0.0 );
				float2 vertexToFrag615_g57399 = IN.ase_texcoord8.zw;
				float2 UVFuzz598_g57399 = vertexToFrag615_g57399;
				float2 UV159_g57719 = UVFuzz598_g57399;
				float4 TexelSize159_g57719 = _FuzzMaskMap_TexelSize;
				float4 Offsets159_g57719 = float4( 0,0,0,0 );
				float2 Weights159_g57719 = float2( 0,0 );
				{
				UV159_g57719 = UV159_g57719 * TexelSize159_g57719.zw - 0.5;
				float2 f = frac( UV159_g57719 );
				UV159_g57719 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57719.x - 0.5, UV159_g57719.x + 1.5, UV159_g57719.y - 0.5, UV159_g57719.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57719 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57719.xyxy;
				Weights159_g57719 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57718 = Offsets159_g57719;
				float2 Input_FetchWeights143_g57718 = Weights159_g57719;
				float2 break46_g57718 = Input_FetchWeights143_g57718;
				float4 lerpResult20_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yw ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xw ) , break46_g57718.x);
				float4 lerpResult40_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yz ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xz ) , break46_g57718.x);
				float4 lerpResult22_g57718 = lerp( lerpResult20_g57718 , lerpResult40_g57718 , break46_g57718.y);
				float4 Output_Fetch2D44_g57718 = lerpResult22_g57718;
				float4 break50_g57718 = Output_Fetch2D44_g57718;
				float3 lerpResult57_g57399 = lerp( temp_cast_0 , ( (_FuzzMaskColor).rgb * break50_g57718.r ) , _FuzzMaskStrength);
				float3 lerpResult144_g57399 = lerp( lerpResult638_g57399 , saturate( ( lerpResult638_g57399 + lerpResult57_g57399 ) ) , ( _FuzzMaskEnable + ( ( _CATEGORY_FUZZMASK + _SPACE_FUZZMASK ) * 0.0 ) ));
				
				float localStochasticTiling159_g57730 = ( 0.0 );
				float2 UV159_g57730 = UVBase593_g57399;
				float4 TexelSize159_g57730 = _BumpMap_TexelSize;
				float4 Offsets159_g57730 = float4( 0,0,0,0 );
				float2 Weights159_g57730 = float2( 0,0 );
				{
				UV159_g57730 = UV159_g57730 * TexelSize159_g57730.zw - 0.5;
				float2 f = frac( UV159_g57730 );
				UV159_g57730 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57730.x - 0.5, UV159_g57730.x + 1.5, UV159_g57730.y - 0.5, UV159_g57730.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57730 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57730.xyxy;
				Weights159_g57730 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57554 = Offsets159_g57730;
				float2 Input_FetchWeights143_g57554 = Weights159_g57730;
				float2 break46_g57554 = Input_FetchWeights143_g57554;
				float4 lerpResult20_g57554 = lerp( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).yw ) , SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).xw ) , break46_g57554.x);
				float4 lerpResult40_g57554 = lerp( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).yz ) , SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).xz ) , break46_g57554.x);
				float4 lerpResult22_g57554 = lerp( lerpResult20_g57554 , lerpResult40_g57554 , break46_g57554.y);
				float4 Output_Fetch2D44_g57554 = lerpResult22_g57554;
				float3 unpack78_g57399 = UnpackNormalScale( Output_Fetch2D44_g57554, _NormalStrength );
				unpack78_g57399.z = lerp( 1, unpack78_g57399.z, saturate(_NormalStrength) );
				float localStochasticTiling159_g57563 = ( 0.0 );
				float2 vertexToFrag610_g57399 = IN.ase_texcoord9.xy;
				float2 UVThread602_g57399 = vertexToFrag610_g57399;
				float2 UV159_g57563 = UVThread602_g57399;
				float4 TexelSize159_g57563 = _ThreadNormalMap_TexelSize;
				float4 Offsets159_g57563 = float4( 0,0,0,0 );
				float2 Weights159_g57563 = float2( 0,0 );
				{
				UV159_g57563 = UV159_g57563 * TexelSize159_g57563.zw - 0.5;
				float2 f = frac( UV159_g57563 );
				UV159_g57563 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57563.x - 0.5, UV159_g57563.x + 1.5, UV159_g57563.y - 0.5, UV159_g57563.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57563 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57563.xyxy;
				Weights159_g57563 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57559 = Offsets159_g57563;
				float2 Input_FetchWeights143_g57559 = Weights159_g57563;
				float2 break46_g57559 = Input_FetchWeights143_g57559;
				float4 lerpResult20_g57559 = lerp( SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).yw ) , SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).xw ) , break46_g57559.x);
				float4 lerpResult40_g57559 = lerp( SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).yz ) , SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).xz ) , break46_g57559.x);
				float4 lerpResult22_g57559 = lerp( lerpResult20_g57559 , lerpResult40_g57559 , break46_g57559.y);
				float4 Output_Fetch2D44_g57559 = lerpResult22_g57559;
				float3 unpack253_g57399 = UnpackNormalScale( Output_Fetch2D44_g57559, _ThreadNormalStrength );
				unpack253_g57399.z = lerp( 1, unpack253_g57399.z, saturate(_ThreadNormalStrength) );
				float layeredBlendVar719_g57399 = 0.5;
				float3 layeredBlend719_g57399 = ( lerp( unpack78_g57399,unpack253_g57399 , layeredBlendVar719_g57399 ) );
				float3 break701_g57399 = layeredBlend719_g57399;
				float3 appendResult703_g57399 = (float3(break701_g57399.x , break701_g57399.y , ( break701_g57399.z + 0.001 )));
				float3 lerpResult91_g57399 = lerp( unpack78_g57399 , appendResult703_g57399 , ( _ThreadMaskEnable + ( ( _CATEGORY_THREADMASK + _SPACE_THREADMASK ) * 0.0 ) ));
				float3 temp_output_24_0_g57558 = lerpResult91_g57399;
				float temp_output_50_0_g57558 = _DoubleSidedNormalMode;
				float m_switch64_g57558 = temp_output_50_0_g57558;
				float3 m_Flip64_g57558 = float3(-1,-1,-1);
				float3 m_Mirror64_g57558 = float3(1,1,-1);
				float3 m_None64_g57558 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57558 = _NormalModefloat3switch( m_switch64_g57558 , m_Flip64_g57558 , m_Mirror64_g57558 , m_None64_g57558 );
				float3 switchResult58_g57558 = (((ase_vface>0)?(temp_output_24_0_g57558):(( temp_output_24_0_g57558 * local_NormalModefloat3switch64_g57558 ))));
				
				float3 BaseColor473_g57399 = lerpResult144_g57399;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float m_switch112_g57754 = _SpecularMode;
				float3 temp_output_143_0_g57755 = _MainLightPosition.xyz;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal153_g57754 = unpack78_g57399;
				float3 worldNormal153_g57754 = float3(dot(tanToWorld0,tanNormal153_g57754), dot(tanToWorld1,tanNormal153_g57754), dot(tanToWorld2,tanNormal153_g57754));
				float3 temp_output_144_0_g57755 = worldNormal153_g57754;
				float dotResult137_g57755 = dot( temp_output_143_0_g57755 , temp_output_144_0_g57755 );
				float dotResult201_g57754 = dot( ( temp_output_143_0_g57755 - ( ( dotResult137_g57755 * 2.0 ) * temp_output_144_0_g57755 ) ) , -WorldViewDirection );
				float temp_output_215_0_g57754 = max( saturate( dotResult201_g57754 ) , 0.0 );
				float temp_output_54_0_g57754 = (temp_output_215_0_g57754*_SpecularWrapScale + _SpecularWrapOffset);
				float saferPower63_g57754 = abs( temp_output_54_0_g57754 );
				float temp_output_63_0_g57754 = pow( saferPower63_g57754 , _SpecularPower );
				float m_Default112_g57754 = ( temp_output_63_0_g57754 * _SpecularStrength );
				float temp_output_222_0_g57754 = ( temp_output_63_0_g57754 * 15.0 );
				float lerpResult102_g57754 = lerp( 0.034 , 0.048 , _SpecularStrengthDielectric);
				float m_Dielectric112_g57754 = ( temp_output_222_0_g57754 * lerpResult102_g57754 );
				float m_DielectricIOR112_g57754 = ( temp_output_222_0_g57754 * ( pow( ( _SpecularStrengthDielectricIOR - 1.0 ) , 2.0 ) / pow( ( _SpecularStrengthDielectricIOR + 1.0 ) , 2.0 ) ) );
				float localSpecularModefloatswitch112_g57754 = SpecularModefloatswitch112_g57754( m_switch112_g57754 , m_Default112_g57754 , m_Dielectric112_g57754 , m_DielectricIOR112_g57754 );
				float3 lerpResult80_g57754 = lerp( float3(0,0,0) , saturate( ( ( (_SpecularColor).rgb * ( ase_lightColor.rgb * max( ase_lightColor.a , 0.0 ) ) ) * localSpecularModefloatswitch112_g57754 ) ) , ( _SpecularEnable + ( ( _CATEGORY_SPECULAR + _SPACE_SPECULAR ) * 0.0 ) ));
				float localStochasticTiling159_g57572 = ( 0.0 );
				float2 UV159_g57572 = UVBase593_g57399;
				float4 TexelSize159_g57572 = _MaskMap_TexelSize;
				float4 Offsets159_g57572 = float4( 0,0,0,0 );
				float2 Weights159_g57572 = float2( 0,0 );
				{
				UV159_g57572 = UV159_g57572 * TexelSize159_g57572.zw - 0.5;
				float2 f = frac( UV159_g57572 );
				UV159_g57572 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57572.x - 0.5, UV159_g57572.x + 1.5, UV159_g57572.y - 0.5, UV159_g57572.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57572 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57572.xyxy;
				Weights159_g57572 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57571 = Offsets159_g57572;
				float2 Input_FetchWeights143_g57571 = Weights159_g57572;
				float2 break46_g57571 = Input_FetchWeights143_g57571;
				float4 lerpResult20_g57571 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57571).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57571).xw ) , break46_g57571.x);
				float4 lerpResult40_g57571 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57571).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57571).xz ) , break46_g57571.x);
				float4 lerpResult22_g57571 = lerp( lerpResult20_g57571 , lerpResult40_g57571 , break46_g57571.y);
				float4 Output_Fetch2D44_g57571 = lerpResult22_g57571;
				float4 break50_g57571 = Output_Fetch2D44_g57571;
				float MASK_R118_g57399 = break50_g57571.r;
				float lerpResult666_g57399 = lerp( ( 1.0 - ( _OcclusionStrengthAORemapMin + ( _OcclusionStrengthAO.x * 0.0 ) ) ) , ( 1.0 - _OcclusionStrengthAORemapMax ) , MASK_R118_g57399);
				float localStochasticTiling159_g57570 = ( 0.0 );
				float2 UV159_g57570 = UVBase593_g57399;
				float4 TexelSize159_g57570 = _ThreadMaskMap_TexelSize;
				float4 Offsets159_g57570 = float4( 0,0,0,0 );
				float2 Weights159_g57570 = float2( 0,0 );
				{
				UV159_g57570 = UV159_g57570 * TexelSize159_g57570.zw - 0.5;
				float2 f = frac( UV159_g57570 );
				UV159_g57570 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57570.x - 0.5, UV159_g57570.x + 1.5, UV159_g57570.y - 0.5, UV159_g57570.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57570 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57570.xyxy;
				Weights159_g57570 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57569 = Offsets159_g57570;
				float2 Input_FetchWeights143_g57569 = Weights159_g57570;
				float2 break46_g57569 = Input_FetchWeights143_g57569;
				float4 lerpResult20_g57569 = lerp( SAMPLE_TEXTURE2D( _ThreadMaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57569).yw ) , SAMPLE_TEXTURE2D( _ThreadMaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57569).xw ) , break46_g57569.x);
				float4 lerpResult40_g57569 = lerp( SAMPLE_TEXTURE2D( _ThreadMaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57569).yz ) , SAMPLE_TEXTURE2D( _ThreadMaskMap, sampler_MaskMap, (Input_FetchOffsets70_g57569).xz ) , break46_g57569.x);
				float4 lerpResult22_g57569 = lerp( lerpResult20_g57569 , lerpResult40_g57569 , break46_g57569.y);
				float4 Output_Fetch2D44_g57569 = lerpResult22_g57569;
				float4 break50_g57569 = Output_Fetch2D44_g57569;
				float MASK_R_Thread264_g57399 = break50_g57569.r;
				float lerpResult521_g57399 = lerp( lerpResult666_g57399 , ( 1.0 - _ThreadMaskOcclusionStrengthAO ) , MASK_R_Thread264_g57399);
				float lerpResult113_g57399 = lerp( lerpResult666_g57399 , lerpResult521_g57399 , _ThreadMaskEnable);
				float temp_output_114_0_g57399 = saturate( lerpResult113_g57399 );
				float Occlusion745_g57399 = temp_output_114_0_g57399;
				
				float MASK_G60_g57399 = break50_g57571.g;
				float lerpResult657_g57399 = lerp( MASK_G60_g57399 , ( 1.0 - MASK_G60_g57399 ) , _SmoothnessSource);
				float lerpResult653_g57399 = lerp( ( _SmoothnessStrengthRemapMin + ( _SmoothnessStrength.x * 0.0 ) ) , _SmoothnessStrengthRemapMax , lerpResult657_g57399);
				float MASK_G_Thread52_g57399 = break50_g57569.g;
				float lerpResult514_g57399 = lerp( lerpResult653_g57399 , _ThreadMaskSmoothnessStrength , MASK_G_Thread52_g57399);
				float lerpResult89_g57399 = lerp( lerpResult653_g57399 , lerpResult514_g57399 , _ThreadMaskEnable);
				
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , WorldViewDirection );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float3 BaseColor = lerpResult144_g57399;
				float3 Normal = switchResult58_g57558;
				float3 Emission = 0;
				float3 Specular = ( BaseColor473_g57399 * lerpResult80_g57754 * Occlusion745_g57399 );
				float Metallic = 0;
				float Smoothness = saturate( lerpResult89_g57399 );
				float Occlusion = temp_output_114_0_g57399;
				float Alpha = temp_output_98_0_g57740;
				float AlphaClipThreshold = _AlphaCutoffBias;
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
					float shadow = _ASETransmissionShadow;

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
					float shadow = _ASETranslucencyShadow;
					float normal = _ASETranslucencyNormalDistortion;
					float scattering = _ASETranslucencyScattering;
					float direct = _ASETranslucencyScattering;
					float ambient = _ASETranslucencyAmbient;
					float strength = _ASETranslucencyStrength;

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
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord3.xy = vertexToFrag607_g57399;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord3.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float Alpha = temp_output_98_0_g57740;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = 0.5;

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
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord3.xy = vertexToFrag607_g57399;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

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
				float4 ase_tangent : TANGENT;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord3.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float Alpha = temp_output_98_0_g57740;
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
			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_FuzzMaskMap);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.texcoord0.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.texcoord0.xy * _BaseAffectUVchannel0 ) + ( v.texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord4.xy = vertexToFrag607_g57399;
				o.ase_texcoord5.xyz = ase_worldNormal;
				float2 temp_output_383_0_g57399 = ( ( ( v.texcoord0.xy * _ThreadMaskUVAffectchannel0 ) + ( v.texcoord1.xy * _ThreadMaskUVAffectchannel1 ) ) + ( ( v.texcoord2.xy * _ThreadMaskUVAffectchannel2 ) + ( v.ase_texcoord3.xy * _ThreadMaskUVAffectchannel3 ) ) );
				float2 vertexToFrag615_g57399 = ( ( temp_output_383_0_g57399 * (_FuzzMaskUV).xy ) + (_FuzzMaskUV).zw );
				o.ase_texcoord4.zw = vertexToFrag615_g57399;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

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
				float4 ase_tangent : TANGENT;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord4.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float3 temp_output_352_0_g57399 = (Output_Fetch2D44_g57480).rgb;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57733 = dot( ase_worldNormal , ase_worldViewDir );
				float TwoSidedSign642_g57399 = (1.0 + (sign( dotResult8_g57733 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult638_g57399 = lerp( ( (_BaseColor).rgb * temp_output_352_0_g57399 * _BaseBrightnessFrontFace ) , ( (_BaseColorBackFace).rgb * temp_output_352_0_g57399 * _BaseBrightnessBackFace ) , TwoSidedSign642_g57399);
				float3 temp_cast_0 = (0.0).xxx;
				float localStochasticTiling159_g57719 = ( 0.0 );
				float2 vertexToFrag615_g57399 = IN.ase_texcoord4.zw;
				float2 UVFuzz598_g57399 = vertexToFrag615_g57399;
				float2 UV159_g57719 = UVFuzz598_g57399;
				float4 TexelSize159_g57719 = _FuzzMaskMap_TexelSize;
				float4 Offsets159_g57719 = float4( 0,0,0,0 );
				float2 Weights159_g57719 = float2( 0,0 );
				{
				UV159_g57719 = UV159_g57719 * TexelSize159_g57719.zw - 0.5;
				float2 f = frac( UV159_g57719 );
				UV159_g57719 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57719.x - 0.5, UV159_g57719.x + 1.5, UV159_g57719.y - 0.5, UV159_g57719.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57719 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57719.xyxy;
				Weights159_g57719 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57718 = Offsets159_g57719;
				float2 Input_FetchWeights143_g57718 = Weights159_g57719;
				float2 break46_g57718 = Input_FetchWeights143_g57718;
				float4 lerpResult20_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yw ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xw ) , break46_g57718.x);
				float4 lerpResult40_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yz ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xz ) , break46_g57718.x);
				float4 lerpResult22_g57718 = lerp( lerpResult20_g57718 , lerpResult40_g57718 , break46_g57718.y);
				float4 Output_Fetch2D44_g57718 = lerpResult22_g57718;
				float4 break50_g57718 = Output_Fetch2D44_g57718;
				float3 lerpResult57_g57399 = lerp( temp_cast_0 , ( (_FuzzMaskColor).rgb * break50_g57718.r ) , _FuzzMaskStrength);
				float3 lerpResult144_g57399 = lerp( lerpResult638_g57399 , saturate( ( lerpResult638_g57399 + lerpResult57_g57399 ) ) , ( _FuzzMaskEnable + ( ( _CATEGORY_FUZZMASK + _SPACE_FUZZMASK ) * 0.0 ) ));
				
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float3 BaseColor = lerpResult144_g57399;
				float3 Emission = 0;
				float Alpha = temp_output_98_0_g57740;
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
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_FuzzMaskMap);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord2.xy = vertexToFrag607_g57399;
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 temp_output_383_0_g57399 = ( ( ( v.ase_texcoord.xy * _ThreadMaskUVAffectchannel0 ) + ( v.ase_texcoord1.xy * _ThreadMaskUVAffectchannel1 ) ) + ( ( v.ase_texcoord2.xy * _ThreadMaskUVAffectchannel2 ) + ( v.ase_texcoord3.xy * _ThreadMaskUVAffectchannel3 ) ) );
				float2 vertexToFrag615_g57399 = ( ( temp_output_383_0_g57399 * (_FuzzMaskUV).xy ) + (_FuzzMaskUV).zw );
				o.ase_texcoord2.zw = vertexToFrag615_g57399;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

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
				float4 ase_tangent : TANGENT;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord2.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float3 temp_output_352_0_g57399 = (Output_Fetch2D44_g57480).rgb;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57733 = dot( ase_worldNormal , ase_worldViewDir );
				float TwoSidedSign642_g57399 = (1.0 + (sign( dotResult8_g57733 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult638_g57399 = lerp( ( (_BaseColor).rgb * temp_output_352_0_g57399 * _BaseBrightnessFrontFace ) , ( (_BaseColorBackFace).rgb * temp_output_352_0_g57399 * _BaseBrightnessBackFace ) , TwoSidedSign642_g57399);
				float3 temp_cast_0 = (0.0).xxx;
				float localStochasticTiling159_g57719 = ( 0.0 );
				float2 vertexToFrag615_g57399 = IN.ase_texcoord2.zw;
				float2 UVFuzz598_g57399 = vertexToFrag615_g57399;
				float2 UV159_g57719 = UVFuzz598_g57399;
				float4 TexelSize159_g57719 = _FuzzMaskMap_TexelSize;
				float4 Offsets159_g57719 = float4( 0,0,0,0 );
				float2 Weights159_g57719 = float2( 0,0 );
				{
				UV159_g57719 = UV159_g57719 * TexelSize159_g57719.zw - 0.5;
				float2 f = frac( UV159_g57719 );
				UV159_g57719 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57719.x - 0.5, UV159_g57719.x + 1.5, UV159_g57719.y - 0.5, UV159_g57719.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57719 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57719.xyxy;
				Weights159_g57719 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57718 = Offsets159_g57719;
				float2 Input_FetchWeights143_g57718 = Weights159_g57719;
				float2 break46_g57718 = Input_FetchWeights143_g57718;
				float4 lerpResult20_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yw ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xw ) , break46_g57718.x);
				float4 lerpResult40_g57718 = lerp( SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).yz ) , SAMPLE_TEXTURE2D( _FuzzMaskMap, sampler_MainTex, (Input_FetchOffsets70_g57718).xz ) , break46_g57718.x);
				float4 lerpResult22_g57718 = lerp( lerpResult20_g57718 , lerpResult40_g57718 , break46_g57718.y);
				float4 Output_Fetch2D44_g57718 = lerpResult22_g57718;
				float4 break50_g57718 = Output_Fetch2D44_g57718;
				float3 lerpResult57_g57399 = lerp( temp_cast_0 , ( (_FuzzMaskColor).rgb * break50_g57718.r ) , _FuzzMaskStrength);
				float3 lerpResult144_g57399 = lerp( lerpResult638_g57399 , saturate( ( lerpResult638_g57399 + lerpResult57_g57399 ) ) , ( _FuzzMaskEnable + ( ( _CATEGORY_FUZZMASK + _SPACE_FUZZMASK ) * 0.0 ) ));
				
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float3 BaseColor = lerpResult144_g57399;
				float Alpha = temp_output_98_0_g57740;
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
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_ThreadNormalMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
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

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.tangentOS.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord5.xy = vertexToFrag607_g57399;
				float2 temp_output_383_0_g57399 = ( ( ( v.ase_texcoord.xy * _ThreadMaskUVAffectchannel0 ) + ( v.ase_texcoord1.xy * _ThreadMaskUVAffectchannel1 ) ) + ( ( v.ase_texcoord2.xy * _ThreadMaskUVAffectchannel2 ) + ( v.ase_texcoord3.xy * _ThreadMaskUVAffectchannel3 ) ) );
				float2 vertexToFrag610_g57399 = ( ( temp_output_383_0_g57399 * (_ThreadMaskUV).xy ) + (_ThreadMaskUV).zw );
				o.ase_texcoord5.zw = vertexToFrag610_g57399;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

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

				float localStochasticTiling159_g57730 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord5.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57730 = UVBase593_g57399;
				float4 TexelSize159_g57730 = _BumpMap_TexelSize;
				float4 Offsets159_g57730 = float4( 0,0,0,0 );
				float2 Weights159_g57730 = float2( 0,0 );
				{
				UV159_g57730 = UV159_g57730 * TexelSize159_g57730.zw - 0.5;
				float2 f = frac( UV159_g57730 );
				UV159_g57730 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57730.x - 0.5, UV159_g57730.x + 1.5, UV159_g57730.y - 0.5, UV159_g57730.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57730 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57730.xyxy;
				Weights159_g57730 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57554 = Offsets159_g57730;
				float2 Input_FetchWeights143_g57554 = Weights159_g57730;
				float2 break46_g57554 = Input_FetchWeights143_g57554;
				float4 lerpResult20_g57554 = lerp( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).yw ) , SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).xw ) , break46_g57554.x);
				float4 lerpResult40_g57554 = lerp( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).yz ) , SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g57554).xz ) , break46_g57554.x);
				float4 lerpResult22_g57554 = lerp( lerpResult20_g57554 , lerpResult40_g57554 , break46_g57554.y);
				float4 Output_Fetch2D44_g57554 = lerpResult22_g57554;
				float3 unpack78_g57399 = UnpackNormalScale( Output_Fetch2D44_g57554, _NormalStrength );
				unpack78_g57399.z = lerp( 1, unpack78_g57399.z, saturate(_NormalStrength) );
				float localStochasticTiling159_g57563 = ( 0.0 );
				float2 vertexToFrag610_g57399 = IN.ase_texcoord5.zw;
				float2 UVThread602_g57399 = vertexToFrag610_g57399;
				float2 UV159_g57563 = UVThread602_g57399;
				float4 TexelSize159_g57563 = _ThreadNormalMap_TexelSize;
				float4 Offsets159_g57563 = float4( 0,0,0,0 );
				float2 Weights159_g57563 = float2( 0,0 );
				{
				UV159_g57563 = UV159_g57563 * TexelSize159_g57563.zw - 0.5;
				float2 f = frac( UV159_g57563 );
				UV159_g57563 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57563.x - 0.5, UV159_g57563.x + 1.5, UV159_g57563.y - 0.5, UV159_g57563.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57563 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57563.xyxy;
				Weights159_g57563 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57559 = Offsets159_g57563;
				float2 Input_FetchWeights143_g57559 = Weights159_g57563;
				float2 break46_g57559 = Input_FetchWeights143_g57559;
				float4 lerpResult20_g57559 = lerp( SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).yw ) , SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).xw ) , break46_g57559.x);
				float4 lerpResult40_g57559 = lerp( SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).yz ) , SAMPLE_TEXTURE2D( _ThreadNormalMap, sampler_BumpMap, (Input_FetchOffsets70_g57559).xz ) , break46_g57559.x);
				float4 lerpResult22_g57559 = lerp( lerpResult20_g57559 , lerpResult40_g57559 , break46_g57559.y);
				float4 Output_Fetch2D44_g57559 = lerpResult22_g57559;
				float3 unpack253_g57399 = UnpackNormalScale( Output_Fetch2D44_g57559, _ThreadNormalStrength );
				unpack253_g57399.z = lerp( 1, unpack253_g57399.z, saturate(_ThreadNormalStrength) );
				float layeredBlendVar719_g57399 = 0.5;
				float3 layeredBlend719_g57399 = ( lerp( unpack78_g57399,unpack253_g57399 , layeredBlendVar719_g57399 ) );
				float3 break701_g57399 = layeredBlend719_g57399;
				float3 appendResult703_g57399 = (float3(break701_g57399.x , break701_g57399.y , ( break701_g57399.z + 0.001 )));
				float3 lerpResult91_g57399 = lerp( unpack78_g57399 , appendResult703_g57399 , ( _ThreadMaskEnable + ( ( _CATEGORY_THREADMASK + _SPACE_THREADMASK ) * 0.0 ) ));
				float3 temp_output_24_0_g57558 = lerpResult91_g57399;
				float temp_output_50_0_g57558 = _DoubleSidedNormalMode;
				float m_switch64_g57558 = temp_output_50_0_g57558;
				float3 m_Flip64_g57558 = float3(-1,-1,-1);
				float3 m_Mirror64_g57558 = float3(1,1,-1);
				float3 m_None64_g57558 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57558 = _NormalModefloat3switch( m_switch64_g57558 , m_Flip64_g57558 , m_Mirror64_g57558 , m_None64_g57558 );
				float3 switchResult58_g57558 = (((ase_vface>0)?(temp_output_24_0_g57558):(( temp_output_24_0_g57558 * local_NormalModefloat3switch64_g57558 ))));
				
				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 temp_output_95_0_g57744 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				float3 Normal = switchResult58_g57558;
				float Alpha = temp_output_98_0_g57740;
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
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
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

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord.xy = vertexToFrag607_g57399;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

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
				float4 ase_tangent : TANGENT;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57744 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57740;
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
			#define _SPECULAR_SETUP 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			float4 _MaskMap_TexelSize;
			half4 _BaseMainUV;
			half4 _OcclusionStrengthAO;
			float4 _MainTex_TexelSize;
			half4 _SpecularColor;
			float4 _ThreadNormalMap_TexelSize;
			float4 _ThreadMaskMap_TexelSize;
			half4 _BaseColorBackFace;
			half4 _SmoothnessStrength;
			half4 _FuzzMaskColor;
			half4 _BaseColor;
			float4 _BumpMap_TexelSize;
			float4 _AlphaRemap;
			float4 _FuzzMaskMap_TexelSize;
			half4 _FuzzMaskUV;
			half4 _ThreadMaskUV;
			float4 _WindMaskMap_ST;
			float _CATEGORY_THREADMASK;
			half _DoubleSidedNormalMode;
			float _SPACE_THREADMASK;
			float _SPACE_SURFACEINPUTS;
			half _ThreadNormalStrength;
			half _NormalStrength;
			float _SPACE_FUZZMASK;
			float _CATEGORY_FUZZMASK;
			half _ThreadMaskEnable;
			half _SpecularMode;
			half _SpecularStrength;
			half _SpecularWrapOffset;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _ThreadMaskSmoothnessStrength;
			half _SmoothnessSource;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			half _ThreadMaskOcclusionStrengthAO;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			float _SPACE_SPECULAR;
			float _CATEGORY_SPECULAR;
			half _SpecularEnable;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _FuzzMaskEnable;
			half _ThreadMaskUVAffectchannel3;
			float _SPACE_ALPHACLIP;
			half _WindFabricPulseFrequency;
			half _WindFabricIntensity;
			half _WindFabricDirection;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			half _WindFabricSpeed;
			float _ASETranslucencyStrength;
			float _ASETranslucencyScattering;
			float _ASETranslucencyDirect;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _ASETranslucencyNormalDistortion;
			half _WindFabricOscillating;
			half _WindMaskMapIntensity;
			half _WindMaskProcedralTopDown;
			half _ThreadMaskUVAffectchannel2;
			half _ThreadMaskUVAffectchannel1;
			half _ThreadMaskUVAffectchannel0;
			half _BaseBrightnessBackFace;
			half _BaseBrightnessFrontFace;
			half _BaseAffectUVchannel3;
			half _BaseAffectUVchannel2;
			half _BaseAffectUVchannel1;
			half _BaseAffectUVchannel0;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindEnableMask;
			half _WindMaskType;
			half _WindMaskProcedralSphericalInverted;
			half _WindMaskProcedralSpherical;
			half _WindMaskProcedralBottomUp;
			half _FuzzMaskStrength;
			half _AlphaCutoffBias;
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

			float _GlobalWindFabricIntensity;
			float _GlobalWindFabricEnabled;
			TEXTURE2D(_WindFabricPatternMap);
			SAMPLER(sampler_WindFabricPatternMap);
			TEXTURE2D(_WindMaskMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
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

				float GlobalWindFabricIntensity3161_g57758 = _GlobalWindFabricIntensity;
				float GlobalWindFabricEnabled3160_g57758 = _GlobalWindFabricEnabled;
				float lerpResult3129_g57758 = lerp( _WindFabricIntensity , ( _WindFabricIntensity * GlobalWindFabricIntensity3161_g57758 ) , GlobalWindFabricEnabled3160_g57758);
				float2 appendResult2856_g57758 = (float2(v.positionOS.xyz.x , v.positionOS.xyz.y));
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float temp_output_2859_0_g57758 = ( _TimeParameters.x * _WindFabricSpeed );
				float clampResult2861_g57758 = clamp( _WindFabricSpeed , 0.2 , 0.25 );
				float2 appendResult2863_g57758 = (float2(temp_output_2859_0_g57758 , ( temp_output_2859_0_g57758 / clampResult2861_g57758 )));
				float2 temp_output_2865_0_g57758 = ( ( ( ase_worldPos.x + ase_worldPos.z ) * _WindFabricPulseFrequency ) + appendResult2863_g57758 );
				float2 lerpResult3130_g57758 = lerp( temp_output_2865_0_g57758 , cos( temp_output_2865_0_g57758 ) , _WindFabricOscillating);
				float4 tex2DNode3170_g57758 = SAMPLE_TEXTURE2D_LOD( _WindFabricPatternMap, sampler_WindFabricPatternMap, ( appendResult2856_g57758 + lerpResult3130_g57758 ), 0.0 );
				float3 appendResult2869_g57758 = (float3(tex2DNode3170_g57758.r , tex2DNode3170_g57758.r , tex2DNode3170_g57758.r));
				float3 temp_output_2836_0_g57758 = ( lerpResult3129_g57758 * appendResult2869_g57758 );
				float3 rotatedValue974_g57758 = RotateAroundAxis( float3( 0,0,0 ), mul( float4( ( ( ( cos( temp_output_2836_0_g57758 ) + ( -0.3193 * PI ) ) * v.normalOS * 1.0 ) + ( sin( temp_output_2836_0_g57758 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 1.0 ) ) , 0.0 ), GetObjectToWorldMatrix() ).xyz, float3( 0,1,0 ), ( _WindFabricDirection * PI ) );
				float2 uv_WindMaskMap = v.ase_texcoord.xy * _WindMaskMap_ST.xy + _WindMaskMap_ST.zw;
				float3 lerpResult3013_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( SAMPLE_TEXTURE2D_LOD( _WindMaskMap, sampler_WindFabricPatternMap, uv_WindMaskMap, 0.0 ).r + ( 1.0 - _WindMaskMapIntensity ) ));
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float temp_output_3025_0_g57758 = frac( abs( ase_worldNormal.z ) );
				float3 lerpResult3012_g57758 = lerp( float3( 0,0,0 ) , rotatedValue974_g57758 , ( 1.0 - ( step( ( 1.0 - ase_worldNormal.y ) , _WindMaskProcedralTopDown ) + step( ( 1.0 + ase_worldNormal.y ) , _WindMaskProcedralBottomUp ) + ( ( 1.0 - step( temp_output_3025_0_g57758 , ( 1.0 - _WindMaskProcedralSpherical ) ) ) + step( temp_output_3025_0_g57758 , _WindMaskProcedralSphericalInverted ) ) ) ));
				float3 lerpResult3137_g57758 = lerp( lerpResult3013_g57758 , lerpResult3012_g57758 , _WindMaskType);
				float3 lerpResult3136_g57758 = lerp( rotatedValue974_g57758 , lerpResult3137_g57758 , _WindEnableMask);
				float3 lerpResult3131_g57758 = lerp( float3(0,0,0) , lerpResult3136_g57758 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float2 vertexToFrag607_g57399 = ( ( ( ( ( v.ase_texcoord.xy * _BaseAffectUVchannel0 ) + ( v.ase_texcoord1.xy * _BaseAffectUVchannel1 ) ) + ( ( v.ase_texcoord2.xy * _BaseAffectUVchannel2 ) + ( v.ase_texcoord3.xy * _BaseAffectUVchannel3 ) ) ) * (_BaseMainUV).xy ) + (_BaseMainUV).zw );
				o.ase_texcoord.xy = vertexToFrag607_g57399;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3131_g57758;

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
				float4 ase_tangent : TANGENT;
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

				float localStochasticTiling159_g57464 = ( 0.0 );
				float2 vertexToFrag607_g57399 = IN.ase_texcoord.xy;
				float2 UVBase593_g57399 = vertexToFrag607_g57399;
				float2 UV159_g57464 = UVBase593_g57399;
				float4 TexelSize159_g57464 = _MainTex_TexelSize;
				float4 Offsets159_g57464 = float4( 0,0,0,0 );
				float2 Weights159_g57464 = float2( 0,0 );
				{
				UV159_g57464 = UV159_g57464 * TexelSize159_g57464.zw - 0.5;
				float2 f = frac( UV159_g57464 );
				UV159_g57464 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57464.x - 0.5, UV159_g57464.x + 1.5, UV159_g57464.y - 0.5, UV159_g57464.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57464 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57464.xyxy;
				Weights159_g57464 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57480 = Offsets159_g57464;
				float2 Input_FetchWeights143_g57480 = Weights159_g57464;
				float2 break46_g57480 = Input_FetchWeights143_g57480;
				float4 lerpResult20_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yw ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xw ) , break46_g57480.x);
				float4 lerpResult40_g57480 = lerp( SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).yz ) , SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g57480).xz ) , break46_g57480.x);
				float4 lerpResult22_g57480 = lerp( lerpResult20_g57480 , lerpResult40_g57480 , break46_g57480.y);
				float4 Output_Fetch2D44_g57480 = lerpResult22_g57480;
				float4 break50_g57480 = Output_Fetch2D44_g57480;
				float temp_output_22_0_g57740 = break50_g57480.a;
				float temp_output_22_0_g57742 = temp_output_22_0_g57740;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57744 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57744 = normalize( temp_output_95_0_g57744 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57740 = dot( normalizeResult96_g57744 , ase_worldViewDir );
				float temp_output_76_0_g57740 = ( 1.0 - abs( dotResult74_g57740 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57740 = 1.0;
				#else
				float staticSwitch281_g57740 = ( 1.0 - ( temp_output_76_0_g57740 * temp_output_76_0_g57740 ) );
				#endif
				float lerpResult80_g57740 = lerp( 1.0 , staticSwitch281_g57740 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57740 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57742 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57742 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57740 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57740;
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
Node;AmplifyShaderEditor.CommentaryNode;2920;-4365.652,-4256.548;Inherit;False;331.8823;626.1448;TRANSLUCENCY ASE;7;2922;2923;2924;2925;2926;2927;2928;;0,0,0,1;0;0
Node;AmplifyShaderEditor.StickyNoteNode;2921;-4724.824,-4251.566;Inherit;False;327.8003;382.4998;;;0,0,0,1;_ASETransmissionShadow$$_ASETranslucencyStrength$_ASETranslucencyNormalDistortion$_ASETranslucencyScattering$_ASETranslucencyDirect$_ASETranslucencyAmbient$_ASETranslucencyShadow;0;0
Node;AmplifyShaderEditor.FunctionNode;2931;-4352,-3584;Inherit;False;DESF Core Fabric;1;;57399;033f93dd140fa644f8cd65abcbe86c5d;7,454,2,579,1,571,1,575,1,582,1,586,1,471,0;0;13;FLOAT3;0;FLOAT3;120;FLOAT3;127;FLOAT;121;FLOAT;122;FLOAT;123;FLOAT;504;FLOAT;506;FLOAT3;464;FLOAT3;463;FLOAT3;459;SAMPLERSTATE;623;SAMPLERSTATE;622
Node;AmplifyShaderEditor.FunctionNode;2897;-4352,-3216;Inherit;False;DESF Weather Wind Fabric;131;;57758;8377dc31f489b0a4b82781c845d5d4e7;2,3138,1,3139,0;0;1;FLOAT3;2190
Node;AmplifyShaderEditor.RangedFloatNode;2928;-4336,-3728;Inherit;False;Property;_ASETranslucencyShadow;ASE Translucency Shadow ;129;0;Create;False;1;;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2927;-4336,-3808;Inherit;False;Property;_ASETranslucencyAmbient;ASE Translucency Ambient;128;0;Create;False;1;;0;0;True;0;False;0.8339342;0.8339342;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2926;-4336,-3888;Inherit;False;Property;_ASETranslucencyDirect;ASE Translucency Direct ;127;0;Create;False;1;;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2925;-4336,-3968;Inherit;False;Property;_ASETranslucencyScattering;ASE Translucency Scattering ;126;0;Create;False;1;;0;0;True;0;False;2;2;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2924;-4336,-4048;Inherit;False;Property;_ASETranslucencyNormalDistortion;ASE Translucency Normal Distortion ;125;0;Create;False;1;;0;0;True;0;False;0.2735869;0.2735869;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2923;-4336,-4128;Inherit;False;Property;_ASETranslucencyStrength;ASE Translucency Strength;124;0;Create;False;1;;0;0;True;0;False;1;1;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2922;-4336,-4208;Inherit;False;Property;_ASETransmissionShadow;ASE Transmission Shadow;123;0;Create;False;1;;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2930;-4704,-4064;Inherit;False;Property;_CATEGORY_TRANSLUCENCYASE;CATEGORY_TRANSLUCENCY ASE;122;0;Create;True;0;0;0;True;1;DE_DrawerCategory(TRANSLUCENCY ASE,true,_ASETranslucencyStrength,0,0);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2929;-4704,-3984;Inherit;False;Property;_SPACE_TRANSLUCENCYASE;SPACE_TRANSLUCENCYASE;130;0;Create;True;0;0;0;True;1;DE_DrawerSpace(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2896;-3968,-3664;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2934;-3965.374,-3584;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2936;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2937;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2938;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2939;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2940;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2941;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2942;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2943;-3965.374,-3637.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2935;-3968,-3584;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Fabric/Translucency;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;0;638176366465757416;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638176366490439881;Transmission;1;638176366500443849;  Transmission Shadow;0.5,True,_ASETransmissionShadow;638176366637053838;Translucency;1;638176366509231970;  Translucency Strength;1,True,_ASETranslucencyStrength;638176366670827413;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;638176366690645448;  Scattering;2,True,_ASETranslucencyScattering;638176366720929114;  Direct;0.9,True,_ASETranslucencyScattering;638176366749924483;  Ambient;0.1,True,_ASETranslucencyAmbient;638176366830126894;  Shadow;0.5,True,_ASETranslucencyShadow;638176366875067310;Cast Shadows;1;0;  Use Shadow Threshold;1;638176366585991142;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;True;0
WireConnection;2935;0;2931;0
WireConnection;2935;1;2931;120
WireConnection;2935;9;2931;127
WireConnection;2935;4;2931;121
WireConnection;2935;5;2931;122
WireConnection;2935;6;2931;123
WireConnection;2935;7;2931;504
WireConnection;2935;8;2897;2190
ASEEND*/
//CHKSM=78C05E7A8749262559EA7D40BA74CDEE7120D6EA