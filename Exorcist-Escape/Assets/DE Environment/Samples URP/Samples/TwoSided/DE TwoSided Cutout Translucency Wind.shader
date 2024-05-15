// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/TwoSided/Cutout Translucency Wind"
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
		[DE_DrawerCategory(SURFACE INPUTS FRONT FACE,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTSFRONTFACE("CATEGORY_SURFACE INPUTS FRONT FACE", Float) = 1
		_00Color("Base Color", Color) = (1,1,1,0)
		_00Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_00MaskMap("Mask Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_00MainUVs("00 Main UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_00BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 0
		_00NormalStrength("Normal Strength", Float) = 1
		[Space(10)]_00MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerFloatEnum(Smoothness _Roughness)][Space(10)]_00SmoothnessSource("Smoothness Source", Float) = 1
		_00SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleLeft]_00SmoothnessFresnelEnable("ENABLE FRESNEL", Float) = 0
		_00SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_00SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerFloatEnum(Texture _Vertex Color)][Space(10)]_00OcclusionSourceBaked("Occlusion Source", Float) = 0
		_00OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerCategory(DISPLACEMENT,true,_DisplacementEnable,0,0)]_CATEGORY_DISPLACEMENT("CATEGORY_DISPLACEMENT", Float) = 0
		[DE_DrawerToggleLeft]_DisplacementEnable("ENABLE DISPLACEMENT", Float) = 0
		[DE_DrawerTextureSingleLine]_ParallaxMap("Displacement Map", 2D) = "black" {}
		_DisplacementStrength("Strength", Range( 0 , 1)) = 0
		_DisplacementBlendInversion("Blend Inversion", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_DISPLACEMENT("SPACE_DISPLACEMENT", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTSFRONTFACE("SPACE_SURFACE INPUTS FRONT FACE", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS BACK FACE,true,_02MainTex,0,0)]_CATEGORY_SURFACEINPUTSBACKFACE("CATEGORY_SURFACE INPUTS BACK FACE", Float) = 1
		_02Color("Base Color", Color) = (1,1,1,0)
		_02Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_02MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_02MaskMap("Mask Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_02MainUVs("02 Main UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_02BumpMap("Normal Map", 2D) = "bump" {}
		_02NormalStrength("Normal Strength", Float) = 1
		[Space(10)]_02MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerFloatEnum(Smoothness _Roughness)][Space(10)]_02SmoothnessSource("Smoothness Source", Float) = 1
		_02SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleLeft]_02SmoothnessFresnelEnable("ENABLE FRESNEL", Float) = 0
		_02SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_02SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerFloatEnum(Texture _Vertex Color)][Space(10)]_02OcclusionSourceBaked("Occlusion Source", Float) = 0
		_02OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTSBACKFACE("SPACE_SURFACE INPUTS BACK FACE", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerToggleLeft]_TransmissionEnable("ENABLE TRANSMISSION", Float) = 0
		[DE_DrawerFloatEnum(Color Picker Only_Transmission Mask Map)]_TransmissionSource("Transmission Source", Float) = 1
		[DE_DrawerTextureSingleLine]_TransmissionMaskMap("Transmission Mask Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_TransmissionMaskInverted("Transmission Mask Inverted", Float) = 0
		_TransmissionMaskStrength("Transmission Mask Strength", Range( 0 , 1.5)) = 1.466198
		_TransmissionMaskFeather("Transmission Mask Feather", Range( 0 , 1)) = 1
		[HDR]_TransmissionColor("Transmission Color", Color) = (0.5,0.5,0.5,1)
		_TransmissionStrength("Transmission Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_TRANSMISSION("SPACE_TRANSMISSION", Float) = 0
		[DE_DrawerCategory(TRANSLUCENCY,true,_TranslucencyEnable,0,0)]_CATEGORY_TRANSLUCENCY("CATEGORY_TRANSLUCENCY", Float) = 0
		[DE_DrawerToggleLeft]_TranslucencyEnable("ENABLE TRANSLUCENCY", Float) = 0
		[DE_DrawerFloatEnum(Color Picker Only _Thickness Mask Map)]_TranslucencySource("Translucency Source", Float) = 1
		[DE_DrawerTextureSingleLine]_ThicknessMap("Thickness Mask Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_ThicknessMapInverted("Thickness Mask Inverted", Float) = 0
		_ThicknessStrength("Thickness Mask Strength", Range( 0 , 1.5)) = 1.466198
		_ThicknessFeather("Thickness Mask Feather", Range( 0 , 1)) = 1
		[HDR]_TranslucencyColor("Translucency Color", Color) = (0.5,0.5,0.5,1)
		_TranslucencyStrength("Translucency Strength", Float) = 1
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
		[DE_DrawerFloatEnum(Global _Local)]_WindEnableMode("Enable Wind Mode", Float) = 0
		[DE_DrawerFloatEnum(Leaf _Palm _Grass _Simple _Ivy)]_WindEnableType("Enable Wind Type", Float) = 0
		[Header(WIND GLOBAL)]_WindGlobalIntensity("Wind Intensity", Float) = 1
		_WindGlobalTurbulence("Wind Turbulence", Float) = 0.35
		[Header(WIND LOCAL)]_WindLocalIntensity("Local Wind Intensity", Float) = 1
		_WindLocalTurbulence("Local Wind Turbulence", Float) = 0.35
		_WindLocalPulseFrequency("Local Wind Pulse Frequency", Float) = 0.1
		_WindLocalRandomOffset("Local Random Offset", Float) = 0.2
		_WindLocalDirection("Local Wind Direction", Range( 0 , 360)) = 0
		[DE_DrawerSpace(10)]_SPACE_WIND("SPACE_WIND", Float) = 0


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
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT


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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_02MainTex);
			TEXTURE2D(_00BumpMap);
			SAMPLER(sampler_00BumpMap);
			TEXTURE2D(_02BumpMap);
			TEXTURE2D(_00MaskMap);
			SAMPLER(sampler_00MaskMap);
			TEXTURE2D(_02MaskMap);
			TEXTURE2D(_TransmissionMaskMap);
			TEXTURE2D(_ThicknessMap);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord8.xy = vertexToFrag70_g58222;
				float2 Offset235_g58225 = (_02MainUVs).zw;
				float2 temp_output_41_0_g58225 = ( ( v.texcoord.xy * (_02MainUVs).xy ) + Offset235_g58225 );
				float2 vertexToFrag70_g58225 = temp_output_41_0_g58225;
				o.ase_texcoord8.zw = vertexToFrag70_g58225;
				
				o.ase_color = v.ase_color;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord8.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float3 SIDE01_ALBEDO_RGBA1688_g58206 = (tex2DNode2144_g58206).rgb;
				float2 vertexToFrag70_g58225 = IN.ase_texcoord8.zw;
				float2 temp_output_2160_0_g58206 = vertexToFrag70_g58225;
				float4 tex2DNode2147_g58206 = SAMPLE_TEXTURE2D( _02MainTex, sampler_MainTex, temp_output_2160_0_g58206 );
				float3 SIDE02_ALBEDO_RGBA1779_g58206 = (tex2DNode2147_g58206).rgb;
				float dotResult8_g58209 = dot( WorldNormal , WorldViewDirection );
				float temp_output_1850_0_g58206 = (1.0 + (sign( dotResult8_g58209 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult1357_g58206 = lerp( ( (_00Color).rgb * SIDE01_ALBEDO_RGBA1688_g58206 * _00Brightness ) , ( (_02Color).rgb * SIDE02_ALBEDO_RGBA1779_g58206 * _02Brightness ) , temp_output_1850_0_g58206);
				
				float4 SIDE01_NORMAL_RGB1710_g58206 = SAMPLE_TEXTURE2D( _00BumpMap, sampler_00BumpMap, temp_output_2159_0_g58206 );
				float3 unpack2040_g58206 = UnpackNormalScale( SIDE01_NORMAL_RGB1710_g58206, _00NormalStrength );
				unpack2040_g58206.z = lerp( 1, unpack2040_g58206.z, saturate(_00NormalStrength) );
				float3 temp_output_24_0_g58210 = unpack2040_g58206;
				float temp_output_50_0_g58210 = _DoubleSidedNormalMode;
				float m_switch64_g58210 = temp_output_50_0_g58210;
				float3 m_Flip64_g58210 = float3(-1,-1,-1);
				float3 m_Mirror64_g58210 = float3(1,1,-1);
				float3 m_None64_g58210 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58210 = _NormalModefloat3switch( m_switch64_g58210 , m_Flip64_g58210 , m_Mirror64_g58210 , m_None64_g58210 );
				float3 switchResult58_g58210 = (((ase_vface>0)?(temp_output_24_0_g58210):(( temp_output_24_0_g58210 * local_NormalModefloat3switch64_g58210 ))));
				float4 SIDE02_NORMAL_RGBA1780_g58206 = SAMPLE_TEXTURE2D( _02BumpMap, sampler_00BumpMap, temp_output_2160_0_g58206 );
				float3 unpack2042_g58206 = UnpackNormalScale( SIDE02_NORMAL_RGBA1780_g58206, _02NormalStrength );
				unpack2042_g58206.z = lerp( 1, unpack2042_g58206.z, saturate(_02NormalStrength) );
				float3 temp_output_24_0_g58229 = unpack2042_g58206;
				float temp_output_50_0_g58229 = _DoubleSidedNormalMode;
				float m_switch64_g58229 = temp_output_50_0_g58229;
				float3 m_Flip64_g58229 = float3(-1,-1,-1);
				float3 m_Mirror64_g58229 = float3(1,1,-1);
				float3 m_None64_g58229 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58229 = _NormalModefloat3switch( m_switch64_g58229 , m_Flip64_g58229 , m_Mirror64_g58229 , m_None64_g58229 );
				float3 switchResult58_g58229 = (((ase_vface>0)?(temp_output_24_0_g58229):(( temp_output_24_0_g58229 * local_NormalModefloat3switch64_g58229 ))));
				float3 lerpResult1545_g58206 = lerp( switchResult58_g58210 , switchResult58_g58229 , temp_output_1850_0_g58206);
				
				float4 tex2DNode2146_g58206 = SAMPLE_TEXTURE2D( _00MaskMap, sampler_00MaskMap, temp_output_2159_0_g58206 );
				float SIDE01_MASK_B1720_g58206 = tex2DNode2146_g58206.b;
				float4 tex2DNode2149_g58206 = SAMPLE_TEXTURE2D( _02MaskMap, sampler_00MaskMap, temp_output_2160_0_g58206 );
				float SIDE02_MASK_B1781_g58206 = tex2DNode2149_g58206.b;
				float lerpResult1361_g58206 = lerp( ( _00MetallicStrength * SIDE01_MASK_B1720_g58206 ) , ( _02MetallicStrength * SIDE02_MASK_B1781_g58206 ) , temp_output_1850_0_g58206);
				
				float SIDE01_MASK_G1683_g58206 = tex2DNode2146_g58206.g;
				float lerpResult2244_g58206 = lerp( SIDE01_MASK_G1683_g58206 , ( 1.0 - SIDE01_MASK_G1683_g58206 ) , _00SmoothnessSource);
				float temp_output_2243_0_g58206 = ( lerpResult2244_g58206 * _00SmoothnessStrength );
				float2 appendResult2252_g58206 = (float2(WorldViewDirection.xy));
				float3 appendResult2251_g58206 = (float3(appendResult2252_g58206 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV2249_g58206 = dot( normalize( unpack2040_g58206 ), appendResult2251_g58206 );
				float fresnelNode2249_g58206 = ( 0.0 + ( 1.0 - _00SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2249_g58206 , 0.0001 ), _00SmoothnessFresnelPower ) );
				float lerpResult2248_g58206 = lerp( temp_output_2243_0_g58206 , ( temp_output_2243_0_g58206 - fresnelNode2249_g58206 ) , _00SmoothnessFresnelEnable);
				float SIDE02_MASK_G1782_g58206 = tex2DNode2149_g58206.g;
				float lerpResult2267_g58206 = lerp( SIDE02_MASK_G1782_g58206 , ( 1.0 - SIDE02_MASK_G1782_g58206 ) , _02SmoothnessSource);
				float temp_output_2266_0_g58206 = ( lerpResult2267_g58206 * _02SmoothnessStrength );
				float2 appendResult2275_g58206 = (float2(WorldViewDirection.xy));
				float3 appendResult2274_g58206 = (float3(appendResult2275_g58206 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV2272_g58206 = dot( normalize( unpack2042_g58206 ), appendResult2274_g58206 );
				float fresnelNode2272_g58206 = ( 0.0 + ( 1.0 - _02SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2272_g58206 , 0.0001 ), _02SmoothnessFresnelPower ) );
				float lerpResult2271_g58206 = lerp( temp_output_2266_0_g58206 , ( temp_output_2266_0_g58206 - fresnelNode2272_g58206 ) , _02SmoothnessFresnelEnable);
				float lerpResult1360_g58206 = lerp( saturate( lerpResult2248_g58206 ) , saturate( lerpResult2271_g58206 ) , temp_output_1850_0_g58206);
				
				float SIDE01_MASK_R1691_g58206 = tex2DNode2146_g58206.r;
				float lerpResult2317_g58206 = lerp( 1.0 , SIDE01_MASK_R1691_g58206 , _00OcclusionStrengthAO);
				float lerpResult2316_g58206 = lerp( 1.0 , IN.ase_color.a , _00OcclusionStrengthAO);
				float lerpResult2296_g58206 = lerp( lerpResult2317_g58206 , lerpResult2316_g58206 , _00OcclusionSourceBaked);
				float SIDE02_MASK_R1783_g58206 = tex2DNode2149_g58206.r;
				float lerpResult2319_g58206 = lerp( 1.0 , SIDE02_MASK_R1783_g58206 , _02OcclusionStrengthAO);
				float lerpResult2318_g58206 = lerp( 1.0 , IN.ase_color.a , _02OcclusionStrengthAO);
				float lerpResult2307_g58206 = lerp( lerpResult2319_g58206 , lerpResult2318_g58206 , _02OcclusionSourceBaked);
				float lerpResult1362_g58206 = lerp( saturate( lerpResult2296_g58206 ) , saturate( lerpResult2307_g58206 ) , temp_output_1850_0_g58206);
				
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , WorldViewDirection );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				
				float3 temp_output_249_0_g58219 = (_TransmissionColor).rgb;
				float4 color71_g58219 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float3 temp_output_247_0_g58219 = (color71_g58219).rgb;
				float2 temp_output_101_0_g58219 = temp_output_2159_0_g58206;
				float3 temp_output_162_0_g58219 = saturate( ( (SAMPLE_TEXTURE2D( _TransmissionMaskMap, sampler_MainTex, temp_output_101_0_g58219 )).rgb / max( _TransmissionMaskFeather , 1E-05 ) ) );
				float3 lerpResult172_g58219 = lerp( temp_output_247_0_g58219 , temp_output_162_0_g58219 , _TransmissionMaskStrength);
				float temp_output_165_0_g58219 = ( 0.0 - 1.0 );
				float temp_output_168_0_g58219 = ( temp_output_162_0_g58219.x - 1.0 );
				float lerpResult173_g58219 = lerp( ( temp_output_165_0_g58219 / temp_output_168_0_g58219 ) , ( temp_output_168_0_g58219 / temp_output_165_0_g58219 ) , ( 0.7 + _TransmissionMaskStrength ));
				float3 lerpResult148_g58219 = lerp( ( temp_output_249_0_g58219 * _TransmissionStrength * lerpResult172_g58219 ) , ( temp_output_249_0_g58219 * _TransmissionStrength * saturate( lerpResult173_g58219 ) ) , _TransmissionMaskInverted);
				float3 lerpResult147_g58219 = lerp( ( temp_output_249_0_g58219 * _TransmissionStrength ) , lerpResult148_g58219 , _TransmissionSource);
				float3 lerpResult122_g58219 = lerp( float3( 0,0,0 ) , lerpResult147_g58219 , ( _TransmissionEnable + ( ( _CATEGORY_TRANSLUCENCY + _SPACE_TRANSMISSION ) * 0.0 ) ));
				
				float3 temp_output_248_0_g58219 = (_TranslucencyColor).rgb;
				float3 temp_output_113_0_g58219 = saturate( ( (SAMPLE_TEXTURE2D( _ThicknessMap, sampler_MainTex, temp_output_101_0_g58219 )).rgb / max( _ThicknessFeather , 1E-05 ) ) );
				float3 lerpResult34_g58219 = lerp( temp_output_247_0_g58219 , temp_output_113_0_g58219 , _ThicknessStrength);
				float temp_output_69_0_g58219 = ( 0.0 - 1.0 );
				float temp_output_22_0_g58219 = ( temp_output_113_0_g58219.x - 1.0 );
				float lerpResult66_g58219 = lerp( ( temp_output_69_0_g58219 / temp_output_22_0_g58219 ) , ( temp_output_22_0_g58219 / temp_output_69_0_g58219 ) , ( 0.7 + _ThicknessStrength ));
				float3 lerpResult153_g58219 = lerp( ( temp_output_248_0_g58219 * lerpResult34_g58219 * _TranslucencyStrength ) , ( temp_output_248_0_g58219 * saturate( lerpResult66_g58219 ) * _TranslucencyStrength ) , _ThicknessMapInverted);
				float3 lerpResult150_g58219 = lerp( ( temp_output_248_0_g58219 * _TranslucencyStrength ) , lerpResult153_g58219 , _TranslucencySource);
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 temp_output_88_0_g58219 = ( ( ase_lightAtten * ase_lightColor.rgb ) * max( ase_lightColor.a , 0.0 ) );
				float3 lerpResult123_g58219 = lerp( float3( 0,0,0 ) , ( lerpResult150_g58219 * saturate( temp_output_88_0_g58219 ) ) , ( _TranslucencyEnable + ( ( _SPACE_TRANSLUCENCY + _CATEGORY_TRANSMISSION ) * 0.0 ) ));
				

				float3 BaseColor = lerpResult1357_g58206;
				float3 Normal = lerpResult1545_g58206;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult1361_g58206;
				float Smoothness = lerpResult1360_g58206;
				float Occlusion = lerpResult1362_g58206;
				float Alpha = temp_output_98_0_g58211;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = lerpResult122_g58219;
				float3 Translucency = lerpResult123_g58219;

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord3.xy = vertexToFrag70_g58222;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord3.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				float Alpha = temp_output_98_0_g58211;
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord3.xy = vertexToFrag70_g58222;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord3.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				float Alpha = temp_output_98_0_g58211;
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_02MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.texcoord0.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord4.xy = vertexToFrag70_g58222;
				float2 Offset235_g58225 = (_02MainUVs).zw;
				float2 temp_output_41_0_g58225 = ( ( v.texcoord0.xy * (_02MainUVs).xy ) + Offset235_g58225 );
				float2 vertexToFrag70_g58225 = temp_output_41_0_g58225;
				o.ase_texcoord4.zw = vertexToFrag70_g58225;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord4.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float3 SIDE01_ALBEDO_RGBA1688_g58206 = (tex2DNode2144_g58206).rgb;
				float2 vertexToFrag70_g58225 = IN.ase_texcoord4.zw;
				float2 temp_output_2160_0_g58206 = vertexToFrag70_g58225;
				float4 tex2DNode2147_g58206 = SAMPLE_TEXTURE2D( _02MainTex, sampler_MainTex, temp_output_2160_0_g58206 );
				float3 SIDE02_ALBEDO_RGBA1779_g58206 = (tex2DNode2147_g58206).rgb;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58209 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_1850_0_g58206 = (1.0 + (sign( dotResult8_g58209 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult1357_g58206 = lerp( ( (_00Color).rgb * SIDE01_ALBEDO_RGBA1688_g58206 * _00Brightness ) , ( (_02Color).rgb * SIDE02_ALBEDO_RGBA1779_g58206 * _02Brightness ) , temp_output_1850_0_g58206);
				
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				float3 BaseColor = lerpResult1357_g58206;
				float3 Emission = 0;
				float Alpha = temp_output_98_0_g58211;
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_02MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord2.xy = vertexToFrag70_g58222;
				float2 Offset235_g58225 = (_02MainUVs).zw;
				float2 temp_output_41_0_g58225 = ( ( v.ase_texcoord.xy * (_02MainUVs).xy ) + Offset235_g58225 );
				float2 vertexToFrag70_g58225 = temp_output_41_0_g58225;
				o.ase_texcoord2.zw = vertexToFrag70_g58225;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord2.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float3 SIDE01_ALBEDO_RGBA1688_g58206 = (tex2DNode2144_g58206).rgb;
				float2 vertexToFrag70_g58225 = IN.ase_texcoord2.zw;
				float2 temp_output_2160_0_g58206 = vertexToFrag70_g58225;
				float4 tex2DNode2147_g58206 = SAMPLE_TEXTURE2D( _02MainTex, sampler_MainTex, temp_output_2160_0_g58206 );
				float3 SIDE02_ALBEDO_RGBA1779_g58206 = (tex2DNode2147_g58206).rgb;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58209 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_1850_0_g58206 = (1.0 + (sign( dotResult8_g58209 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult1357_g58206 = lerp( ( (_00Color).rgb * SIDE01_ALBEDO_RGBA1688_g58206 * _00Brightness ) , ( (_02Color).rgb * SIDE02_ALBEDO_RGBA1779_g58206 * _02Brightness ) , temp_output_1850_0_g58206);
				
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				float3 BaseColor = lerpResult1357_g58206;
				float Alpha = temp_output_98_0_g58211;
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
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_00BumpMap);
			SAMPLER(sampler_00BumpMap);
			TEXTURE2D(_02BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord5.xy = vertexToFrag70_g58222;
				float2 Offset235_g58225 = (_02MainUVs).zw;
				float2 temp_output_41_0_g58225 = ( ( v.ase_texcoord.xy * (_02MainUVs).xy ) + Offset235_g58225 );
				float2 vertexToFrag70_g58225 = temp_output_41_0_g58225;
				o.ase_texcoord5.zw = vertexToFrag70_g58225;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
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
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord5.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 SIDE01_NORMAL_RGB1710_g58206 = SAMPLE_TEXTURE2D( _00BumpMap, sampler_00BumpMap, temp_output_2159_0_g58206 );
				float3 unpack2040_g58206 = UnpackNormalScale( SIDE01_NORMAL_RGB1710_g58206, _00NormalStrength );
				unpack2040_g58206.z = lerp( 1, unpack2040_g58206.z, saturate(_00NormalStrength) );
				float3 temp_output_24_0_g58210 = unpack2040_g58206;
				float temp_output_50_0_g58210 = _DoubleSidedNormalMode;
				float m_switch64_g58210 = temp_output_50_0_g58210;
				float3 m_Flip64_g58210 = float3(-1,-1,-1);
				float3 m_Mirror64_g58210 = float3(1,1,-1);
				float3 m_None64_g58210 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58210 = _NormalModefloat3switch( m_switch64_g58210 , m_Flip64_g58210 , m_Mirror64_g58210 , m_None64_g58210 );
				float3 switchResult58_g58210 = (((ase_vface>0)?(temp_output_24_0_g58210):(( temp_output_24_0_g58210 * local_NormalModefloat3switch64_g58210 ))));
				float2 vertexToFrag70_g58225 = IN.ase_texcoord5.zw;
				float2 temp_output_2160_0_g58206 = vertexToFrag70_g58225;
				float4 SIDE02_NORMAL_RGBA1780_g58206 = SAMPLE_TEXTURE2D( _02BumpMap, sampler_00BumpMap, temp_output_2160_0_g58206 );
				float3 unpack2042_g58206 = UnpackNormalScale( SIDE02_NORMAL_RGBA1780_g58206, _02NormalStrength );
				unpack2042_g58206.z = lerp( 1, unpack2042_g58206.z, saturate(_02NormalStrength) );
				float3 temp_output_24_0_g58229 = unpack2042_g58206;
				float temp_output_50_0_g58229 = _DoubleSidedNormalMode;
				float m_switch64_g58229 = temp_output_50_0_g58229;
				float3 m_Flip64_g58229 = float3(-1,-1,-1);
				float3 m_Mirror64_g58229 = float3(1,1,-1);
				float3 m_None64_g58229 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58229 = _NormalModefloat3switch( m_switch64_g58229 , m_Flip64_g58229 , m_Mirror64_g58229 , m_None64_g58229 );
				float3 switchResult58_g58229 = (((ase_vface>0)?(temp_output_24_0_g58229):(( temp_output_24_0_g58229 * local_NormalModefloat3switch64_g58229 ))));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58209 = dot( WorldNormal , ase_worldViewDir );
				float temp_output_1850_0_g58206 = (1.0 + (sign( dotResult8_g58209 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult1545_g58206 = lerp( switchResult58_g58210 , switchResult58_g58229 , temp_output_1850_0_g58206);
				
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 temp_output_95_0_g58215 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				float3 Normal = lerpResult1545_g58206;
				float Alpha = temp_output_98_0_g58211;
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord.xy = vertexToFrag70_g58222;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58215 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58211;
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
			float4 _AlphaRemap;
			float4 _02MainUVs;
			half4 _02Color;
			half4 _TranslucencyColor;
			half4 _00Color;
			half4 _TransmissionColor;
			float4 _00MainUVs;
			half _02OcclusionSourceBaked;
			half _02OcclusionStrengthAO;
			half _00OcclusionSourceBaked;
			half _00OcclusionStrengthAO;
			half _02SmoothnessFresnelEnable;
			half _02SmoothnessStrength;
			half _02SmoothnessFresnelScale;
			float _AlphaRemapMin;
			half _02SmoothnessSource;
			half _00SmoothnessFresnelEnable;
			half _00SmoothnessFresnelPower;
			half _00SmoothnessFresnelScale;
			half _00SmoothnessStrength;
			half _02SmoothnessFresnelPower;
			float _CATEGORY_SURFACEINPUTSBACKFACE;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _00SmoothnessSource;
			half _TransmissionSource;
			half _TransmissionMaskStrength;
			half _TransmissionMaskFeather;
			half _TransmissionStrength;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _TransmissionMaskInverted;
			float _02MetallicStrength;
			half _DoubleSidedNormalMode;
			half _02NormalStrength;
			half _WindEnableType;
			int _Cull;
			float _SPACE_TRANSLUCENCYASE;
			float _CATEGORY_TRANSLUCENCYASE;
			float _ASETransmissionShadow;
			float _ASETranslucencyStrength;
			float _ASETranslucencyNormalDistortion;
			half _WindGlobalIntensity;
			float _ASETranslucencyScattering;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyShadow;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _SPACE_SURFACEINPUTSFRONTFACE;
			float _SPACE_SURFACEINPUTSBACKFACE;
			float _CATEGORY_SURFACEINPUTSFRONTFACE;
			float _ASETranslucencyDirect;
			float _00MetallicStrength;
			half _WindLocalIntensity;
			half _WindLocalRandomOffset;
			half _TranslucencySource;
			half _00NormalStrength;
			half _02Brightness;
			half _00Brightness;
			float _SPACE_DISPLACEMENT;
			float _CATEGORY_DISPLACEMENT;
			half _DisplacementEnable;
			half _WindEnableMode;
			half _DisplacementStrength;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindGlobalTurbulence;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			float _DisplacementBlendInversion;
			half _TranslucencyEnable;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g58203( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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

				float m_switch2439_g58203 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g58203 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float GlobalWindIntensity3173_g58203 = _GlobalWindIntensity;
				float WIND_MODE2462_g58203 = _WindEnableMode;
				float lerpResult3147_g58203 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g58203 ) , _WindLocalIntensity , WIND_MODE2462_g58203);
				float _WIND_STRENGHT2400_g58203 = lerpResult3147_g58203;
				float GlobalWindRandomOffset3174_g58203 = _GlobalWindRandomOffset;
				float lerpResult3149_g58203 = lerp( GlobalWindRandomOffset3174_g58203 , _WindLocalRandomOffset , WIND_MODE2462_g58203);
				float4 transform3073_g58203 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g58203 = (float2(transform3073_g58203.x , transform3073_g58203.z));
				float dotResult2341_g58203 = dot( appendResult2307_g58203 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g58203 = lerp( 0.8 , ( ( lerpResult3149_g58203 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g58203 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g58203 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g58203 );
				float _WIND_TUBULENCE_RANDOM2274_g58203 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g58203 = _GlobalWindPulse;
				float lerpResult3152_g58203 = lerp( GlobalWindPulse3177_g58203 , _WindLocalPulseFrequency , WIND_MODE2462_g58203);
				float _WIND_PULSE2421_g58203 = lerpResult3152_g58203;
				float FUNC_Angle2470_g58203 = ( _WIND_STRENGHT2400_g58203 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 ) - ( VERTEX_POSITION_MATRIX2352_g58203.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g58203 );
				float FUNC_Angle_SinA2424_g58203 = sin( FUNC_Angle2470_g58203 );
				float FUNC_Angle_CosA2362_g58203 = cos( FUNC_Angle2470_g58203 );
				float GlobalWindDirection3175_g58203 = _GlobalWindDirection;
				float lerpResult3150_g58203 = lerp( GlobalWindDirection3175_g58203 , _WindLocalDirection , WIND_MODE2462_g58203);
				float _WindDirection2249_g58203 = lerpResult3150_g58203;
				float2 localDirectionalEquation2249_g58203 = DirectionalEquation( _WindDirection2249_g58203 );
				float2 break2469_g58203 = localDirectionalEquation2249_g58203;
				float _WIND_DIRECTION_X2418_g58203 = break2469_g58203.x;
				float lerpResult2258_g58203 = lerp( break2265_g58203.x , ( ( break2265_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2265_g58203.x * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_X2418_g58203);
				float3 break2340_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float3 break2233_g58203 = VERTEX_POSITION_MATRIX2352_g58203;
				float _WIND_DIRECTION_Y2416_g58203 = break2469_g58203.y;
				float lerpResult2275_g58203 = lerp( break2233_g58203.z , ( ( break2233_g58203.y * FUNC_Angle_SinA2424_g58203 ) + ( break2233_g58203.z * FUNC_Angle_CosA2362_g58203 ) ) , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2235_g58203 = (float3(lerpResult2258_g58203 , ( ( break2340_g58203.y * FUNC_Angle_CosA2362_g58203 ) - ( break2340_g58203.z * FUNC_Angle_SinA2424_g58203 ) ) , lerpResult2275_g58203));
				float3 VERTEX_POSITION2282_g58203 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g58203 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g58203 = VERTEX_POSITION2282_g58203;
				half FUNC_SinFunction2336_g58203 = sin( ( ( _WIND_RANDOM_OFFSET2244_g58203 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g58203 + ( VERTEX_POSITION_MATRIX2352_g58203.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g58203 = _GlobalWindTurbulence;
				float lerpResult3151_g58203 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g58203 ) , _WindLocalTurbulence , WIND_MODE2462_g58203);
				float _WIND_TUBULENCE2442_g58203 = lerpResult3151_g58203;
				float3 appendResult2480_g58203 = (float3(break2518_g58203.x , ( break2518_g58203.y + ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) ) , break2518_g58203.z));
				float3 VERTEX_LEAF2396_g58203 = appendResult2480_g58203;
				float3 m_Leaf2439_g58203 = VERTEX_LEAF2396_g58203;
				float3 VERTEX_PALM2310_g58203 = ( ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) * _WIND_TUBULENCE2442_g58203 ) + VERTEX_POSITION2282_g58203 );
				float3 m_Palm2439_g58203 = VERTEX_PALM2310_g58203;
				float3 break2486_g58203 = VERTEX_POSITION2282_g58203;
				float temp_output_2514_0_g58203 = ( FUNC_SinFunction2336_g58203 * v.ase_color.b * ( FUNC_Angle2470_g58203 + ( _WIND_STRENGHT2400_g58203 / 200.0 ) ) );
				float lerpResult2482_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_X2418_g58203);
				float lerpResult2484_g58203 = lerp( 0.0 , temp_output_2514_0_g58203 , _WIND_DIRECTION_Y2416_g58203);
				float3 appendResult2489_g58203 = (float3(( break2486_g58203.x + lerpResult2482_g58203 ) , break2486_g58203.y , ( break2486_g58203.z + lerpResult2484_g58203 )));
				float3 VERTEX_GRASS2242_g58203 = appendResult2489_g58203;
				float3 m_Grass2439_g58203 = VERTEX_GRASS2242_g58203;
				float3 m_Simple2439_g58203 = VERTEX_POSITION2282_g58203;
				float clampResult2884_g58203 = clamp( ( _WIND_STRENGHT2400_g58203 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g58203 = VERTEX_POSITION2282_g58203;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g58203 = ase_worldPos;
				float temp_output_2690_0_g58203 = ( _WIND_RANDOM_OFFSET2244_g58203 * 25.0 );
				float clampResult2691_g58203 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g58203 = (float2(temp_output_2690_0_g58203 , ( temp_output_2690_0_g58203 / clampResult2691_g58203 )));
				float3 appendResult2706_g58203 = (float3(break2708_g58203.x , ( break2708_g58203.y + cos( ( ( ( break2718_g58203.x + break2718_g58203.y + break2718_g58203.z ) * 2.0 ) + appendResult2694_g58203 + FUNC_Angle2470_g58203 + _WIND_TUBULENCE2442_g58203 ) ) ).x , break2708_g58203.z));
				float3 temp_output_2613_0_g58203 = ( clampResult2884_g58203 * appendResult2706_g58203 );
				float3 VERTEX_IVY997_g58203 = ( ( ( cos( temp_output_2613_0_g58203 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g58203 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g58203 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g58203 = VERTEX_IVY997_g58203;
				float3 localWind_Typefloat3switch2439_g58203 = Wind_Typefloat3switch2439_g58203( m_switch2439_g58203 , m_Leaf2439_g58203 , m_Palm2439_g58203 , m_Grass2439_g58203 , m_Simple2439_g58203 , m_Ivy2439_g58203 );
				float3 lerpResult3142_g58203 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g58203 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g58206 = lerpResult3142_g58203;
				float2 Offset235_g58222 = (_00MainUVs).zw;
				float2 temp_output_41_0_g58222 = ( ( v.ase_texcoord.xy * (_00MainUVs).xy ) + Offset235_g58222 );
				float2 vertexToFrag70_g58222 = temp_output_41_0_g58222;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float3 temp_output_2224_0_g58206 = (SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_ParallaxMap, temp_output_2159_0_g58206, 0.0 )).rgb;
				float3 lerpResult2234_g58206 = lerp( temp_output_2224_0_g58206 , ( 1.0 - temp_output_2224_0_g58206 ) , _DisplacementBlendInversion);
				float3 lerpResult2240_g58206 = lerp( temp_output_1234_0_g58206 , ( v.normalOS * ( lerpResult2234_g58206 * _DisplacementStrength ) ) , ( _DisplacementEnable + ( ( _CATEGORY_DISPLACEMENT + _SPACE_DISPLACEMENT ) * 0.0 ) ));
				
				o.ase_texcoord.xy = vertexToFrag70_g58222;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( temp_output_1234_0_g58206 + lerpResult2240_g58206 );

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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 vertexToFrag70_g58222 = IN.ase_texcoord.xy;
				float2 temp_output_2159_0_g58206 = vertexToFrag70_g58222;
				float4 tex2DNode2144_g58206 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, temp_output_2159_0_g58206 );
				float temp_output_22_0_g58211 = tex2DNode2144_g58206.a;
				float temp_output_22_0_g58213 = temp_output_22_0_g58211;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58215 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58215 = normalize( temp_output_95_0_g58215 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58211 = dot( normalizeResult96_g58215 , ase_worldViewDir );
				float temp_output_76_0_g58211 = ( 1.0 - abs( dotResult74_g58211 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58211 = 1.0;
				#else
				float staticSwitch281_g58211 = ( 1.0 - ( temp_output_76_0_g58211 * temp_output_76_0_g58211 ) );
				#endif
				float lerpResult80_g58211 = lerp( 1.0 , staticSwitch281_g58211 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58211 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58213 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58213 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58211 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58211;
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
Node;AmplifyShaderEditor.CommentaryNode;2907;-4404.999,-4253.758;Inherit;False;338.382;585.8447;TRANSLUCENCY ASE;7;2909;2910;2911;2912;2913;2914;2915;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2880;-4736,-3584;Inherit;False;DESF Weather Wind;104;;58203;b135a554f7e4d0b41bba02c61b34ae74;5,3133,1,2371,1,2432,1,3138,0,3139,0;0;1;FLOAT3;2190
Node;AmplifyShaderEditor.StickyNoteNode;2908;-4764.17,-4248.776;Inherit;False;334.3999;352.0999;;;0,0,0,1;_ASETransmissionShadow$$_ASETranslucencyStrength$_ASETranslucencyNormalDistortion$_ASETranslucencyScattering$_ASETranslucencyDirect$_ASETranslucencyAmbient$_ASETranslucencyShadow;0;0
Node;AmplifyShaderEditor.FunctionNode;2920;-4480,-3584;Inherit;False;DESF Core TwoSided;1;;58206;397023e1505046f4fa62c13c8dd71e62;4,442,2,1853,0,2210,1,2213,1;3;1234;FLOAT3;0,0,0;False;1582;FLOAT3;0,0,0;False;1583;FLOAT3;0,0,0;False;17;FLOAT3;38;FLOAT3;35;FLOAT3;1585;FLOAT;37;FLOAT;33;FLOAT;34;FLOAT;441;FLOAT;46;FLOAT;814;FLOAT;1935;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;SAMPLERSTATE;2205;SAMPLERSTATE;1977;SAMPLERSTATE;1983
Node;AmplifyShaderEditor.RangedFloatNode;2915;-4368,-3744;Inherit;False;Property;_ASETranslucencyShadow;ASE Translucency Shadow ;102;0;Create;False;1;;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2914;-4368,-3824;Inherit;False;Property;_ASETranslucencyAmbient;ASE Translucency Ambient;101;0;Create;False;1;;0;0;True;0;False;0.8339342;0.8339342;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2913;-4368,-3904;Inherit;False;Property;_ASETranslucencyDirect;ASE Translucency Direct ;100;0;Create;False;1;;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2912;-4368,-3984;Inherit;False;Property;_ASETranslucencyScattering;ASE Translucency Scattering ;99;0;Create;False;1;;0;0;True;0;False;2;2;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2911;-4368,-4064;Inherit;False;Property;_ASETranslucencyNormalDistortion;ASE Translucency Normal Distortion ;98;0;Create;False;1;;0;0;True;0;False;0.2735869;0.2735869;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2910;-4368,-4144;Inherit;False;Property;_ASETranslucencyStrength;ASE Translucency Strength;97;0;Create;False;1;;0;0;True;0;False;1;1;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2909;-4368,-4224;Inherit;False;Property;_ASETransmissionShadow;ASE Transmission Shadow;96;0;Create;False;1;;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2916;-4736,-4064;Inherit;False;Property;_CATEGORY_TRANSLUCENCYASE;CATEGORY_TRANSLUCENCY ASE;95;0;Create;True;0;0;0;True;1;DE_DrawerCategory(TRANSLUCENCY ASE,true,_ASETranslucencyStrength,0,0);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2917;-4736,-3984;Inherit;False;Property;_SPACE_TRANSLUCENCYASE;SPACE_TRANSLUCENCYASE;103;0;Create;True;0;0;0;True;1;DE_DrawerSpace(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2893;-3968,-3664;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2921;-3962.846,-3584;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2923;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2924;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2925;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2926;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2927;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2928;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2929;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2930;-3962.846,-3639.561;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2922;-3968,-3584;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/TwoSided/Cutout Translucency Wind;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638177019473167118;Transmission;1;638177019478361624;  Transmission Shadow;0.5,True,_ASETransmissionShadow;638177019587124032;Translucency;1;638177019497891126;  Translucency Strength;1,True,_ASETranslucencyStrength;638177019609554943;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;638177019631633919;  Scattering;2,True,_ASETranslucencyScattering;638177019655343865;  Direct;0.9,True,_ASETranslucencyScattering;638177019687688448;  Ambient;0.1,True,_ASETranslucencyAmbient;638177019712293647;  Shadow;0.5,True,_ASETranslucencyShadow;638177019737433530;Cast Shadows;1;0;  Use Shadow Threshold;1;638177019768157686;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;True;0
WireConnection;2920;1234;2880;2190
WireConnection;2922;0;2920;38
WireConnection;2922;1;2920;35
WireConnection;2922;3;2920;37
WireConnection;2922;4;2920;33
WireConnection;2922;5;2920;34
WireConnection;2922;6;2920;46
WireConnection;2922;7;2920;814
WireConnection;2922;16;2920;1935
WireConnection;2922;14;2920;656
WireConnection;2922;15;2920;657
WireConnection;2922;8;2920;1235
ASEEND*/
//CHKSM=3D059E99CECF4B75FF7912B9A06A970BECC0E1DF