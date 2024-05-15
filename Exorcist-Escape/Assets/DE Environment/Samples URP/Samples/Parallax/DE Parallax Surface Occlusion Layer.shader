// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Parallax/Surface Occlusion Layer"
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
		[DE_DrawerSpace(10)]_SPACE_ALPHACLIP("SPACE_ALPHACLIP", Float) = 0
		[DE_DrawerCategory(COLOR,true,_BaseColor,0,0)]_CATEGORY_COLOR("CATEGORY_COLOR", Float) = 1
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerSpace(10)]_SPACE_COLOR("SPACE_COLOR", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_MaskMap("Mask Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(UV0 _UV1 _UV2 _UV3)]_UVMode("UV Mode", Float) = 0
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerFloatEnum(Smoothness _Roughness)][Space(10)]_SmoothnessSource("Smoothness Source", Float) = 1
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleLeft]_SmoothnessFresnelEnable("ENABLE FRESNEL", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerFloatEnum(Texture _Vertex Color)][Space(10)]_OcclusionSource("Occlusion Source", Float) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[Normal][DE_DrawerTextureSingleLine][Space(10)]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerTextureSingleLine]_ParallaxMap("Displacement Map", 2D) = "black" {}
		_ParallaxHeightScale("Parallax Height Scale", Range( 0 , 0.1)) = 0.03
		_ParallaxReferencePlane("Parallax Reference Plane", Range( 0 , 1)) = 0
		_ParallaxSamplesMin("Parallax Samples Min", Float) = 32
		_ParallaxSamplesMax("Parallax Samples Max", Float) = 128
		_ParallaxSidewallStepsMax("Parallax Sidewall Steps Max", Int) = 6
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(PARALLAX LAYER,true,_ParallaxLayerEnable,0,0)]_CATEGORY_PARALLAXLAYER("CATEGORY_PARALLAX LAYER", Float) = 0
		[DE_DrawerToggleLeft]_ParallaxLayerEnable("ENABLE PARALLAX LAYERS", Float) = 0
		[DE_DrawerFloatEnum(Red _Green _Blue _Alpha)][Space(15)]_ParallaxLayer1MaskChannel("Mask Map Channel", Float) = 0
		[DE_DrawerToggleNoKeyword]_ParallaxLayer1MaskInverted("Mask Map Inverted", Float) = 0
		[DE_DrawerTextureSingleLine]_ParallaxLayer1MaskMap("Mask", 2D) = "white" {}
		[DE_DrawerTilingOffset]_ParallaxLayer1MaskUVs("Parallax Layer  1 Mask UVs", Vector) = (1,1,0,0)
		_ParallaxLayer1BlendAmount("Blend Amount", Range( 0 , 1)) = 0.001
		_ParallaxLayer1BlendHardness("Blend Hardness", Range( 0 , 5)) = 0.001
		_ParallaxLayer1BlendFalloff("Blend Falloff", Range( 0 , 2)) = 0.001
		[DE_DrawerToggleLeft][Space(10)]_ParallaxLayer1Enable("ENABLE PARALLAX LAYER 1", Float) = 0
		[HDR]_ParallaxLayer1Color("Base Color", Color) = (1,1,1,0)
		_ParallaxLayer1Brightness("Brightness", Range( 0 , 1)) = 0.6821798
		_ParallaxLayer1EmissiveIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerTextureSingleLine]_ParallaxLayer1Map("Layer 1", 2D) = "white" {}
		[DE_DrawerTilingOffset]_ParallaxLayer1UVs("Parallax Layer  1 UVs", Vector) = (1,1,0,0)
		_ParallaxLayer1DepthScale("Depth Scale", Range( 0 , 1)) = 0.3
		[DE_DrawerSpace(10)]_SPACE_PARALLAXLAYER("SPACE_PARALLAXLAYER", Float) = 0
		[DE_DrawerToggleLeft][Space(10)]_ParallaxLayer2Enable("ENABLE PARALLAX LAYER 2", Float) = 0
		[HDR]_ParallaxLayer2Color("Base Color", Color) = (1,1,1,0)
		_ParallaxLayer2Brightness("Brightness", Range( 0 , 1)) = 0.7
		_ParallaxLayer2EmissiveIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerTextureSingleLine]_ParallaxLayer2Map("Layer 2", 2D) = "white" {}
		[DE_DrawerTilingOffset]_ParallaxLayer2UVs("Parallax Layer 2 UVs", Vector) = (1,1,0,0)
		_ParallaxLayer2DepthScale("Depth Scale", Range( 0 , 1)) = 0


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
			#define _EMISSION
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
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ParallaxLayer1Map);
			TEXTURE2D(_ParallaxLayer2Map);
			TEXTURE2D(_ParallaxLayer1MaskMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);


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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			float ParallaxLayer1MaskChannelSwitch109_g59291( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else if(m_switch ==3)
					return m_Alpha;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float2 Offset235_g59296 = (_ParallaxLayer1UVs).zw;
				float2 temp_output_41_0_g59296 = ( ( v.texcoord.xy * ( (_ParallaxLayer1UVs).xy / 1.0 ) ) + Offset235_g59296 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g59296 = ( temp_output_41_0_g59296 - ( ( ( (_ParallaxLayer1UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.xy = vertexToFrag70_g59296;
				float2 Offset235_g59299 = (_ParallaxLayer2UVs).zw;
				float2 temp_output_41_0_g59299 = ( ( v.texcoord.xy * ( (_ParallaxLayer2UVs).xy / 1.0 ) ) + Offset235_g59299 );
				float2 vertexToFrag70_g59299 = ( temp_output_41_0_g59299 - ( ( ( (_ParallaxLayer2UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.zw = vertexToFrag70_g59299;
				float2 Offset235_g59293 = (_ParallaxLayer1MaskUVs).zw;
				float2 temp_output_41_0_g59293 = ( ( v.texcoord.xy * ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) ) + Offset235_g59293 );
				float2 vertexToFrag70_g59293 = ( temp_output_41_0_g59293 - ( ( ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord11.xy = vertexToFrag70_g59293;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord8.zw = v.texcoord1.xy;
				o.ase_texcoord9.xy = v.texcoord2.xy;
				o.ase_texcoord9.zw = v.ase_texcoord3.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord11.zw = 0;

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
				v.normalOS = lerpResult2758_g59191;
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
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float3 temp_output_1923_0_g59191 = (_BaseColor).rgb;
				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord8.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord8.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord9.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord9.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), WorldNormal, WorldViewDirection, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float3 ALBEDO_RGBA1381_g59191 = (Output_Fetch2DDerivative203_g59244).rgb;
				float3 temp_output_3_0_g59191 = ( temp_output_1923_0_g59191 * ALBEDO_RGBA1381_g59191 * _Brightness );
				float3 temp_output_36_0_g59291 = temp_output_3_0_g59191;
				float3 temp_output_19_0_g59302 = (_ParallaxLayer1Color).rgb;
				float temp_output_21_0_g59302 = _ParallaxLayer1EmissiveIntensity;
				float3 temp_output_26_0_g59302 = ( temp_output_19_0_g59302 * temp_output_21_0_g59302 );
				float3 temp_output_462_22_g59291 = temp_output_26_0_g59302;
				float2 vertexToFrag70_g59296 = IN.ase_texcoord10.xy;
				float2 temp_output_493_0_g59291 = vertexToFrag70_g59296;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 Offset149_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer1DepthScale ) + temp_output_493_0_g59291;
				float3 Layer1BaseColor260_g59291 = ( temp_output_462_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1Map, sampler_ParallaxMap, Offset149_g59291, ddx( temp_output_493_0_g59291 ), ddy( temp_output_493_0_g59291 ) )).rgb * _ParallaxLayer1Brightness );
				float3 lerpResult370_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , _ParallaxLayer1Enable);
				float3 temp_output_19_0_g59304 = (_ParallaxLayer2Color).rgb;
				float temp_output_21_0_g59304 = _ParallaxLayer2EmissiveIntensity;
				float3 temp_output_26_0_g59304 = ( temp_output_19_0_g59304 * temp_output_21_0_g59304 );
				float3 temp_output_481_22_g59291 = temp_output_26_0_g59304;
				float2 vertexToFrag70_g59299 = IN.ase_texcoord10.zw;
				float2 temp_output_494_0_g59291 = vertexToFrag70_g59299;
				float2 Offset7_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer2DepthScale ) + temp_output_494_0_g59291;
				float3 Layer2BaseColor150_g59291 = ( temp_output_481_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer2Map, sampler_ParallaxMap, Offset7_g59291, ddx( temp_output_494_0_g59291 ), ddy( temp_output_494_0_g59291 ) )).rgb * _ParallaxLayer2Brightness );
				float3 lerpResult343_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , _ParallaxLayer2Enable);
				float m_switch109_g59291 = _ParallaxLayer1MaskChannel;
				float2 vertexToFrag70_g59293 = IN.ase_texcoord11.xy;
				float2 temp_output_490_0_g59291 = vertexToFrag70_g59293;
				float4 tex2DNode71_g59291 = SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1MaskMap, sampler_ParallaxMap, temp_output_490_0_g59291, ddx( temp_output_490_0_g59291 ), ddy( temp_output_490_0_g59291 ) );
				float m_Red109_g59291 = ( tex2DNode71_g59291.r * tex2DNode71_g59291.r );
				float m_Green109_g59291 = ( tex2DNode71_g59291.g * tex2DNode71_g59291.g );
				float m_Blue109_g59291 = ( tex2DNode71_g59291.b * tex2DNode71_g59291.b );
				float m_Alpha109_g59291 = ( tex2DNode71_g59291.a * tex2DNode71_g59291.a );
				float localParallaxLayer1MaskChannelSwitch109_g59291 = ParallaxLayer1MaskChannelSwitch109_g59291( m_switch109_g59291 , m_Red109_g59291 , m_Green109_g59291 , m_Blue109_g59291 , m_Alpha109_g59291 );
				float lerpResult218_g59291 = lerp( localParallaxLayer1MaskChannelSwitch109_g59291 , ( 1.0 - localParallaxLayer1MaskChannelSwitch109_g59291 ) , _ParallaxLayer1MaskInverted);
				float saferPower352_g59291 = abs( max( saturate( (1.0 + (( 1.0 - lerpResult218_g59291 ) - _ParallaxLayer1BlendAmount) * (( 1.0 - _ParallaxLayer1BlendHardness ) - 1.0) / (0.0 - _ParallaxLayer1BlendAmount)) ) , 0.0 ) );
				float Layer1Mask257_g59291 = saturate( pow( saferPower352_g59291 , _ParallaxLayer1BlendFalloff ) );
				float3 lerpResult96_g59291 = lerp( temp_output_36_0_g59291 , ( lerpResult370_g59291 + lerpResult343_g59291 ) , Layer1Mask257_g59291);
				float temp_output_66_0_g59291 = ( _ParallaxLayerEnable + ( ( _CATEGORY_PARALLAXLAYER + _SPACE_PARALLAXLAYER ) * 0.0 ) );
				float3 lerpResult58_g59291 = lerp( temp_output_36_0_g59291 , lerpResult96_g59291 , temp_output_66_0_g59291);
				
				float localStochasticTiling159_g59245 = ( 0.0 );
				float2 UV159_g59245 = UVParallax2784_g59191;
				float4 TexelSize159_g59245 = _BumpMap_TexelSize;
				float4 Offsets159_g59245 = float4( 0,0,0,0 );
				float2 Weights159_g59245 = float2( 0,0 );
				{
				UV159_g59245 = UV159_g59245 * TexelSize159_g59245.zw - 0.5;
				float2 f = frac( UV159_g59245 );
				UV159_g59245 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59245.x - 0.5, UV159_g59245.x + 1.5, UV159_g59245.y - 0.5, UV159_g59245.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59245 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59245.xyxy;
				Weights159_g59245 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59246 = Offsets159_g59245;
				float2 temp_output_205_0_g59246 = UVParallaxDDX2785_g59191;
				float2 temp_output_206_0_g59246 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59246 = Weights159_g59245;
				float2 break169_g59246 = Input_FetchWeights143_g59246;
				float4 lerpResult167_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult168_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult180_g59246 = lerp( lerpResult167_g59246 , lerpResult168_g59246 , break169_g59246.y);
				float4 Output_Fetch2DDerivative203_g59246 = lerpResult180_g59246;
				float4 NORMAL_RGBA1382_g59191 = Output_Fetch2DDerivative203_g59246;
				float3 unpack1891_g59191 = UnpackNormalScale( NORMAL_RGBA1382_g59191, _NormalStrength );
				unpack1891_g59191.z = lerp( 1, unpack1891_g59191.z, saturate(_NormalStrength) );
				float3 temp_output_132_0_g59291 = unpack1891_g59191;
				float3 _ParallaxLayer1NormalStrength = float3(0,0,1);
				float3 lerpResult373_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer1Enable);
				float3 lerpResult374_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer2Enable);
				float3 lerpResult270_g59291 = lerp( temp_output_132_0_g59291 , BlendNormal( lerpResult373_g59291 , lerpResult374_g59291 ) , Layer1Mask257_g59291);
				float3 lerpResult142_g59291 = lerp( temp_output_132_0_g59291 , lerpResult270_g59291 , temp_output_66_0_g59291);
				
				half4 color473_g59291 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_474_0_g59291 = (color473_g59291).rgb;
				float3 EmissionlLayer1464_g59291 = temp_output_462_22_g59291;
				float3 lerpResult465_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer1464_g59291 , _ParallaxLayer1Enable);
				float3 lerpResult484_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , Layer1Mask257_g59291);
				float3 lerpResult470_g59291 = lerp( temp_output_474_0_g59291 , lerpResult465_g59291 , lerpResult484_g59291);
				float3 EmissionlLayer2482_g59291 = temp_output_481_22_g59291;
				float3 lerpResult468_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer2482_g59291 , _ParallaxLayer2Enable);
				float3 lerpResult485_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , Layer1Mask257_g59291);
				float3 lerpResult475_g59291 = lerp( temp_output_474_0_g59291 , lerpResult468_g59291 , lerpResult485_g59291);
				float3 lerpResult472_g59291 = lerp( temp_output_474_0_g59291 , ( lerpResult470_g59291 + lerpResult475_g59291 ) , temp_output_66_0_g59291);
				
				float localStochasticTiling159_g59247 = ( 0.0 );
				float2 UV159_g59247 = UVParallax2784_g59191;
				float4 TexelSize159_g59247 = _MaskMap_TexelSize;
				float4 Offsets159_g59247 = float4( 0,0,0,0 );
				float2 Weights159_g59247 = float2( 0,0 );
				{
				UV159_g59247 = UV159_g59247 * TexelSize159_g59247.zw - 0.5;
				float2 f = frac( UV159_g59247 );
				UV159_g59247 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59247.x - 0.5, UV159_g59247.x + 1.5, UV159_g59247.y - 0.5, UV159_g59247.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59247 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59247.xyxy;
				Weights159_g59247 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59248 = Offsets159_g59247;
				float2 temp_output_205_0_g59248 = UVParallaxDDX2785_g59191;
				float2 temp_output_206_0_g59248 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59248 = Weights159_g59247;
				float2 break169_g59248 = Input_FetchWeights143_g59248;
				float4 lerpResult167_g59248 = lerp( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).yw, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).xw, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , break169_g59248.x);
				float4 lerpResult168_g59248 = lerp( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).yz, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).xz, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , break169_g59248.x);
				float4 lerpResult180_g59248 = lerp( lerpResult167_g59248 , lerpResult168_g59248 , break169_g59248.y);
				float4 Output_Fetch2DDerivative203_g59248 = lerpResult180_g59248;
				float4 break50_g59248 = Output_Fetch2DDerivative203_g59248;
				float MASK_B1377_g59191 = break50_g59248.b;
				float temp_output_129_0_g59291 = ( _MetallicStrength * MASK_B1377_g59191 );
				float lerpResult378_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult379_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult278_g59291 = lerp( temp_output_129_0_g59291 , ( lerpResult378_g59291 + lerpResult379_g59291 ) , Layer1Mask257_g59291);
				float lerpResult139_g59291 = lerp( temp_output_129_0_g59291 , lerpResult278_g59291 , temp_output_66_0_g59291);
				
				float MASK_G158_g59191 = break50_g59248.g;
				float temp_output_2651_0_g59191 = ( 1.0 - MASK_G158_g59191 );
				float lerpResult2650_g59191 = lerp( MASK_G158_g59191 , temp_output_2651_0_g59191 , _SmoothnessSource);
				float temp_output_2693_0_g59191 = ( lerpResult2650_g59191 * _SmoothnessStrength );
				float2 appendResult2645_g59191 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g59191 = (float3(appendResult2645_g59191 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g59191 = unpack1891_g59191;
				float3 normalizeResult2641_g59191 = normalize( ( ( WorldTangent * break2680_g59191.x ) + ( WorldBiTangent * break2680_g59191.y ) + ( WorldNormal * break2680_g59191.z ) ) );
				float3 Normal_Per_Pixel2690_g59191 = normalizeResult2641_g59191;
				float fresnelNdotV2685_g59191 = dot( normalize( Normal_Per_Pixel2690_g59191 ), appendResult2644_g59191 );
				float fresnelNode2685_g59191 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g59191 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g59191 = lerp( temp_output_2693_0_g59191 , ( temp_output_2693_0_g59191 - fresnelNode2685_g59191 ) , _SmoothnessFresnelEnable);
				float temp_output_123_0_g59291 = saturate( lerpResult2636_g59191 );
				float lerpResult388_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult387_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult290_g59291 = lerp( temp_output_123_0_g59291 , ( lerpResult388_g59291 + lerpResult387_g59291 ) , Layer1Mask257_g59291);
				float lerpResult138_g59291 = lerp( temp_output_123_0_g59291 , lerpResult290_g59291 , temp_output_66_0_g59291);
				
				float MASK_R1378_g59191 = break50_g59248.r;
				float lerpResult3415_g59191 = lerp( 1.0 , MASK_R1378_g59191 , _OcclusionStrengthAO);
				float lerpResult3414_g59191 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g59191 = lerp( lerpResult3415_g59191 , lerpResult3414_g59191 , _OcclusionSource);
				float temp_output_2730_0_g59191 = saturate( lerpResult2709_g59191 );
				float temp_output_130_0_g59291 = temp_output_2730_0_g59191;
				float lerpResult391_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult392_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult296_g59291 = lerp( temp_output_130_0_g59291 , ( lerpResult391_g59291 + lerpResult392_g59291 ) , Layer1Mask257_g59291);
				float lerpResult140_g59291 = lerp( temp_output_130_0_g59291 , lerpResult296_g59291 , temp_output_66_0_g59291);
				
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , WorldViewDirection );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float3 BaseColor = lerpResult58_g59291;
				float3 Normal = lerpResult142_g59291;
				float3 Emission = lerpResult472_g59291;
				float3 Specular = 0.5;
				float Metallic = lerpResult139_g59291;
				float Smoothness = lerpResult138_g59291;
				float Occlusion = lerpResult140_g59291;
				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord3.zw = v.ase_texcoord1.xy;
				o.ase_texcoord4.xy = v.ase_texcoord2.xy;
				o.ase_texcoord4.zw = v.ase_texcoord3.xy;
				
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

				v.normalOS = lerpResult2758_g59191;

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord3.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord3.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord4.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord4.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord3.zw = v.ase_texcoord1.xy;
				o.ase_texcoord4.xy = v.ase_texcoord2.xy;
				o.ase_texcoord4.zw = v.ase_texcoord3.xy;
				
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

				v.normalOS = lerpResult2758_g59191;

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord3.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord3.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord4.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord4.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;

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
			#define _EMISSION
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ParallaxLayer1Map);
			TEXTURE2D(_ParallaxLayer2Map);
			TEXTURE2D(_ParallaxLayer1MaskMap);


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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			float ParallaxLayer1MaskChannelSwitch109_g59291( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else if(m_switch ==3)
					return m_Alpha;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				o.ase_texcoord7.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				float2 Offset235_g59296 = (_ParallaxLayer1UVs).zw;
				float2 temp_output_41_0_g59296 = ( ( v.texcoord0.xy * ( (_ParallaxLayer1UVs).xy / 1.0 ) ) + Offset235_g59296 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g59296 = ( temp_output_41_0_g59296 - ( ( ( (_ParallaxLayer1UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag70_g59296;
				float2 Offset235_g59299 = (_ParallaxLayer2UVs).zw;
				float2 temp_output_41_0_g59299 = ( ( v.texcoord0.xy * ( (_ParallaxLayer2UVs).xy / 1.0 ) ) + Offset235_g59299 );
				float2 vertexToFrag70_g59299 = ( temp_output_41_0_g59299 - ( ( ( (_ParallaxLayer2UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.zw = vertexToFrag70_g59299;
				float2 Offset235_g59293 = (_ParallaxLayer1MaskUVs).zw;
				float2 temp_output_41_0_g59293 = ( ( v.texcoord0.xy * ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) ) + Offset235_g59293 );
				float2 vertexToFrag70_g59293 = ( temp_output_41_0_g59293 - ( ( ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.xy = vertexToFrag70_g59293;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_texcoord4.zw = v.texcoord1.xy;
				o.ase_texcoord5.xy = v.texcoord2.xy;
				o.ase_texcoord5.zw = v.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord10.zw = 0;

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

				v.normalOS = lerpResult2758_g59191;

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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float3 temp_output_1923_0_g59191 = (_BaseColor).rgb;
				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord4.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord4.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord5.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord5.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float3 ALBEDO_RGBA1381_g59191 = (Output_Fetch2DDerivative203_g59244).rgb;
				float3 temp_output_3_0_g59191 = ( temp_output_1923_0_g59191 * ALBEDO_RGBA1381_g59191 * _Brightness );
				float3 temp_output_36_0_g59291 = temp_output_3_0_g59191;
				float3 temp_output_19_0_g59302 = (_ParallaxLayer1Color).rgb;
				float temp_output_21_0_g59302 = _ParallaxLayer1EmissiveIntensity;
				float3 temp_output_26_0_g59302 = ( temp_output_19_0_g59302 * temp_output_21_0_g59302 );
				float3 temp_output_462_22_g59291 = temp_output_26_0_g59302;
				float2 vertexToFrag70_g59296 = IN.ase_texcoord9.xy;
				float2 temp_output_493_0_g59291 = vertexToFrag70_g59296;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 Offset149_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer1DepthScale ) + temp_output_493_0_g59291;
				float3 Layer1BaseColor260_g59291 = ( temp_output_462_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1Map, sampler_ParallaxMap, Offset149_g59291, ddx( temp_output_493_0_g59291 ), ddy( temp_output_493_0_g59291 ) )).rgb * _ParallaxLayer1Brightness );
				float3 lerpResult370_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , _ParallaxLayer1Enable);
				float3 temp_output_19_0_g59304 = (_ParallaxLayer2Color).rgb;
				float temp_output_21_0_g59304 = _ParallaxLayer2EmissiveIntensity;
				float3 temp_output_26_0_g59304 = ( temp_output_19_0_g59304 * temp_output_21_0_g59304 );
				float3 temp_output_481_22_g59291 = temp_output_26_0_g59304;
				float2 vertexToFrag70_g59299 = IN.ase_texcoord9.zw;
				float2 temp_output_494_0_g59291 = vertexToFrag70_g59299;
				float2 Offset7_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer2DepthScale ) + temp_output_494_0_g59291;
				float3 Layer2BaseColor150_g59291 = ( temp_output_481_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer2Map, sampler_ParallaxMap, Offset7_g59291, ddx( temp_output_494_0_g59291 ), ddy( temp_output_494_0_g59291 ) )).rgb * _ParallaxLayer2Brightness );
				float3 lerpResult343_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , _ParallaxLayer2Enable);
				float m_switch109_g59291 = _ParallaxLayer1MaskChannel;
				float2 vertexToFrag70_g59293 = IN.ase_texcoord10.xy;
				float2 temp_output_490_0_g59291 = vertexToFrag70_g59293;
				float4 tex2DNode71_g59291 = SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1MaskMap, sampler_ParallaxMap, temp_output_490_0_g59291, ddx( temp_output_490_0_g59291 ), ddy( temp_output_490_0_g59291 ) );
				float m_Red109_g59291 = ( tex2DNode71_g59291.r * tex2DNode71_g59291.r );
				float m_Green109_g59291 = ( tex2DNode71_g59291.g * tex2DNode71_g59291.g );
				float m_Blue109_g59291 = ( tex2DNode71_g59291.b * tex2DNode71_g59291.b );
				float m_Alpha109_g59291 = ( tex2DNode71_g59291.a * tex2DNode71_g59291.a );
				float localParallaxLayer1MaskChannelSwitch109_g59291 = ParallaxLayer1MaskChannelSwitch109_g59291( m_switch109_g59291 , m_Red109_g59291 , m_Green109_g59291 , m_Blue109_g59291 , m_Alpha109_g59291 );
				float lerpResult218_g59291 = lerp( localParallaxLayer1MaskChannelSwitch109_g59291 , ( 1.0 - localParallaxLayer1MaskChannelSwitch109_g59291 ) , _ParallaxLayer1MaskInverted);
				float saferPower352_g59291 = abs( max( saturate( (1.0 + (( 1.0 - lerpResult218_g59291 ) - _ParallaxLayer1BlendAmount) * (( 1.0 - _ParallaxLayer1BlendHardness ) - 1.0) / (0.0 - _ParallaxLayer1BlendAmount)) ) , 0.0 ) );
				float Layer1Mask257_g59291 = saturate( pow( saferPower352_g59291 , _ParallaxLayer1BlendFalloff ) );
				float3 lerpResult96_g59291 = lerp( temp_output_36_0_g59291 , ( lerpResult370_g59291 + lerpResult343_g59291 ) , Layer1Mask257_g59291);
				float temp_output_66_0_g59291 = ( _ParallaxLayerEnable + ( ( _CATEGORY_PARALLAXLAYER + _SPACE_PARALLAXLAYER ) * 0.0 ) );
				float3 lerpResult58_g59291 = lerp( temp_output_36_0_g59291 , lerpResult96_g59291 , temp_output_66_0_g59291);
				
				half4 color473_g59291 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_474_0_g59291 = (color473_g59291).rgb;
				float3 EmissionlLayer1464_g59291 = temp_output_462_22_g59291;
				float3 lerpResult465_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer1464_g59291 , _ParallaxLayer1Enable);
				float3 lerpResult484_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , Layer1Mask257_g59291);
				float3 lerpResult470_g59291 = lerp( temp_output_474_0_g59291 , lerpResult465_g59291 , lerpResult484_g59291);
				float3 EmissionlLayer2482_g59291 = temp_output_481_22_g59291;
				float3 lerpResult468_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer2482_g59291 , _ParallaxLayer2Enable);
				float3 lerpResult485_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , Layer1Mask257_g59291);
				float3 lerpResult475_g59291 = lerp( temp_output_474_0_g59291 , lerpResult468_g59291 , lerpResult485_g59291);
				float3 lerpResult472_g59291 = lerp( temp_output_474_0_g59291 , ( lerpResult470_g59291 + lerpResult475_g59291 ) , temp_output_66_0_g59291);
				
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float3 BaseColor = lerpResult58_g59291;
				float3 Emission = lerpResult472_g59291;
				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;

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
			#define _EMISSION
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ParallaxLayer1Map);
			TEXTURE2D(_ParallaxLayer2Map);
			TEXTURE2D(_ParallaxLayer1MaskMap);


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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			float ParallaxLayer1MaskChannelSwitch109_g59291( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else if(m_switch ==3)
					return m_Alpha;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float2 Offset235_g59296 = (_ParallaxLayer1UVs).zw;
				float2 temp_output_41_0_g59296 = ( ( v.ase_texcoord.xy * ( (_ParallaxLayer1UVs).xy / 1.0 ) ) + Offset235_g59296 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g59296 = ( temp_output_41_0_g59296 - ( ( ( (_ParallaxLayer1UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord7.xy = vertexToFrag70_g59296;
				float2 Offset235_g59299 = (_ParallaxLayer2UVs).zw;
				float2 temp_output_41_0_g59299 = ( ( v.ase_texcoord.xy * ( (_ParallaxLayer2UVs).xy / 1.0 ) ) + Offset235_g59299 );
				float2 vertexToFrag70_g59299 = ( temp_output_41_0_g59299 - ( ( ( (_ParallaxLayer2UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord7.zw = vertexToFrag70_g59299;
				float2 Offset235_g59293 = (_ParallaxLayer1MaskUVs).zw;
				float2 temp_output_41_0_g59293 = ( ( v.ase_texcoord.xy * ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) ) + Offset235_g59293 );
				float2 vertexToFrag70_g59293 = ( temp_output_41_0_g59293 - ( ( ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g59293;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord2.zw = v.ase_texcoord1.xy;
				o.ase_texcoord3.xy = v.ase_texcoord2.xy;
				o.ase_texcoord3.zw = v.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
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

				v.normalOS = lerpResult2758_g59191;

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float3 temp_output_1923_0_g59191 = (_BaseColor).rgb;
				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord2.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord2.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord3.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord3.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float3 ALBEDO_RGBA1381_g59191 = (Output_Fetch2DDerivative203_g59244).rgb;
				float3 temp_output_3_0_g59191 = ( temp_output_1923_0_g59191 * ALBEDO_RGBA1381_g59191 * _Brightness );
				float3 temp_output_36_0_g59291 = temp_output_3_0_g59191;
				float3 temp_output_19_0_g59302 = (_ParallaxLayer1Color).rgb;
				float temp_output_21_0_g59302 = _ParallaxLayer1EmissiveIntensity;
				float3 temp_output_26_0_g59302 = ( temp_output_19_0_g59302 * temp_output_21_0_g59302 );
				float3 temp_output_462_22_g59291 = temp_output_26_0_g59302;
				float2 vertexToFrag70_g59296 = IN.ase_texcoord7.xy;
				float2 temp_output_493_0_g59291 = vertexToFrag70_g59296;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 Offset149_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer1DepthScale ) + temp_output_493_0_g59291;
				float3 Layer1BaseColor260_g59291 = ( temp_output_462_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1Map, sampler_ParallaxMap, Offset149_g59291, ddx( temp_output_493_0_g59291 ), ddy( temp_output_493_0_g59291 ) )).rgb * _ParallaxLayer1Brightness );
				float3 lerpResult370_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , _ParallaxLayer1Enable);
				float3 temp_output_19_0_g59304 = (_ParallaxLayer2Color).rgb;
				float temp_output_21_0_g59304 = _ParallaxLayer2EmissiveIntensity;
				float3 temp_output_26_0_g59304 = ( temp_output_19_0_g59304 * temp_output_21_0_g59304 );
				float3 temp_output_481_22_g59291 = temp_output_26_0_g59304;
				float2 vertexToFrag70_g59299 = IN.ase_texcoord7.zw;
				float2 temp_output_494_0_g59291 = vertexToFrag70_g59299;
				float2 Offset7_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer2DepthScale ) + temp_output_494_0_g59291;
				float3 Layer2BaseColor150_g59291 = ( temp_output_481_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer2Map, sampler_ParallaxMap, Offset7_g59291, ddx( temp_output_494_0_g59291 ), ddy( temp_output_494_0_g59291 ) )).rgb * _ParallaxLayer2Brightness );
				float3 lerpResult343_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , _ParallaxLayer2Enable);
				float m_switch109_g59291 = _ParallaxLayer1MaskChannel;
				float2 vertexToFrag70_g59293 = IN.ase_texcoord8.xy;
				float2 temp_output_490_0_g59291 = vertexToFrag70_g59293;
				float4 tex2DNode71_g59291 = SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1MaskMap, sampler_ParallaxMap, temp_output_490_0_g59291, ddx( temp_output_490_0_g59291 ), ddy( temp_output_490_0_g59291 ) );
				float m_Red109_g59291 = ( tex2DNode71_g59291.r * tex2DNode71_g59291.r );
				float m_Green109_g59291 = ( tex2DNode71_g59291.g * tex2DNode71_g59291.g );
				float m_Blue109_g59291 = ( tex2DNode71_g59291.b * tex2DNode71_g59291.b );
				float m_Alpha109_g59291 = ( tex2DNode71_g59291.a * tex2DNode71_g59291.a );
				float localParallaxLayer1MaskChannelSwitch109_g59291 = ParallaxLayer1MaskChannelSwitch109_g59291( m_switch109_g59291 , m_Red109_g59291 , m_Green109_g59291 , m_Blue109_g59291 , m_Alpha109_g59291 );
				float lerpResult218_g59291 = lerp( localParallaxLayer1MaskChannelSwitch109_g59291 , ( 1.0 - localParallaxLayer1MaskChannelSwitch109_g59291 ) , _ParallaxLayer1MaskInverted);
				float saferPower352_g59291 = abs( max( saturate( (1.0 + (( 1.0 - lerpResult218_g59291 ) - _ParallaxLayer1BlendAmount) * (( 1.0 - _ParallaxLayer1BlendHardness ) - 1.0) / (0.0 - _ParallaxLayer1BlendAmount)) ) , 0.0 ) );
				float Layer1Mask257_g59291 = saturate( pow( saferPower352_g59291 , _ParallaxLayer1BlendFalloff ) );
				float3 lerpResult96_g59291 = lerp( temp_output_36_0_g59291 , ( lerpResult370_g59291 + lerpResult343_g59291 ) , Layer1Mask257_g59291);
				float temp_output_66_0_g59291 = ( _ParallaxLayerEnable + ( ( _CATEGORY_PARALLAXLAYER + _SPACE_PARALLAXLAYER ) * 0.0 ) );
				float3 lerpResult58_g59291 = lerp( temp_output_36_0_g59291 , lerpResult96_g59291 , temp_output_66_0_g59291);
				
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float3 BaseColor = lerpResult58_g59291;
				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;

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
			#define _EMISSION
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
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_ParallaxLayer1MaskMap);
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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			float ParallaxLayer1MaskChannelSwitch109_g59291( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else if(m_switch ==3)
					return m_Alpha;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				float2 Offset235_g59293 = (_ParallaxLayer1MaskUVs).zw;
				float2 temp_output_41_0_g59293 = ( ( v.ase_texcoord.xy * ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) ) + Offset235_g59293 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g59293 = ( temp_output_41_0_g59293 - ( ( ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g59293;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_texcoord5.zw = v.ase_texcoord1.xy;
				o.ase_texcoord6.xy = v.ase_texcoord2.xy;
				o.ase_texcoord6.zw = v.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
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

				v.normalOS = lerpResult2758_g59191;
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

				float localStochasticTiling159_g59245 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord5.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord5.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord6.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord6.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), WorldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59245 = UVParallax2784_g59191;
				float4 TexelSize159_g59245 = _BumpMap_TexelSize;
				float4 Offsets159_g59245 = float4( 0,0,0,0 );
				float2 Weights159_g59245 = float2( 0,0 );
				{
				UV159_g59245 = UV159_g59245 * TexelSize159_g59245.zw - 0.5;
				float2 f = frac( UV159_g59245 );
				UV159_g59245 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59245.x - 0.5, UV159_g59245.x + 1.5, UV159_g59245.y - 0.5, UV159_g59245.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59245 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59245.xyxy;
				Weights159_g59245 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59246 = Offsets159_g59245;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59246 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59246 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59246 = Weights159_g59245;
				float2 break169_g59246 = Input_FetchWeights143_g59246;
				float4 lerpResult167_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult168_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult180_g59246 = lerp( lerpResult167_g59246 , lerpResult168_g59246 , break169_g59246.y);
				float4 Output_Fetch2DDerivative203_g59246 = lerpResult180_g59246;
				float4 NORMAL_RGBA1382_g59191 = Output_Fetch2DDerivative203_g59246;
				float3 unpack1891_g59191 = UnpackNormalScale( NORMAL_RGBA1382_g59191, _NormalStrength );
				unpack1891_g59191.z = lerp( 1, unpack1891_g59191.z, saturate(_NormalStrength) );
				float3 temp_output_132_0_g59291 = unpack1891_g59191;
				float3 _ParallaxLayer1NormalStrength = float3(0,0,1);
				float3 lerpResult373_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer1Enable);
				float3 lerpResult374_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer2Enable);
				float m_switch109_g59291 = _ParallaxLayer1MaskChannel;
				float2 vertexToFrag70_g59293 = IN.ase_texcoord8.xy;
				float2 temp_output_490_0_g59291 = vertexToFrag70_g59293;
				float4 tex2DNode71_g59291 = SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1MaskMap, sampler_ParallaxMap, temp_output_490_0_g59291, ddx( temp_output_490_0_g59291 ), ddy( temp_output_490_0_g59291 ) );
				float m_Red109_g59291 = ( tex2DNode71_g59291.r * tex2DNode71_g59291.r );
				float m_Green109_g59291 = ( tex2DNode71_g59291.g * tex2DNode71_g59291.g );
				float m_Blue109_g59291 = ( tex2DNode71_g59291.b * tex2DNode71_g59291.b );
				float m_Alpha109_g59291 = ( tex2DNode71_g59291.a * tex2DNode71_g59291.a );
				float localParallaxLayer1MaskChannelSwitch109_g59291 = ParallaxLayer1MaskChannelSwitch109_g59291( m_switch109_g59291 , m_Red109_g59291 , m_Green109_g59291 , m_Blue109_g59291 , m_Alpha109_g59291 );
				float lerpResult218_g59291 = lerp( localParallaxLayer1MaskChannelSwitch109_g59291 , ( 1.0 - localParallaxLayer1MaskChannelSwitch109_g59291 ) , _ParallaxLayer1MaskInverted);
				float saferPower352_g59291 = abs( max( saturate( (1.0 + (( 1.0 - lerpResult218_g59291 ) - _ParallaxLayer1BlendAmount) * (( 1.0 - _ParallaxLayer1BlendHardness ) - 1.0) / (0.0 - _ParallaxLayer1BlendAmount)) ) , 0.0 ) );
				float Layer1Mask257_g59291 = saturate( pow( saferPower352_g59291 , _ParallaxLayer1BlendFalloff ) );
				float3 lerpResult270_g59291 = lerp( temp_output_132_0_g59291 , BlendNormal( lerpResult373_g59291 , lerpResult374_g59291 ) , Layer1Mask257_g59291);
				float temp_output_66_0_g59291 = ( _ParallaxLayerEnable + ( ( _CATEGORY_PARALLAXLAYER + _SPACE_PARALLAXLAYER ) * 0.0 ) );
				float3 lerpResult142_g59291 = lerp( temp_output_132_0_g59291 , lerpResult270_g59291 , temp_output_66_0_g59291);
				
				float localStochasticTiling159_g59243 = ( 0.0 );
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float3 Normal = lerpResult142_g59291;
				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;

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
			#define _EMISSION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ParallaxLayer1Map);
			TEXTURE2D(_ParallaxLayer2Map);
			TEXTURE2D(_ParallaxLayer1MaskMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);


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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			float ParallaxLayer1MaskChannelSwitch109_g59291( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else if(m_switch ==3)
					return m_Alpha;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float2 Offset235_g59296 = (_ParallaxLayer1UVs).zw;
				float2 temp_output_41_0_g59296 = ( ( v.texcoord.xy * ( (_ParallaxLayer1UVs).xy / 1.0 ) ) + Offset235_g59296 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g59296 = ( temp_output_41_0_g59296 - ( ( ( (_ParallaxLayer1UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.xy = vertexToFrag70_g59296;
				float2 Offset235_g59299 = (_ParallaxLayer2UVs).zw;
				float2 temp_output_41_0_g59299 = ( ( v.texcoord.xy * ( (_ParallaxLayer2UVs).xy / 1.0 ) ) + Offset235_g59299 );
				float2 vertexToFrag70_g59299 = ( temp_output_41_0_g59299 - ( ( ( (_ParallaxLayer2UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.zw = vertexToFrag70_g59299;
				float2 Offset235_g59293 = (_ParallaxLayer1MaskUVs).zw;
				float2 temp_output_41_0_g59293 = ( ( v.texcoord.xy * ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) ) + Offset235_g59293 );
				float2 vertexToFrag70_g59293 = ( temp_output_41_0_g59293 - ( ( ( (_ParallaxLayer1MaskUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord11.xy = vertexToFrag70_g59293;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord8.zw = v.texcoord1.xy;
				o.ase_texcoord9.xy = v.texcoord2.xy;
				o.ase_texcoord9.zw = v.ase_texcoord3.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord11.zw = 0;
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

				v.normalOS = lerpResult2758_g59191;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

				float3 temp_output_1923_0_g59191 = (_BaseColor).rgb;
				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord8.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord8.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord9.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord9.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), WorldNormal, WorldViewDirection, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float3 ALBEDO_RGBA1381_g59191 = (Output_Fetch2DDerivative203_g59244).rgb;
				float3 temp_output_3_0_g59191 = ( temp_output_1923_0_g59191 * ALBEDO_RGBA1381_g59191 * _Brightness );
				float3 temp_output_36_0_g59291 = temp_output_3_0_g59191;
				float3 temp_output_19_0_g59302 = (_ParallaxLayer1Color).rgb;
				float temp_output_21_0_g59302 = _ParallaxLayer1EmissiveIntensity;
				float3 temp_output_26_0_g59302 = ( temp_output_19_0_g59302 * temp_output_21_0_g59302 );
				float3 temp_output_462_22_g59291 = temp_output_26_0_g59302;
				float2 vertexToFrag70_g59296 = IN.ase_texcoord10.xy;
				float2 temp_output_493_0_g59291 = vertexToFrag70_g59296;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 Offset149_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer1DepthScale ) + temp_output_493_0_g59291;
				float3 Layer1BaseColor260_g59291 = ( temp_output_462_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1Map, sampler_ParallaxMap, Offset149_g59291, ddx( temp_output_493_0_g59291 ), ddy( temp_output_493_0_g59291 ) )).rgb * _ParallaxLayer1Brightness );
				float3 lerpResult370_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , _ParallaxLayer1Enable);
				float3 temp_output_19_0_g59304 = (_ParallaxLayer2Color).rgb;
				float temp_output_21_0_g59304 = _ParallaxLayer2EmissiveIntensity;
				float3 temp_output_26_0_g59304 = ( temp_output_19_0_g59304 * temp_output_21_0_g59304 );
				float3 temp_output_481_22_g59291 = temp_output_26_0_g59304;
				float2 vertexToFrag70_g59299 = IN.ase_texcoord10.zw;
				float2 temp_output_494_0_g59291 = vertexToFrag70_g59299;
				float2 Offset7_g59291 = ( ( 0.0 - 1 ) * ase_tanViewDir.xy * _ParallaxLayer2DepthScale ) + temp_output_494_0_g59291;
				float3 Layer2BaseColor150_g59291 = ( temp_output_481_22_g59291 * (SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer2Map, sampler_ParallaxMap, Offset7_g59291, ddx( temp_output_494_0_g59291 ), ddy( temp_output_494_0_g59291 ) )).rgb * _ParallaxLayer2Brightness );
				float3 lerpResult343_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , _ParallaxLayer2Enable);
				float m_switch109_g59291 = _ParallaxLayer1MaskChannel;
				float2 vertexToFrag70_g59293 = IN.ase_texcoord11.xy;
				float2 temp_output_490_0_g59291 = vertexToFrag70_g59293;
				float4 tex2DNode71_g59291 = SAMPLE_TEXTURE2D_GRAD( _ParallaxLayer1MaskMap, sampler_ParallaxMap, temp_output_490_0_g59291, ddx( temp_output_490_0_g59291 ), ddy( temp_output_490_0_g59291 ) );
				float m_Red109_g59291 = ( tex2DNode71_g59291.r * tex2DNode71_g59291.r );
				float m_Green109_g59291 = ( tex2DNode71_g59291.g * tex2DNode71_g59291.g );
				float m_Blue109_g59291 = ( tex2DNode71_g59291.b * tex2DNode71_g59291.b );
				float m_Alpha109_g59291 = ( tex2DNode71_g59291.a * tex2DNode71_g59291.a );
				float localParallaxLayer1MaskChannelSwitch109_g59291 = ParallaxLayer1MaskChannelSwitch109_g59291( m_switch109_g59291 , m_Red109_g59291 , m_Green109_g59291 , m_Blue109_g59291 , m_Alpha109_g59291 );
				float lerpResult218_g59291 = lerp( localParallaxLayer1MaskChannelSwitch109_g59291 , ( 1.0 - localParallaxLayer1MaskChannelSwitch109_g59291 ) , _ParallaxLayer1MaskInverted);
				float saferPower352_g59291 = abs( max( saturate( (1.0 + (( 1.0 - lerpResult218_g59291 ) - _ParallaxLayer1BlendAmount) * (( 1.0 - _ParallaxLayer1BlendHardness ) - 1.0) / (0.0 - _ParallaxLayer1BlendAmount)) ) , 0.0 ) );
				float Layer1Mask257_g59291 = saturate( pow( saferPower352_g59291 , _ParallaxLayer1BlendFalloff ) );
				float3 lerpResult96_g59291 = lerp( temp_output_36_0_g59291 , ( lerpResult370_g59291 + lerpResult343_g59291 ) , Layer1Mask257_g59291);
				float temp_output_66_0_g59291 = ( _ParallaxLayerEnable + ( ( _CATEGORY_PARALLAXLAYER + _SPACE_PARALLAXLAYER ) * 0.0 ) );
				float3 lerpResult58_g59291 = lerp( temp_output_36_0_g59291 , lerpResult96_g59291 , temp_output_66_0_g59291);
				
				float localStochasticTiling159_g59245 = ( 0.0 );
				float2 UV159_g59245 = UVParallax2784_g59191;
				float4 TexelSize159_g59245 = _BumpMap_TexelSize;
				float4 Offsets159_g59245 = float4( 0,0,0,0 );
				float2 Weights159_g59245 = float2( 0,0 );
				{
				UV159_g59245 = UV159_g59245 * TexelSize159_g59245.zw - 0.5;
				float2 f = frac( UV159_g59245 );
				UV159_g59245 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59245.x - 0.5, UV159_g59245.x + 1.5, UV159_g59245.y - 0.5, UV159_g59245.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59245 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59245.xyxy;
				Weights159_g59245 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59246 = Offsets159_g59245;
				float2 temp_output_205_0_g59246 = UVParallaxDDX2785_g59191;
				float2 temp_output_206_0_g59246 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59246 = Weights159_g59245;
				float2 break169_g59246 = Input_FetchWeights143_g59246;
				float4 lerpResult167_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xw, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult168_g59246 = lerp( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).yz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, (Input_FetchOffsets70_g59246).xz, temp_output_205_0_g59246, temp_output_206_0_g59246 ) , break169_g59246.x);
				float4 lerpResult180_g59246 = lerp( lerpResult167_g59246 , lerpResult168_g59246 , break169_g59246.y);
				float4 Output_Fetch2DDerivative203_g59246 = lerpResult180_g59246;
				float4 NORMAL_RGBA1382_g59191 = Output_Fetch2DDerivative203_g59246;
				float3 unpack1891_g59191 = UnpackNormalScale( NORMAL_RGBA1382_g59191, _NormalStrength );
				unpack1891_g59191.z = lerp( 1, unpack1891_g59191.z, saturate(_NormalStrength) );
				float3 temp_output_132_0_g59291 = unpack1891_g59191;
				float3 _ParallaxLayer1NormalStrength = float3(0,0,1);
				float3 lerpResult373_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer1Enable);
				float3 lerpResult374_g59291 = lerp( float3( 0,0,1 ) , _ParallaxLayer1NormalStrength , _ParallaxLayer2Enable);
				float3 lerpResult270_g59291 = lerp( temp_output_132_0_g59291 , BlendNormal( lerpResult373_g59291 , lerpResult374_g59291 ) , Layer1Mask257_g59291);
				float3 lerpResult142_g59291 = lerp( temp_output_132_0_g59291 , lerpResult270_g59291 , temp_output_66_0_g59291);
				
				half4 color473_g59291 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_474_0_g59291 = (color473_g59291).rgb;
				float3 EmissionlLayer1464_g59291 = temp_output_462_22_g59291;
				float3 lerpResult465_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer1464_g59291 , _ParallaxLayer1Enable);
				float3 lerpResult484_g59291 = lerp( float3( 0,0,0 ) , Layer1BaseColor260_g59291 , Layer1Mask257_g59291);
				float3 lerpResult470_g59291 = lerp( temp_output_474_0_g59291 , lerpResult465_g59291 , lerpResult484_g59291);
				float3 EmissionlLayer2482_g59291 = temp_output_481_22_g59291;
				float3 lerpResult468_g59291 = lerp( float3( 0,0,0 ) , EmissionlLayer2482_g59291 , _ParallaxLayer2Enable);
				float3 lerpResult485_g59291 = lerp( float3( 0,0,0 ) , Layer2BaseColor150_g59291 , Layer1Mask257_g59291);
				float3 lerpResult475_g59291 = lerp( temp_output_474_0_g59291 , lerpResult468_g59291 , lerpResult485_g59291);
				float3 lerpResult472_g59291 = lerp( temp_output_474_0_g59291 , ( lerpResult470_g59291 + lerpResult475_g59291 ) , temp_output_66_0_g59291);
				
				float localStochasticTiling159_g59247 = ( 0.0 );
				float2 UV159_g59247 = UVParallax2784_g59191;
				float4 TexelSize159_g59247 = _MaskMap_TexelSize;
				float4 Offsets159_g59247 = float4( 0,0,0,0 );
				float2 Weights159_g59247 = float2( 0,0 );
				{
				UV159_g59247 = UV159_g59247 * TexelSize159_g59247.zw - 0.5;
				float2 f = frac( UV159_g59247 );
				UV159_g59247 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59247.x - 0.5, UV159_g59247.x + 1.5, UV159_g59247.y - 0.5, UV159_g59247.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59247 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59247.xyxy;
				Weights159_g59247 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59248 = Offsets159_g59247;
				float2 temp_output_205_0_g59248 = UVParallaxDDX2785_g59191;
				float2 temp_output_206_0_g59248 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59248 = Weights159_g59247;
				float2 break169_g59248 = Input_FetchWeights143_g59248;
				float4 lerpResult167_g59248 = lerp( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).yw, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).xw, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , break169_g59248.x);
				float4 lerpResult168_g59248 = lerp( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).yz, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, (Input_FetchOffsets70_g59248).xz, temp_output_205_0_g59248, temp_output_206_0_g59248 ) , break169_g59248.x);
				float4 lerpResult180_g59248 = lerp( lerpResult167_g59248 , lerpResult168_g59248 , break169_g59248.y);
				float4 Output_Fetch2DDerivative203_g59248 = lerpResult180_g59248;
				float4 break50_g59248 = Output_Fetch2DDerivative203_g59248;
				float MASK_B1377_g59191 = break50_g59248.b;
				float temp_output_129_0_g59291 = ( _MetallicStrength * MASK_B1377_g59191 );
				float lerpResult378_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult379_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult278_g59291 = lerp( temp_output_129_0_g59291 , ( lerpResult378_g59291 + lerpResult379_g59291 ) , Layer1Mask257_g59291);
				float lerpResult139_g59291 = lerp( temp_output_129_0_g59291 , lerpResult278_g59291 , temp_output_66_0_g59291);
				
				float MASK_G158_g59191 = break50_g59248.g;
				float temp_output_2651_0_g59191 = ( 1.0 - MASK_G158_g59191 );
				float lerpResult2650_g59191 = lerp( MASK_G158_g59191 , temp_output_2651_0_g59191 , _SmoothnessSource);
				float temp_output_2693_0_g59191 = ( lerpResult2650_g59191 * _SmoothnessStrength );
				float2 appendResult2645_g59191 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g59191 = (float3(appendResult2645_g59191 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g59191 = unpack1891_g59191;
				float3 normalizeResult2641_g59191 = normalize( ( ( WorldTangent * break2680_g59191.x ) + ( WorldBiTangent * break2680_g59191.y ) + ( WorldNormal * break2680_g59191.z ) ) );
				float3 Normal_Per_Pixel2690_g59191 = normalizeResult2641_g59191;
				float fresnelNdotV2685_g59191 = dot( normalize( Normal_Per_Pixel2690_g59191 ), appendResult2644_g59191 );
				float fresnelNode2685_g59191 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g59191 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g59191 = lerp( temp_output_2693_0_g59191 , ( temp_output_2693_0_g59191 - fresnelNode2685_g59191 ) , _SmoothnessFresnelEnable);
				float temp_output_123_0_g59291 = saturate( lerpResult2636_g59191 );
				float lerpResult388_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult387_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult290_g59291 = lerp( temp_output_123_0_g59291 , ( lerpResult388_g59291 + lerpResult387_g59291 ) , Layer1Mask257_g59291);
				float lerpResult138_g59291 = lerp( temp_output_123_0_g59291 , lerpResult290_g59291 , temp_output_66_0_g59291);
				
				float MASK_R1378_g59191 = break50_g59248.r;
				float lerpResult3415_g59191 = lerp( 1.0 , MASK_R1378_g59191 , _OcclusionStrengthAO);
				float lerpResult3414_g59191 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g59191 = lerp( lerpResult3415_g59191 , lerpResult3414_g59191 , _OcclusionSource);
				float temp_output_2730_0_g59191 = saturate( lerpResult2709_g59191 );
				float temp_output_130_0_g59291 = temp_output_2730_0_g59191;
				float lerpResult391_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer1Enable);
				float lerpResult392_g59291 = lerp( 0.0 , 0.0 , _ParallaxLayer2Enable);
				float lerpResult296_g59291 = lerp( temp_output_130_0_g59291 , ( lerpResult391_g59291 + lerpResult392_g59291 ) , Layer1Mask257_g59291);
				float lerpResult140_g59291 = lerp( temp_output_130_0_g59291 , lerpResult296_g59291 , temp_output_66_0_g59291);
				
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , WorldViewDirection );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				float3 BaseColor = lerpResult58_g59291;
				float3 Normal = lerpResult142_g59291;
				float3 Emission = lerpResult472_g59291;
				float3 Specular = 0.5;
				float Metallic = lerpResult139_g59291;
				float Smoothness = lerpResult138_g59291;
				float Occlusion = lerpResult140_g59291;
				float Alpha = temp_output_98_0_g59237;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
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
			#define _EMISSION
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


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				o.ase_texcoord5.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord.zw = v.ase_texcoord1.xy;
				o.ase_texcoord1.xy = v.ase_texcoord2.xy;
				o.ase_texcoord1.zw = v.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

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

				v.normalOS = lerpResult2758_g59191;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord1.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord1.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				surfaceDescription.Alpha = temp_output_98_0_g59237;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
			#define _EMISSION
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


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ParallaxMap_ST;
			float4 _ParallaxLayer2UVs;
			half4 _ParallaxLayer2Color;
			float4 _BumpMap_TexelSize;
			float4 _ParallaxLayer1UVs;
			half4 _ParallaxLayer1Color;
			float4 _MainTex_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _MainUVs;
			float4 _ParallaxLayer1MaskUVs;
			half4 _BaseColor;
			float4 _AlphaRemap;
			half _SmoothnessFresnelPower;
			half _ParallaxLayer1BlendAmount;
			half _ParallaxLayer1BlendHardness;
			half _ParallaxLayer1BlendFalloff;
			half _GlancingClipMode;
			half _ParallaxLayerEnable;
			float _AlphaRemapMax;
			float _CATEGORY_PARALLAXLAYER;
			float _SPACE_PARALLAXLAYER;
			float _AlphaRemapMin;
			half _NormalStrength;
			half _OcclusionSource;
			float _MetallicStrength;
			half _OcclusionStrengthAO;
			half _ParallaxLayer1MaskInverted;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelEnable;
			int _Cull;
			half _ParallaxLayer2DepthScale;
			half _ParallaxLayer2Enable;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _ParallaxHeightScale;
			float _ParallaxSamplesMin;
			half _ParallaxLayer1MaskChannel;
			float _ParallaxSamplesMax;
			half _ParallaxReferencePlane;
			half _Brightness;
			half _ParallaxLayer1EmissiveIntensity;
			half _ParallaxLayer1DepthScale;
			half _ParallaxLayer1Brightness;
			half _ParallaxLayer1Enable;
			half _ParallaxLayer2EmissiveIntensity;
			float _CATEGORY_ALPHACLIPPING;
			half _ParallaxLayer2Brightness;
			int _ParallaxSidewallStepsMax;
			float _SPACE_ALPHACLIP;
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

			TEXTURE2D(_MainTex);
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_ParallaxMap);
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
			
			float2 float2switchUVMode80_g59269( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			inline float2 POM( TEXTURE2D(heightMap), SAMPLER(samplerheightMap), float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + currTexOffset, dx, dy ).b;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = sidewallSteps;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = SAMPLE_TEXTURE2D_GRAD( heightMap, samplerheightMap, uvs + finalTexOffset, dx, dy ).b;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult2768_g59191 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult2758_g59191 = lerp( v.normalOS , -v.normalOS , step( dotResult2768_g59191 , -1.0 ));
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				o.ase_texcoord5.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord.zw = v.ase_texcoord1.xy;
				o.ase_texcoord1.xy = v.ase_texcoord2.xy;
				o.ase_texcoord1.zw = v.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

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

				v.normalOS = lerpResult2758_g59191;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localStochasticTiling159_g59243 = ( 0.0 );
				float m_switch80_g59269 = _UVMode;
				float2 m_UV080_g59269 = IN.ase_texcoord.xy;
				float2 m_UV180_g59269 = IN.ase_texcoord.zw;
				float2 m_UV280_g59269 = IN.ase_texcoord1.xy;
				float2 m_UV380_g59269 = IN.ase_texcoord1.zw;
				float2 localfloat2switchUVMode80_g59269 = float2switchUVMode80_g59269( m_switch80_g59269 , m_UV080_g59269 , m_UV180_g59269 , m_UV280_g59269 , m_UV380_g59269 );
				float2 temp_output_1955_0_g59191 = (_MainUVs).xy;
				float2 temp_output_1953_0_g59191 = (_MainUVs).zw;
				float2 Offset235_g59269 = temp_output_1953_0_g59191;
				float2 temp_output_41_0_g59269 = ( ( localfloat2switchUVMode80_g59269 * temp_output_1955_0_g59191 ) + Offset235_g59269 );
				float2 temp_output_2089_0_g59191 = temp_output_41_0_g59269;
				float2 temp_output_194_0_g59285 = temp_output_2089_0_g59191;
				float temp_output_195_0_g59285 = _ParallaxHeightScale;
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float temp_output_419_0_g59285 = _ParallaxSamplesMin;
				float temp_output_420_0_g59285 = _ParallaxSamplesMax;
				int ParallaxSidewallSteps3386_g59191 = _ParallaxSidewallStepsMax;
				float temp_output_421_0_g59285 = (float)ParallaxSidewallSteps3386_g59191;
				float temp_output_196_0_g59285 = _ParallaxReferencePlane;
				float2 OffsetPOM354_g59285 = POM( _ParallaxMap, sampler_ParallaxMap, temp_output_194_0_g59285, ddx(temp_output_194_0_g59285), ddy(temp_output_194_0_g59285), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, (int)temp_output_419_0_g59285, (int)temp_output_420_0_g59285, (int)temp_output_421_0_g59285, temp_output_195_0_g59285, temp_output_196_0_g59285, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 UVParallax2784_g59191 = OffsetPOM354_g59285;
				float2 UV159_g59243 = UVParallax2784_g59191;
				float4 TexelSize159_g59243 = _MainTex_TexelSize;
				float4 Offsets159_g59243 = float4( 0,0,0,0 );
				float2 Weights159_g59243 = float2( 0,0 );
				{
				UV159_g59243 = UV159_g59243 * TexelSize159_g59243.zw - 0.5;
				float2 f = frac( UV159_g59243 );
				UV159_g59243 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g59243.x - 0.5, UV159_g59243.x + 1.5, UV159_g59243.y - 0.5, UV159_g59243.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g59243 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g59243.xyxy;
				Weights159_g59243 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g59244 = Offsets159_g59243;
				float2 UVParallaxDDX2785_g59191 = ddx( temp_output_194_0_g59285 );
				float2 temp_output_205_0_g59244 = UVParallaxDDX2785_g59191;
				float2 UVParallaxDDY2801_g59191 = ddy( temp_output_194_0_g59285 );
				float2 temp_output_206_0_g59244 = UVParallaxDDY2801_g59191;
				float2 Input_FetchWeights143_g59244 = Weights159_g59243;
				float2 break169_g59244 = Input_FetchWeights143_g59244;
				float4 lerpResult167_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xw, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult168_g59244 = lerp( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).yz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, (Input_FetchOffsets70_g59244).xz, temp_output_205_0_g59244, temp_output_206_0_g59244 ) , break169_g59244.x);
				float4 lerpResult180_g59244 = lerp( lerpResult167_g59244 , lerpResult168_g59244 , break169_g59244.y);
				float4 Output_Fetch2DDerivative203_g59244 = lerpResult180_g59244;
				float4 break50_g59244 = Output_Fetch2DDerivative203_g59244;
				float temp_output_22_0_g59237 = break50_g59244.a;
				float temp_output_22_0_g59239 = temp_output_22_0_g59237;
				float3 temp_output_95_0_g59241 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g59241 = normalize( temp_output_95_0_g59241 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g59237 = dot( normalizeResult96_g59241 , ase_worldViewDir );
				float temp_output_76_0_g59237 = ( 1.0 - abs( dotResult74_g59237 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g59237 = 1.0;
				#else
				float staticSwitch281_g59237 = ( 1.0 - ( temp_output_76_0_g59237 * temp_output_76_0_g59237 ) );
				#endif
				float lerpResult80_g59237 = lerp( 1.0 , staticSwitch281_g59237 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g59237 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g59239 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g59239 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g59237 );
				

				surfaceDescription.Alpha = temp_output_98_0_g59237;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
Node;AmplifyShaderEditor.IntNode;1904;-7296,-4688;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;1;;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;1994;-8016,-4608;Inherit;False;DESF Core Lit;1;;59191;e0cdd7758f4404849b063afff4596424;39,442,2,1557,0,1749,0,1556,0,2284,4,2283,4,2213,4,2481,4,2411,4,2399,4,2172,4,2282,4,3300,4,3301,4,3299,4,2132,4,3146,4,2311,4,3108,0,3119,0,3076,0,3408,0,3291,0,3290,0,3289,0,3287,0,96,0,2591,0,2559,0,1368,0,2125,0,2131,0,2028,0,1333,0,2126,0,1896,0,1415,0,830,0,2523,1;1;1234;FLOAT3;0,0,0;False;17;FLOAT3;38;FLOAT3;35;FLOAT;37;FLOAT3;1922;FLOAT;33;FLOAT;34;FLOAT;46;FLOAT;814;FLOAT;1660;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;FLOAT3;2760;SAMPLERSTATE;1819;SAMPLERSTATE;1824;SAMPLERSTATE;1818
Node;AmplifyShaderEditor.FunctionNode;1973;-7616,-4640;Inherit;False;DESF Module Parallax Layer;161;;59291;000e5ddf988d23c439fa22de07f30a3e;0;7;36;FLOAT3;0,0,0;False;132;FLOAT3;0,0,0;False;129;FLOAT;0;False;131;FLOAT;0;False;123;FLOAT;0;False;130;FLOAT;0;False;50;SAMPLERSTATE;;False;7;FLOAT3;0;FLOAT3;128;FLOAT3;463;FLOAT;125;FLOAT;127;FLOAT;124;FLOAT;126
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1984;-7347.146,-4608;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1986;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1987;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1988;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1989;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1990;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1991;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1992;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1993;-7347.146,-4686.959;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1985;-7296,-4608;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Parallax/Surface Occlusion Layer;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;1973;36;1994;38
WireConnection;1973;132;1994;35
WireConnection;1973;129;1994;37
WireConnection;1973;131;1994;1922
WireConnection;1973;123;1994;33
WireConnection;1973;130;1994;34
WireConnection;1973;50;1994;1818
WireConnection;1985;0;1973;0
WireConnection;1985;1;1973;128
WireConnection;1985;2;1973;463
WireConnection;1985;3;1973;125
WireConnection;1985;4;1973;124
WireConnection;1985;5;1973;126
WireConnection;1985;6;1994;46
WireConnection;1985;10;1994;2760
ASEEND*/
//CHKSM=7206EAD9C8860C37091BAD1680FFF45518E8515D