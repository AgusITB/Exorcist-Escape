// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Cutout/Emission Panning"
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
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 2
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(EMISSION,true,_EmissiveEnable,0,0)]_CATEGORY_EMISSION("CATEGORY_EMISSION", Float) = 0
		[DE_DrawerToggleLeft]_EmissiveEnable("ENABLE EMISSION", Float) = 0
		[DE_DrawerToggleNoKeyword]_EmissiveisGlobal("Emissive is Global", Float) = 0
		[DE_DrawerFloatEnum(Front _Back _Both)]_EmissiveRenderFace("Emissive Render Face", Float) = 2
		[DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
		_EmissiveAffectAlbedoBias("Emissive Affect Albedo Bias", Range( 0 , 1)) = 0
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerToggleLeft][Space(10)]_EmissiveMapEnable("ENABLE EMISSION MAP", Float) = 0
		[HDR][DE_DrawerTextureSingleLine]_EmissiveColorMap("Emission Map", 2D) = "white" {}
		[HDR]_EmissivePanningColor("Emissive Color", Color) = (0,0,0,0)
		[DE_DrawerToggleNoKeyword]_EmissivePanningisGlobal("Emissive is Global", Float) = 0
		[DE_DrawerToggleNoKeyword]_EmissiveColorMapInverted("Emission Map is Inverted", Float) = 0
		_EmissivePanningIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerTilingOffset]_EmissiveColorMapUVs("EmissiveColorMap UVs", Vector) = (1,1,0,0)
		_EmissivePanningRotation("Rotation", Float) = 0
		_EmissivePanningSpeedX("Panning Speed X", Float) = 0
		_EmissivePanningSpeedY("Panning Speed Y", Float) = 0
		[DE_DrawerToggleLeft][Space(10)]_EmissiveColorMaskingEnable("ENABLE EMISSION MASKING COLOR", Float) = 0
		_EmissiveColorMaskingColor("Masking Color", Color) = (0.5019608,0,0,0)
		_EmissiveColorMaskingRange("Masking Range", Range( 0 , 1)) = 0.1
		_EmissiveColorMaskingFuzziness("Masking Fuzziness", Range( 0 , 1)) = 0.1
		[DE_DrawerToggleLeft][Space(10)]_EmissiveGlowEnable("ENABLE EMISSION GLOW", Float) = 0
		[DE_DrawerToggleNoKeyword]_EmissiveGlowisGlobal("Emissive is Global", Float) = 0
		[HDR]_EmissiveGlowColor("Emissive Color Glow", Color) = (0,0,0,0)
		_EmissiveGlowIntensity("Emissive Intensity", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_EMISSION("SPACE_EMISSION", Float) = 0


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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
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
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			float _GlobalEmissionIntensity;
			float _GlobalEmissionEnabled;
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			float3 EmissiveCullfloat3switch( float m_switch, float3 m_Front, float3 m_Back, float3 m_Both )
			{
				if(m_switch ==0)
					return m_Front;
				else if(m_switch ==1)
					return m_Back;
				else if(m_switch ==2)
					return m_Both;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.texcoord.xy;
				float2 m_UV180_g58525 = v.texcoord1.xy;
				float2 m_UV280_g58525 = v.texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord8.xy = vertexToFrag70_g58525;
				float temp_output_6_0_g58596 = _EmissivePanningRotation;
				float temp_output_200_0_g58596 = radians( temp_output_6_0_g58596 );
				float temp_output_13_0_g58596 = cos( temp_output_200_0_g58596 );
				float2 temp_output_9_0_g58596 = float2( 0.5,0.5 );
				float2 break39_g58596 = ( v.texcoord.xy - temp_output_9_0_g58596 );
				float temp_output_14_0_g58596 = sin( temp_output_200_0_g58596 );
				float2 appendResult36_g58596 = (float2(( ( temp_output_13_0_g58596 * break39_g58596.x ) + ( temp_output_14_0_g58596 * break39_g58596.y ) ) , ( ( temp_output_13_0_g58596 * break39_g58596.y ) - ( temp_output_14_0_g58596 * break39_g58596.x ) )));
				float2 temp_output_657_0_g58567 = (_EmissiveColorMapUVs).xy;
				float2 temp_output_658_0_g58567 = (_EmissiveColorMapUVs).zw;
				float2 Offset235_g58596 = temp_output_658_0_g58567;
				float Time63_g58596 = _TimeParameters.x;
				float2 appendResult201_g58596 = (float2(_EmissivePanningSpeedX , _EmissivePanningSpeedY));
				float2 temp_output_41_0_g58596 = ( ( ( appendResult36_g58596 * ( temp_output_657_0_g58567 / 1.0 ) ) + temp_output_9_0_g58596 ) + ( Offset235_g58596 + ( Time63_g58596 * appendResult201_g58596 ) ) );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58596 = ( temp_output_41_0_g58596 - ( ( ( temp_output_657_0_g58567 / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g58596;
				
				o.ase_color = v.ase_color;

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

				float3 temp_output_1923_0_g44920 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord8.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float3 ALBEDO_RGBA1381_g44920 = (tex2DNode2048_g44920).rgb;
				float3 temp_output_3_0_g44920 = ( temp_output_1923_0_g44920 * ALBEDO_RGBA1381_g44920 * _Brightness );
				float3 temp_output_83_0_g58567 = temp_output_3_0_g44920;
				float m_switch1_g58569 = _EmissiveRenderFace;
				float3 temp_output_696_0_g58567 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g58587 = temp_output_696_0_g58567;
				float temp_output_21_0_g58587 = _EmissiveIntensity;
				float lerpResult6_g58587 = lerp( temp_output_21_0_g58587 , ( temp_output_21_0_g58587 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58587 = lerp( temp_output_21_0_g58587 , lerpResult6_g58587 , _EmissiveisGlobal);
				float3 temp_output_2_0_g58587 = ( temp_output_19_0_g58587 * lerpResult9_g58587 );
				float3 EMISSION_TINT111_g58567 = temp_output_2_0_g58587;
				float3 temp_output_693_0_g58567 = (_EmissivePanningColor).rgb;
				float3 temp_output_19_0_g58585 = temp_output_693_0_g58567;
				float temp_output_21_0_g58585 = _EmissivePanningIntensity;
				float lerpResult6_g58585 = lerp( temp_output_21_0_g58585 , ( temp_output_21_0_g58585 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58585 = lerp( temp_output_21_0_g58585 , lerpResult6_g58585 , _EmissivePanningisGlobal);
				float3 temp_output_2_0_g58585 = ( temp_output_19_0_g58585 * lerpResult9_g58585 );
				float3 EMISSION_TINTPANNING412_g58567 = temp_output_2_0_g58585;
				float2 vertexToFrag70_g58596 = IN.ase_texcoord8.zw;
				float4 tex2DNode309_g58567 = SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, vertexToFrag70_g58596 );
				float3 temp_output_685_0_g58567 = (tex2DNode309_g58567).rgb;
				float3 lerpResult652_g58567 = lerp( temp_output_685_0_g58567 , ( 1.0 - temp_output_685_0_g58567 ) , _EmissiveColorMapInverted);
				float3 lerpResult136_g58567 = lerp( EMISSION_TINT111_g58567 , EMISSION_TINTPANNING412_g58567 , lerpResult652_g58567);
				float3 lerpResult202_g58567 = lerp( EMISSION_TINT111_g58567 , lerpResult136_g58567 , _EmissiveMapEnable);
				float3 Albedo_In99_g58567 = temp_output_83_0_g58567;
				float3 lerpResult369_g58567 = lerp( Albedo_In99_g58567 , lerpResult202_g58567 , saturate( ( 1.0 - ( ( distance( (_EmissiveColorMaskingColor).rgb , Albedo_In99_g58567 ) - _EmissiveColorMaskingRange ) / max( _EmissiveColorMaskingFuzziness , 1E-05 ) ) ) ));
				float3 lerpResult374_g58567 = lerp( lerpResult202_g58567 , lerpResult369_g58567 , _EmissiveColorMaskingEnable);
				float3 temp_output_690_0_g58567 = (_EmissiveGlowColor).rgb;
				float3 temp_output_19_0_g58582 = temp_output_690_0_g58567;
				float temp_output_21_0_g58582 = _EmissiveGlowIntensity;
				float lerpResult6_g58582 = lerp( temp_output_21_0_g58582 , ( temp_output_21_0_g58582 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58582 = lerp( temp_output_21_0_g58582 , lerpResult6_g58582 , _EmissiveGlowisGlobal);
				float3 temp_output_2_0_g58582 = ( temp_output_19_0_g58582 * lerpResult9_g58582 );
				float3 EMISSION_TINTGLOW158_g58567 = temp_output_2_0_g58582;
				float4 NORMAL_RGBA1382_g44920 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g44920 );
				float3 unpack1891_g44920 = UnpackNormalScale( NORMAL_RGBA1382_g44920, _NormalStrength );
				unpack1891_g44920.z = lerp( 1, unpack1891_g44920.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58217 = unpack1891_g44920;
				float temp_output_50_0_g58217 = _DoubleSidedNormalMode;
				float m_switch64_g58217 = temp_output_50_0_g58217;
				float3 m_Flip64_g58217 = float3(-1,-1,-1);
				float3 m_Mirror64_g58217 = float3(1,1,-1);
				float3 m_None64_g58217 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58217 = _NormalModefloat3switch( m_switch64_g58217 , m_Flip64_g58217 , m_Mirror64_g58217 , m_None64_g58217 );
				float3 switchResult58_g58217 = (((ase_vface>0)?(temp_output_24_0_g58217):(( temp_output_24_0_g58217 * local_NormalModefloat3switch64_g58217 ))));
				float3 temp_output_2895_35 = switchResult58_g58217;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal190_g58567 = temp_output_2895_35;
				float fresnelNdotV190_g58567 = dot( float3(dot(tanToWorld0,tanNormal190_g58567), dot(tanToWorld1,tanNormal190_g58567), dot(tanToWorld2,tanNormal190_g58567)), WorldViewDirection );
				float fresnelNode190_g58567 = ( 0.0 + 0.17 * pow( max( 1.0 - fresnelNdotV190_g58567 , 0.0001 ), 5.0 ) );
				float3 lerpResult195_g58567 = lerp( lerpResult374_g58567 , EMISSION_TINTGLOW158_g58567 , fresnelNode190_g58567);
				float3 lerpResult185_g58567 = lerp( lerpResult374_g58567 , lerpResult195_g58567 , _EmissiveGlowEnable);
				float3 temp_output_7_0_g58569 = lerpResult185_g58567;
				half4 color5_g58569 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_6_0_g58569 = (color5_g58569).rgb;
				float dotResult8_g58572 = dot( WorldNormal , WorldViewDirection );
				float temp_output_18_0_g58569 = (1.0 + (sign( dotResult8_g58572 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult15_g58569 = lerp( temp_output_7_0_g58569 , temp_output_6_0_g58569 , temp_output_18_0_g58569);
				float3 m_Front1_g58569 = lerpResult15_g58569;
				float3 lerpResult16_g58569 = lerp( temp_output_6_0_g58569 , temp_output_7_0_g58569 , temp_output_18_0_g58569);
				float3 m_Back1_g58569 = lerpResult16_g58569;
				float3 m_Both1_g58569 = temp_output_7_0_g58569;
				float3 localEmissiveCullfloat3switch1_g58569 = EmissiveCullfloat3switch( m_switch1_g58569 , m_Front1_g58569 , m_Back1_g58569 , m_Both1_g58569 );
				float3 temp_output_507_0_g58567 = localEmissiveCullfloat3switch1_g58569;
				float3 lerpResult378_g58567 = lerp( temp_output_83_0_g58567 , ( temp_output_83_0_g58567 * saturate( temp_output_507_0_g58567 ) ) , _EmissiveAffectAlbedoBias);
				float temp_output_674_0_g58567 = ( _EmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION + _EmissionFlags ) * 0.0 ) );
				float3 lerpResult384_g58567 = lerp( temp_output_83_0_g58567 , lerpResult378_g58567 , temp_output_674_0_g58567);
				
				half4 color26_g58567 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_489_0_g58567 = (color26_g58567).rgb;
				float3 lerpResult65_g58567 = lerp( temp_output_489_0_g58567 , temp_output_507_0_g58567 , temp_output_674_0_g58567);
				
				float4 tex2DNode2050_g44920 = SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, UV213_g44920 );
				float MASK_B1377_g44920 = tex2DNode2050_g44920.b;
				
				float MASK_G158_g44920 = tex2DNode2050_g44920.g;
				float temp_output_2651_0_g44920 = ( 1.0 - MASK_G158_g44920 );
				float lerpResult2650_g44920 = lerp( MASK_G158_g44920 , temp_output_2651_0_g44920 , _SmoothnessSource);
				float temp_output_2693_0_g44920 = ( lerpResult2650_g44920 * _SmoothnessStrength );
				float2 appendResult2645_g44920 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g44920 = (float3(appendResult2645_g44920 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g44920 = unpack1891_g44920;
				float3 normalizeResult2641_g44920 = normalize( ( ( WorldTangent * break2680_g44920.x ) + ( WorldBiTangent * break2680_g44920.y ) + ( WorldNormal * break2680_g44920.z ) ) );
				float3 Normal_Per_Pixel2690_g44920 = normalizeResult2641_g44920;
				float fresnelNdotV2685_g44920 = dot( normalize( Normal_Per_Pixel2690_g44920 ), appendResult2644_g44920 );
				float fresnelNode2685_g44920 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g44920 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g44920 = lerp( temp_output_2693_0_g44920 , ( temp_output_2693_0_g44920 - fresnelNode2685_g44920 ) , _SmoothnessFresnelEnable);
				
				float MASK_R1378_g44920 = tex2DNode2050_g44920.r;
				float lerpResult3415_g44920 = lerp( 1.0 , MASK_R1378_g44920 , _OcclusionStrengthAO);
				float lerpResult3414_g44920 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g44920 = lerp( lerpResult3415_g44920 , lerpResult3414_g44920 , _OcclusionSource);
				float temp_output_2730_0_g44920 = saturate( lerpResult2709_g44920 );
				
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , WorldViewDirection );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float3 BaseColor = lerpResult384_g58567;
				float3 Normal = temp_output_2895_35;
				float3 Emission = lerpResult65_g58567;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g44920 );
				float Smoothness = saturate( lerpResult2636_g44920 );
				float Occlusion = temp_output_2730_0_g44920;
				float Alpha = temp_output_98_0_g58267;
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
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord3.xy = vertexToFrag70_g58525;
				
				
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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord3.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float Alpha = temp_output_98_0_g58267;
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
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord3.xy = vertexToFrag70_g58525;
				
				
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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord3.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float Alpha = temp_output_98_0_g58267;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			float _GlobalEmissionIntensity;
			float _GlobalEmissionEnabled;
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			float3 EmissiveCullfloat3switch( float m_switch, float3 m_Front, float3 m_Back, float3 m_Both )
			{
				if(m_switch ==0)
					return m_Front;
				else if(m_switch ==1)
					return m_Back;
				else if(m_switch ==2)
					return m_Both;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.texcoord0.xy;
				float2 m_UV180_g58525 = v.texcoord1.xy;
				float2 m_UV280_g58525 = v.texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord4.xy = vertexToFrag70_g58525;
				float temp_output_6_0_g58596 = _EmissivePanningRotation;
				float temp_output_200_0_g58596 = radians( temp_output_6_0_g58596 );
				float temp_output_13_0_g58596 = cos( temp_output_200_0_g58596 );
				float2 temp_output_9_0_g58596 = float2( 0.5,0.5 );
				float2 break39_g58596 = ( v.texcoord0.xy - temp_output_9_0_g58596 );
				float temp_output_14_0_g58596 = sin( temp_output_200_0_g58596 );
				float2 appendResult36_g58596 = (float2(( ( temp_output_13_0_g58596 * break39_g58596.x ) + ( temp_output_14_0_g58596 * break39_g58596.y ) ) , ( ( temp_output_13_0_g58596 * break39_g58596.y ) - ( temp_output_14_0_g58596 * break39_g58596.x ) )));
				float2 temp_output_657_0_g58567 = (_EmissiveColorMapUVs).xy;
				float2 temp_output_658_0_g58567 = (_EmissiveColorMapUVs).zw;
				float2 Offset235_g58596 = temp_output_658_0_g58567;
				float Time63_g58596 = _TimeParameters.x;
				float2 appendResult201_g58596 = (float2(_EmissivePanningSpeedX , _EmissivePanningSpeedY));
				float2 temp_output_41_0_g58596 = ( ( ( appendResult36_g58596 * ( temp_output_657_0_g58567 / 1.0 ) ) + temp_output_9_0_g58596 ) + ( Offset235_g58596 + ( Time63_g58596 * appendResult201_g58596 ) ) );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58596 = ( temp_output_41_0_g58596 - ( ( ( temp_output_657_0_g58567 / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.zw = vertexToFrag70_g58596;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				
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

				float3 temp_output_1923_0_g44920 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord4.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float3 ALBEDO_RGBA1381_g44920 = (tex2DNode2048_g44920).rgb;
				float3 temp_output_3_0_g44920 = ( temp_output_1923_0_g44920 * ALBEDO_RGBA1381_g44920 * _Brightness );
				float3 temp_output_83_0_g58567 = temp_output_3_0_g44920;
				float m_switch1_g58569 = _EmissiveRenderFace;
				float3 temp_output_696_0_g58567 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g58587 = temp_output_696_0_g58567;
				float temp_output_21_0_g58587 = _EmissiveIntensity;
				float lerpResult6_g58587 = lerp( temp_output_21_0_g58587 , ( temp_output_21_0_g58587 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58587 = lerp( temp_output_21_0_g58587 , lerpResult6_g58587 , _EmissiveisGlobal);
				float3 temp_output_2_0_g58587 = ( temp_output_19_0_g58587 * lerpResult9_g58587 );
				float3 EMISSION_TINT111_g58567 = temp_output_2_0_g58587;
				float3 temp_output_693_0_g58567 = (_EmissivePanningColor).rgb;
				float3 temp_output_19_0_g58585 = temp_output_693_0_g58567;
				float temp_output_21_0_g58585 = _EmissivePanningIntensity;
				float lerpResult6_g58585 = lerp( temp_output_21_0_g58585 , ( temp_output_21_0_g58585 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58585 = lerp( temp_output_21_0_g58585 , lerpResult6_g58585 , _EmissivePanningisGlobal);
				float3 temp_output_2_0_g58585 = ( temp_output_19_0_g58585 * lerpResult9_g58585 );
				float3 EMISSION_TINTPANNING412_g58567 = temp_output_2_0_g58585;
				float2 vertexToFrag70_g58596 = IN.ase_texcoord4.zw;
				float4 tex2DNode309_g58567 = SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, vertexToFrag70_g58596 );
				float3 temp_output_685_0_g58567 = (tex2DNode309_g58567).rgb;
				float3 lerpResult652_g58567 = lerp( temp_output_685_0_g58567 , ( 1.0 - temp_output_685_0_g58567 ) , _EmissiveColorMapInverted);
				float3 lerpResult136_g58567 = lerp( EMISSION_TINT111_g58567 , EMISSION_TINTPANNING412_g58567 , lerpResult652_g58567);
				float3 lerpResult202_g58567 = lerp( EMISSION_TINT111_g58567 , lerpResult136_g58567 , _EmissiveMapEnable);
				float3 Albedo_In99_g58567 = temp_output_83_0_g58567;
				float3 lerpResult369_g58567 = lerp( Albedo_In99_g58567 , lerpResult202_g58567 , saturate( ( 1.0 - ( ( distance( (_EmissiveColorMaskingColor).rgb , Albedo_In99_g58567 ) - _EmissiveColorMaskingRange ) / max( _EmissiveColorMaskingFuzziness , 1E-05 ) ) ) ));
				float3 lerpResult374_g58567 = lerp( lerpResult202_g58567 , lerpResult369_g58567 , _EmissiveColorMaskingEnable);
				float3 temp_output_690_0_g58567 = (_EmissiveGlowColor).rgb;
				float3 temp_output_19_0_g58582 = temp_output_690_0_g58567;
				float temp_output_21_0_g58582 = _EmissiveGlowIntensity;
				float lerpResult6_g58582 = lerp( temp_output_21_0_g58582 , ( temp_output_21_0_g58582 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58582 = lerp( temp_output_21_0_g58582 , lerpResult6_g58582 , _EmissiveGlowisGlobal);
				float3 temp_output_2_0_g58582 = ( temp_output_19_0_g58582 * lerpResult9_g58582 );
				float3 EMISSION_TINTGLOW158_g58567 = temp_output_2_0_g58582;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float4 NORMAL_RGBA1382_g44920 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g44920 );
				float3 unpack1891_g44920 = UnpackNormalScale( NORMAL_RGBA1382_g44920, _NormalStrength );
				unpack1891_g44920.z = lerp( 1, unpack1891_g44920.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58217 = unpack1891_g44920;
				float temp_output_50_0_g58217 = _DoubleSidedNormalMode;
				float m_switch64_g58217 = temp_output_50_0_g58217;
				float3 m_Flip64_g58217 = float3(-1,-1,-1);
				float3 m_Mirror64_g58217 = float3(1,1,-1);
				float3 m_None64_g58217 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58217 = _NormalModefloat3switch( m_switch64_g58217 , m_Flip64_g58217 , m_Mirror64_g58217 , m_None64_g58217 );
				float3 switchResult58_g58217 = (((ase_vface>0)?(temp_output_24_0_g58217):(( temp_output_24_0_g58217 * local_NormalModefloat3switch64_g58217 ))));
				float3 temp_output_2895_35 = switchResult58_g58217;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal190_g58567 = temp_output_2895_35;
				float fresnelNdotV190_g58567 = dot( float3(dot(tanToWorld0,tanNormal190_g58567), dot(tanToWorld1,tanNormal190_g58567), dot(tanToWorld2,tanNormal190_g58567)), ase_worldViewDir );
				float fresnelNode190_g58567 = ( 0.0 + 0.17 * pow( max( 1.0 - fresnelNdotV190_g58567 , 0.0001 ), 5.0 ) );
				float3 lerpResult195_g58567 = lerp( lerpResult374_g58567 , EMISSION_TINTGLOW158_g58567 , fresnelNode190_g58567);
				float3 lerpResult185_g58567 = lerp( lerpResult374_g58567 , lerpResult195_g58567 , _EmissiveGlowEnable);
				float3 temp_output_7_0_g58569 = lerpResult185_g58567;
				half4 color5_g58569 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_6_0_g58569 = (color5_g58569).rgb;
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58572 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_18_0_g58569 = (1.0 + (sign( dotResult8_g58572 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult15_g58569 = lerp( temp_output_7_0_g58569 , temp_output_6_0_g58569 , temp_output_18_0_g58569);
				float3 m_Front1_g58569 = lerpResult15_g58569;
				float3 lerpResult16_g58569 = lerp( temp_output_6_0_g58569 , temp_output_7_0_g58569 , temp_output_18_0_g58569);
				float3 m_Back1_g58569 = lerpResult16_g58569;
				float3 m_Both1_g58569 = temp_output_7_0_g58569;
				float3 localEmissiveCullfloat3switch1_g58569 = EmissiveCullfloat3switch( m_switch1_g58569 , m_Front1_g58569 , m_Back1_g58569 , m_Both1_g58569 );
				float3 temp_output_507_0_g58567 = localEmissiveCullfloat3switch1_g58569;
				float3 lerpResult378_g58567 = lerp( temp_output_83_0_g58567 , ( temp_output_83_0_g58567 * saturate( temp_output_507_0_g58567 ) ) , _EmissiveAffectAlbedoBias);
				float temp_output_674_0_g58567 = ( _EmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION + _EmissionFlags ) * 0.0 ) );
				float3 lerpResult384_g58567 = lerp( temp_output_83_0_g58567 , lerpResult378_g58567 , temp_output_674_0_g58567);
				
				half4 color26_g58567 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_489_0_g58567 = (color26_g58567).rgb;
				float3 lerpResult65_g58567 = lerp( temp_output_489_0_g58567 , temp_output_507_0_g58567 , temp_output_674_0_g58567);
				
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float3 BaseColor = lerpResult384_g58567;
				float3 Emission = lerpResult65_g58567;
				float Alpha = temp_output_98_0_g58267;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			float _GlobalEmissionIntensity;
			float _GlobalEmissionEnabled;
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			float3 EmissiveCullfloat3switch( float m_switch, float3 m_Front, float3 m_Back, float3 m_Both )
			{
				if(m_switch ==0)
					return m_Front;
				else if(m_switch ==1)
					return m_Back;
				else if(m_switch ==2)
					return m_Both;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord2.xy = vertexToFrag70_g58525;
				float temp_output_6_0_g58596 = _EmissivePanningRotation;
				float temp_output_200_0_g58596 = radians( temp_output_6_0_g58596 );
				float temp_output_13_0_g58596 = cos( temp_output_200_0_g58596 );
				float2 temp_output_9_0_g58596 = float2( 0.5,0.5 );
				float2 break39_g58596 = ( v.ase_texcoord.xy - temp_output_9_0_g58596 );
				float temp_output_14_0_g58596 = sin( temp_output_200_0_g58596 );
				float2 appendResult36_g58596 = (float2(( ( temp_output_13_0_g58596 * break39_g58596.x ) + ( temp_output_14_0_g58596 * break39_g58596.y ) ) , ( ( temp_output_13_0_g58596 * break39_g58596.y ) - ( temp_output_14_0_g58596 * break39_g58596.x ) )));
				float2 temp_output_657_0_g58567 = (_EmissiveColorMapUVs).xy;
				float2 temp_output_658_0_g58567 = (_EmissiveColorMapUVs).zw;
				float2 Offset235_g58596 = temp_output_658_0_g58567;
				float Time63_g58596 = _TimeParameters.x;
				float2 appendResult201_g58596 = (float2(_EmissivePanningSpeedX , _EmissivePanningSpeedY));
				float2 temp_output_41_0_g58596 = ( ( ( appendResult36_g58596 * ( temp_output_657_0_g58567 / 1.0 ) ) + temp_output_9_0_g58596 ) + ( Offset235_g58596 + ( Time63_g58596 * appendResult201_g58596 ) ) );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58596 = ( temp_output_41_0_g58596 - ( ( ( temp_output_657_0_g58567 / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord2.zw = vertexToFrag70_g58596;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
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

				float3 temp_output_1923_0_g44920 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord2.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float3 ALBEDO_RGBA1381_g44920 = (tex2DNode2048_g44920).rgb;
				float3 temp_output_3_0_g44920 = ( temp_output_1923_0_g44920 * ALBEDO_RGBA1381_g44920 * _Brightness );
				float3 temp_output_83_0_g58567 = temp_output_3_0_g44920;
				float m_switch1_g58569 = _EmissiveRenderFace;
				float3 temp_output_696_0_g58567 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g58587 = temp_output_696_0_g58567;
				float temp_output_21_0_g58587 = _EmissiveIntensity;
				float lerpResult6_g58587 = lerp( temp_output_21_0_g58587 , ( temp_output_21_0_g58587 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58587 = lerp( temp_output_21_0_g58587 , lerpResult6_g58587 , _EmissiveisGlobal);
				float3 temp_output_2_0_g58587 = ( temp_output_19_0_g58587 * lerpResult9_g58587 );
				float3 EMISSION_TINT111_g58567 = temp_output_2_0_g58587;
				float3 temp_output_693_0_g58567 = (_EmissivePanningColor).rgb;
				float3 temp_output_19_0_g58585 = temp_output_693_0_g58567;
				float temp_output_21_0_g58585 = _EmissivePanningIntensity;
				float lerpResult6_g58585 = lerp( temp_output_21_0_g58585 , ( temp_output_21_0_g58585 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58585 = lerp( temp_output_21_0_g58585 , lerpResult6_g58585 , _EmissivePanningisGlobal);
				float3 temp_output_2_0_g58585 = ( temp_output_19_0_g58585 * lerpResult9_g58585 );
				float3 EMISSION_TINTPANNING412_g58567 = temp_output_2_0_g58585;
				float2 vertexToFrag70_g58596 = IN.ase_texcoord2.zw;
				float4 tex2DNode309_g58567 = SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, vertexToFrag70_g58596 );
				float3 temp_output_685_0_g58567 = (tex2DNode309_g58567).rgb;
				float3 lerpResult652_g58567 = lerp( temp_output_685_0_g58567 , ( 1.0 - temp_output_685_0_g58567 ) , _EmissiveColorMapInverted);
				float3 lerpResult136_g58567 = lerp( EMISSION_TINT111_g58567 , EMISSION_TINTPANNING412_g58567 , lerpResult652_g58567);
				float3 lerpResult202_g58567 = lerp( EMISSION_TINT111_g58567 , lerpResult136_g58567 , _EmissiveMapEnable);
				float3 Albedo_In99_g58567 = temp_output_83_0_g58567;
				float3 lerpResult369_g58567 = lerp( Albedo_In99_g58567 , lerpResult202_g58567 , saturate( ( 1.0 - ( ( distance( (_EmissiveColorMaskingColor).rgb , Albedo_In99_g58567 ) - _EmissiveColorMaskingRange ) / max( _EmissiveColorMaskingFuzziness , 1E-05 ) ) ) ));
				float3 lerpResult374_g58567 = lerp( lerpResult202_g58567 , lerpResult369_g58567 , _EmissiveColorMaskingEnable);
				float3 temp_output_690_0_g58567 = (_EmissiveGlowColor).rgb;
				float3 temp_output_19_0_g58582 = temp_output_690_0_g58567;
				float temp_output_21_0_g58582 = _EmissiveGlowIntensity;
				float lerpResult6_g58582 = lerp( temp_output_21_0_g58582 , ( temp_output_21_0_g58582 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58582 = lerp( temp_output_21_0_g58582 , lerpResult6_g58582 , _EmissiveGlowisGlobal);
				float3 temp_output_2_0_g58582 = ( temp_output_19_0_g58582 * lerpResult9_g58582 );
				float3 EMISSION_TINTGLOW158_g58567 = temp_output_2_0_g58582;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float4 NORMAL_RGBA1382_g44920 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g44920 );
				float3 unpack1891_g44920 = UnpackNormalScale( NORMAL_RGBA1382_g44920, _NormalStrength );
				unpack1891_g44920.z = lerp( 1, unpack1891_g44920.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58217 = unpack1891_g44920;
				float temp_output_50_0_g58217 = _DoubleSidedNormalMode;
				float m_switch64_g58217 = temp_output_50_0_g58217;
				float3 m_Flip64_g58217 = float3(-1,-1,-1);
				float3 m_Mirror64_g58217 = float3(1,1,-1);
				float3 m_None64_g58217 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58217 = _NormalModefloat3switch( m_switch64_g58217 , m_Flip64_g58217 , m_Mirror64_g58217 , m_None64_g58217 );
				float3 switchResult58_g58217 = (((ase_vface>0)?(temp_output_24_0_g58217):(( temp_output_24_0_g58217 * local_NormalModefloat3switch64_g58217 ))));
				float3 temp_output_2895_35 = switchResult58_g58217;
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal190_g58567 = temp_output_2895_35;
				float fresnelNdotV190_g58567 = dot( float3(dot(tanToWorld0,tanNormal190_g58567), dot(tanToWorld1,tanNormal190_g58567), dot(tanToWorld2,tanNormal190_g58567)), ase_worldViewDir );
				float fresnelNode190_g58567 = ( 0.0 + 0.17 * pow( max( 1.0 - fresnelNdotV190_g58567 , 0.0001 ), 5.0 ) );
				float3 lerpResult195_g58567 = lerp( lerpResult374_g58567 , EMISSION_TINTGLOW158_g58567 , fresnelNode190_g58567);
				float3 lerpResult185_g58567 = lerp( lerpResult374_g58567 , lerpResult195_g58567 , _EmissiveGlowEnable);
				float3 temp_output_7_0_g58569 = lerpResult185_g58567;
				half4 color5_g58569 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_6_0_g58569 = (color5_g58569).rgb;
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g58572 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_18_0_g58569 = (1.0 + (sign( dotResult8_g58572 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult15_g58569 = lerp( temp_output_7_0_g58569 , temp_output_6_0_g58569 , temp_output_18_0_g58569);
				float3 m_Front1_g58569 = lerpResult15_g58569;
				float3 lerpResult16_g58569 = lerp( temp_output_6_0_g58569 , temp_output_7_0_g58569 , temp_output_18_0_g58569);
				float3 m_Back1_g58569 = lerpResult16_g58569;
				float3 m_Both1_g58569 = temp_output_7_0_g58569;
				float3 localEmissiveCullfloat3switch1_g58569 = EmissiveCullfloat3switch( m_switch1_g58569 , m_Front1_g58569 , m_Back1_g58569 , m_Both1_g58569 );
				float3 temp_output_507_0_g58567 = localEmissiveCullfloat3switch1_g58569;
				float3 lerpResult378_g58567 = lerp( temp_output_83_0_g58567 , ( temp_output_83_0_g58567 * saturate( temp_output_507_0_g58567 ) ) , _EmissiveAffectAlbedoBias);
				float temp_output_674_0_g58567 = ( _EmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION + _EmissionFlags ) * 0.0 ) );
				float3 lerpResult384_g58567 = lerp( temp_output_83_0_g58567 , lerpResult378_g58567 , temp_output_674_0_g58567);
				
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float3 BaseColor = lerpResult384_g58567;
				float Alpha = temp_output_98_0_g58267;
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
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord5.xy = vertexToFrag70_g58525;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord5.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 NORMAL_RGBA1382_g44920 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g44920 );
				float3 unpack1891_g44920 = UnpackNormalScale( NORMAL_RGBA1382_g44920, _NormalStrength );
				unpack1891_g44920.z = lerp( 1, unpack1891_g44920.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58217 = unpack1891_g44920;
				float temp_output_50_0_g58217 = _DoubleSidedNormalMode;
				float m_switch64_g58217 = temp_output_50_0_g58217;
				float3 m_Flip64_g58217 = float3(-1,-1,-1);
				float3 m_Mirror64_g58217 = float3(1,1,-1);
				float3 m_None64_g58217 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58217 = _NormalModefloat3switch( m_switch64_g58217 , m_Flip64_g58217 , m_Mirror64_g58217 , m_None64_g58217 );
				float3 switchResult58_g58217 = (((ase_vface>0)?(temp_output_24_0_g58217):(( temp_output_24_0_g58217 * local_NormalModefloat3switch64_g58217 ))));
				float3 temp_output_2895_35 = switchResult58_g58217;
				
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float3 Normal = temp_output_2895_35;
				float Alpha = temp_output_98_0_g58267;
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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
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
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			float _GlobalEmissionIntensity;
			float _GlobalEmissionEnabled;
			TEXTURE2D(_EmissiveColorMap);
			SAMPLER(sampler_EmissiveColorMap);
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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
			
			float3 EmissiveCullfloat3switch( float m_switch, float3 m_Front, float3 m_Back, float3 m_Both )
			{
				if(m_switch ==0)
					return m_Front;
				else if(m_switch ==1)
					return m_Back;
				else if(m_switch ==2)
					return m_Both;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.texcoord.xy;
				float2 m_UV180_g58525 = v.texcoord1.xy;
				float2 m_UV280_g58525 = v.texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord8.xy = vertexToFrag70_g58525;
				float temp_output_6_0_g58596 = _EmissivePanningRotation;
				float temp_output_200_0_g58596 = radians( temp_output_6_0_g58596 );
				float temp_output_13_0_g58596 = cos( temp_output_200_0_g58596 );
				float2 temp_output_9_0_g58596 = float2( 0.5,0.5 );
				float2 break39_g58596 = ( v.texcoord.xy - temp_output_9_0_g58596 );
				float temp_output_14_0_g58596 = sin( temp_output_200_0_g58596 );
				float2 appendResult36_g58596 = (float2(( ( temp_output_13_0_g58596 * break39_g58596.x ) + ( temp_output_14_0_g58596 * break39_g58596.y ) ) , ( ( temp_output_13_0_g58596 * break39_g58596.y ) - ( temp_output_14_0_g58596 * break39_g58596.x ) )));
				float2 temp_output_657_0_g58567 = (_EmissiveColorMapUVs).xy;
				float2 temp_output_658_0_g58567 = (_EmissiveColorMapUVs).zw;
				float2 Offset235_g58596 = temp_output_658_0_g58567;
				float Time63_g58596 = _TimeParameters.x;
				float2 appendResult201_g58596 = (float2(_EmissivePanningSpeedX , _EmissivePanningSpeedY));
				float2 temp_output_41_0_g58596 = ( ( ( appendResult36_g58596 * ( temp_output_657_0_g58567 / 1.0 ) ) + temp_output_9_0_g58596 ) + ( Offset235_g58596 + ( Time63_g58596 * appendResult201_g58596 ) ) );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g58596 = ( temp_output_41_0_g58596 - ( ( ( temp_output_657_0_g58567 / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g58596;
				
				o.ase_color = v.ase_color;
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

				float3 temp_output_1923_0_g44920 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord8.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float3 ALBEDO_RGBA1381_g44920 = (tex2DNode2048_g44920).rgb;
				float3 temp_output_3_0_g44920 = ( temp_output_1923_0_g44920 * ALBEDO_RGBA1381_g44920 * _Brightness );
				float3 temp_output_83_0_g58567 = temp_output_3_0_g44920;
				float m_switch1_g58569 = _EmissiveRenderFace;
				float3 temp_output_696_0_g58567 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g58587 = temp_output_696_0_g58567;
				float temp_output_21_0_g58587 = _EmissiveIntensity;
				float lerpResult6_g58587 = lerp( temp_output_21_0_g58587 , ( temp_output_21_0_g58587 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58587 = lerp( temp_output_21_0_g58587 , lerpResult6_g58587 , _EmissiveisGlobal);
				float3 temp_output_2_0_g58587 = ( temp_output_19_0_g58587 * lerpResult9_g58587 );
				float3 EMISSION_TINT111_g58567 = temp_output_2_0_g58587;
				float3 temp_output_693_0_g58567 = (_EmissivePanningColor).rgb;
				float3 temp_output_19_0_g58585 = temp_output_693_0_g58567;
				float temp_output_21_0_g58585 = _EmissivePanningIntensity;
				float lerpResult6_g58585 = lerp( temp_output_21_0_g58585 , ( temp_output_21_0_g58585 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58585 = lerp( temp_output_21_0_g58585 , lerpResult6_g58585 , _EmissivePanningisGlobal);
				float3 temp_output_2_0_g58585 = ( temp_output_19_0_g58585 * lerpResult9_g58585 );
				float3 EMISSION_TINTPANNING412_g58567 = temp_output_2_0_g58585;
				float2 vertexToFrag70_g58596 = IN.ase_texcoord8.zw;
				float4 tex2DNode309_g58567 = SAMPLE_TEXTURE2D( _EmissiveColorMap, sampler_EmissiveColorMap, vertexToFrag70_g58596 );
				float3 temp_output_685_0_g58567 = (tex2DNode309_g58567).rgb;
				float3 lerpResult652_g58567 = lerp( temp_output_685_0_g58567 , ( 1.0 - temp_output_685_0_g58567 ) , _EmissiveColorMapInverted);
				float3 lerpResult136_g58567 = lerp( EMISSION_TINT111_g58567 , EMISSION_TINTPANNING412_g58567 , lerpResult652_g58567);
				float3 lerpResult202_g58567 = lerp( EMISSION_TINT111_g58567 , lerpResult136_g58567 , _EmissiveMapEnable);
				float3 Albedo_In99_g58567 = temp_output_83_0_g58567;
				float3 lerpResult369_g58567 = lerp( Albedo_In99_g58567 , lerpResult202_g58567 , saturate( ( 1.0 - ( ( distance( (_EmissiveColorMaskingColor).rgb , Albedo_In99_g58567 ) - _EmissiveColorMaskingRange ) / max( _EmissiveColorMaskingFuzziness , 1E-05 ) ) ) ));
				float3 lerpResult374_g58567 = lerp( lerpResult202_g58567 , lerpResult369_g58567 , _EmissiveColorMaskingEnable);
				float3 temp_output_690_0_g58567 = (_EmissiveGlowColor).rgb;
				float3 temp_output_19_0_g58582 = temp_output_690_0_g58567;
				float temp_output_21_0_g58582 = _EmissiveGlowIntensity;
				float lerpResult6_g58582 = lerp( temp_output_21_0_g58582 , ( temp_output_21_0_g58582 * _GlobalEmissionIntensity ) , _GlobalEmissionEnabled);
				float lerpResult9_g58582 = lerp( temp_output_21_0_g58582 , lerpResult6_g58582 , _EmissiveGlowisGlobal);
				float3 temp_output_2_0_g58582 = ( temp_output_19_0_g58582 * lerpResult9_g58582 );
				float3 EMISSION_TINTGLOW158_g58567 = temp_output_2_0_g58582;
				float4 NORMAL_RGBA1382_g44920 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g44920 );
				float3 unpack1891_g44920 = UnpackNormalScale( NORMAL_RGBA1382_g44920, _NormalStrength );
				unpack1891_g44920.z = lerp( 1, unpack1891_g44920.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g58217 = unpack1891_g44920;
				float temp_output_50_0_g58217 = _DoubleSidedNormalMode;
				float m_switch64_g58217 = temp_output_50_0_g58217;
				float3 m_Flip64_g58217 = float3(-1,-1,-1);
				float3 m_Mirror64_g58217 = float3(1,1,-1);
				float3 m_None64_g58217 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g58217 = _NormalModefloat3switch( m_switch64_g58217 , m_Flip64_g58217 , m_Mirror64_g58217 , m_None64_g58217 );
				float3 switchResult58_g58217 = (((ase_vface>0)?(temp_output_24_0_g58217):(( temp_output_24_0_g58217 * local_NormalModefloat3switch64_g58217 ))));
				float3 temp_output_2895_35 = switchResult58_g58217;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal190_g58567 = temp_output_2895_35;
				float fresnelNdotV190_g58567 = dot( float3(dot(tanToWorld0,tanNormal190_g58567), dot(tanToWorld1,tanNormal190_g58567), dot(tanToWorld2,tanNormal190_g58567)), WorldViewDirection );
				float fresnelNode190_g58567 = ( 0.0 + 0.17 * pow( max( 1.0 - fresnelNdotV190_g58567 , 0.0001 ), 5.0 ) );
				float3 lerpResult195_g58567 = lerp( lerpResult374_g58567 , EMISSION_TINTGLOW158_g58567 , fresnelNode190_g58567);
				float3 lerpResult185_g58567 = lerp( lerpResult374_g58567 , lerpResult195_g58567 , _EmissiveGlowEnable);
				float3 temp_output_7_0_g58569 = lerpResult185_g58567;
				half4 color5_g58569 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_6_0_g58569 = (color5_g58569).rgb;
				float dotResult8_g58572 = dot( WorldNormal , WorldViewDirection );
				float temp_output_18_0_g58569 = (1.0 + (sign( dotResult8_g58572 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult15_g58569 = lerp( temp_output_7_0_g58569 , temp_output_6_0_g58569 , temp_output_18_0_g58569);
				float3 m_Front1_g58569 = lerpResult15_g58569;
				float3 lerpResult16_g58569 = lerp( temp_output_6_0_g58569 , temp_output_7_0_g58569 , temp_output_18_0_g58569);
				float3 m_Back1_g58569 = lerpResult16_g58569;
				float3 m_Both1_g58569 = temp_output_7_0_g58569;
				float3 localEmissiveCullfloat3switch1_g58569 = EmissiveCullfloat3switch( m_switch1_g58569 , m_Front1_g58569 , m_Back1_g58569 , m_Both1_g58569 );
				float3 temp_output_507_0_g58567 = localEmissiveCullfloat3switch1_g58569;
				float3 lerpResult378_g58567 = lerp( temp_output_83_0_g58567 , ( temp_output_83_0_g58567 * saturate( temp_output_507_0_g58567 ) ) , _EmissiveAffectAlbedoBias);
				float temp_output_674_0_g58567 = ( _EmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION + _EmissionFlags ) * 0.0 ) );
				float3 lerpResult384_g58567 = lerp( temp_output_83_0_g58567 , lerpResult378_g58567 , temp_output_674_0_g58567);
				
				half4 color26_g58567 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_489_0_g58567 = (color26_g58567).rgb;
				float3 lerpResult65_g58567 = lerp( temp_output_489_0_g58567 , temp_output_507_0_g58567 , temp_output_674_0_g58567);
				
				float4 tex2DNode2050_g44920 = SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, UV213_g44920 );
				float MASK_B1377_g44920 = tex2DNode2050_g44920.b;
				
				float MASK_G158_g44920 = tex2DNode2050_g44920.g;
				float temp_output_2651_0_g44920 = ( 1.0 - MASK_G158_g44920 );
				float lerpResult2650_g44920 = lerp( MASK_G158_g44920 , temp_output_2651_0_g44920 , _SmoothnessSource);
				float temp_output_2693_0_g44920 = ( lerpResult2650_g44920 * _SmoothnessStrength );
				float2 appendResult2645_g44920 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g44920 = (float3(appendResult2645_g44920 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g44920 = unpack1891_g44920;
				float3 normalizeResult2641_g44920 = normalize( ( ( WorldTangent * break2680_g44920.x ) + ( WorldBiTangent * break2680_g44920.y ) + ( WorldNormal * break2680_g44920.z ) ) );
				float3 Normal_Per_Pixel2690_g44920 = normalizeResult2641_g44920;
				float fresnelNdotV2685_g44920 = dot( normalize( Normal_Per_Pixel2690_g44920 ), appendResult2644_g44920 );
				float fresnelNode2685_g44920 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g44920 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g44920 = lerp( temp_output_2693_0_g44920 , ( temp_output_2693_0_g44920 - fresnelNode2685_g44920 ) , _SmoothnessFresnelEnable);
				
				float MASK_R1378_g44920 = tex2DNode2050_g44920.r;
				float lerpResult3415_g44920 = lerp( 1.0 , MASK_R1378_g44920 , _OcclusionStrengthAO);
				float lerpResult3414_g44920 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g44920 = lerp( lerpResult3415_g44920 , lerpResult3414_g44920 , _OcclusionSource);
				float temp_output_2730_0_g44920 = saturate( lerpResult2709_g44920 );
				
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 temp_output_95_0_g58271 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , WorldViewDirection );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				float3 BaseColor = lerpResult384_g58567;
				float3 Normal = temp_output_2895_35;
				float3 Emission = lerpResult65_g58567;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g44920 );
				float Smoothness = saturate( lerpResult2636_g44920 );
				float Occlusion = temp_output_2730_0_g44920;
				float Alpha = temp_output_98_0_g58267;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord.xy = vertexToFrag70_g58525;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58271 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58267;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _EmissiveGlowColor;
			float4 _EmissiveColorMapUVs;
			half4 _EmissiveColor;
			half4 _EmissiveColorMaskingColor;
			float4 _AlphaRemap;
			half4 _BaseColor;
			half4 _EmissivePanningColor;
			float4 _MainUVs;
			float _SPACE_TRANSLUCENCY;
			half _EmissionFlags;
			float _CATEGORY_EMISSION;
			half _EmissiveEnable;
			half _EmissiveAffectAlbedoBias;
			half _EmissiveGlowEnable;
			half _DoubleSidedNormalMode;
			float _SPACE_EMISSION;
			float _MetallicStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _SmoothnessSource;
			half _NormalStrength;
			half _EmissiveColorMaskingEnable;
			half _EmissiveGlowIntensity;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			int _Cull;
			float _UVMode;
			half _Brightness;
			half _EmissiveRenderFace;
			half _EmissiveIntensity;
			half _EmissiveisGlobal;
			half _EmissivePanningIntensity;
			half _EmissivePanningisGlobal;
			half _EmissivePanningRotation;
			half _EmissivePanningSpeedX;
			half _EmissivePanningSpeedY;
			half _EmissiveColorMapInverted;
			half _EmissiveMapEnable;
			half _EmissiveColorMaskingRange;
			half _EmissiveColorMaskingFuzziness;
			half _AlphaCutoffBias;
			half _EmissiveGlowisGlobal;
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
			
			float2 float2switchUVMode80_g58525( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch80_g58525 = _UVMode;
				float2 m_UV080_g58525 = v.ase_texcoord.xy;
				float2 m_UV180_g58525 = v.ase_texcoord1.xy;
				float2 m_UV280_g58525 = v.ase_texcoord2.xy;
				float2 m_UV380_g58525 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g58525 = float2switchUVMode80_g58525( m_switch80_g58525 , m_UV080_g58525 , m_UV180_g58525 , m_UV280_g58525 , m_UV380_g58525 );
				float2 temp_output_1955_0_g44920 = (_MainUVs).xy;
				float2 temp_output_1953_0_g44920 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g44920;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g44920 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord.xy = vertexToFrag70_g58525;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord.xy;
				float2 UV213_g44920 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g44920 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g44920 );
				float temp_output_22_0_g58267 = tex2DNode2048_g44920.a;
				float temp_output_22_0_g58269 = temp_output_22_0_g58267;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g58271 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g58271 = normalize( temp_output_95_0_g58271 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g58267 = dot( normalizeResult96_g58271 , ase_worldViewDir );
				float temp_output_76_0_g58267 = ( 1.0 - abs( dotResult74_g58267 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g58267 = 1.0;
				#else
				float staticSwitch281_g58267 = ( 1.0 - ( temp_output_76_0_g58267 * temp_output_76_0_g58267 ) );
				#endif
				float lerpResult80_g58267 = lerp( 1.0 , staticSwitch281_g58267 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g58267 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g58269 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g58269 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g58267 );
				

				surfaceDescription.Alpha = temp_output_98_0_g58267;
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
Node;AmplifyShaderEditor.FunctionNode;2895;-4544,-3584;Inherit;False;DESF Core Lit;1;;44920;e0cdd7758f4404849b063afff4596424;39,442,2,1557,0,1749,0,1556,0,2284,0,2283,0,2213,0,2481,0,2411,0,2399,0,2172,0,2282,0,3300,0,3301,0,3299,0,2132,0,3146,0,2311,0,3108,0,3119,0,3076,0,3408,0,3291,0,3290,0,3289,0,3287,0,96,0,2591,0,2559,0,1368,0,2125,0,2131,0,2028,0,1333,0,2126,1,1896,0,1415,0,830,0,2523,1;1;1234;FLOAT3;0,0,0;False;17;FLOAT3;38;FLOAT3;35;FLOAT;37;FLOAT3;1922;FLOAT;33;FLOAT;34;FLOAT;46;FLOAT;814;FLOAT;1660;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;FLOAT3;2760;SAMPLERSTATE;1819;SAMPLERSTATE;1824;SAMPLERSTATE;1818
Node;AmplifyShaderEditor.FunctionNode;2899;-4128,-3632;Inherit;False;DESF Module Emission;161;;58567;f6260db0b43d4504b8a093f7f73e5a28;15,634,2,341,2,362,2,575,2,616,0,614,0,608,1,611,1,586,0,197,1,376,1,258,0,543,0,596,0,597,0;3;83;FLOAT3;0,0,0;False;192;FLOAT3;0,0,1;False;613;SAMPLERSTATE;;False;2;FLOAT3;96;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;2903;-3840,-3664;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2917;-3838.134,-3584;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2919;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2920;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2921;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2922;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2923;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2924;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2925;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2926;-3838.134,-3646.757;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2918;-3840,-3584;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Cutout/Emission Panning;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;1;638176985580579812;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;2899;83;2895;38
WireConnection;2899;192;2895;35
WireConnection;2918;0;2899;96
WireConnection;2918;1;2895;35
WireConnection;2918;2;2899;0
WireConnection;2918;3;2895;37
WireConnection;2918;4;2895;33
WireConnection;2918;5;2895;34
WireConnection;2918;6;2895;46
WireConnection;2918;7;2895;814
WireConnection;2918;16;2895;1660
ASEEND*/
//CHKSM=438321C416A07919941498E4A2F3E17C8D62701B