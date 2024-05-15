// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Portal/LatLong"
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
		_PortalOpacityLatLong("Opacity LatLong", Range( 0 , 1)) = 0.5
		[DE_DrawerCategory(DISTANCE FADE,true,_DistanceFadeEnable,0,0)]_CATEGORY_DISTANCEFADE("CATEGORY_DISTANCEFADE", Float) = 1
		[DE_DrawerToggleLeft]_DistanceFadeEnable("ENABLE FADE", Float) = 0
		[DE_DrawerFloatEnum(FadeIn _FadeOut)]_DistanceFadeMode("Distance Fade Mode", Float) = 0
		_DistanceFadeRange("Distance Fade Range", Range( 2 , 500)) = 75
		[DE_DrawerSpace(10)]_SPACE_DISTANCEFADE("SPACE_DISTANCEFADE", Float) = 0
		[DE_DrawerCategory(COLOR FRONT FACE,true,_PortalEmissiveFrontFaceColor,0,0)]_CATEGORY_EMISSIONCOLORFRONTFACE("CATEGORY_EMISSIONCOLORFRONTFACE", Float) = 0
		[DE_DrawerToggleLeft]_EmissiveDoubleSidedEnable("ENABLE EMISSION", Float) = 0
		[DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
		[HDR][Header(FRONT FACE)][Space(10)]_PortalEmissiveFrontFaceColor("Emissive Color Front Face", Color) = (0,0,0,0)
		_PortalEmissiveFrontFaceIntensity("Emissive Intensity", Float) = 1
		[HDR][Header(FRONT FACE RIM)][Space(10)]_PortalEmissiveFrontFaceRimColor("Emissive Rim Color Front Face", Color) = (0,0,0,0)
		_PortalEmissiveFrontFaceRimPower("Emissive Rim Power", Float) = 0.55
		_PortalEmissiveFrontFaceRimIntensity("Emissive Rim Intensity", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_EMISSIONCOLORFRONTFACE("SPACE_EMISSIONCOLORFRONTFACE", Float) = 0
		[DE_DrawerCategory(COLOR BACK FACE,true,_PortalEmissiveBackFaceColor,0,0)]_CATEGORY_EMISSIONCOLORBACKFACE("CATEGORY_EMISSIONCOLORBACKFACE", Float) = 0
		[HDR][Header(BACK FACE)]_PortalEmissiveBackFaceColor("Emissive Color Back Face", Color) = (0,0,0,0)
		_PortalEmissiveBackFaceIntensity("Emissive Intensity", Float) = 1
		[HDR][Header(BACK FACE RIM)][Space(10)]_PortalEmissiveBackFaceRimColor("Emissive Color Rim Back Face", Color) = (0,0,0,0)
		_PortalEmissiveBackRimPower("Emissive Rim Power", Float) = 0.55
		_PortalEmissiveBackFaceRimIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_EMISSIONCOLORBACKFACE("SPACE_EMISSIONCOLORBACKFACE", Float) = 0
		[DE_DrawerCategory(EMISSION MAP,true,_EmissiveColorMap,0,0)]_CATEGORY_EMISSIONMAP("CATEGORY_EMISSION MAP", Float) = 0
		[HDR][DE_DrawerTextureSingleLine]_EmissiveColorMap("Emissive Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_PortalUVRotationUVs("Portal UV Rotation", Vector) = (1,1,0,0)
		_PortalUVRotationAnchorX("UV Anchor X", Float) = 0
		_PortalUVRotationAnchorXMax("UV Anchor X Max", Float) = 1
		_PortalUVRotationAnchorY("UV Anchor Y", Float) = 0
		_PortalUVRotationAnchorYMax("UV Anchor Y Max", Float) = 1
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		_PortalNormalStrength("Normal Strength", Float) = 1
		[DE_DrawerToggleLeft][Space(10)]_PortalUVRotationEnable("ENABLE ROTATION", Float) = 0
		_PortalUVRotationSpeed("Portal Rotation Speed", Float) = 50
		[DE_DrawerToggleLeft][Space(10)]_PortalUVTwirlEnable("ENABLE TWIRL", Float) = 0
		_PortalUVTwirlWarpStrength("Portal Twirl Warp Strength", Float) = 25
		_PortalUVTwirlSpeed("Portal Twirl Speed", Float) = 0.5
		[DE_DrawerToggleLeft][Space(10)]_PortalUVOrbitEnable("ENABLE ORBIT", Float) = 0
		_PortalUVOrbitSpeed("Portal Orbit Speed", Float) = 30
		_PortalUVOrbitOffset("Portal Orbit Offset", Float) = 0.3
		[DE_DrawerToggleLeft][Space(10)]_PortalUVRadialShearEnable("ENABLE RADIAL SHEAR", Float) = 0
		_PortalUVRadialShearStrength("Portal Radial Shear Strength", Float) = 10
		_PortalUVRadialShearSpeedX("Portal Radial Shear Speed X", Float) = 0
		_PortalUVRadialShearSpeedY("Portal Radial Shear Speed Y", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_EMISSIONMAP("SPACE_EMISSION MAP", Float) = 0
		[DE_DrawerCategory(MASK,true,_PortalMaskEnable,0,0)]_CATEGORY_MASK("CATEGORY_MASK", Float) = 0
		[HDR][DE_DrawerTextureSingleLine]_EmissiveMaskMap("Emissive Mask Map", 2D) = "black" {}
		[DE_DrawerTilingOffset]_EmissiveMaskMapUVs("Emissive Mask Map UVs", Vector) = (1,1,0,0)
		[DE_DrawerToggleLeft][Space(10)]_PortalMaskEnable("ENABLE MASK", Float) = 1
		_EmissiveMaskPower("Mask Power", Float) = 0.5
		_EmissiveMaskContrastMin("Mask Contrast Min", Float) = -0.02
		_EmissiveMaskContrastMax("Mask Contrast Max", Float) = 0.5
		[DE_DrawerToggleLeft][Space(10)]_PortalMaskLatLongEnable("ENABLE MASK LATLONG TEXTURE", Float) = 1
		_EmissiveMaskRTPower("Mask Power", Float) = 0.5
		_EmissiveMaskRTContrastMin("Mask Contrast Min", Float) = -0.02
		_EmissiveMaskContrastRTMax("Mask Contrast Max", Float) = 0.5
		[DE_DrawerSpace(10)]_SPACE_MASK("SPACE_MASK", Float) = 0
		[DE_DrawerCategory(LATLONG TEXTURE,true,_LatLongMap,0,0)]_CATEGORY_LATLONGTEXTURE("CATEGORY_LATLONG TEXTURE", Float) = 1
		[DE_DrawerToggleLeft]_LatLongTextureEnable("ENABLE LATLONG TEXTURE", Float) = 1
		[HDR][NoScaleOffset][DE_DrawerTextureSingleLine]_LatLongMap("LatLong Map", 2D) = "white" {}
		_LatLongExposure("Exposure", Range( 0 , 4)) = 1
		[DE_DrawerSpace(10)]_SPACE_LATLONGTEXTURE("SPACE_LATLONGTEXTURE", Float) = 0


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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag70_g58603;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = lerpResult9_g58587;
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

				float3 normalizedWorldNormal = normalize( WorldNormal );
				float3 temp_output_194_0_g58611 = reflect( WorldViewDirection , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord8.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord8.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1309_0_g58560 = ( temp_output_1394_0_g58560 * ( _LatLongExposure + ( ( _CATEGORY_LATLONGTEXTURE + _SPACE_LATLONGTEXTURE ) * 0.0 ) ) );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord8.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1304_g58560 = lerp( temp_output_1309_0_g58560 , float3( 0,0,0 ) , EmissionMaskSample1112_g58560);
				float3 lerpResult1310_g58560 = lerp( temp_output_1309_0_g58560 , lerpResult1304_g58560 , _PortalMaskLatLongEnable);
				float3 LatLongSample1354_g58560 = lerpResult1310_g58560;
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1356_g58560 = lerp( float3( 0,0,0 ) , LatLongSample1354_g58560 , SampleLatLongEnable1349_g58560);
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord9.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float3 lerpResult1355_g58560 = lerp( float3( 0,0,0 ) , lerpResult1356_g58560 , temp_output_16_0_g58560);
				
				float3 _Vector2 = float3(0,0,0);
				float3 unpack988_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_523_0_g58560 ), _PortalNormalStrength );
				unpack988_g58560.z = lerp( 1, unpack988_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEROTATION996_g58560 = _PortalUVRotationEnable;
				float3 lerpResult1006_g58560 = lerp( float3(0,0,1) , BlendNormal( float3(0,0,1) , unpack988_g58560 ) , ENABLEROTATION996_g58560);
				float3 unpack989_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_1251_47_g58560 ), _PortalNormalStrength );
				unpack989_g58560.z = lerp( 1, unpack989_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLETWIRL997_g58560 = _PortalUVTwirlEnable;
				float3 lerpResult1017_g58560 = lerp( lerpResult1006_g58560 , BlendNormal( lerpResult1006_g58560 , unpack989_g58560 ) , ENABLETWIRL997_g58560);
				float3 unpack991_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_580_0_g58560 ), _PortalNormalStrength );
				unpack991_g58560.z = lerp( 1, unpack991_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEORBIT998_g58560 = _PortalUVOrbitEnable;
				float3 lerpResult1026_g58560 = lerp( lerpResult1017_g58560 , BlendNormal( lerpResult1017_g58560 , unpack991_g58560 ) , ENABLEORBIT998_g58560);
				float3 unpack993_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, Out614_g58560 ), _PortalNormalStrength );
				unpack993_g58560.z = lerp( 1, unpack993_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLERADIALSHEAR999_g58560 = _PortalUVRadialShearEnable;
				float3 lerpResult1029_g58560 = lerp( lerpResult1026_g58560 , BlendNormal( lerpResult1026_g58560 , unpack993_g58560 ) , ENABLERADIALSHEAR999_g58560);
				float temp_output_461_0_g58560 = ( _EmissiveDoubleSidedEnable + ( ( _CATEGORY_EMISSIONCOLORFRONTFACE + _SPACE_EMISSIONCOLORFRONTFACE + _CATEGORY_EMISSIONCOLORBACKFACE + _SPACE_EMISSIONCOLORBACKFACE ) * 0.0 ) );
				float3 lerpResult1037_g58560 = lerp( _Vector2 , lerpResult1029_g58560 , temp_output_461_0_g58560);
				
				float3 lerpResult1347_g58560 = lerp( lerpResult455_g58560 , ( lerpResult455_g58560 + LatLongSample1354_g58560 ) , _LatLongTextureEnable);
				float3 temp_output_19_0_g58564 = _PortalEmissiveFrontFaceColor.rgb;
				float temp_output_21_0_g58564 = ( _PortalEmissiveFrontFaceIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g58564 = ( temp_output_19_0_g58564 * temp_output_21_0_g58564 );
				float3 temp_output_19_0_g58566 = _PortalEmissiveFrontFaceRimColor.rgb;
				float temp_output_21_0_g58566 = _PortalEmissiveFrontFaceRimIntensity;
				float3 temp_output_26_0_g58566 = ( temp_output_19_0_g58566 * temp_output_21_0_g58566 );
				float dotResult4_g58589 = dot( WorldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float temp_output_1092_0_g58560 = dotResult4_g58589;
				float3 lerpResult689_g58560 = lerp( temp_output_26_0_g58564 , temp_output_26_0_g58566 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveFrontFaceRimPower ) ));
				float3 temp_output_19_0_g58585 = _PortalEmissiveBackFaceColor.rgb;
				float temp_output_21_0_g58585 = _PortalEmissiveBackFaceIntensity;
				float3 temp_output_26_0_g58585 = ( temp_output_19_0_g58585 * temp_output_21_0_g58585 );
				float3 temp_output_19_0_g58568 = _PortalEmissiveBackFaceRimColor.rgb;
				float temp_output_21_0_g58568 = _PortalEmissiveBackFaceRimIntensity;
				float3 temp_output_26_0_g58568 = ( temp_output_19_0_g58568 * temp_output_21_0_g58568 );
				float3 lerpResult747_g58560 = lerp( temp_output_26_0_g58585 , temp_output_26_0_g58568 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveBackRimPower ) ));
				float dotResult8_g58592 = dot( WorldNormal , WorldViewDirection );
				float3 lerpResult360_g58560 = lerp( lerpResult689_g58560 , lerpResult747_g58560 , (1.0 + (sign( dotResult8_g58592 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0)));
				float3 EmissiveColor459_g58560 = lerpResult360_g58560;
				float3 lerpResult466_g58560 = lerp( temp_output_416_0_g58560 , ( lerpResult1347_g58560 * EmissiveColor459_g58560 ) , temp_output_461_0_g58560);
				float3 lerpResult22_g58560 = lerp( temp_output_416_0_g58560 , lerpResult466_g58560 , temp_output_16_0_g58560);
				
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , WorldViewDirection );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float3 BaseColor = lerpResult1355_g58560;
				float3 Normal = lerpResult1037_g58560;
				float3 Emission = lerpResult22_g58560;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.xy = vertexToFrag70_g58603;
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord4.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord4.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord4.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord5.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.xy = vertexToFrag70_g58603;
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord4.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord4.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord4.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord5.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord4.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.texcoord0.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.texcoord0.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord6.xy = vertexToFrag70_g58603;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				
				o.ase_texcoord5.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord6.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord5.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord5.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1309_0_g58560 = ( temp_output_1394_0_g58560 * ( _LatLongExposure + ( ( _CATEGORY_LATLONGTEXTURE + _SPACE_LATLONGTEXTURE ) * 0.0 ) ) );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord5.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1304_g58560 = lerp( temp_output_1309_0_g58560 , float3( 0,0,0 ) , EmissionMaskSample1112_g58560);
				float3 lerpResult1310_g58560 = lerp( temp_output_1309_0_g58560 , lerpResult1304_g58560 , _PortalMaskLatLongEnable);
				float3 LatLongSample1354_g58560 = lerpResult1310_g58560;
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1356_g58560 = lerp( float3( 0,0,0 ) , LatLongSample1354_g58560 , SampleLatLongEnable1349_g58560);
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord6.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 screenPos = IN.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float3 lerpResult1355_g58560 = lerp( float3( 0,0,0 ) , lerpResult1356_g58560 , temp_output_16_0_g58560);
				
				float3 lerpResult1347_g58560 = lerp( lerpResult455_g58560 , ( lerpResult455_g58560 + LatLongSample1354_g58560 ) , _LatLongTextureEnable);
				float3 temp_output_19_0_g58564 = _PortalEmissiveFrontFaceColor.rgb;
				float temp_output_21_0_g58564 = ( _PortalEmissiveFrontFaceIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g58564 = ( temp_output_19_0_g58564 * temp_output_21_0_g58564 );
				float3 temp_output_19_0_g58566 = _PortalEmissiveFrontFaceRimColor.rgb;
				float temp_output_21_0_g58566 = _PortalEmissiveFrontFaceRimIntensity;
				float3 temp_output_26_0_g58566 = ( temp_output_19_0_g58566 * temp_output_21_0_g58566 );
				float dotResult4_g58589 = dot( ase_worldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float temp_output_1092_0_g58560 = dotResult4_g58589;
				float3 lerpResult689_g58560 = lerp( temp_output_26_0_g58564 , temp_output_26_0_g58566 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveFrontFaceRimPower ) ));
				float3 temp_output_19_0_g58585 = _PortalEmissiveBackFaceColor.rgb;
				float temp_output_21_0_g58585 = _PortalEmissiveBackFaceIntensity;
				float3 temp_output_26_0_g58585 = ( temp_output_19_0_g58585 * temp_output_21_0_g58585 );
				float3 temp_output_19_0_g58568 = _PortalEmissiveBackFaceRimColor.rgb;
				float temp_output_21_0_g58568 = _PortalEmissiveBackFaceRimIntensity;
				float3 temp_output_26_0_g58568 = ( temp_output_19_0_g58568 * temp_output_21_0_g58568 );
				float3 lerpResult747_g58560 = lerp( temp_output_26_0_g58585 , temp_output_26_0_g58568 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveBackRimPower ) ));
				float dotResult8_g58592 = dot( ase_worldNormal , ase_worldViewDir );
				float3 lerpResult360_g58560 = lerp( lerpResult689_g58560 , lerpResult747_g58560 , (1.0 + (sign( dotResult8_g58592 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0)));
				float3 EmissiveColor459_g58560 = lerpResult360_g58560;
				float temp_output_461_0_g58560 = ( _EmissiveDoubleSidedEnable + ( ( _CATEGORY_EMISSIONCOLORFRONTFACE + _SPACE_EMISSIONCOLORFRONTFACE + _CATEGORY_EMISSIONCOLORBACKFACE + _SPACE_EMISSIONCOLORBACKFACE ) * 0.0 ) );
				float3 lerpResult466_g58560 = lerp( temp_output_416_0_g58560 , ( lerpResult1347_g58560 * EmissiveColor459_g58560 ) , temp_output_461_0_g58560);
				float3 lerpResult22_g58560 = lerp( temp_output_416_0_g58560 , lerpResult466_g58560 , temp_output_16_0_g58560);
				
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float3 BaseColor = lerpResult1355_g58560;
				float3 Emission = lerpResult22_g58560;
				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord2.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord3.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.xy = vertexToFrag70_g58603;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord4.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord3.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord3.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1309_0_g58560 = ( temp_output_1394_0_g58560 * ( _LatLongExposure + ( ( _CATEGORY_LATLONGTEXTURE + _SPACE_LATLONGTEXTURE ) * 0.0 ) ) );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord3.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1304_g58560 = lerp( temp_output_1309_0_g58560 , float3( 0,0,0 ) , EmissionMaskSample1112_g58560);
				float3 lerpResult1310_g58560 = lerp( temp_output_1309_0_g58560 , lerpResult1304_g58560 , _PortalMaskLatLongEnable);
				float3 LatLongSample1354_g58560 = lerpResult1310_g58560;
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1356_g58560 = lerp( float3( 0,0,0 ) , LatLongSample1354_g58560 , SampleLatLongEnable1349_g58560);
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord4.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float3 lerpResult1355_g58560 = lerp( float3( 0,0,0 ) , lerpResult1356_g58560 , temp_output_16_0_g58560);
				
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float3 BaseColor = lerpResult1355_g58560;
				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.xy = vertexToFrag70_g58603;
				
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord6.xy = vertexToFrag70_g58606;
				
				o.ase_texcoord5.zw = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;
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

				float3 _Vector2 = float3(0,0,0);
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord5.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 unpack988_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_523_0_g58560 ), _PortalNormalStrength );
				unpack988_g58560.z = lerp( 1, unpack988_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEROTATION996_g58560 = _PortalUVRotationEnable;
				float3 lerpResult1006_g58560 = lerp( float3(0,0,1) , BlendNormal( float3(0,0,1) , unpack988_g58560 ) , ENABLEROTATION996_g58560);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 unpack989_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_1251_47_g58560 ), _PortalNormalStrength );
				unpack989_g58560.z = lerp( 1, unpack989_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLETWIRL997_g58560 = _PortalUVTwirlEnable;
				float3 lerpResult1017_g58560 = lerp( lerpResult1006_g58560 , BlendNormal( lerpResult1006_g58560 , unpack989_g58560 ) , ENABLETWIRL997_g58560);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 unpack991_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_580_0_g58560 ), _PortalNormalStrength );
				unpack991_g58560.z = lerp( 1, unpack991_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEORBIT998_g58560 = _PortalUVOrbitEnable;
				float3 lerpResult1026_g58560 = lerp( lerpResult1017_g58560 , BlendNormal( lerpResult1017_g58560 , unpack991_g58560 ) , ENABLEORBIT998_g58560);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 unpack993_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, Out614_g58560 ), _PortalNormalStrength );
				unpack993_g58560.z = lerp( 1, unpack993_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLERADIALSHEAR999_g58560 = _PortalUVRadialShearEnable;
				float3 lerpResult1029_g58560 = lerp( lerpResult1026_g58560 , BlendNormal( lerpResult1026_g58560 , unpack993_g58560 ) , ENABLERADIALSHEAR999_g58560);
				float temp_output_461_0_g58560 = ( _EmissiveDoubleSidedEnable + ( ( _CATEGORY_EMISSIONCOLORFRONTFACE + _SPACE_EMISSIONCOLORFRONTFACE + _CATEGORY_EMISSIONCOLORBACKFACE + _SPACE_EMISSIONCOLORBACKFACE ) * 0.0 ) );
				float3 lerpResult1037_g58560 = lerp( _Vector2 , lerpResult1029_g58560 , temp_output_461_0_g58560);
				
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord5.zw );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord5.zw );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 temp_cast_5 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_6 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord6.xy;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_5 , temp_cast_6 , temp_output_496_0_g58560);
				float3 temp_cast_7 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_7 ) );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_8 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_9 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_8 , temp_cast_9 , temp_output_496_0_g58560);
				float3 temp_cast_10 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_10 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float3 Normal = lerpResult1037_g58560;
				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag70_g58603;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;
				v.tangentOS = v.tangentOS;

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

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
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

				float3 normalizedWorldNormal = normalize( WorldNormal );
				float3 temp_output_194_0_g58611 = reflect( WorldViewDirection , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord8.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord8.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1309_0_g58560 = ( temp_output_1394_0_g58560 * ( _LatLongExposure + ( ( _CATEGORY_LATLONGTEXTURE + _SPACE_LATLONGTEXTURE ) * 0.0 ) ) );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord8.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1304_g58560 = lerp( temp_output_1309_0_g58560 , float3( 0,0,0 ) , EmissionMaskSample1112_g58560);
				float3 lerpResult1310_g58560 = lerp( temp_output_1309_0_g58560 , lerpResult1304_g58560 , _PortalMaskLatLongEnable);
				float3 LatLongSample1354_g58560 = lerpResult1310_g58560;
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1356_g58560 = lerp( float3( 0,0,0 ) , LatLongSample1354_g58560 , SampleLatLongEnable1349_g58560);
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord9.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( WorldPosition, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , WorldPosition ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float3 lerpResult1355_g58560 = lerp( float3( 0,0,0 ) , lerpResult1356_g58560 , temp_output_16_0_g58560);
				
				float3 _Vector2 = float3(0,0,0);
				float3 unpack988_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_523_0_g58560 ), _PortalNormalStrength );
				unpack988_g58560.z = lerp( 1, unpack988_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEROTATION996_g58560 = _PortalUVRotationEnable;
				float3 lerpResult1006_g58560 = lerp( float3(0,0,1) , BlendNormal( float3(0,0,1) , unpack988_g58560 ) , ENABLEROTATION996_g58560);
				float3 unpack989_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_1251_47_g58560 ), _PortalNormalStrength );
				unpack989_g58560.z = lerp( 1, unpack989_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLETWIRL997_g58560 = _PortalUVTwirlEnable;
				float3 lerpResult1017_g58560 = lerp( lerpResult1006_g58560 , BlendNormal( lerpResult1006_g58560 , unpack989_g58560 ) , ENABLETWIRL997_g58560);
				float3 unpack991_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, temp_output_580_0_g58560 ), _PortalNormalStrength );
				unpack991_g58560.z = lerp( 1, unpack991_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLEORBIT998_g58560 = _PortalUVOrbitEnable;
				float3 lerpResult1026_g58560 = lerp( lerpResult1017_g58560 , BlendNormal( lerpResult1017_g58560 , unpack991_g58560 ) , ENABLEORBIT998_g58560);
				float3 unpack993_g58560 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, Out614_g58560 ), _PortalNormalStrength );
				unpack993_g58560.z = lerp( 1, unpack993_g58560.z, saturate(_PortalNormalStrength) );
				float ENABLERADIALSHEAR999_g58560 = _PortalUVRadialShearEnable;
				float3 lerpResult1029_g58560 = lerp( lerpResult1026_g58560 , BlendNormal( lerpResult1026_g58560 , unpack993_g58560 ) , ENABLERADIALSHEAR999_g58560);
				float temp_output_461_0_g58560 = ( _EmissiveDoubleSidedEnable + ( ( _CATEGORY_EMISSIONCOLORFRONTFACE + _SPACE_EMISSIONCOLORFRONTFACE + _CATEGORY_EMISSIONCOLORBACKFACE + _SPACE_EMISSIONCOLORBACKFACE ) * 0.0 ) );
				float3 lerpResult1037_g58560 = lerp( _Vector2 , lerpResult1029_g58560 , temp_output_461_0_g58560);
				
				float3 lerpResult1347_g58560 = lerp( lerpResult455_g58560 , ( lerpResult455_g58560 + LatLongSample1354_g58560 ) , _LatLongTextureEnable);
				float3 temp_output_19_0_g58564 = _PortalEmissiveFrontFaceColor.rgb;
				float temp_output_21_0_g58564 = ( _PortalEmissiveFrontFaceIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g58564 = ( temp_output_19_0_g58564 * temp_output_21_0_g58564 );
				float3 temp_output_19_0_g58566 = _PortalEmissiveFrontFaceRimColor.rgb;
				float temp_output_21_0_g58566 = _PortalEmissiveFrontFaceRimIntensity;
				float3 temp_output_26_0_g58566 = ( temp_output_19_0_g58566 * temp_output_21_0_g58566 );
				float dotResult4_g58589 = dot( WorldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float temp_output_1092_0_g58560 = dotResult4_g58589;
				float3 lerpResult689_g58560 = lerp( temp_output_26_0_g58564 , temp_output_26_0_g58566 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveFrontFaceRimPower ) ));
				float3 temp_output_19_0_g58585 = _PortalEmissiveBackFaceColor.rgb;
				float temp_output_21_0_g58585 = _PortalEmissiveBackFaceIntensity;
				float3 temp_output_26_0_g58585 = ( temp_output_19_0_g58585 * temp_output_21_0_g58585 );
				float3 temp_output_19_0_g58568 = _PortalEmissiveBackFaceRimColor.rgb;
				float temp_output_21_0_g58568 = _PortalEmissiveBackFaceRimIntensity;
				float3 temp_output_26_0_g58568 = ( temp_output_19_0_g58568 * temp_output_21_0_g58568 );
				float3 lerpResult747_g58560 = lerp( temp_output_26_0_g58585 , temp_output_26_0_g58568 , pow( ( 1.0 - saturate( temp_output_1092_0_g58560 ) ) , ( 1.5 - _PortalEmissiveBackRimPower ) ));
				float dotResult8_g58592 = dot( WorldNormal , WorldViewDirection );
				float3 lerpResult360_g58560 = lerp( lerpResult689_g58560 , lerpResult747_g58560 , (1.0 + (sign( dotResult8_g58592 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0)));
				float3 EmissiveColor459_g58560 = lerpResult360_g58560;
				float3 lerpResult466_g58560 = lerp( temp_output_416_0_g58560 , ( lerpResult1347_g58560 * EmissiveColor459_g58560 ) , temp_output_461_0_g58560);
				float3 lerpResult22_g58560 = lerp( temp_output_416_0_g58560 , lerpResult466_g58560 , temp_output_16_0_g58560);
				
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , WorldViewDirection );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				float3 BaseColor = lerpResult1355_g58560;
				float3 Normal = lerpResult1037_g58560;
				float3 Emission = lerpResult22_g58560;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
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

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord.xyz = ase_worldPos;
				o.ase_texcoord1.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord2.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord3.xy = vertexToFrag70_g58603;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord2.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord2.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord2.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord3.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( ase_worldPos, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58572;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _PortalEmissiveFrontFaceRimColor;
			half4 _PortalEmissiveBackFaceColor;
			float4 _PortalUVRotationUVs;
			half4 _PortalEmissiveBackFaceRimColor;
			float4 _EmissiveMaskMapUVs;
			half4 _PortalEmissiveFrontFaceColor;
			float4 _AlphaRemap;
			float _CATEGORY_DISTANCEFADE;
			float _SPACE_DISTANCEFADE;
			float _SPACE_EMISSIONCOLORBACKFACE;
			half _EmissiveDoubleSidedEnable;
			float _DistanceFadeEnable;
			float _CATEGORY_EMISSIONCOLORFRONTFACE;
			half _DistanceFadeMode;
			float _DistanceFadeRange;
			float _SPACE_EMISSIONCOLORFRONTFACE;
			float _CATEGORY_EMISSIONCOLORBACKFACE;
			half _PortalNormalStrength;
			int _Cull;
			half _EmissionFlags;
			float _SPACE_EMISSIONMAP;
			half _PortalEmissiveFrontFaceRimIntensity;
			half _PortalEmissiveFrontFaceRimPower;
			half _PortalEmissiveBackFaceIntensity;
			half _PortalEmissiveBackFaceRimIntensity;
			half _PortalEmissiveBackRimPower;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _PortalEmissiveFrontFaceIntensity;
			float _CATEGORY_EMISSIONMAP;
			float _CATEGORY_MASK;
			half _AlphaCutoffBias;
			half _LatLongExposure;
			float _CATEGORY_LATLONGTEXTURE;
			float _SPACE_LATLONGTEXTURE;
			float _EmissiveMaskRTContrastMin;
			float _EmissiveMaskContrastRTMax;
			float _EmissiveMaskRTPower;
			half _PortalMaskLatLongEnable;
			half _LatLongTextureEnable;
			half _PortalOpacityLatLong;
			float _PortalUVRotationSpeed;
			float _PortalUVRotationAnchorX;
			float _PortalUVRotationAnchorXMax;
			float _PortalUVRotationAnchorY;
			float _PortalUVRotationAnchorYMax;
			half _PortalUVRotationEnable;
			float _PortalUVTwirlSpeed;
			float _PortalUVTwirlWarpStrength;
			half _PortalUVTwirlEnable;
			float _PortalUVOrbitSpeed;
			float _PortalUVOrbitOffset;
			half _PortalUVOrbitEnable;
			float _PortalUVRadialShearStrength;
			float _PortalUVRadialShearSpeedX;
			float _PortalUVRadialShearSpeedY;
			half _PortalUVRadialShearEnable;
			float _EmissiveMaskContrastMin;
			float _EmissiveMaskContrastMax;
			float _EmissiveMaskPower;
			half _PortalMaskEnable;
			float _SPACE_MASK;
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

			TEXTURE2D(_LatLongMap);
			SAMPLER(sampler_LatLongMap);
			TEXTURE2D(_EmissiveMaskMap);
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);


			
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

				float3 _Vector2 = float3(0,0,0);
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58588 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g58587 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g58588 , -1.0 ));
				
				o.ase_texcoord.xyz = ase_worldPos;
				o.ase_texcoord1.xyz = ase_worldNormal;
				float2 Offset235_g58606 = (_EmissiveMaskMapUVs).zw;
				float2 temp_output_41_0_g58606 = ( ( v.ase_texcoord.xy * ( (_EmissiveMaskMapUVs).xy / 1.0 ) ) + Offset235_g58606 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58606 = ( temp_output_41_0_g58606 - ( ( ( (_EmissiveMaskMapUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord2.zw = vertexToFrag70_g58606;
				float2 Offset235_g58603 = (_PortalUVRotationUVs).zw;
				float2 temp_output_41_0_g58603 = ( ( v.ase_texcoord.xy * ( (_PortalUVRotationUVs).xy / 1.0 ) ) + Offset235_g58603 );
				float2 vertexToFrag70_g58603 = ( temp_output_41_0_g58603 - ( ( ( (_PortalUVRotationUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord3.xy = vertexToFrag70_g58603;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = _Vector2;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = lerpResult9_g58587;

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

				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_194_0_g58611 = reflect( ase_worldViewDir , normalizedWorldNormal );
				float3 break350_g58611 = temp_output_194_0_g58611;
				float temp_output_392_0_g58611 = (temp_output_194_0_g58611).y;
				float2 appendResult357_g58611 = (float2(( atan2( break350_g58611.z , break350_g58611.x ) + 1.570796 ) , ( ( -0.5 * PI ) + asin( temp_output_392_0_g58611 ) )));
				float2 temp_output_1386_218_g58560 = ( appendResult357_g58611 * float2( 0.1591549,-0.3183099 ) );
				float2 temp_output_1386_365_g58560 = ddx( IN.ase_texcoord2.xy );
				float2 temp_output_1386_367_g58560 = ddy( IN.ase_texcoord2.xy );
				float4 tex2DNode1323_g58560 = SAMPLE_TEXTURE2D_GRAD( _LatLongMap, sampler_LatLongMap, temp_output_1386_218_g58560, temp_output_1386_365_g58560, temp_output_1386_367_g58560 );
				float3 temp_output_1394_0_g58560 = (tex2DNode1323_g58560).rgb;
				float3 temp_output_1306_0_g58560 = ( 1.0 - temp_output_1394_0_g58560 );
				float3 temp_cast_0 = (_EmissiveMaskRTContrastMin).xxx;
				float3 temp_cast_1 = (_EmissiveMaskContrastRTMax).xxx;
				float2 vertexToFrag70_g58606 = IN.ase_texcoord2.zw;
				float3 temp_output_496_0_g58560 = (SAMPLE_TEXTURE2D( _EmissiveMaskMap, sampler_EmissiveColorMap, vertexToFrag70_g58606 )).rgb;
				float3 smoothstepResult1109_g58560 = smoothstep( temp_cast_0 , temp_cast_1 , temp_output_496_0_g58560);
				float3 temp_cast_2 = (_EmissiveMaskRTPower).xxx;
				float3 EmissionMaskSample1112_g58560 = saturate( pow( smoothstepResult1109_g58560 , temp_cast_2 ) );
				float3 lerpResult1305_g58560 = lerp( float3( 0,0,0 ) , temp_output_1306_0_g58560 , EmissionMaskSample1112_g58560);
				float3 lerpResult1307_g58560 = lerp( temp_output_1306_0_g58560 , lerpResult1305_g58560 , _PortalMaskLatLongEnable);
				float SampleLatLongEnable1349_g58560 = _LatLongTextureEnable;
				float3 lerpResult1308_g58560 = lerp( float3( 0,0,0 ) , lerpResult1307_g58560 , SampleLatLongEnable1349_g58560);
				float3 LatLongSampleAlpha1353_g58560 = lerpResult1308_g58560;
				float3 break1366_g58560 = LatLongSampleAlpha1353_g58560;
				float lerpResult1369_g58560 = lerp( ( 1.0 - _PortalOpacityLatLong ) , 0.0 , max( max( break1366_g58560.x , break1366_g58560.y ) , break1366_g58560.z ));
				half4 color417_g58560 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_416_0_g58560 = (color417_g58560).rgb;
				float3 MaskEmissive418_g58560 = temp_output_416_0_g58560;
				float temp_output_116_0_g58600 = radians( ( _TimeParameters.x * _PortalUVRotationSpeed ) );
				float temp_output_13_0_g58600 = cos( temp_output_116_0_g58600 );
				float2 vertexToFrag70_g58603 = IN.ase_texcoord3.xy;
				float2 temp_output_1266_0_g58560 = vertexToFrag70_g58603;
				float2 appendResult1262_g58560 = (float2(0.5 , 0.5));
				float3 worldToObj29_g58602 = mul( GetWorldToObjectMatrix(), float4( ase_worldPos, 1 ) ).xyz;
				float3 break28_g58602 = ( _WorldSpaceCameraPos - worldToObj29_g58602 );
				float temp_output_18_0_g58602 = ( PI * 0.5 );
				float2 appendResult17_g58602 = (float2(( ( atan( ( _PortalUVRotationAnchorX * break28_g58602.x ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorXMax ) , ( ( atan( ( _PortalUVRotationAnchorY * break28_g58602.y ) ) / temp_output_18_0_g58602 ) * _PortalUVRotationAnchorYMax )));
				float2 temp_output_1265_0_g58560 = ( appendResult1262_g58560 - appendResult17_g58602 );
				float2 temp_output_9_0_g58600 = temp_output_1265_0_g58560;
				float2 break39_g58600 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58600 );
				float temp_output_14_0_g58600 = sin( temp_output_116_0_g58600 );
				float2 appendResult36_g58600 = (float2(( ( temp_output_13_0_g58600 * break39_g58600.x ) + ( temp_output_14_0_g58600 * break39_g58600.y ) ) , ( ( temp_output_13_0_g58600 * break39_g58600.y ) - ( temp_output_14_0_g58600 * break39_g58600.x ) )));
				float2 temp_output_523_0_g58560 = ( appendResult36_g58600 + temp_output_9_0_g58600 );
				float3 lerpResult491_g58560 = lerp( MaskEmissive418_g58560 , ( MaskEmissive418_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_523_0_g58560 )).rgb ) , _PortalUVRotationEnable);
				float2 center41_g58601 = temp_output_1265_0_g58560;
				float2 delta38_g58601 = ( temp_output_1266_0_g58560 - center41_g58601 );
				float angle34_g58601 = ( length( delta38_g58601 ) * (0.0 + (sin( ( _TimeParameters.x * _PortalUVTwirlSpeed ) ) - -1.0) * (_PortalUVTwirlWarpStrength - 0.0) / (1.0 - -1.0)) );
				float x2_g58601 = ( ( cos( angle34_g58601 ) * delta38_g58601.x ) - ( sin( angle34_g58601 ) * delta38_g58601.y ) );
				float2 break5_g58601 = center41_g58601;
				float2 break8_g58601 = float2( 0,0 );
				float y22_g58601 = ( ( sin( angle34_g58601 ) * delta38_g58601.x ) + ( cos( angle34_g58601 ) * delta38_g58601.y ) );
				float2 appendResult23_g58601 = (float2(( x2_g58601 + break5_g58601.x + break8_g58601.x ) , ( break5_g58601.y + break8_g58601.y + y22_g58601 )));
				float2 temp_output_1251_47_g58560 = appendResult23_g58601;
				float3 lerpResult541_g58560 = lerp( lerpResult491_g58560 , ( lerpResult491_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_1251_47_g58560 )).rgb ) , _PortalUVTwirlEnable);
				float temp_output_116_0_g58584 = radians( ( _TimeParameters.x * _PortalUVOrbitSpeed ) );
				float temp_output_13_0_g58584 = cos( temp_output_116_0_g58584 );
				float2 temp_output_9_0_g58584 = temp_output_1265_0_g58560;
				float2 break39_g58584 = ( temp_output_1266_0_g58560 - temp_output_9_0_g58584 );
				float temp_output_14_0_g58584 = sin( temp_output_116_0_g58584 );
				float2 appendResult36_g58584 = (float2(( ( temp_output_13_0_g58584 * break39_g58584.x ) + ( temp_output_14_0_g58584 * break39_g58584.y ) ) , ( ( temp_output_13_0_g58584 * break39_g58584.y ) - ( temp_output_14_0_g58584 * break39_g58584.x ) )));
				float4 appendResult582_g58560 = (float4(_PortalUVOrbitOffset , 0.0 , 0.0 , 0.0));
				float2 temp_output_580_0_g58560 = (( appendResult36_g58584 + temp_output_9_0_g58584 )*1.0 + appendResult582_g58560.xy);
				float3 lerpResult588_g58560 = lerp( lerpResult541_g58560 , ( lerpResult541_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, temp_output_580_0_g58560 )).rgb ) , _PortalUVOrbitEnable);
				float localUnity_RadialShear_float614_g58560 = ( 0.0 );
				float2 UV614_g58560 = temp_output_1266_0_g58560;
				float2 Center614_g58560 = temp_output_1265_0_g58560;
				float Strength614_g58560 = _PortalUVRadialShearStrength;
				float2 appendResult645_g58560 = (float2(( _TimeParameters.x * _PortalUVRadialShearSpeedX ) , ( _TimeParameters.x * _PortalUVRadialShearSpeedY )));
				float2 Offset614_g58560 = appendResult645_g58560;
				float2 Out614_g58560 = float2( 0,0 );
				{
				float2 delta = UV614_g58560 - Center614_g58560;
				float delta2 = dot(delta.xy, delta.xy);
				float2 delta_offset = delta2 * Strength614_g58560;
				Out614_g58560 = UV614_g58560 + float2(delta.y, -delta.x) * delta_offset + Offset614_g58560;
				}
				float3 lerpResult651_g58560 = lerp( lerpResult588_g58560 , ( lerpResult588_g58560 + (SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, Out614_g58560 )).rgb ) , _PortalUVRadialShearEnable);
				float3 temp_cast_4 = (_EmissiveMaskContrastMin).xxx;
				float3 temp_cast_5 = (_EmissiveMaskContrastMax).xxx;
				float3 smoothstepResult1100_g58560 = smoothstep( temp_cast_4 , temp_cast_5 , temp_output_496_0_g58560);
				float3 temp_cast_6 = (_EmissiveMaskPower).xxx;
				float3 EmissionMask468_g58560 = saturate( pow( smoothstepResult1100_g58560 , temp_cast_6 ) );
				float3 lerpResult478_g58560 = lerp( lerpResult651_g58560 , MaskEmissive418_g58560 , EmissionMask468_g58560);
				float3 lerpResult455_g58560 = lerp( lerpResult651_g58560 , lerpResult478_g58560 , ( _PortalMaskEnable + ( ( _CATEGORY_MASK + _SPACE_MASK + _CATEGORY_EMISSIONMAP + _SPACE_EMISSIONMAP ) * 0.0 ) ));
				float3 FinalMix859_g58560 = lerpResult455_g58560;
				float3 break386_g58560 = FinalMix859_g58560;
				float temp_output_375_0_g58560 = max( max( break386_g58560.x , break386_g58560.y ) , break386_g58560.z );
				float lerpResult1363_g58560 = lerp( lerpResult1369_g58560 , 0.0 , temp_output_375_0_g58560);
				float temp_output_149_0_g58582 = ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _DistanceFadeRange );
				float lerpResult159_g58582 = lerp( temp_output_149_0_g58582 , ( 1.0 - temp_output_149_0_g58582 ) , _DistanceFadeMode);
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth131_g58582 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth131_g58582 = saturate( abs( ( screenDepth131_g58582 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DistanceFadeRange ) ) );
				float saferPower165_g58582 = abs( saturate( distanceDepth131_g58582 ) );
				float lerpResult157_g58582 = lerp( 1.0 , ( saturate( lerpResult159_g58582 ) * pow( saferPower165_g58582 , 0.01 ) ) , ( _DistanceFadeEnable + ( ( _CATEGORY_DISTANCEFADE + _SPACE_DISTANCEFADE ) * 0.0 ) ));
				float temp_output_16_0_g58560 = ( lerpResult1363_g58560 * lerpResult157_g58582 );
				float temp_output_22_0_g58572 = temp_output_16_0_g58560;
				float temp_output_22_0_g58574 = temp_output_22_0_g58572;
				float3 temp_output_95_0_g58576 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58576 = normalize( temp_output_95_0_g58576 );
				float dotResult74_g58572 = dot( normalizeResult96_g58576 , ase_worldViewDir );
				float temp_output_76_0_g58572 = ( 1.0 - abs( dotResult74_g58572 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58572 = 1.0;
				#else
				float staticSwitch281_g58572 = ( 1.0 - ( temp_output_76_0_g58572 * temp_output_76_0_g58572 ) );
				#endif
				float lerpResult80_g58572 = lerp( 1.0 , staticSwitch281_g58572 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58572 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58574 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58574 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58572 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58572;
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
Node;AmplifyShaderEditor.FunctionNode;3066;-4224,-3584;Inherit;False;DESF Core Portal;1;;58560;1c2a77c189d27df4aa91480a9de7f0df;21,950,2,115,2,485,2,751,2,764,2,847,2,896,2,895,2,605,0,1000,0,1002,1,596,1,1003,1,599,1,1004,1,602,1,1005,1,652,1,900,0,1044,0,1043,0;0;8;FLOAT3;849;FLOAT3;1036;FLOAT3;29;FLOAT;30;FLOAT;169;FLOAT;258;FLOAT3;32;FLOAT3;663
Node;AmplifyShaderEditor.IntNode;2874;-3840,-3664;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;1;;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3067;-3941.374,-3584;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3069;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3070;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3071;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3072;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3073;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3074;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3075;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3076;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3068;-3840,-3584;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Portal/LatLong;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;1;638202867669569259;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;3068;0;3066;849
WireConnection;3068;1;3066;1036
WireConnection;3068;2;3066;29
WireConnection;3068;6;3066;30
WireConnection;3068;7;3066;169
WireConnection;3068;16;3066;258
WireConnection;3068;8;3066;32
WireConnection;3068;10;3066;663
ASEEND*/
//CHKSM=4C593572FF89EEDF1033A3F70E2E314D8301D533