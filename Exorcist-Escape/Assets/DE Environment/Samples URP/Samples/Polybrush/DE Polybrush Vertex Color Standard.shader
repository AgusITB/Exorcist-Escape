// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Polybrush/Vertex Color Standard"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector][Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 2
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
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(POLYBRUSH VERTEX COLOR,true,_EnablePolybrush,0,0)]_CATEGORY_POLYBRUSHVERTEXCOLOR("CATEGORY_POLYBRUSH VERTEX COLOR", Float) = 0
		[DE_DrawerToggleLeft]_EnablePolybrush("ENABLE POLYBRUSH", Float) = 0
		[Header(COLOR MASK)][DE_DrawerFloatEnum(Off _Red _Green _Blue _Alpha)]_00FilterVertexColor("Filter Vertex Color", Float) = 0
		_00Color("Base Color", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_00BaseColorMap("Base Map", 2D) = "white" {}
		_00Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTilingOffset]_00UVs("UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_00NormalMap("Normal Map", 2D) = "bump" {}
		_00NormalMapScale("Normal Strength", Float) = 1
		_00MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_00OcclusionStrength("Occlusion Strength", Range( 0 , 1)) = 0
		_00SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		_00BlendHeight("Blend Height", Range( 0.001 , 3)) = 1
		_00BlendSmooth("Blend Smooth", Range( 0.001 , 3)) = 1
		[Header(COLOR MASK)][DE_DrawerFloatEnum(Off _Red _Green _Blue _Alpha)]_01FilterVertexColor("Filter Vertex Color", Float) = 0
		_01Color("Base Color", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_01BaseColorMap("Base Map", 2D) = "white" {}
		_01Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTilingOffset]_01UVs("UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_01NormalMap("Normal Map", 2D) = "bump" {}
		_01NormalMapScale("Normal Strength", Float) = 1
		_01MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_01OcclusionStrength("Occlusion Strength", Range( 0 , 1)) = 0
		_01SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		_01BlendHeight("Blend Height", Range( 0.001 , 3)) = 1
		_01BlendSmooth("Blend Smooth", Range( 0.001 , 3)) = 1
		[Header(COLOR MASK)][DE_DrawerFloatEnum(Off _Red _Green _Blue _Alpha)]_02FilterVertexColor("Filter Vertex Color", Float) = 0
		_02Color("Base Color", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_02BaseColorMap("Base Map", 2D) = "white" {}
		_02Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTilingOffset]_02UVs("UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_02NormalMap("Normal Map", 2D) = "bump" {}
		_02NormalMapScale("Normal Strength", Float) = 1
		_02MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_02OcclusionStrength("Occlusion Strength", Range( 0 , 1)) = 0
		_02SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		_02BlendHeight("Blend Height", Range( 0.001 , 3)) = 1
		_02BlendSmooth("Blend Smooth", Range( 0.001 , 3)) = 1
		[DE_DrawerSpace(10)]_SPACE_POLYBRUSH("SPACE_POLYBRUSH", Float) = 0


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

			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL


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
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			TEXTURE2D(_00BaseColorMap);
			SAMPLER(sampler_00BaseColorMap);
			TEXTURE2D(_01BaseColorMap);
			SAMPLER(sampler_01BaseColorMap);
			TEXTURE2D(_02BaseColorMap);
			SAMPLER(sampler_02BaseColorMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_00NormalMap);
			SAMPLER(sampler_00NormalMap);
			TEXTURE2D(_01NormalMap);
			SAMPLER(sampler_01NormalMap);
			TEXTURE2D(_02NormalMap);
			SAMPLER(sampler_02NormalMap);
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
			
			float MaskVCSwitch44_g58271( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58272( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58273( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
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
				float2 temp_output_1955_0_g58314 = (_MainUVs).xy;
				float2 temp_output_1953_0_g58314 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g58314;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g58314 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord8.xy = vertexToFrag70_g58525;
				float2 Offset235_g57822 = (_00UVs).zw;
				float2 temp_output_41_0_g57822 = ( ( v.texcoord.xy * (_00UVs).xy ) + Offset235_g57822 );
				float2 vertexToFrag70_g57822 = temp_output_41_0_g57822;
				o.ase_texcoord8.zw = vertexToFrag70_g57822;
				float2 Offset235_g58224 = (_01UVs).zw;
				float2 temp_output_41_0_g58224 = ( ( v.texcoord.xy * (_01UVs).xy ) + Offset235_g58224 );
				float2 vertexToFrag70_g58224 = temp_output_41_0_g58224;
				o.ase_texcoord9.xy = vertexToFrag70_g58224;
				float2 Offset235_g58240 = (_02UVs).zw;
				float2 temp_output_41_0_g58240 = ( ( v.texcoord.xy * (_02UVs).xy ) + Offset235_g58240 );
				float2 vertexToFrag70_g58240 = temp_output_41_0_g58240;
				o.ase_texcoord9.zw = vertexToFrag70_g58240;
				
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

				float3 temp_output_1923_0_g58314 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord8.xy;
				float2 UV213_g58314 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g58314 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g58314 );
				float3 ALBEDO_RGBA1381_g58314 = (tex2DNode2048_g58314).rgb;
				float3 temp_output_3_0_g58314 = ( temp_output_1923_0_g58314 * ALBEDO_RGBA1381_g58314 * _Brightness );
				float3 temp_output_123_0_g57819 = temp_output_3_0_g58314;
				float localStochasticTiling159_g57826 = ( 0.0 );
				float2 vertexToFrag70_g57822 = IN.ase_texcoord8.zw;
				float2 temp_output_730_0_g57819 = vertexToFrag70_g57822;
				float2 UV159_g57826 = temp_output_730_0_g57819;
				float4 TexelSize159_g57826 = _00BaseColorMap_TexelSize;
				float4 Offsets159_g57826 = float4( 0,0,0,0 );
				float2 Weights159_g57826 = float2( 0,0 );
				{
				UV159_g57826 = UV159_g57826 * TexelSize159_g57826.zw - 0.5;
				float2 f = frac( UV159_g57826 );
				UV159_g57826 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57826.x - 0.5, UV159_g57826.x + 1.5, UV159_g57826.y - 0.5, UV159_g57826.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57826 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57826.xyxy;
				Weights159_g57826 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57820 = Offsets159_g57826;
				float2 temp_output_855_0_g57819 = ddx( temp_output_730_0_g57819 );
				float2 temp_output_205_0_g57820 = temp_output_855_0_g57819;
				float2 temp_output_856_0_g57819 = ddy( temp_output_730_0_g57819 );
				float2 temp_output_206_0_g57820 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57820 = Weights159_g57826;
				float2 break169_g57820 = Input_FetchWeights143_g57820;
				float4 lerpResult167_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult168_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult180_g57820 = lerp( lerpResult167_g57820 , lerpResult168_g57820 , break169_g57820.y);
				float4 Output_Fetch2DDerivative203_g57820 = lerpResult180_g57820;
				float3 BaseColor001284_g57819 = ( (_00Color).rgb * (Output_Fetch2DDerivative203_g57820).rgb * _00Brightness );
				float m_switch44_g58271 = _00FilterVertexColor;
				float m_Off44_g58271 = 1.0;
				float dotResult58_g58271 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58271 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58271 = ( dotResult58_g58271 + dotResult61_g58271 );
				float dotResult57_g58271 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58271 = ( dotResult57_g58271 + dotResult58_g58271 );
				float m_B44_g58271 = ( dotResult57_g58271 + dotResult61_g58271 );
				float m_A44_g58271 = IN.ase_color.a;
				float localMaskVCSwitch44_g58271 = MaskVCSwitch44_g58271( m_switch44_g58271 , m_Off44_g58271 , m_R44_g58271 , m_G44_g58271 , m_B44_g58271 , m_A44_g58271 );
				float clampResult54_g58271 = clamp( ( ( localMaskVCSwitch44_g58271 * _00BlendHeight ) / _00BlendSmooth ) , 0.0 , 1.0 );
				float VC001248_g57819 = clampResult54_g58271;
				float3 lerpResult1168_g57819 = lerp( BaseColor001284_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58228 = ( 0.0 );
				float2 vertexToFrag70_g58224 = IN.ase_texcoord9.xy;
				float2 temp_output_885_0_g57819 = vertexToFrag70_g58224;
				float2 UV159_g58228 = temp_output_885_0_g57819;
				float4 TexelSize159_g58228 = _01BaseColorMap_TexelSize;
				float4 Offsets159_g58228 = float4( 0,0,0,0 );
				float2 Weights159_g58228 = float2( 0,0 );
				{
				UV159_g58228 = UV159_g58228 * TexelSize159_g58228.zw - 0.5;
				float2 f = frac( UV159_g58228 );
				UV159_g58228 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58228.x - 0.5, UV159_g58228.x + 1.5, UV159_g58228.y - 0.5, UV159_g58228.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58228 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58228.xyxy;
				Weights159_g58228 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58222 = Offsets159_g58228;
				float2 temp_output_909_0_g57819 = ddx( temp_output_885_0_g57819 );
				float2 temp_output_205_0_g58222 = temp_output_909_0_g57819;
				float2 temp_output_908_0_g57819 = ddy( temp_output_885_0_g57819 );
				float2 temp_output_206_0_g58222 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58222 = Weights159_g58228;
				float2 break169_g58222 = Input_FetchWeights143_g58222;
				float4 lerpResult167_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult168_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult180_g58222 = lerp( lerpResult167_g58222 , lerpResult168_g58222 , break169_g58222.y);
				float4 Output_Fetch2DDerivative203_g58222 = lerpResult180_g58222;
				float3 BaseColor011408_g57819 = ( (_01Color).rgb * (Output_Fetch2DDerivative203_g58222).rgb * _01Brightness );
				float m_switch44_g58272 = _01FilterVertexColor;
				float m_Off44_g58272 = 1.0;
				float dotResult58_g58272 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58272 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58272 = ( dotResult58_g58272 + dotResult61_g58272 );
				float dotResult57_g58272 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58272 = ( dotResult57_g58272 + dotResult58_g58272 );
				float m_B44_g58272 = ( dotResult57_g58272 + dotResult61_g58272 );
				float m_A44_g58272 = IN.ase_color.a;
				float localMaskVCSwitch44_g58272 = MaskVCSwitch44_g58272( m_switch44_g58272 , m_Off44_g58272 , m_R44_g58272 , m_G44_g58272 , m_B44_g58272 , m_A44_g58272 );
				float clampResult54_g58272 = clamp( ( ( localMaskVCSwitch44_g58272 * _01BlendHeight ) / _01BlendSmooth ) , 0.0 , 1.0 );
				float VC011249_g57819 = clampResult54_g58272;
				float3 lerpResult1438_g57819 = lerp( BaseColor011408_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58244 = ( 0.0 );
				float2 vertexToFrag70_g58240 = IN.ase_texcoord9.zw;
				float2 temp_output_1015_0_g57819 = vertexToFrag70_g58240;
				float2 UV159_g58244 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58244 = _02BaseColorMap_TexelSize;
				float4 Offsets159_g58244 = float4( 0,0,0,0 );
				float2 Weights159_g58244 = float2( 0,0 );
				{
				UV159_g58244 = UV159_g58244 * TexelSize159_g58244.zw - 0.5;
				float2 f = frac( UV159_g58244 );
				UV159_g58244 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58244.x - 0.5, UV159_g58244.x + 1.5, UV159_g58244.y - 0.5, UV159_g58244.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58244 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58244.xyxy;
				Weights159_g58244 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58238 = Offsets159_g58244;
				float2 temp_output_1039_0_g57819 = ddx( temp_output_1015_0_g57819 );
				float2 temp_output_205_0_g58238 = temp_output_1039_0_g57819;
				float2 temp_output_1038_0_g57819 = ddy( temp_output_1015_0_g57819 );
				float2 temp_output_206_0_g58238 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58238 = Weights159_g58244;
				float2 break169_g58238 = Input_FetchWeights143_g58238;
				float4 lerpResult167_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult168_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult180_g58238 = lerp( lerpResult167_g58238 , lerpResult168_g58238 , break169_g58238.y);
				float4 Output_Fetch2DDerivative203_g58238 = lerpResult180_g58238;
				float3 BaseColor021410_g57819 = ( (_02Color).rgb * (Output_Fetch2DDerivative203_g58238).rgb * _02Brightness );
				float m_switch44_g58273 = _02FilterVertexColor;
				float m_Off44_g58273 = 1.0;
				float dotResult58_g58273 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58273 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58273 = ( dotResult58_g58273 + dotResult61_g58273 );
				float dotResult57_g58273 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58273 = ( dotResult57_g58273 + dotResult58_g58273 );
				float m_B44_g58273 = ( dotResult57_g58273 + dotResult61_g58273 );
				float m_A44_g58273 = IN.ase_color.a;
				float localMaskVCSwitch44_g58273 = MaskVCSwitch44_g58273( m_switch44_g58273 , m_Off44_g58273 , m_R44_g58273 , m_G44_g58273 , m_B44_g58273 , m_A44_g58273 );
				float clampResult54_g58273 = clamp( ( ( localMaskVCSwitch44_g58273 * _02BlendHeight ) / _02BlendSmooth ) , 0.0 , 1.0 );
				float VC021250_g57819 = clampResult54_g58273;
				float3 lerpResult1439_g57819 = lerp( BaseColor021410_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector0 = float3(0,0,0);
				float EnablePolybrush1431_g57819 = ( _EnablePolybrush + ( ( _CATEGORY_POLYBRUSHVERTEXCOLOR + _SPACE_POLYBRUSH ) * 0.0 ) );
				float3 lerpResult585_g57819 = lerp( temp_output_123_0_g57819 , ( temp_output_123_0_g57819 + ( ( lerpResult1168_g57819 + lerpResult1438_g57819 ) + ( lerpResult1439_g57819 + _Vector0 ) ) ) , EnablePolybrush1431_g57819);
				
				float4 NORMAL_RGBA1382_g58314 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g58314 );
				float3 unpack1891_g58314 = UnpackNormalScale( NORMAL_RGBA1382_g58314, _NormalStrength );
				unpack1891_g58314.z = lerp( 1, unpack1891_g58314.z, saturate(_NormalStrength) );
				float3 temp_output_102_0_g57819 = unpack1891_g58314;
				float localStochasticTiling159_g57829 = ( 0.0 );
				float2 UV159_g57829 = temp_output_730_0_g57819;
				float4 TexelSize159_g57829 = _00NormalMap_TexelSize;
				float4 Offsets159_g57829 = float4( 0,0,0,0 );
				float2 Weights159_g57829 = float2( 0,0 );
				{
				UV159_g57829 = UV159_g57829 * TexelSize159_g57829.zw - 0.5;
				float2 f = frac( UV159_g57829 );
				UV159_g57829 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57829.x - 0.5, UV159_g57829.x + 1.5, UV159_g57829.y - 0.5, UV159_g57829.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57829 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57829.xyxy;
				Weights159_g57829 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57828 = Offsets159_g57829;
				float2 temp_output_205_0_g57828 = temp_output_855_0_g57819;
				float2 temp_output_206_0_g57828 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57828 = Weights159_g57829;
				float2 break169_g57828 = Input_FetchWeights143_g57828;
				float4 lerpResult167_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult168_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult180_g57828 = lerp( lerpResult167_g57828 , lerpResult168_g57828 , break169_g57828.y);
				float4 Output_Fetch2DDerivative203_g57828 = lerpResult180_g57828;
				float3 unpack659_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g57828, _00NormalMapScale );
				unpack659_g57819.z = lerp( 1, unpack659_g57819.z, saturate(_00NormalMapScale) );
				float3 Normal001285_g57819 = unpack659_g57819;
				float3 lerpResult1451_g57819 = lerp( Normal001285_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58231 = ( 0.0 );
				float2 UV159_g58231 = temp_output_885_0_g57819;
				float4 TexelSize159_g58231 = _01NormalMap_TexelSize;
				float4 Offsets159_g58231 = float4( 0,0,0,0 );
				float2 Weights159_g58231 = float2( 0,0 );
				{
				UV159_g58231 = UV159_g58231 * TexelSize159_g58231.zw - 0.5;
				float2 f = frac( UV159_g58231 );
				UV159_g58231 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58231.x - 0.5, UV159_g58231.x + 1.5, UV159_g58231.y - 0.5, UV159_g58231.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58231 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58231.xyxy;
				Weights159_g58231 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58230 = Offsets159_g58231;
				float2 temp_output_205_0_g58230 = temp_output_909_0_g57819;
				float2 temp_output_206_0_g58230 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58230 = Weights159_g58231;
				float2 break169_g58230 = Input_FetchWeights143_g58230;
				float4 lerpResult167_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult168_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult180_g58230 = lerp( lerpResult167_g58230 , lerpResult168_g58230 , break169_g58230.y);
				float4 Output_Fetch2DDerivative203_g58230 = lerpResult180_g58230;
				float3 unpack940_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58230, _01NormalMapScale );
				unpack940_g57819.z = lerp( 1, unpack940_g57819.z, saturate(_01NormalMapScale) );
				float3 Normal011409_g57819 = unpack940_g57819;
				float3 lerpResult1450_g57819 = lerp( Normal011409_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58247 = ( 0.0 );
				float2 UV159_g58247 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58247 = _02NormalMap_TexelSize;
				float4 Offsets159_g58247 = float4( 0,0,0,0 );
				float2 Weights159_g58247 = float2( 0,0 );
				{
				UV159_g58247 = UV159_g58247 * TexelSize159_g58247.zw - 0.5;
				float2 f = frac( UV159_g58247 );
				UV159_g58247 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58247.x - 0.5, UV159_g58247.x + 1.5, UV159_g58247.y - 0.5, UV159_g58247.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58247 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58247.xyxy;
				Weights159_g58247 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58246 = Offsets159_g58247;
				float2 temp_output_205_0_g58246 = temp_output_1039_0_g57819;
				float2 temp_output_206_0_g58246 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58246 = Weights159_g58247;
				float2 break169_g58246 = Input_FetchWeights143_g58246;
				float4 lerpResult167_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult168_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult180_g58246 = lerp( lerpResult167_g58246 , lerpResult168_g58246 , break169_g58246.y);
				float4 Output_Fetch2DDerivative203_g58246 = lerpResult180_g58246;
				float3 unpack1070_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58246, _02NormalMapScale );
				unpack1070_g57819.z = lerp( 1, unpack1070_g57819.z, saturate(_02NormalMapScale) );
				float3 Normal021411_g57819 = unpack1070_g57819;
				float3 lerpResult1449_g57819 = lerp( Normal021411_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector1 = float3(0,0,0);
				float3 lerpResult589_g57819 = lerp( temp_output_102_0_g57819 , ( temp_output_102_0_g57819 + ( ( saturate( lerpResult1451_g57819 ) + saturate( lerpResult1450_g57819 ) ) + ( saturate( lerpResult1449_g57819 ) + _Vector1 ) ) ) , EnablePolybrush1431_g57819);
				
				float4 tex2DNode2050_g58314 = SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, UV213_g58314 );
				float MASK_B1377_g58314 = tex2DNode2050_g58314.b;
				float temp_output_473_0_g57819 = ( _MetallicStrength * MASK_B1377_g58314 );
				float lerpResult1479_g57819 = lerp( _00MetallicStrength , 0.0 , VC001248_g57819);
				float lerpResult1474_g57819 = lerp( _01MetallicStrength , 0.0 , VC011249_g57819);
				float lerpResult1473_g57819 = lerp( _02MetallicStrength , 0.0 , VC021250_g57819);
				float lerpResult586_g57819 = lerp( temp_output_473_0_g57819 , ( temp_output_473_0_g57819 + ( ( lerpResult1479_g57819 + lerpResult1474_g57819 ) + ( lerpResult1473_g57819 + 0.0 ) ) ) , EnablePolybrush1431_g57819);
				
				float MASK_G158_g58314 = tex2DNode2050_g58314.g;
				float temp_output_2651_0_g58314 = ( 1.0 - MASK_G158_g58314 );
				float lerpResult2650_g58314 = lerp( MASK_G158_g58314 , temp_output_2651_0_g58314 , _SmoothnessSource);
				float temp_output_2693_0_g58314 = ( lerpResult2650_g58314 * _SmoothnessStrength );
				float2 appendResult2645_g58314 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g58314 = (float3(appendResult2645_g58314 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g58314 = unpack1891_g58314;
				float3 normalizeResult2641_g58314 = normalize( ( ( WorldTangent * break2680_g58314.x ) + ( WorldBiTangent * break2680_g58314.y ) + ( WorldNormal * break2680_g58314.z ) ) );
				float3 Normal_Per_Pixel2690_g58314 = normalizeResult2641_g58314;
				float fresnelNdotV2685_g58314 = dot( normalize( Normal_Per_Pixel2690_g58314 ), appendResult2644_g58314 );
				float fresnelNode2685_g58314 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g58314 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g58314 = lerp( temp_output_2693_0_g58314 , ( temp_output_2693_0_g58314 - fresnelNode2685_g58314 ) , _SmoothnessFresnelEnable);
				float temp_output_284_0_g57819 = saturate( lerpResult2636_g58314 );
				float lerpResult1462_g57819 = lerp( _00SmoothnessStrength , 0.0 , VC001248_g57819);
				float lerpResult1461_g57819 = lerp( _01SmoothnessStrength , 0.0 , VC011249_g57819);
				float lerpResult1460_g57819 = lerp( _02SmoothnessStrength , 0.0 , VC021250_g57819);
				float lerpResult587_g57819 = lerp( temp_output_284_0_g57819 , ( temp_output_284_0_g57819 + ( ( lerpResult1462_g57819 + lerpResult1461_g57819 ) + ( lerpResult1460_g57819 + 0.0 ) ) ) , EnablePolybrush1431_g57819);
				
				float MASK_R1378_g58314 = tex2DNode2050_g58314.r;
				float lerpResult3415_g58314 = lerp( 1.0 , MASK_R1378_g58314 , _OcclusionStrengthAO);
				float lerpResult3414_g58314 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g58314 = lerp( lerpResult3415_g58314 , lerpResult3414_g58314 , _OcclusionSource);
				float temp_output_2730_0_g58314 = saturate( lerpResult2709_g58314 );
				float temp_output_474_0_g57819 = temp_output_2730_0_g58314;
				float lerpResult1491_g57819 = lerp( ( 1.0 - _00OcclusionStrength ) , 0.0 , VC001248_g57819);
				float lerpResult1486_g57819 = lerp( ( 1.0 - _01OcclusionStrength ) , 0.0 , VC011249_g57819);
				float lerpResult1485_g57819 = lerp( ( 1.0 - _02OcclusionStrength ) , 0.0 , VC021250_g57819);
				float lerpResult588_g57819 = lerp( temp_output_474_0_g57819 , saturate( ( temp_output_474_0_g57819 + ( ( lerpResult1491_g57819 + lerpResult1486_g57819 ) + ( lerpResult1485_g57819 + 0.0 ) ) ) ) , EnablePolybrush1431_g57819);
				

				float3 BaseColor = lerpResult585_g57819;
				float3 Normal = lerpResult589_g57819;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult586_g57819;
				float Smoothness = lerpResult587_g57819;
				float Occlusion = lerpResult588_g57819;
				float Alpha = 1;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

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

				

				float Alpha = 1;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

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

				

				float Alpha = 1;
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

			#define ASE_NEEDS_FRAG_COLOR


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			TEXTURE2D(_00BaseColorMap);
			SAMPLER(sampler_00BaseColorMap);
			TEXTURE2D(_01BaseColorMap);
			SAMPLER(sampler_01BaseColorMap);
			TEXTURE2D(_02BaseColorMap);
			SAMPLER(sampler_02BaseColorMap);


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
			
			float MaskVCSwitch44_g58271( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58272( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58273( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
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
				float2 temp_output_1955_0_g58314 = (_MainUVs).xy;
				float2 temp_output_1953_0_g58314 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g58314;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g58314 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord4.xy = vertexToFrag70_g58525;
				float2 Offset235_g57822 = (_00UVs).zw;
				float2 temp_output_41_0_g57822 = ( ( v.texcoord0.xy * (_00UVs).xy ) + Offset235_g57822 );
				float2 vertexToFrag70_g57822 = temp_output_41_0_g57822;
				o.ase_texcoord4.zw = vertexToFrag70_g57822;
				float2 Offset235_g58224 = (_01UVs).zw;
				float2 temp_output_41_0_g58224 = ( ( v.texcoord0.xy * (_01UVs).xy ) + Offset235_g58224 );
				float2 vertexToFrag70_g58224 = temp_output_41_0_g58224;
				o.ase_texcoord5.xy = vertexToFrag70_g58224;
				float2 Offset235_g58240 = (_02UVs).zw;
				float2 temp_output_41_0_g58240 = ( ( v.texcoord0.xy * (_02UVs).xy ) + Offset235_g58240 );
				float2 vertexToFrag70_g58240 = temp_output_41_0_g58240;
				o.ase_texcoord5.zw = vertexToFrag70_g58240;
				
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
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
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
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
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

				float3 temp_output_1923_0_g58314 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord4.xy;
				float2 UV213_g58314 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g58314 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g58314 );
				float3 ALBEDO_RGBA1381_g58314 = (tex2DNode2048_g58314).rgb;
				float3 temp_output_3_0_g58314 = ( temp_output_1923_0_g58314 * ALBEDO_RGBA1381_g58314 * _Brightness );
				float3 temp_output_123_0_g57819 = temp_output_3_0_g58314;
				float localStochasticTiling159_g57826 = ( 0.0 );
				float2 vertexToFrag70_g57822 = IN.ase_texcoord4.zw;
				float2 temp_output_730_0_g57819 = vertexToFrag70_g57822;
				float2 UV159_g57826 = temp_output_730_0_g57819;
				float4 TexelSize159_g57826 = _00BaseColorMap_TexelSize;
				float4 Offsets159_g57826 = float4( 0,0,0,0 );
				float2 Weights159_g57826 = float2( 0,0 );
				{
				UV159_g57826 = UV159_g57826 * TexelSize159_g57826.zw - 0.5;
				float2 f = frac( UV159_g57826 );
				UV159_g57826 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57826.x - 0.5, UV159_g57826.x + 1.5, UV159_g57826.y - 0.5, UV159_g57826.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57826 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57826.xyxy;
				Weights159_g57826 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57820 = Offsets159_g57826;
				float2 temp_output_855_0_g57819 = ddx( temp_output_730_0_g57819 );
				float2 temp_output_205_0_g57820 = temp_output_855_0_g57819;
				float2 temp_output_856_0_g57819 = ddy( temp_output_730_0_g57819 );
				float2 temp_output_206_0_g57820 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57820 = Weights159_g57826;
				float2 break169_g57820 = Input_FetchWeights143_g57820;
				float4 lerpResult167_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult168_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult180_g57820 = lerp( lerpResult167_g57820 , lerpResult168_g57820 , break169_g57820.y);
				float4 Output_Fetch2DDerivative203_g57820 = lerpResult180_g57820;
				float3 BaseColor001284_g57819 = ( (_00Color).rgb * (Output_Fetch2DDerivative203_g57820).rgb * _00Brightness );
				float m_switch44_g58271 = _00FilterVertexColor;
				float m_Off44_g58271 = 1.0;
				float dotResult58_g58271 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58271 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58271 = ( dotResult58_g58271 + dotResult61_g58271 );
				float dotResult57_g58271 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58271 = ( dotResult57_g58271 + dotResult58_g58271 );
				float m_B44_g58271 = ( dotResult57_g58271 + dotResult61_g58271 );
				float m_A44_g58271 = IN.ase_color.a;
				float localMaskVCSwitch44_g58271 = MaskVCSwitch44_g58271( m_switch44_g58271 , m_Off44_g58271 , m_R44_g58271 , m_G44_g58271 , m_B44_g58271 , m_A44_g58271 );
				float clampResult54_g58271 = clamp( ( ( localMaskVCSwitch44_g58271 * _00BlendHeight ) / _00BlendSmooth ) , 0.0 , 1.0 );
				float VC001248_g57819 = clampResult54_g58271;
				float3 lerpResult1168_g57819 = lerp( BaseColor001284_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58228 = ( 0.0 );
				float2 vertexToFrag70_g58224 = IN.ase_texcoord5.xy;
				float2 temp_output_885_0_g57819 = vertexToFrag70_g58224;
				float2 UV159_g58228 = temp_output_885_0_g57819;
				float4 TexelSize159_g58228 = _01BaseColorMap_TexelSize;
				float4 Offsets159_g58228 = float4( 0,0,0,0 );
				float2 Weights159_g58228 = float2( 0,0 );
				{
				UV159_g58228 = UV159_g58228 * TexelSize159_g58228.zw - 0.5;
				float2 f = frac( UV159_g58228 );
				UV159_g58228 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58228.x - 0.5, UV159_g58228.x + 1.5, UV159_g58228.y - 0.5, UV159_g58228.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58228 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58228.xyxy;
				Weights159_g58228 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58222 = Offsets159_g58228;
				float2 temp_output_909_0_g57819 = ddx( temp_output_885_0_g57819 );
				float2 temp_output_205_0_g58222 = temp_output_909_0_g57819;
				float2 temp_output_908_0_g57819 = ddy( temp_output_885_0_g57819 );
				float2 temp_output_206_0_g58222 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58222 = Weights159_g58228;
				float2 break169_g58222 = Input_FetchWeights143_g58222;
				float4 lerpResult167_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult168_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult180_g58222 = lerp( lerpResult167_g58222 , lerpResult168_g58222 , break169_g58222.y);
				float4 Output_Fetch2DDerivative203_g58222 = lerpResult180_g58222;
				float3 BaseColor011408_g57819 = ( (_01Color).rgb * (Output_Fetch2DDerivative203_g58222).rgb * _01Brightness );
				float m_switch44_g58272 = _01FilterVertexColor;
				float m_Off44_g58272 = 1.0;
				float dotResult58_g58272 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58272 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58272 = ( dotResult58_g58272 + dotResult61_g58272 );
				float dotResult57_g58272 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58272 = ( dotResult57_g58272 + dotResult58_g58272 );
				float m_B44_g58272 = ( dotResult57_g58272 + dotResult61_g58272 );
				float m_A44_g58272 = IN.ase_color.a;
				float localMaskVCSwitch44_g58272 = MaskVCSwitch44_g58272( m_switch44_g58272 , m_Off44_g58272 , m_R44_g58272 , m_G44_g58272 , m_B44_g58272 , m_A44_g58272 );
				float clampResult54_g58272 = clamp( ( ( localMaskVCSwitch44_g58272 * _01BlendHeight ) / _01BlendSmooth ) , 0.0 , 1.0 );
				float VC011249_g57819 = clampResult54_g58272;
				float3 lerpResult1438_g57819 = lerp( BaseColor011408_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58244 = ( 0.0 );
				float2 vertexToFrag70_g58240 = IN.ase_texcoord5.zw;
				float2 temp_output_1015_0_g57819 = vertexToFrag70_g58240;
				float2 UV159_g58244 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58244 = _02BaseColorMap_TexelSize;
				float4 Offsets159_g58244 = float4( 0,0,0,0 );
				float2 Weights159_g58244 = float2( 0,0 );
				{
				UV159_g58244 = UV159_g58244 * TexelSize159_g58244.zw - 0.5;
				float2 f = frac( UV159_g58244 );
				UV159_g58244 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58244.x - 0.5, UV159_g58244.x + 1.5, UV159_g58244.y - 0.5, UV159_g58244.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58244 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58244.xyxy;
				Weights159_g58244 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58238 = Offsets159_g58244;
				float2 temp_output_1039_0_g57819 = ddx( temp_output_1015_0_g57819 );
				float2 temp_output_205_0_g58238 = temp_output_1039_0_g57819;
				float2 temp_output_1038_0_g57819 = ddy( temp_output_1015_0_g57819 );
				float2 temp_output_206_0_g58238 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58238 = Weights159_g58244;
				float2 break169_g58238 = Input_FetchWeights143_g58238;
				float4 lerpResult167_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult168_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult180_g58238 = lerp( lerpResult167_g58238 , lerpResult168_g58238 , break169_g58238.y);
				float4 Output_Fetch2DDerivative203_g58238 = lerpResult180_g58238;
				float3 BaseColor021410_g57819 = ( (_02Color).rgb * (Output_Fetch2DDerivative203_g58238).rgb * _02Brightness );
				float m_switch44_g58273 = _02FilterVertexColor;
				float m_Off44_g58273 = 1.0;
				float dotResult58_g58273 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58273 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58273 = ( dotResult58_g58273 + dotResult61_g58273 );
				float dotResult57_g58273 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58273 = ( dotResult57_g58273 + dotResult58_g58273 );
				float m_B44_g58273 = ( dotResult57_g58273 + dotResult61_g58273 );
				float m_A44_g58273 = IN.ase_color.a;
				float localMaskVCSwitch44_g58273 = MaskVCSwitch44_g58273( m_switch44_g58273 , m_Off44_g58273 , m_R44_g58273 , m_G44_g58273 , m_B44_g58273 , m_A44_g58273 );
				float clampResult54_g58273 = clamp( ( ( localMaskVCSwitch44_g58273 * _02BlendHeight ) / _02BlendSmooth ) , 0.0 , 1.0 );
				float VC021250_g57819 = clampResult54_g58273;
				float3 lerpResult1439_g57819 = lerp( BaseColor021410_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector0 = float3(0,0,0);
				float EnablePolybrush1431_g57819 = ( _EnablePolybrush + ( ( _CATEGORY_POLYBRUSHVERTEXCOLOR + _SPACE_POLYBRUSH ) * 0.0 ) );
				float3 lerpResult585_g57819 = lerp( temp_output_123_0_g57819 , ( temp_output_123_0_g57819 + ( ( lerpResult1168_g57819 + lerpResult1438_g57819 ) + ( lerpResult1439_g57819 + _Vector0 ) ) ) , EnablePolybrush1431_g57819);
				

				float3 BaseColor = lerpResult585_g57819;
				float3 Emission = 0;
				float Alpha = 1;
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

			#define ASE_NEEDS_FRAG_COLOR


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			TEXTURE2D(_00BaseColorMap);
			SAMPLER(sampler_00BaseColorMap);
			TEXTURE2D(_01BaseColorMap);
			SAMPLER(sampler_01BaseColorMap);
			TEXTURE2D(_02BaseColorMap);
			SAMPLER(sampler_02BaseColorMap);


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
			
			float MaskVCSwitch44_g58271( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58272( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58273( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
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
				float2 temp_output_1955_0_g58314 = (_MainUVs).xy;
				float2 temp_output_1953_0_g58314 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g58314;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g58314 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord2.xy = vertexToFrag70_g58525;
				float2 Offset235_g57822 = (_00UVs).zw;
				float2 temp_output_41_0_g57822 = ( ( v.ase_texcoord.xy * (_00UVs).xy ) + Offset235_g57822 );
				float2 vertexToFrag70_g57822 = temp_output_41_0_g57822;
				o.ase_texcoord2.zw = vertexToFrag70_g57822;
				float2 Offset235_g58224 = (_01UVs).zw;
				float2 temp_output_41_0_g58224 = ( ( v.ase_texcoord.xy * (_01UVs).xy ) + Offset235_g58224 );
				float2 vertexToFrag70_g58224 = temp_output_41_0_g58224;
				o.ase_texcoord3.xy = vertexToFrag70_g58224;
				float2 Offset235_g58240 = (_02UVs).zw;
				float2 temp_output_41_0_g58240 = ( ( v.ase_texcoord.xy * (_02UVs).xy ) + Offset235_g58240 );
				float2 vertexToFrag70_g58240 = temp_output_41_0_g58240;
				o.ase_texcoord3.zw = vertexToFrag70_g58240;
				
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

				float3 temp_output_1923_0_g58314 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord2.xy;
				float2 UV213_g58314 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g58314 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g58314 );
				float3 ALBEDO_RGBA1381_g58314 = (tex2DNode2048_g58314).rgb;
				float3 temp_output_3_0_g58314 = ( temp_output_1923_0_g58314 * ALBEDO_RGBA1381_g58314 * _Brightness );
				float3 temp_output_123_0_g57819 = temp_output_3_0_g58314;
				float localStochasticTiling159_g57826 = ( 0.0 );
				float2 vertexToFrag70_g57822 = IN.ase_texcoord2.zw;
				float2 temp_output_730_0_g57819 = vertexToFrag70_g57822;
				float2 UV159_g57826 = temp_output_730_0_g57819;
				float4 TexelSize159_g57826 = _00BaseColorMap_TexelSize;
				float4 Offsets159_g57826 = float4( 0,0,0,0 );
				float2 Weights159_g57826 = float2( 0,0 );
				{
				UV159_g57826 = UV159_g57826 * TexelSize159_g57826.zw - 0.5;
				float2 f = frac( UV159_g57826 );
				UV159_g57826 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57826.x - 0.5, UV159_g57826.x + 1.5, UV159_g57826.y - 0.5, UV159_g57826.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57826 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57826.xyxy;
				Weights159_g57826 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57820 = Offsets159_g57826;
				float2 temp_output_855_0_g57819 = ddx( temp_output_730_0_g57819 );
				float2 temp_output_205_0_g57820 = temp_output_855_0_g57819;
				float2 temp_output_856_0_g57819 = ddy( temp_output_730_0_g57819 );
				float2 temp_output_206_0_g57820 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57820 = Weights159_g57826;
				float2 break169_g57820 = Input_FetchWeights143_g57820;
				float4 lerpResult167_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult168_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult180_g57820 = lerp( lerpResult167_g57820 , lerpResult168_g57820 , break169_g57820.y);
				float4 Output_Fetch2DDerivative203_g57820 = lerpResult180_g57820;
				float3 BaseColor001284_g57819 = ( (_00Color).rgb * (Output_Fetch2DDerivative203_g57820).rgb * _00Brightness );
				float m_switch44_g58271 = _00FilterVertexColor;
				float m_Off44_g58271 = 1.0;
				float dotResult58_g58271 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58271 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58271 = ( dotResult58_g58271 + dotResult61_g58271 );
				float dotResult57_g58271 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58271 = ( dotResult57_g58271 + dotResult58_g58271 );
				float m_B44_g58271 = ( dotResult57_g58271 + dotResult61_g58271 );
				float m_A44_g58271 = IN.ase_color.a;
				float localMaskVCSwitch44_g58271 = MaskVCSwitch44_g58271( m_switch44_g58271 , m_Off44_g58271 , m_R44_g58271 , m_G44_g58271 , m_B44_g58271 , m_A44_g58271 );
				float clampResult54_g58271 = clamp( ( ( localMaskVCSwitch44_g58271 * _00BlendHeight ) / _00BlendSmooth ) , 0.0 , 1.0 );
				float VC001248_g57819 = clampResult54_g58271;
				float3 lerpResult1168_g57819 = lerp( BaseColor001284_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58228 = ( 0.0 );
				float2 vertexToFrag70_g58224 = IN.ase_texcoord3.xy;
				float2 temp_output_885_0_g57819 = vertexToFrag70_g58224;
				float2 UV159_g58228 = temp_output_885_0_g57819;
				float4 TexelSize159_g58228 = _01BaseColorMap_TexelSize;
				float4 Offsets159_g58228 = float4( 0,0,0,0 );
				float2 Weights159_g58228 = float2( 0,0 );
				{
				UV159_g58228 = UV159_g58228 * TexelSize159_g58228.zw - 0.5;
				float2 f = frac( UV159_g58228 );
				UV159_g58228 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58228.x - 0.5, UV159_g58228.x + 1.5, UV159_g58228.y - 0.5, UV159_g58228.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58228 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58228.xyxy;
				Weights159_g58228 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58222 = Offsets159_g58228;
				float2 temp_output_909_0_g57819 = ddx( temp_output_885_0_g57819 );
				float2 temp_output_205_0_g58222 = temp_output_909_0_g57819;
				float2 temp_output_908_0_g57819 = ddy( temp_output_885_0_g57819 );
				float2 temp_output_206_0_g58222 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58222 = Weights159_g58228;
				float2 break169_g58222 = Input_FetchWeights143_g58222;
				float4 lerpResult167_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult168_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult180_g58222 = lerp( lerpResult167_g58222 , lerpResult168_g58222 , break169_g58222.y);
				float4 Output_Fetch2DDerivative203_g58222 = lerpResult180_g58222;
				float3 BaseColor011408_g57819 = ( (_01Color).rgb * (Output_Fetch2DDerivative203_g58222).rgb * _01Brightness );
				float m_switch44_g58272 = _01FilterVertexColor;
				float m_Off44_g58272 = 1.0;
				float dotResult58_g58272 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58272 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58272 = ( dotResult58_g58272 + dotResult61_g58272 );
				float dotResult57_g58272 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58272 = ( dotResult57_g58272 + dotResult58_g58272 );
				float m_B44_g58272 = ( dotResult57_g58272 + dotResult61_g58272 );
				float m_A44_g58272 = IN.ase_color.a;
				float localMaskVCSwitch44_g58272 = MaskVCSwitch44_g58272( m_switch44_g58272 , m_Off44_g58272 , m_R44_g58272 , m_G44_g58272 , m_B44_g58272 , m_A44_g58272 );
				float clampResult54_g58272 = clamp( ( ( localMaskVCSwitch44_g58272 * _01BlendHeight ) / _01BlendSmooth ) , 0.0 , 1.0 );
				float VC011249_g57819 = clampResult54_g58272;
				float3 lerpResult1438_g57819 = lerp( BaseColor011408_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58244 = ( 0.0 );
				float2 vertexToFrag70_g58240 = IN.ase_texcoord3.zw;
				float2 temp_output_1015_0_g57819 = vertexToFrag70_g58240;
				float2 UV159_g58244 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58244 = _02BaseColorMap_TexelSize;
				float4 Offsets159_g58244 = float4( 0,0,0,0 );
				float2 Weights159_g58244 = float2( 0,0 );
				{
				UV159_g58244 = UV159_g58244 * TexelSize159_g58244.zw - 0.5;
				float2 f = frac( UV159_g58244 );
				UV159_g58244 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58244.x - 0.5, UV159_g58244.x + 1.5, UV159_g58244.y - 0.5, UV159_g58244.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58244 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58244.xyxy;
				Weights159_g58244 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58238 = Offsets159_g58244;
				float2 temp_output_1039_0_g57819 = ddx( temp_output_1015_0_g57819 );
				float2 temp_output_205_0_g58238 = temp_output_1039_0_g57819;
				float2 temp_output_1038_0_g57819 = ddy( temp_output_1015_0_g57819 );
				float2 temp_output_206_0_g58238 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58238 = Weights159_g58244;
				float2 break169_g58238 = Input_FetchWeights143_g58238;
				float4 lerpResult167_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult168_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult180_g58238 = lerp( lerpResult167_g58238 , lerpResult168_g58238 , break169_g58238.y);
				float4 Output_Fetch2DDerivative203_g58238 = lerpResult180_g58238;
				float3 BaseColor021410_g57819 = ( (_02Color).rgb * (Output_Fetch2DDerivative203_g58238).rgb * _02Brightness );
				float m_switch44_g58273 = _02FilterVertexColor;
				float m_Off44_g58273 = 1.0;
				float dotResult58_g58273 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58273 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58273 = ( dotResult58_g58273 + dotResult61_g58273 );
				float dotResult57_g58273 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58273 = ( dotResult57_g58273 + dotResult58_g58273 );
				float m_B44_g58273 = ( dotResult57_g58273 + dotResult61_g58273 );
				float m_A44_g58273 = IN.ase_color.a;
				float localMaskVCSwitch44_g58273 = MaskVCSwitch44_g58273( m_switch44_g58273 , m_Off44_g58273 , m_R44_g58273 , m_G44_g58273 , m_B44_g58273 , m_A44_g58273 );
				float clampResult54_g58273 = clamp( ( ( localMaskVCSwitch44_g58273 * _02BlendHeight ) / _02BlendSmooth ) , 0.0 , 1.0 );
				float VC021250_g57819 = clampResult54_g58273;
				float3 lerpResult1439_g57819 = lerp( BaseColor021410_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector0 = float3(0,0,0);
				float EnablePolybrush1431_g57819 = ( _EnablePolybrush + ( ( _CATEGORY_POLYBRUSHVERTEXCOLOR + _SPACE_POLYBRUSH ) * 0.0 ) );
				float3 lerpResult585_g57819 = lerp( temp_output_123_0_g57819 , ( temp_output_123_0_g57819 + ( ( lerpResult1168_g57819 + lerpResult1438_g57819 ) + ( lerpResult1439_g57819 + _Vector0 ) ) ) , EnablePolybrush1431_g57819);
				

				float3 BaseColor = lerpResult585_g57819;
				float Alpha = 1;
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

			#define ASE_NEEDS_FRAG_COLOR


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
				float4 ase_color : COLOR;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			TEXTURE2D(_00NormalMap);
			SAMPLER(sampler_00NormalMap);
			TEXTURE2D(_01NormalMap);
			SAMPLER(sampler_01NormalMap);
			TEXTURE2D(_02NormalMap);
			SAMPLER(sampler_02NormalMap);


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
			
			float MaskVCSwitch44_g58271( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58272( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58273( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
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
				float2 temp_output_1955_0_g58314 = (_MainUVs).xy;
				float2 temp_output_1953_0_g58314 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g58314;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g58314 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord5.xy = vertexToFrag70_g58525;
				float2 Offset235_g57822 = (_00UVs).zw;
				float2 temp_output_41_0_g57822 = ( ( v.ase_texcoord.xy * (_00UVs).xy ) + Offset235_g57822 );
				float2 vertexToFrag70_g57822 = temp_output_41_0_g57822;
				o.ase_texcoord5.zw = vertexToFrag70_g57822;
				float2 Offset235_g58224 = (_01UVs).zw;
				float2 temp_output_41_0_g58224 = ( ( v.ase_texcoord.xy * (_01UVs).xy ) + Offset235_g58224 );
				float2 vertexToFrag70_g58224 = temp_output_41_0_g58224;
				o.ase_texcoord6.xy = vertexToFrag70_g58224;
				float2 Offset235_g58240 = (_02UVs).zw;
				float2 temp_output_41_0_g58240 = ( ( v.ase_texcoord.xy * (_02UVs).xy ) + Offset235_g58240 );
				float2 vertexToFrag70_g58240 = temp_output_41_0_g58240;
				o.ase_texcoord6.zw = vertexToFrag70_g58240;
				
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
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

				float2 vertexToFrag70_g58525 = IN.ase_texcoord5.xy;
				float2 UV213_g58314 = vertexToFrag70_g58525;
				float4 NORMAL_RGBA1382_g58314 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g58314 );
				float3 unpack1891_g58314 = UnpackNormalScale( NORMAL_RGBA1382_g58314, _NormalStrength );
				unpack1891_g58314.z = lerp( 1, unpack1891_g58314.z, saturate(_NormalStrength) );
				float3 temp_output_102_0_g57819 = unpack1891_g58314;
				float localStochasticTiling159_g57829 = ( 0.0 );
				float2 vertexToFrag70_g57822 = IN.ase_texcoord5.zw;
				float2 temp_output_730_0_g57819 = vertexToFrag70_g57822;
				float2 UV159_g57829 = temp_output_730_0_g57819;
				float4 TexelSize159_g57829 = _00NormalMap_TexelSize;
				float4 Offsets159_g57829 = float4( 0,0,0,0 );
				float2 Weights159_g57829 = float2( 0,0 );
				{
				UV159_g57829 = UV159_g57829 * TexelSize159_g57829.zw - 0.5;
				float2 f = frac( UV159_g57829 );
				UV159_g57829 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57829.x - 0.5, UV159_g57829.x + 1.5, UV159_g57829.y - 0.5, UV159_g57829.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57829 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57829.xyxy;
				Weights159_g57829 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57828 = Offsets159_g57829;
				float2 temp_output_855_0_g57819 = ddx( temp_output_730_0_g57819 );
				float2 temp_output_205_0_g57828 = temp_output_855_0_g57819;
				float2 temp_output_856_0_g57819 = ddy( temp_output_730_0_g57819 );
				float2 temp_output_206_0_g57828 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57828 = Weights159_g57829;
				float2 break169_g57828 = Input_FetchWeights143_g57828;
				float4 lerpResult167_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult168_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult180_g57828 = lerp( lerpResult167_g57828 , lerpResult168_g57828 , break169_g57828.y);
				float4 Output_Fetch2DDerivative203_g57828 = lerpResult180_g57828;
				float3 unpack659_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g57828, _00NormalMapScale );
				unpack659_g57819.z = lerp( 1, unpack659_g57819.z, saturate(_00NormalMapScale) );
				float3 Normal001285_g57819 = unpack659_g57819;
				float m_switch44_g58271 = _00FilterVertexColor;
				float m_Off44_g58271 = 1.0;
				float dotResult58_g58271 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58271 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58271 = ( dotResult58_g58271 + dotResult61_g58271 );
				float dotResult57_g58271 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58271 = ( dotResult57_g58271 + dotResult58_g58271 );
				float m_B44_g58271 = ( dotResult57_g58271 + dotResult61_g58271 );
				float m_A44_g58271 = IN.ase_color.a;
				float localMaskVCSwitch44_g58271 = MaskVCSwitch44_g58271( m_switch44_g58271 , m_Off44_g58271 , m_R44_g58271 , m_G44_g58271 , m_B44_g58271 , m_A44_g58271 );
				float clampResult54_g58271 = clamp( ( ( localMaskVCSwitch44_g58271 * _00BlendHeight ) / _00BlendSmooth ) , 0.0 , 1.0 );
				float VC001248_g57819 = clampResult54_g58271;
				float3 lerpResult1451_g57819 = lerp( Normal001285_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58231 = ( 0.0 );
				float2 vertexToFrag70_g58224 = IN.ase_texcoord6.xy;
				float2 temp_output_885_0_g57819 = vertexToFrag70_g58224;
				float2 UV159_g58231 = temp_output_885_0_g57819;
				float4 TexelSize159_g58231 = _01NormalMap_TexelSize;
				float4 Offsets159_g58231 = float4( 0,0,0,0 );
				float2 Weights159_g58231 = float2( 0,0 );
				{
				UV159_g58231 = UV159_g58231 * TexelSize159_g58231.zw - 0.5;
				float2 f = frac( UV159_g58231 );
				UV159_g58231 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58231.x - 0.5, UV159_g58231.x + 1.5, UV159_g58231.y - 0.5, UV159_g58231.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58231 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58231.xyxy;
				Weights159_g58231 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58230 = Offsets159_g58231;
				float2 temp_output_909_0_g57819 = ddx( temp_output_885_0_g57819 );
				float2 temp_output_205_0_g58230 = temp_output_909_0_g57819;
				float2 temp_output_908_0_g57819 = ddy( temp_output_885_0_g57819 );
				float2 temp_output_206_0_g58230 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58230 = Weights159_g58231;
				float2 break169_g58230 = Input_FetchWeights143_g58230;
				float4 lerpResult167_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult168_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult180_g58230 = lerp( lerpResult167_g58230 , lerpResult168_g58230 , break169_g58230.y);
				float4 Output_Fetch2DDerivative203_g58230 = lerpResult180_g58230;
				float3 unpack940_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58230, _01NormalMapScale );
				unpack940_g57819.z = lerp( 1, unpack940_g57819.z, saturate(_01NormalMapScale) );
				float3 Normal011409_g57819 = unpack940_g57819;
				float m_switch44_g58272 = _01FilterVertexColor;
				float m_Off44_g58272 = 1.0;
				float dotResult58_g58272 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58272 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58272 = ( dotResult58_g58272 + dotResult61_g58272 );
				float dotResult57_g58272 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58272 = ( dotResult57_g58272 + dotResult58_g58272 );
				float m_B44_g58272 = ( dotResult57_g58272 + dotResult61_g58272 );
				float m_A44_g58272 = IN.ase_color.a;
				float localMaskVCSwitch44_g58272 = MaskVCSwitch44_g58272( m_switch44_g58272 , m_Off44_g58272 , m_R44_g58272 , m_G44_g58272 , m_B44_g58272 , m_A44_g58272 );
				float clampResult54_g58272 = clamp( ( ( localMaskVCSwitch44_g58272 * _01BlendHeight ) / _01BlendSmooth ) , 0.0 , 1.0 );
				float VC011249_g57819 = clampResult54_g58272;
				float3 lerpResult1450_g57819 = lerp( Normal011409_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58247 = ( 0.0 );
				float2 vertexToFrag70_g58240 = IN.ase_texcoord6.zw;
				float2 temp_output_1015_0_g57819 = vertexToFrag70_g58240;
				float2 UV159_g58247 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58247 = _02NormalMap_TexelSize;
				float4 Offsets159_g58247 = float4( 0,0,0,0 );
				float2 Weights159_g58247 = float2( 0,0 );
				{
				UV159_g58247 = UV159_g58247 * TexelSize159_g58247.zw - 0.5;
				float2 f = frac( UV159_g58247 );
				UV159_g58247 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58247.x - 0.5, UV159_g58247.x + 1.5, UV159_g58247.y - 0.5, UV159_g58247.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58247 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58247.xyxy;
				Weights159_g58247 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58246 = Offsets159_g58247;
				float2 temp_output_1039_0_g57819 = ddx( temp_output_1015_0_g57819 );
				float2 temp_output_205_0_g58246 = temp_output_1039_0_g57819;
				float2 temp_output_1038_0_g57819 = ddy( temp_output_1015_0_g57819 );
				float2 temp_output_206_0_g58246 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58246 = Weights159_g58247;
				float2 break169_g58246 = Input_FetchWeights143_g58246;
				float4 lerpResult167_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult168_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult180_g58246 = lerp( lerpResult167_g58246 , lerpResult168_g58246 , break169_g58246.y);
				float4 Output_Fetch2DDerivative203_g58246 = lerpResult180_g58246;
				float3 unpack1070_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58246, _02NormalMapScale );
				unpack1070_g57819.z = lerp( 1, unpack1070_g57819.z, saturate(_02NormalMapScale) );
				float3 Normal021411_g57819 = unpack1070_g57819;
				float m_switch44_g58273 = _02FilterVertexColor;
				float m_Off44_g58273 = 1.0;
				float dotResult58_g58273 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58273 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58273 = ( dotResult58_g58273 + dotResult61_g58273 );
				float dotResult57_g58273 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58273 = ( dotResult57_g58273 + dotResult58_g58273 );
				float m_B44_g58273 = ( dotResult57_g58273 + dotResult61_g58273 );
				float m_A44_g58273 = IN.ase_color.a;
				float localMaskVCSwitch44_g58273 = MaskVCSwitch44_g58273( m_switch44_g58273 , m_Off44_g58273 , m_R44_g58273 , m_G44_g58273 , m_B44_g58273 , m_A44_g58273 );
				float clampResult54_g58273 = clamp( ( ( localMaskVCSwitch44_g58273 * _02BlendHeight ) / _02BlendSmooth ) , 0.0 , 1.0 );
				float VC021250_g57819 = clampResult54_g58273;
				float3 lerpResult1449_g57819 = lerp( Normal021411_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector1 = float3(0,0,0);
				float EnablePolybrush1431_g57819 = ( _EnablePolybrush + ( ( _CATEGORY_POLYBRUSHVERTEXCOLOR + _SPACE_POLYBRUSH ) * 0.0 ) );
				float3 lerpResult589_g57819 = lerp( temp_output_102_0_g57819 , ( temp_output_102_0_g57819 + ( ( saturate( lerpResult1451_g57819 ) + saturate( lerpResult1450_g57819 ) ) + ( saturate( lerpResult1449_g57819 ) + _Vector1 ) ) ) , EnablePolybrush1431_g57819);
				

				float3 Normal = lerpResult589_g57819;
				float Alpha = 1;
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

			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL


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
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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
			TEXTURE2D(_00BaseColorMap);
			SAMPLER(sampler_00BaseColorMap);
			TEXTURE2D(_01BaseColorMap);
			SAMPLER(sampler_01BaseColorMap);
			TEXTURE2D(_02BaseColorMap);
			SAMPLER(sampler_02BaseColorMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_00NormalMap);
			SAMPLER(sampler_00NormalMap);
			TEXTURE2D(_01NormalMap);
			SAMPLER(sampler_01NormalMap);
			TEXTURE2D(_02NormalMap);
			SAMPLER(sampler_02NormalMap);
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
			
			float MaskVCSwitch44_g58271( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58272( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
			}
			
			float MaskVCSwitch44_g58273( float m_switch, float m_Off, float m_R, float m_G, float m_B, float m_A )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_R;
				else if(m_switch ==2)
					return m_G;
				else if(m_switch ==3)
					return m_B;
				else if(m_switch ==4)
					return m_A;
				else
				return float(0);
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
				float2 temp_output_1955_0_g58314 = (_MainUVs).xy;
				float2 temp_output_1953_0_g58314 = (_MainUVs).zw;
				float2 Offset235_g58525 = temp_output_1953_0_g58314;
				float2 temp_output_41_0_g58525 = ( ( localfloat2switchUVMode80_g58525 * temp_output_1955_0_g58314 ) + Offset235_g58525 );
				float2 vertexToFrag70_g58525 = temp_output_41_0_g58525;
				o.ase_texcoord8.xy = vertexToFrag70_g58525;
				float2 Offset235_g57822 = (_00UVs).zw;
				float2 temp_output_41_0_g57822 = ( ( v.texcoord.xy * (_00UVs).xy ) + Offset235_g57822 );
				float2 vertexToFrag70_g57822 = temp_output_41_0_g57822;
				o.ase_texcoord8.zw = vertexToFrag70_g57822;
				float2 Offset235_g58224 = (_01UVs).zw;
				float2 temp_output_41_0_g58224 = ( ( v.texcoord.xy * (_01UVs).xy ) + Offset235_g58224 );
				float2 vertexToFrag70_g58224 = temp_output_41_0_g58224;
				o.ase_texcoord9.xy = vertexToFrag70_g58224;
				float2 Offset235_g58240 = (_02UVs).zw;
				float2 temp_output_41_0_g58240 = ( ( v.texcoord.xy * (_02UVs).xy ) + Offset235_g58240 );
				float2 vertexToFrag70_g58240 = temp_output_41_0_g58240;
				o.ase_texcoord9.zw = vertexToFrag70_g58240;
				
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

				float3 temp_output_1923_0_g58314 = (_BaseColor).rgb;
				float2 vertexToFrag70_g58525 = IN.ase_texcoord8.xy;
				float2 UV213_g58314 = vertexToFrag70_g58525;
				float4 tex2DNode2048_g58314 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, UV213_g58314 );
				float3 ALBEDO_RGBA1381_g58314 = (tex2DNode2048_g58314).rgb;
				float3 temp_output_3_0_g58314 = ( temp_output_1923_0_g58314 * ALBEDO_RGBA1381_g58314 * _Brightness );
				float3 temp_output_123_0_g57819 = temp_output_3_0_g58314;
				float localStochasticTiling159_g57826 = ( 0.0 );
				float2 vertexToFrag70_g57822 = IN.ase_texcoord8.zw;
				float2 temp_output_730_0_g57819 = vertexToFrag70_g57822;
				float2 UV159_g57826 = temp_output_730_0_g57819;
				float4 TexelSize159_g57826 = _00BaseColorMap_TexelSize;
				float4 Offsets159_g57826 = float4( 0,0,0,0 );
				float2 Weights159_g57826 = float2( 0,0 );
				{
				UV159_g57826 = UV159_g57826 * TexelSize159_g57826.zw - 0.5;
				float2 f = frac( UV159_g57826 );
				UV159_g57826 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57826.x - 0.5, UV159_g57826.x + 1.5, UV159_g57826.y - 0.5, UV159_g57826.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57826 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57826.xyxy;
				Weights159_g57826 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57820 = Offsets159_g57826;
				float2 temp_output_855_0_g57819 = ddx( temp_output_730_0_g57819 );
				float2 temp_output_205_0_g57820 = temp_output_855_0_g57819;
				float2 temp_output_856_0_g57819 = ddy( temp_output_730_0_g57819 );
				float2 temp_output_206_0_g57820 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57820 = Weights159_g57826;
				float2 break169_g57820 = Input_FetchWeights143_g57820;
				float4 lerpResult167_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xw, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult168_g57820 = lerp( SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).yz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , SAMPLE_TEXTURE2D_GRAD( _00BaseColorMap, sampler_00BaseColorMap, (Input_FetchOffsets70_g57820).xz, temp_output_205_0_g57820, temp_output_206_0_g57820 ) , break169_g57820.x);
				float4 lerpResult180_g57820 = lerp( lerpResult167_g57820 , lerpResult168_g57820 , break169_g57820.y);
				float4 Output_Fetch2DDerivative203_g57820 = lerpResult180_g57820;
				float3 BaseColor001284_g57819 = ( (_00Color).rgb * (Output_Fetch2DDerivative203_g57820).rgb * _00Brightness );
				float m_switch44_g58271 = _00FilterVertexColor;
				float m_Off44_g58271 = 1.0;
				float dotResult58_g58271 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58271 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58271 = ( dotResult58_g58271 + dotResult61_g58271 );
				float dotResult57_g58271 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58271 = ( dotResult57_g58271 + dotResult58_g58271 );
				float m_B44_g58271 = ( dotResult57_g58271 + dotResult61_g58271 );
				float m_A44_g58271 = IN.ase_color.a;
				float localMaskVCSwitch44_g58271 = MaskVCSwitch44_g58271( m_switch44_g58271 , m_Off44_g58271 , m_R44_g58271 , m_G44_g58271 , m_B44_g58271 , m_A44_g58271 );
				float clampResult54_g58271 = clamp( ( ( localMaskVCSwitch44_g58271 * _00BlendHeight ) / _00BlendSmooth ) , 0.0 , 1.0 );
				float VC001248_g57819 = clampResult54_g58271;
				float3 lerpResult1168_g57819 = lerp( BaseColor001284_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58228 = ( 0.0 );
				float2 vertexToFrag70_g58224 = IN.ase_texcoord9.xy;
				float2 temp_output_885_0_g57819 = vertexToFrag70_g58224;
				float2 UV159_g58228 = temp_output_885_0_g57819;
				float4 TexelSize159_g58228 = _01BaseColorMap_TexelSize;
				float4 Offsets159_g58228 = float4( 0,0,0,0 );
				float2 Weights159_g58228 = float2( 0,0 );
				{
				UV159_g58228 = UV159_g58228 * TexelSize159_g58228.zw - 0.5;
				float2 f = frac( UV159_g58228 );
				UV159_g58228 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58228.x - 0.5, UV159_g58228.x + 1.5, UV159_g58228.y - 0.5, UV159_g58228.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58228 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58228.xyxy;
				Weights159_g58228 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58222 = Offsets159_g58228;
				float2 temp_output_909_0_g57819 = ddx( temp_output_885_0_g57819 );
				float2 temp_output_205_0_g58222 = temp_output_909_0_g57819;
				float2 temp_output_908_0_g57819 = ddy( temp_output_885_0_g57819 );
				float2 temp_output_206_0_g58222 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58222 = Weights159_g58228;
				float2 break169_g58222 = Input_FetchWeights143_g58222;
				float4 lerpResult167_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xw, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult168_g58222 = lerp( SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).yz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , SAMPLE_TEXTURE2D_GRAD( _01BaseColorMap, sampler_01BaseColorMap, (Input_FetchOffsets70_g58222).xz, temp_output_205_0_g58222, temp_output_206_0_g58222 ) , break169_g58222.x);
				float4 lerpResult180_g58222 = lerp( lerpResult167_g58222 , lerpResult168_g58222 , break169_g58222.y);
				float4 Output_Fetch2DDerivative203_g58222 = lerpResult180_g58222;
				float3 BaseColor011408_g57819 = ( (_01Color).rgb * (Output_Fetch2DDerivative203_g58222).rgb * _01Brightness );
				float m_switch44_g58272 = _01FilterVertexColor;
				float m_Off44_g58272 = 1.0;
				float dotResult58_g58272 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58272 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58272 = ( dotResult58_g58272 + dotResult61_g58272 );
				float dotResult57_g58272 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58272 = ( dotResult57_g58272 + dotResult58_g58272 );
				float m_B44_g58272 = ( dotResult57_g58272 + dotResult61_g58272 );
				float m_A44_g58272 = IN.ase_color.a;
				float localMaskVCSwitch44_g58272 = MaskVCSwitch44_g58272( m_switch44_g58272 , m_Off44_g58272 , m_R44_g58272 , m_G44_g58272 , m_B44_g58272 , m_A44_g58272 );
				float clampResult54_g58272 = clamp( ( ( localMaskVCSwitch44_g58272 * _01BlendHeight ) / _01BlendSmooth ) , 0.0 , 1.0 );
				float VC011249_g57819 = clampResult54_g58272;
				float3 lerpResult1438_g57819 = lerp( BaseColor011408_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58244 = ( 0.0 );
				float2 vertexToFrag70_g58240 = IN.ase_texcoord9.zw;
				float2 temp_output_1015_0_g57819 = vertexToFrag70_g58240;
				float2 UV159_g58244 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58244 = _02BaseColorMap_TexelSize;
				float4 Offsets159_g58244 = float4( 0,0,0,0 );
				float2 Weights159_g58244 = float2( 0,0 );
				{
				UV159_g58244 = UV159_g58244 * TexelSize159_g58244.zw - 0.5;
				float2 f = frac( UV159_g58244 );
				UV159_g58244 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58244.x - 0.5, UV159_g58244.x + 1.5, UV159_g58244.y - 0.5, UV159_g58244.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58244 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58244.xyxy;
				Weights159_g58244 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58238 = Offsets159_g58244;
				float2 temp_output_1039_0_g57819 = ddx( temp_output_1015_0_g57819 );
				float2 temp_output_205_0_g58238 = temp_output_1039_0_g57819;
				float2 temp_output_1038_0_g57819 = ddy( temp_output_1015_0_g57819 );
				float2 temp_output_206_0_g58238 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58238 = Weights159_g58244;
				float2 break169_g58238 = Input_FetchWeights143_g58238;
				float4 lerpResult167_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xw, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult168_g58238 = lerp( SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).yz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , SAMPLE_TEXTURE2D_GRAD( _02BaseColorMap, sampler_02BaseColorMap, (Input_FetchOffsets70_g58238).xz, temp_output_205_0_g58238, temp_output_206_0_g58238 ) , break169_g58238.x);
				float4 lerpResult180_g58238 = lerp( lerpResult167_g58238 , lerpResult168_g58238 , break169_g58238.y);
				float4 Output_Fetch2DDerivative203_g58238 = lerpResult180_g58238;
				float3 BaseColor021410_g57819 = ( (_02Color).rgb * (Output_Fetch2DDerivative203_g58238).rgb * _02Brightness );
				float m_switch44_g58273 = _02FilterVertexColor;
				float m_Off44_g58273 = 1.0;
				float dotResult58_g58273 = dot( IN.ase_color.g , IN.ase_color.g );
				float dotResult61_g58273 = dot( IN.ase_color.b , IN.ase_color.b );
				float m_R44_g58273 = ( dotResult58_g58273 + dotResult61_g58273 );
				float dotResult57_g58273 = dot( IN.ase_color.r , IN.ase_color.r );
				float m_G44_g58273 = ( dotResult57_g58273 + dotResult58_g58273 );
				float m_B44_g58273 = ( dotResult57_g58273 + dotResult61_g58273 );
				float m_A44_g58273 = IN.ase_color.a;
				float localMaskVCSwitch44_g58273 = MaskVCSwitch44_g58273( m_switch44_g58273 , m_Off44_g58273 , m_R44_g58273 , m_G44_g58273 , m_B44_g58273 , m_A44_g58273 );
				float clampResult54_g58273 = clamp( ( ( localMaskVCSwitch44_g58273 * _02BlendHeight ) / _02BlendSmooth ) , 0.0 , 1.0 );
				float VC021250_g57819 = clampResult54_g58273;
				float3 lerpResult1439_g57819 = lerp( BaseColor021410_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector0 = float3(0,0,0);
				float EnablePolybrush1431_g57819 = ( _EnablePolybrush + ( ( _CATEGORY_POLYBRUSHVERTEXCOLOR + _SPACE_POLYBRUSH ) * 0.0 ) );
				float3 lerpResult585_g57819 = lerp( temp_output_123_0_g57819 , ( temp_output_123_0_g57819 + ( ( lerpResult1168_g57819 + lerpResult1438_g57819 ) + ( lerpResult1439_g57819 + _Vector0 ) ) ) , EnablePolybrush1431_g57819);
				
				float4 NORMAL_RGBA1382_g58314 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, UV213_g58314 );
				float3 unpack1891_g58314 = UnpackNormalScale( NORMAL_RGBA1382_g58314, _NormalStrength );
				unpack1891_g58314.z = lerp( 1, unpack1891_g58314.z, saturate(_NormalStrength) );
				float3 temp_output_102_0_g57819 = unpack1891_g58314;
				float localStochasticTiling159_g57829 = ( 0.0 );
				float2 UV159_g57829 = temp_output_730_0_g57819;
				float4 TexelSize159_g57829 = _00NormalMap_TexelSize;
				float4 Offsets159_g57829 = float4( 0,0,0,0 );
				float2 Weights159_g57829 = float2( 0,0 );
				{
				UV159_g57829 = UV159_g57829 * TexelSize159_g57829.zw - 0.5;
				float2 f = frac( UV159_g57829 );
				UV159_g57829 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g57829.x - 0.5, UV159_g57829.x + 1.5, UV159_g57829.y - 0.5, UV159_g57829.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g57829 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g57829.xyxy;
				Weights159_g57829 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g57828 = Offsets159_g57829;
				float2 temp_output_205_0_g57828 = temp_output_855_0_g57819;
				float2 temp_output_206_0_g57828 = temp_output_856_0_g57819;
				float2 Input_FetchWeights143_g57828 = Weights159_g57829;
				float2 break169_g57828 = Input_FetchWeights143_g57828;
				float4 lerpResult167_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xw, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult168_g57828 = lerp( SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).yz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , SAMPLE_TEXTURE2D_GRAD( _00NormalMap, sampler_00NormalMap, (Input_FetchOffsets70_g57828).xz, temp_output_205_0_g57828, temp_output_206_0_g57828 ) , break169_g57828.x);
				float4 lerpResult180_g57828 = lerp( lerpResult167_g57828 , lerpResult168_g57828 , break169_g57828.y);
				float4 Output_Fetch2DDerivative203_g57828 = lerpResult180_g57828;
				float3 unpack659_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g57828, _00NormalMapScale );
				unpack659_g57819.z = lerp( 1, unpack659_g57819.z, saturate(_00NormalMapScale) );
				float3 Normal001285_g57819 = unpack659_g57819;
				float3 lerpResult1451_g57819 = lerp( Normal001285_g57819 , float3( 0,0,0 ) , VC001248_g57819);
				float localStochasticTiling159_g58231 = ( 0.0 );
				float2 UV159_g58231 = temp_output_885_0_g57819;
				float4 TexelSize159_g58231 = _01NormalMap_TexelSize;
				float4 Offsets159_g58231 = float4( 0,0,0,0 );
				float2 Weights159_g58231 = float2( 0,0 );
				{
				UV159_g58231 = UV159_g58231 * TexelSize159_g58231.zw - 0.5;
				float2 f = frac( UV159_g58231 );
				UV159_g58231 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58231.x - 0.5, UV159_g58231.x + 1.5, UV159_g58231.y - 0.5, UV159_g58231.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58231 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58231.xyxy;
				Weights159_g58231 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58230 = Offsets159_g58231;
				float2 temp_output_205_0_g58230 = temp_output_909_0_g57819;
				float2 temp_output_206_0_g58230 = temp_output_908_0_g57819;
				float2 Input_FetchWeights143_g58230 = Weights159_g58231;
				float2 break169_g58230 = Input_FetchWeights143_g58230;
				float4 lerpResult167_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xw, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult168_g58230 = lerp( SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).yz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , SAMPLE_TEXTURE2D_GRAD( _01NormalMap, sampler_01NormalMap, (Input_FetchOffsets70_g58230).xz, temp_output_205_0_g58230, temp_output_206_0_g58230 ) , break169_g58230.x);
				float4 lerpResult180_g58230 = lerp( lerpResult167_g58230 , lerpResult168_g58230 , break169_g58230.y);
				float4 Output_Fetch2DDerivative203_g58230 = lerpResult180_g58230;
				float3 unpack940_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58230, _01NormalMapScale );
				unpack940_g57819.z = lerp( 1, unpack940_g57819.z, saturate(_01NormalMapScale) );
				float3 Normal011409_g57819 = unpack940_g57819;
				float3 lerpResult1450_g57819 = lerp( Normal011409_g57819 , float3( 0,0,0 ) , VC011249_g57819);
				float localStochasticTiling159_g58247 = ( 0.0 );
				float2 UV159_g58247 = temp_output_1015_0_g57819;
				float4 TexelSize159_g58247 = _02NormalMap_TexelSize;
				float4 Offsets159_g58247 = float4( 0,0,0,0 );
				float2 Weights159_g58247 = float2( 0,0 );
				{
				UV159_g58247 = UV159_g58247 * TexelSize159_g58247.zw - 0.5;
				float2 f = frac( UV159_g58247 );
				UV159_g58247 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58247.x - 0.5, UV159_g58247.x + 1.5, UV159_g58247.y - 0.5, UV159_g58247.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58247 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58247.xyxy;
				Weights159_g58247 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58246 = Offsets159_g58247;
				float2 temp_output_205_0_g58246 = temp_output_1039_0_g57819;
				float2 temp_output_206_0_g58246 = temp_output_1038_0_g57819;
				float2 Input_FetchWeights143_g58246 = Weights159_g58247;
				float2 break169_g58246 = Input_FetchWeights143_g58246;
				float4 lerpResult167_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xw, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult168_g58246 = lerp( SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).yz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , SAMPLE_TEXTURE2D_GRAD( _02NormalMap, sampler_02NormalMap, (Input_FetchOffsets70_g58246).xz, temp_output_205_0_g58246, temp_output_206_0_g58246 ) , break169_g58246.x);
				float4 lerpResult180_g58246 = lerp( lerpResult167_g58246 , lerpResult168_g58246 , break169_g58246.y);
				float4 Output_Fetch2DDerivative203_g58246 = lerpResult180_g58246;
				float3 unpack1070_g57819 = UnpackNormalScale( Output_Fetch2DDerivative203_g58246, _02NormalMapScale );
				unpack1070_g57819.z = lerp( 1, unpack1070_g57819.z, saturate(_02NormalMapScale) );
				float3 Normal021411_g57819 = unpack1070_g57819;
				float3 lerpResult1449_g57819 = lerp( Normal021411_g57819 , float3( 0,0,0 ) , VC021250_g57819);
				float3 _Vector1 = float3(0,0,0);
				float3 lerpResult589_g57819 = lerp( temp_output_102_0_g57819 , ( temp_output_102_0_g57819 + ( ( saturate( lerpResult1451_g57819 ) + saturate( lerpResult1450_g57819 ) ) + ( saturate( lerpResult1449_g57819 ) + _Vector1 ) ) ) , EnablePolybrush1431_g57819);
				
				float4 tex2DNode2050_g58314 = SAMPLE_TEXTURE2D( _MaskMap, sampler_MaskMap, UV213_g58314 );
				float MASK_B1377_g58314 = tex2DNode2050_g58314.b;
				float temp_output_473_0_g57819 = ( _MetallicStrength * MASK_B1377_g58314 );
				float lerpResult1479_g57819 = lerp( _00MetallicStrength , 0.0 , VC001248_g57819);
				float lerpResult1474_g57819 = lerp( _01MetallicStrength , 0.0 , VC011249_g57819);
				float lerpResult1473_g57819 = lerp( _02MetallicStrength , 0.0 , VC021250_g57819);
				float lerpResult586_g57819 = lerp( temp_output_473_0_g57819 , ( temp_output_473_0_g57819 + ( ( lerpResult1479_g57819 + lerpResult1474_g57819 ) + ( lerpResult1473_g57819 + 0.0 ) ) ) , EnablePolybrush1431_g57819);
				
				float MASK_G158_g58314 = tex2DNode2050_g58314.g;
				float temp_output_2651_0_g58314 = ( 1.0 - MASK_G158_g58314 );
				float lerpResult2650_g58314 = lerp( MASK_G158_g58314 , temp_output_2651_0_g58314 , _SmoothnessSource);
				float temp_output_2693_0_g58314 = ( lerpResult2650_g58314 * _SmoothnessStrength );
				float2 appendResult2645_g58314 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g58314 = (float3(appendResult2645_g58314 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g58314 = unpack1891_g58314;
				float3 normalizeResult2641_g58314 = normalize( ( ( WorldTangent * break2680_g58314.x ) + ( WorldBiTangent * break2680_g58314.y ) + ( WorldNormal * break2680_g58314.z ) ) );
				float3 Normal_Per_Pixel2690_g58314 = normalizeResult2641_g58314;
				float fresnelNdotV2685_g58314 = dot( normalize( Normal_Per_Pixel2690_g58314 ), appendResult2644_g58314 );
				float fresnelNode2685_g58314 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g58314 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g58314 = lerp( temp_output_2693_0_g58314 , ( temp_output_2693_0_g58314 - fresnelNode2685_g58314 ) , _SmoothnessFresnelEnable);
				float temp_output_284_0_g57819 = saturate( lerpResult2636_g58314 );
				float lerpResult1462_g57819 = lerp( _00SmoothnessStrength , 0.0 , VC001248_g57819);
				float lerpResult1461_g57819 = lerp( _01SmoothnessStrength , 0.0 , VC011249_g57819);
				float lerpResult1460_g57819 = lerp( _02SmoothnessStrength , 0.0 , VC021250_g57819);
				float lerpResult587_g57819 = lerp( temp_output_284_0_g57819 , ( temp_output_284_0_g57819 + ( ( lerpResult1462_g57819 + lerpResult1461_g57819 ) + ( lerpResult1460_g57819 + 0.0 ) ) ) , EnablePolybrush1431_g57819);
				
				float MASK_R1378_g58314 = tex2DNode2050_g58314.r;
				float lerpResult3415_g58314 = lerp( 1.0 , MASK_R1378_g58314 , _OcclusionStrengthAO);
				float lerpResult3414_g58314 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g58314 = lerp( lerpResult3415_g58314 , lerpResult3414_g58314 , _OcclusionSource);
				float temp_output_2730_0_g58314 = saturate( lerpResult2709_g58314 );
				float temp_output_474_0_g57819 = temp_output_2730_0_g58314;
				float lerpResult1491_g57819 = lerp( ( 1.0 - _00OcclusionStrength ) , 0.0 , VC001248_g57819);
				float lerpResult1486_g57819 = lerp( ( 1.0 - _01OcclusionStrength ) , 0.0 , VC011249_g57819);
				float lerpResult1485_g57819 = lerp( ( 1.0 - _02OcclusionStrength ) , 0.0 , VC021250_g57819);
				float lerpResult588_g57819 = lerp( temp_output_474_0_g57819 , saturate( ( temp_output_474_0_g57819 + ( ( lerpResult1491_g57819 + lerpResult1486_g57819 ) + ( lerpResult1485_g57819 + 0.0 ) ) ) ) , EnablePolybrush1431_g57819);
				

				float3 BaseColor = lerpResult585_g57819;
				float3 Normal = lerpResult589_g57819;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult586_g57819;
				float Smoothness = lerpResult587_g57819;
				float Occlusion = lerpResult588_g57819;
				float Alpha = 1;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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

				

				surfaceDescription.Alpha = 1;
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _01BaseColorMap_TexelSize;
			half4 _01Color;
			float4 _01NormalMap_TexelSize;
			float4 _02NormalMap_TexelSize;
			float4 _02BaseColorMap_TexelSize;
			float4 _02UVs;
			half4 _BaseColor;
			half4 _02Color;
			float4 _MainUVs;
			float4 _01UVs;
			half4 _00Color;
			float4 _00UVs;
			float4 _00BaseColorMap_TexelSize;
			float4 _00NormalMap_TexelSize;
			half _01MetallicStrength;
			half _02NormalMapScale;
			float _MetallicStrength;
			half _01NormalMapScale;
			half _00NormalMapScale;
			half _00MetallicStrength;
			int _Cull;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _00SmoothnessStrength;
			half _01SmoothnessStrength;
			half _02SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			half _00OcclusionStrength;
			half _02MetallicStrength;
			half _NormalStrength;
			float _02FilterVertexColor;
			float _CATEGORY_POLYBRUSHVERTEXCOLOR;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _UVMode;
			half _Brightness;
			half _00Brightness;
			float _00FilterVertexColor;
			half _00BlendHeight;
			half _00BlendSmooth;
			half _01Brightness;
			float _01FilterVertexColor;
			half _01BlendHeight;
			half _01BlendSmooth;
			half _02Brightness;
			half _01OcclusionStrength;
			half _02BlendHeight;
			half _02BlendSmooth;
			half _EnablePolybrush;
			float _SPACE_POLYBRUSH;
			half _02OcclusionStrength;
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

				

				surfaceDescription.Alpha = 1;
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
Node;AmplifyShaderEditor.FunctionNode;437;1088,-640;Inherit;False;DESF Module Polybrush;161;;57819;5aa4fd9a26bfc9445850fb66cb24a6fa;28,1562,1,1558,1,1554,1,1545,1,1550,1,327,0,332,0,1563,1,1559,1,1555,1,1551,1,1546,1,901,0,925,0,1565,1,1553,1,1557,1,1547,1,1561,1,1055,0,1031,0,1548,0,1560,0,1556,0,1552,0,1564,0,1407,0,1406,0;5;123;FLOAT3;0,0,0;False;102;FLOAT3;0,0,1;False;473;FLOAT;0;False;284;FLOAT;0;False;474;FLOAT;0;False;5;FLOAT3;148;FLOAT3;147;FLOAT;571;FLOAT;289;FLOAT;540
Node;AmplifyShaderEditor.IntNode;453;1408,-720;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;477;704,-640;Inherit;False;DESF Core Lit;1;;58314;e0cdd7758f4404849b063afff4596424;39,442,2,1557,0,1749,0,1556,0,2284,0,2283,0,2213,0,2481,0,2411,0,2399,0,2172,0,2282,0,3300,0,3301,0,3299,0,2132,0,3146,0,2311,0,3108,0,3119,0,3076,0,3408,0,3291,0,3290,0,3289,0,3287,0,96,0,2591,0,2559,0,1368,0,2125,0,2131,0,2028,0,1333,0,2126,0,1896,0,1415,0,830,0,2523,1;1;1234;FLOAT3;0,0,0;False;17;FLOAT3;38;FLOAT3;35;FLOAT;37;FLOAT3;1922;FLOAT;33;FLOAT;34;FLOAT;46;FLOAT;814;FLOAT;1660;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;FLOAT3;2760;SAMPLERSTATE;1819;SAMPLERSTATE;1824;SAMPLERSTATE;1818
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;467;1374.904,-640;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;469;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;470;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;471;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;472;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;473;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;474;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;475;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;476;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;468;1408,-640;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Polybrush/Vertex Color Standard;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;437;123;477;38
WireConnection;437;102;477;35
WireConnection;437;473;477;37
WireConnection;437;284;477;33
WireConnection;437;474;477;34
WireConnection;468;0;437;148
WireConnection;468;1;437;147
WireConnection;468;3;437;571
WireConnection;468;4;437;289
WireConnection;468;5;437;540
ASEEND*/
//CHKSM=A9945ACDD5C7FE00DC2A105671BBDABE7D4B22C6