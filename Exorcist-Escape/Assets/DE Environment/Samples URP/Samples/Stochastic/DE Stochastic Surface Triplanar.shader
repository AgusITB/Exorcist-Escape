// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Stochastic/Surface Triplanar"
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
		[DE_DrawerFloatEnum(World _Object)]_MainUVSpace("UV Mode", Float) = 1
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT


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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			void TriplanarWeights158_g58573( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			
			void TriplanarWeights158_g58570( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			
			void TriplanarWeights158_g58571( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8 = v.positionOS;
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

				float3 temp_output_1923_0_g58503 = (_BaseColor).rgb;
				float localStochasticTiling347_g58587 = ( 0.0 );
				float2 temp_output_1955_0_g58503 = (_MainUVs).xy;
				float2 Tiling3202_g58503 = temp_output_1955_0_g58503;
				float2 temp_output_360_0_g58587 = Tiling3202_g58503;
				float3 temp_output_358_0_g58587 = mul( GetWorldToObjectMatrix(), float4( IN.ase_texcoord8.xyz , 0.0 ) ).xyz;
				float UVSpace3168_g58503 = _MainUVSpace;
				float3 lerpResult354_g58587 = lerp( WorldPosition , temp_output_358_0_g58587 , UVSpace3168_g58503);
				float2 temp_output_1953_0_g58503 = (_MainUVs).zw;
				float2 Off3201_g58503 = temp_output_1953_0_g58503;
				float2 temp_output_383_0_g58587 = Off3201_g58503;
				float2 UV347_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 UV1347_g58587 = float2( 0,0 );
				float2 UV2347_g58587 = float2( 0,0 );
				float2 UV3347_g58587 = float2( 0,0 );
				float W1347_g58587 = 0.0;
				float W2347_g58587 = 0.0;
				float W3347_g58587 = 0.0;
				StochasticTiling( UV347_g58587 , UV1347_g58587 , UV2347_g58587 , UV3347_g58587 , W1347_g58587 , W2347_g58587 , W3347_g58587 );
				float2 temp_output_3375_332_g58503 = UV1347_g58587;
				float2 UV1_00379_g58573 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58573 = ( 0.0 );
				float2 newUV264_g58573 = float2( 0,0 );
				float2 temp_output_3375_331_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 temp_output_225_0_g58573 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58573 = ddx( temp_output_225_0_g58573 );
				float2 dx264_g58573 = temp_output_33_0_g58573;
				float2 temp_output_65_0_g58573 = ddy( temp_output_225_0_g58573 );
				float2 dy264_g58573 = temp_output_65_0_g58573;
				{
				 float2 du = float2(dx264_g58573.x, dy264_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58573.x = du.x;
				                dy264_g58573.x = du.y;
				}
				float2 UV0_00_DDX394_g58573 = dx264_g58573;
				float2 UV0_00_DDY395_g58573 = dy264_g58573;
				float3 appendResult361_g58587 = (float3(W1347_g58587 , W2347_g58587 , W3347_g58587));
				float3 temp_output_3375_362_g58503 = appendResult361_g58587;
				float3 Weight_00404_g58573 = temp_output_3375_362_g58503;
				float3 break303_g58573 = Weight_00404_g58573;
				float2 temp_output_3375_333_g58503 = UV2347_g58587;
				float2 UV2_00380_g58573 = temp_output_3375_333_g58503;
				float2 temp_output_3375_334_g58503 = UV3347_g58587;
				float2 UV3_00381_g58573 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58573 = ( 0.0 );
				float3 WorldNormal158_g58573 = WorldNormal;
				float W0158_g58573 = 0.0;
				float W1158_g58573 = 0.0;
				float W2158_g58573 = 0.0;
				TriplanarWeights158_g58573( WorldNormal158_g58573 , W0158_g58573 , W1158_g58573 , W2158_g58573 );
				float localStochasticTiling338_g58587 = ( 0.0 );
				float2 UV338_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 UV1338_g58587 = float2( 0,0 );
				float2 UV2338_g58587 = float2( 0,0 );
				float2 UV3338_g58587 = float2( 0,0 );
				float W1338_g58587 = 0.0;
				float W2338_g58587 = 0.0;
				float W3338_g58587 = 0.0;
				StochasticTiling( UV338_g58587 , UV1338_g58587 , UV2338_g58587 , UV3338_g58587 , W1338_g58587 , W2338_g58587 , W3338_g58587 );
				float2 temp_output_3375_335_g58503 = UV1338_g58587;
				float2 UV1_01418_g58573 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58573 = ( 0.0 );
				float2 newUV265_g58573 = float2( 0,0 );
				float2 temp_output_3375_339_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 temp_output_243_0_g58573 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58573 = ddx( temp_output_243_0_g58573 );
				float2 dx265_g58573 = temp_output_60_0_g58573;
				float2 temp_output_127_0_g58573 = ddy( temp_output_243_0_g58573 );
				float2 dy265_g58573 = temp_output_127_0_g58573;
				{
				 float2 du = float2(dx265_g58573.x, dy265_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58573.x = du.x;
				                dy265_g58573.x = du.y;
				}
				float2 UV0_01_DDX410_g58573 = dx265_g58573;
				float2 UV0_01_DDY409_g58573 = dy265_g58573;
				float3 appendResult363_g58587 = (float3(W1338_g58587 , W2338_g58587 , W3338_g58587));
				float3 temp_output_3375_364_g58503 = appendResult363_g58587;
				float3 Weight_01428_g58573 = temp_output_3375_364_g58503;
				float3 break304_g58573 = Weight_01428_g58573;
				float2 temp_output_3375_336_g58503 = UV2338_g58587;
				float2 UV2_01419_g58573 = temp_output_3375_336_g58503;
				float2 temp_output_3375_337_g58503 = UV3338_g58587;
				float2 UV3_01420_g58573 = temp_output_3375_337_g58503;
				float localStochasticTiling349_g58587 = ( 0.0 );
				float2 UV349_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 UV1349_g58587 = float2( 0,0 );
				float2 UV2349_g58587 = float2( 0,0 );
				float2 UV3349_g58587 = float2( 0,0 );
				float W1349_g58587 = 0.0;
				float W2349_g58587 = 0.0;
				float W3349_g58587 = 0.0;
				StochasticTiling( UV349_g58587 , UV1349_g58587 , UV2349_g58587 , UV3349_g58587 , W1349_g58587 , W2349_g58587 , W3349_g58587 );
				float2 temp_output_3375_342_g58503 = UV1349_g58587;
				float2 UV1_02442_g58573 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58573 = ( 0.0 );
				float2 newUV266_g58573 = float2( 0,0 );
				float2 temp_output_3375_348_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 temp_output_255_0_g58573 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58573 = ddx( temp_output_255_0_g58573 );
				float2 dx266_g58573 = temp_output_112_0_g58573;
				float2 temp_output_35_0_g58573 = ddy( temp_output_255_0_g58573 );
				float2 dy266_g58573 = temp_output_35_0_g58573;
				{
				 float2 du = float2(dx266_g58573.x, dy266_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58573.x = du.x;
				                dy266_g58573.x = du.y;
				}
				float2 UV0_02_DDX431_g58573 = dx266_g58573;
				float2 UV0_02_DDY432_g58573 = dy266_g58573;
				float3 appendResult365_g58587 = (float3(W1349_g58587 , W2349_g58587 , W3349_g58587));
				float3 temp_output_3375_366_g58503 = appendResult365_g58587;
				float3 Weight_02452_g58573 = temp_output_3375_366_g58503;
				float3 break305_g58573 = Weight_02452_g58573;
				float2 temp_output_3375_343_g58503 = UV2349_g58587;
				float2 UV2_02443_g58573 = temp_output_3375_343_g58503;
				float2 temp_output_3375_344_g58503 = UV3349_g58587;
				float2 UV3_02444_g58573 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58573 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_00379_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_00380_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_00381_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.z ) ) * W0158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_01418_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_01419_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_01420_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.z ) ) * W1158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_02442_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_02443_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_02444_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.z ) ) * W2158_g58573 ) );
				float4 StochasticBaseMap3286_g58503 = Sample2DTriplanar351_g58573;
				float3 ALBEDO_RGBA1381_g58503 = (StochasticBaseMap3286_g58503).rgb;
				float3 temp_output_3_0_g58503 = ( temp_output_1923_0_g58503 * ALBEDO_RGBA1381_g58503 * _Brightness );
				
				float2 UV1_00379_g58570 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58570 = ( 0.0 );
				float2 newUV264_g58570 = float2( 0,0 );
				float2 temp_output_225_0_g58570 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58570 = ddx( temp_output_225_0_g58570 );
				float2 dx264_g58570 = temp_output_33_0_g58570;
				float2 temp_output_65_0_g58570 = ddy( temp_output_225_0_g58570 );
				float2 dy264_g58570 = temp_output_65_0_g58570;
				{
				 float2 du = float2(dx264_g58570.x, dy264_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58570.x = du.x;
				                dy264_g58570.x = du.y;
				}
				float2 UV0_00_DDX394_g58570 = dx264_g58570;
				float2 UV0_00_DDY395_g58570 = dy264_g58570;
				float3 Weight_00404_g58570 = temp_output_3375_362_g58503;
				float3 break303_g58570 = Weight_00404_g58570;
				float2 UV2_00380_g58570 = temp_output_3375_333_g58503;
				float2 UV3_00381_g58570 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58570 = ( 0.0 );
				float3 WorldNormal158_g58570 = WorldNormal;
				float W0158_g58570 = 0.0;
				float W1158_g58570 = 0.0;
				float W2158_g58570 = 0.0;
				TriplanarWeights158_g58570( WorldNormal158_g58570 , W0158_g58570 , W1158_g58570 , W2158_g58570 );
				float2 UV1_01418_g58570 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58570 = ( 0.0 );
				float2 newUV265_g58570 = float2( 0,0 );
				float2 temp_output_243_0_g58570 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58570 = ddx( temp_output_243_0_g58570 );
				float2 dx265_g58570 = temp_output_60_0_g58570;
				float2 temp_output_127_0_g58570 = ddy( temp_output_243_0_g58570 );
				float2 dy265_g58570 = temp_output_127_0_g58570;
				{
				 float2 du = float2(dx265_g58570.x, dy265_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58570.x = du.x;
				                dy265_g58570.x = du.y;
				}
				float2 UV0_01_DDX410_g58570 = dx265_g58570;
				float2 UV0_01_DDY409_g58570 = dy265_g58570;
				float3 Weight_01428_g58570 = temp_output_3375_364_g58503;
				float3 break304_g58570 = Weight_01428_g58570;
				float2 UV2_01419_g58570 = temp_output_3375_336_g58503;
				float2 UV3_01420_g58570 = temp_output_3375_337_g58503;
				float2 UV1_02442_g58570 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58570 = ( 0.0 );
				float2 newUV266_g58570 = float2( 0,0 );
				float2 temp_output_255_0_g58570 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58570 = ddx( temp_output_255_0_g58570 );
				float2 dx266_g58570 = temp_output_112_0_g58570;
				float2 temp_output_35_0_g58570 = ddy( temp_output_255_0_g58570 );
				float2 dy266_g58570 = temp_output_35_0_g58570;
				{
				 float2 du = float2(dx266_g58570.x, dy266_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58570.x = du.x;
				                dy266_g58570.x = du.y;
				}
				float2 UV0_02_DDX431_g58570 = dx266_g58570;
				float2 UV0_02_DDY432_g58570 = dy266_g58570;
				float3 Weight_02452_g58570 = temp_output_3375_366_g58503;
				float3 break305_g58570 = Weight_02452_g58570;
				float2 UV2_02443_g58570 = temp_output_3375_343_g58503;
				float2 UV3_02444_g58570 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58570 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_00379_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_00380_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_00381_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.z ) ) * W0158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_01418_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_01419_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_01420_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.z ) ) * W1158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_02442_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_02443_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_02444_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.z ) ) * W2158_g58570 ) );
				float4 StochasticNormal3292_g58503 = Sample2DTriplanar351_g58570;
				float4 NORMAL_RGBA1382_g58503 = StochasticNormal3292_g58503;
				float3 unpack1891_g58503 = UnpackNormalScale( NORMAL_RGBA1382_g58503, _NormalStrength );
				unpack1891_g58503.z = lerp( 1, unpack1891_g58503.z, saturate(_NormalStrength) );
				
				float2 UV1_00379_g58571 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58571 = ( 0.0 );
				float2 newUV264_g58571 = float2( 0,0 );
				float2 temp_output_225_0_g58571 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58571 = ddx( temp_output_225_0_g58571 );
				float2 dx264_g58571 = temp_output_33_0_g58571;
				float2 temp_output_65_0_g58571 = ddy( temp_output_225_0_g58571 );
				float2 dy264_g58571 = temp_output_65_0_g58571;
				{
				 float2 du = float2(dx264_g58571.x, dy264_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58571.x = du.x;
				                dy264_g58571.x = du.y;
				}
				float2 UV0_00_DDX394_g58571 = dx264_g58571;
				float2 UV0_00_DDY395_g58571 = dy264_g58571;
				float3 Weight_00404_g58571 = temp_output_3375_362_g58503;
				float3 break303_g58571 = Weight_00404_g58571;
				float2 UV2_00380_g58571 = temp_output_3375_333_g58503;
				float2 UV3_00381_g58571 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58571 = ( 0.0 );
				float3 WorldNormal158_g58571 = WorldNormal;
				float W0158_g58571 = 0.0;
				float W1158_g58571 = 0.0;
				float W2158_g58571 = 0.0;
				TriplanarWeights158_g58571( WorldNormal158_g58571 , W0158_g58571 , W1158_g58571 , W2158_g58571 );
				float2 UV1_01418_g58571 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58571 = ( 0.0 );
				float2 newUV265_g58571 = float2( 0,0 );
				float2 temp_output_243_0_g58571 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58571 = ddx( temp_output_243_0_g58571 );
				float2 dx265_g58571 = temp_output_60_0_g58571;
				float2 temp_output_127_0_g58571 = ddy( temp_output_243_0_g58571 );
				float2 dy265_g58571 = temp_output_127_0_g58571;
				{
				 float2 du = float2(dx265_g58571.x, dy265_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58571.x = du.x;
				                dy265_g58571.x = du.y;
				}
				float2 UV0_01_DDX410_g58571 = dx265_g58571;
				float2 UV0_01_DDY409_g58571 = dy265_g58571;
				float3 Weight_01428_g58571 = temp_output_3375_364_g58503;
				float3 break304_g58571 = Weight_01428_g58571;
				float2 UV2_01419_g58571 = temp_output_3375_336_g58503;
				float2 UV3_01420_g58571 = temp_output_3375_337_g58503;
				float2 UV1_02442_g58571 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58571 = ( 0.0 );
				float2 newUV266_g58571 = float2( 0,0 );
				float2 temp_output_255_0_g58571 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58571 = ddx( temp_output_255_0_g58571 );
				float2 dx266_g58571 = temp_output_112_0_g58571;
				float2 temp_output_35_0_g58571 = ddy( temp_output_255_0_g58571 );
				float2 dy266_g58571 = temp_output_35_0_g58571;
				{
				 float2 du = float2(dx266_g58571.x, dy266_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58571.x = du.x;
				                dy266_g58571.x = du.y;
				}
				float2 UV0_02_DDX431_g58571 = dx266_g58571;
				float2 UV0_02_DDY432_g58571 = dy266_g58571;
				float3 Weight_02452_g58571 = temp_output_3375_366_g58503;
				float3 break305_g58571 = Weight_02452_g58571;
				float2 UV2_02443_g58571 = temp_output_3375_343_g58503;
				float2 UV3_02444_g58571 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58571 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_00379_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_00380_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_00381_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.z ) ) * W0158_g58571 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_01418_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_01419_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_01420_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.z ) ) * W1158_g58571 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_02442_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_02443_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_02444_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.z ) ) * W2158_g58571 ) );
				float4 StochasticMaskMap3293_g58503 = Sample2DTriplanar351_g58571;
				float4 break3298_g58503 = StochasticMaskMap3293_g58503;
				float MASK_B1377_g58503 = break3298_g58503.b;
				
				float MASK_G158_g58503 = break3298_g58503.g;
				float temp_output_2651_0_g58503 = ( 1.0 - MASK_G158_g58503 );
				float lerpResult2650_g58503 = lerp( MASK_G158_g58503 , temp_output_2651_0_g58503 , _SmoothnessSource);
				float temp_output_2693_0_g58503 = ( lerpResult2650_g58503 * _SmoothnessStrength );
				float2 appendResult2645_g58503 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g58503 = (float3(appendResult2645_g58503 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g58503 = unpack1891_g58503;
				float3 normalizeResult2641_g58503 = normalize( ( ( WorldTangent * break2680_g58503.x ) + ( WorldBiTangent * break2680_g58503.y ) + ( WorldNormal * break2680_g58503.z ) ) );
				float3 Normal_Per_Pixel2690_g58503 = normalizeResult2641_g58503;
				float fresnelNdotV2685_g58503 = dot( normalize( Normal_Per_Pixel2690_g58503 ), appendResult2644_g58503 );
				float fresnelNode2685_g58503 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g58503 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g58503 = lerp( temp_output_2693_0_g58503 , ( temp_output_2693_0_g58503 - fresnelNode2685_g58503 ) , _SmoothnessFresnelEnable);
				
				float MASK_R1378_g58503 = break3298_g58503.r;
				float lerpResult3415_g58503 = lerp( 1.0 , MASK_R1378_g58503 , _OcclusionStrengthAO);
				float lerpResult3414_g58503 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g58503 = lerp( lerpResult3415_g58503 , lerpResult3414_g58503 , _OcclusionSource);
				float temp_output_2730_0_g58503 = saturate( lerpResult2709_g58503 );
				

				float3 BaseColor = temp_output_3_0_g58503;
				float3 Normal = unpack1891_g58503;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g58503 );
				float Smoothness = saturate( lerpResult2636_g58503 );
				float Occlusion = temp_output_2730_0_g58503;
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			void TriplanarWeights158_g58573( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord4 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
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

				float3 temp_output_1923_0_g58503 = (_BaseColor).rgb;
				float localStochasticTiling347_g58587 = ( 0.0 );
				float2 temp_output_1955_0_g58503 = (_MainUVs).xy;
				float2 Tiling3202_g58503 = temp_output_1955_0_g58503;
				float2 temp_output_360_0_g58587 = Tiling3202_g58503;
				float3 temp_output_358_0_g58587 = mul( GetWorldToObjectMatrix(), float4( IN.ase_texcoord4.xyz , 0.0 ) ).xyz;
				float UVSpace3168_g58503 = _MainUVSpace;
				float3 lerpResult354_g58587 = lerp( WorldPosition , temp_output_358_0_g58587 , UVSpace3168_g58503);
				float2 temp_output_1953_0_g58503 = (_MainUVs).zw;
				float2 Off3201_g58503 = temp_output_1953_0_g58503;
				float2 temp_output_383_0_g58587 = Off3201_g58503;
				float2 UV347_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 UV1347_g58587 = float2( 0,0 );
				float2 UV2347_g58587 = float2( 0,0 );
				float2 UV3347_g58587 = float2( 0,0 );
				float W1347_g58587 = 0.0;
				float W2347_g58587 = 0.0;
				float W3347_g58587 = 0.0;
				StochasticTiling( UV347_g58587 , UV1347_g58587 , UV2347_g58587 , UV3347_g58587 , W1347_g58587 , W2347_g58587 , W3347_g58587 );
				float2 temp_output_3375_332_g58503 = UV1347_g58587;
				float2 UV1_00379_g58573 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58573 = ( 0.0 );
				float2 newUV264_g58573 = float2( 0,0 );
				float2 temp_output_3375_331_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 temp_output_225_0_g58573 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58573 = ddx( temp_output_225_0_g58573 );
				float2 dx264_g58573 = temp_output_33_0_g58573;
				float2 temp_output_65_0_g58573 = ddy( temp_output_225_0_g58573 );
				float2 dy264_g58573 = temp_output_65_0_g58573;
				{
				 float2 du = float2(dx264_g58573.x, dy264_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58573.x = du.x;
				                dy264_g58573.x = du.y;
				}
				float2 UV0_00_DDX394_g58573 = dx264_g58573;
				float2 UV0_00_DDY395_g58573 = dy264_g58573;
				float3 appendResult361_g58587 = (float3(W1347_g58587 , W2347_g58587 , W3347_g58587));
				float3 temp_output_3375_362_g58503 = appendResult361_g58587;
				float3 Weight_00404_g58573 = temp_output_3375_362_g58503;
				float3 break303_g58573 = Weight_00404_g58573;
				float2 temp_output_3375_333_g58503 = UV2347_g58587;
				float2 UV2_00380_g58573 = temp_output_3375_333_g58503;
				float2 temp_output_3375_334_g58503 = UV3347_g58587;
				float2 UV3_00381_g58573 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58573 = ( 0.0 );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 WorldNormal158_g58573 = ase_worldNormal;
				float W0158_g58573 = 0.0;
				float W1158_g58573 = 0.0;
				float W2158_g58573 = 0.0;
				TriplanarWeights158_g58573( WorldNormal158_g58573 , W0158_g58573 , W1158_g58573 , W2158_g58573 );
				float localStochasticTiling338_g58587 = ( 0.0 );
				float2 UV338_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 UV1338_g58587 = float2( 0,0 );
				float2 UV2338_g58587 = float2( 0,0 );
				float2 UV3338_g58587 = float2( 0,0 );
				float W1338_g58587 = 0.0;
				float W2338_g58587 = 0.0;
				float W3338_g58587 = 0.0;
				StochasticTiling( UV338_g58587 , UV1338_g58587 , UV2338_g58587 , UV3338_g58587 , W1338_g58587 , W2338_g58587 , W3338_g58587 );
				float2 temp_output_3375_335_g58503 = UV1338_g58587;
				float2 UV1_01418_g58573 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58573 = ( 0.0 );
				float2 newUV265_g58573 = float2( 0,0 );
				float2 temp_output_3375_339_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 temp_output_243_0_g58573 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58573 = ddx( temp_output_243_0_g58573 );
				float2 dx265_g58573 = temp_output_60_0_g58573;
				float2 temp_output_127_0_g58573 = ddy( temp_output_243_0_g58573 );
				float2 dy265_g58573 = temp_output_127_0_g58573;
				{
				 float2 du = float2(dx265_g58573.x, dy265_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58573.x = du.x;
				                dy265_g58573.x = du.y;
				}
				float2 UV0_01_DDX410_g58573 = dx265_g58573;
				float2 UV0_01_DDY409_g58573 = dy265_g58573;
				float3 appendResult363_g58587 = (float3(W1338_g58587 , W2338_g58587 , W3338_g58587));
				float3 temp_output_3375_364_g58503 = appendResult363_g58587;
				float3 Weight_01428_g58573 = temp_output_3375_364_g58503;
				float3 break304_g58573 = Weight_01428_g58573;
				float2 temp_output_3375_336_g58503 = UV2338_g58587;
				float2 UV2_01419_g58573 = temp_output_3375_336_g58503;
				float2 temp_output_3375_337_g58503 = UV3338_g58587;
				float2 UV3_01420_g58573 = temp_output_3375_337_g58503;
				float localStochasticTiling349_g58587 = ( 0.0 );
				float2 UV349_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 UV1349_g58587 = float2( 0,0 );
				float2 UV2349_g58587 = float2( 0,0 );
				float2 UV3349_g58587 = float2( 0,0 );
				float W1349_g58587 = 0.0;
				float W2349_g58587 = 0.0;
				float W3349_g58587 = 0.0;
				StochasticTiling( UV349_g58587 , UV1349_g58587 , UV2349_g58587 , UV3349_g58587 , W1349_g58587 , W2349_g58587 , W3349_g58587 );
				float2 temp_output_3375_342_g58503 = UV1349_g58587;
				float2 UV1_02442_g58573 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58573 = ( 0.0 );
				float2 newUV266_g58573 = float2( 0,0 );
				float2 temp_output_3375_348_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 temp_output_255_0_g58573 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58573 = ddx( temp_output_255_0_g58573 );
				float2 dx266_g58573 = temp_output_112_0_g58573;
				float2 temp_output_35_0_g58573 = ddy( temp_output_255_0_g58573 );
				float2 dy266_g58573 = temp_output_35_0_g58573;
				{
				 float2 du = float2(dx266_g58573.x, dy266_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58573.x = du.x;
				                dy266_g58573.x = du.y;
				}
				float2 UV0_02_DDX431_g58573 = dx266_g58573;
				float2 UV0_02_DDY432_g58573 = dy266_g58573;
				float3 appendResult365_g58587 = (float3(W1349_g58587 , W2349_g58587 , W3349_g58587));
				float3 temp_output_3375_366_g58503 = appendResult365_g58587;
				float3 Weight_02452_g58573 = temp_output_3375_366_g58503;
				float3 break305_g58573 = Weight_02452_g58573;
				float2 temp_output_3375_343_g58503 = UV2349_g58587;
				float2 UV2_02443_g58573 = temp_output_3375_343_g58503;
				float2 temp_output_3375_344_g58503 = UV3349_g58587;
				float2 UV3_02444_g58573 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58573 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_00379_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_00380_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_00381_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.z ) ) * W0158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_01418_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_01419_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_01420_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.z ) ) * W1158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_02442_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_02443_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_02444_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.z ) ) * W2158_g58573 ) );
				float4 StochasticBaseMap3286_g58503 = Sample2DTriplanar351_g58573;
				float3 ALBEDO_RGBA1381_g58503 = (StochasticBaseMap3286_g58503).rgb;
				float3 temp_output_3_0_g58503 = ( temp_output_1923_0_g58503 * ALBEDO_RGBA1381_g58503 * _Brightness );
				

				float3 BaseColor = temp_output_3_0_g58503;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			void TriplanarWeights158_g58573( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
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

				float3 temp_output_1923_0_g58503 = (_BaseColor).rgb;
				float localStochasticTiling347_g58587 = ( 0.0 );
				float2 temp_output_1955_0_g58503 = (_MainUVs).xy;
				float2 Tiling3202_g58503 = temp_output_1955_0_g58503;
				float2 temp_output_360_0_g58587 = Tiling3202_g58503;
				float3 temp_output_358_0_g58587 = mul( GetWorldToObjectMatrix(), float4( IN.ase_texcoord2.xyz , 0.0 ) ).xyz;
				float UVSpace3168_g58503 = _MainUVSpace;
				float3 lerpResult354_g58587 = lerp( WorldPosition , temp_output_358_0_g58587 , UVSpace3168_g58503);
				float2 temp_output_1953_0_g58503 = (_MainUVs).zw;
				float2 Off3201_g58503 = temp_output_1953_0_g58503;
				float2 temp_output_383_0_g58587 = Off3201_g58503;
				float2 UV347_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 UV1347_g58587 = float2( 0,0 );
				float2 UV2347_g58587 = float2( 0,0 );
				float2 UV3347_g58587 = float2( 0,0 );
				float W1347_g58587 = 0.0;
				float W2347_g58587 = 0.0;
				float W3347_g58587 = 0.0;
				StochasticTiling( UV347_g58587 , UV1347_g58587 , UV2347_g58587 , UV3347_g58587 , W1347_g58587 , W2347_g58587 , W3347_g58587 );
				float2 temp_output_3375_332_g58503 = UV1347_g58587;
				float2 UV1_00379_g58573 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58573 = ( 0.0 );
				float2 newUV264_g58573 = float2( 0,0 );
				float2 temp_output_3375_331_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 temp_output_225_0_g58573 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58573 = ddx( temp_output_225_0_g58573 );
				float2 dx264_g58573 = temp_output_33_0_g58573;
				float2 temp_output_65_0_g58573 = ddy( temp_output_225_0_g58573 );
				float2 dy264_g58573 = temp_output_65_0_g58573;
				{
				 float2 du = float2(dx264_g58573.x, dy264_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58573.x = du.x;
				                dy264_g58573.x = du.y;
				}
				float2 UV0_00_DDX394_g58573 = dx264_g58573;
				float2 UV0_00_DDY395_g58573 = dy264_g58573;
				float3 appendResult361_g58587 = (float3(W1347_g58587 , W2347_g58587 , W3347_g58587));
				float3 temp_output_3375_362_g58503 = appendResult361_g58587;
				float3 Weight_00404_g58573 = temp_output_3375_362_g58503;
				float3 break303_g58573 = Weight_00404_g58573;
				float2 temp_output_3375_333_g58503 = UV2347_g58587;
				float2 UV2_00380_g58573 = temp_output_3375_333_g58503;
				float2 temp_output_3375_334_g58503 = UV3347_g58587;
				float2 UV3_00381_g58573 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58573 = ( 0.0 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 WorldNormal158_g58573 = ase_worldNormal;
				float W0158_g58573 = 0.0;
				float W1158_g58573 = 0.0;
				float W2158_g58573 = 0.0;
				TriplanarWeights158_g58573( WorldNormal158_g58573 , W0158_g58573 , W1158_g58573 , W2158_g58573 );
				float localStochasticTiling338_g58587 = ( 0.0 );
				float2 UV338_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 UV1338_g58587 = float2( 0,0 );
				float2 UV2338_g58587 = float2( 0,0 );
				float2 UV3338_g58587 = float2( 0,0 );
				float W1338_g58587 = 0.0;
				float W2338_g58587 = 0.0;
				float W3338_g58587 = 0.0;
				StochasticTiling( UV338_g58587 , UV1338_g58587 , UV2338_g58587 , UV3338_g58587 , W1338_g58587 , W2338_g58587 , W3338_g58587 );
				float2 temp_output_3375_335_g58503 = UV1338_g58587;
				float2 UV1_01418_g58573 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58573 = ( 0.0 );
				float2 newUV265_g58573 = float2( 0,0 );
				float2 temp_output_3375_339_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 temp_output_243_0_g58573 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58573 = ddx( temp_output_243_0_g58573 );
				float2 dx265_g58573 = temp_output_60_0_g58573;
				float2 temp_output_127_0_g58573 = ddy( temp_output_243_0_g58573 );
				float2 dy265_g58573 = temp_output_127_0_g58573;
				{
				 float2 du = float2(dx265_g58573.x, dy265_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58573.x = du.x;
				                dy265_g58573.x = du.y;
				}
				float2 UV0_01_DDX410_g58573 = dx265_g58573;
				float2 UV0_01_DDY409_g58573 = dy265_g58573;
				float3 appendResult363_g58587 = (float3(W1338_g58587 , W2338_g58587 , W3338_g58587));
				float3 temp_output_3375_364_g58503 = appendResult363_g58587;
				float3 Weight_01428_g58573 = temp_output_3375_364_g58503;
				float3 break304_g58573 = Weight_01428_g58573;
				float2 temp_output_3375_336_g58503 = UV2338_g58587;
				float2 UV2_01419_g58573 = temp_output_3375_336_g58503;
				float2 temp_output_3375_337_g58503 = UV3338_g58587;
				float2 UV3_01420_g58573 = temp_output_3375_337_g58503;
				float localStochasticTiling349_g58587 = ( 0.0 );
				float2 UV349_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 UV1349_g58587 = float2( 0,0 );
				float2 UV2349_g58587 = float2( 0,0 );
				float2 UV3349_g58587 = float2( 0,0 );
				float W1349_g58587 = 0.0;
				float W2349_g58587 = 0.0;
				float W3349_g58587 = 0.0;
				StochasticTiling( UV349_g58587 , UV1349_g58587 , UV2349_g58587 , UV3349_g58587 , W1349_g58587 , W2349_g58587 , W3349_g58587 );
				float2 temp_output_3375_342_g58503 = UV1349_g58587;
				float2 UV1_02442_g58573 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58573 = ( 0.0 );
				float2 newUV266_g58573 = float2( 0,0 );
				float2 temp_output_3375_348_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 temp_output_255_0_g58573 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58573 = ddx( temp_output_255_0_g58573 );
				float2 dx266_g58573 = temp_output_112_0_g58573;
				float2 temp_output_35_0_g58573 = ddy( temp_output_255_0_g58573 );
				float2 dy266_g58573 = temp_output_35_0_g58573;
				{
				 float2 du = float2(dx266_g58573.x, dy266_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58573.x = du.x;
				                dy266_g58573.x = du.y;
				}
				float2 UV0_02_DDX431_g58573 = dx266_g58573;
				float2 UV0_02_DDY432_g58573 = dy266_g58573;
				float3 appendResult365_g58587 = (float3(W1349_g58587 , W2349_g58587 , W3349_g58587));
				float3 temp_output_3375_366_g58503 = appendResult365_g58587;
				float3 Weight_02452_g58573 = temp_output_3375_366_g58503;
				float3 break305_g58573 = Weight_02452_g58573;
				float2 temp_output_3375_343_g58503 = UV2349_g58587;
				float2 UV2_02443_g58573 = temp_output_3375_343_g58503;
				float2 temp_output_3375_344_g58503 = UV3349_g58587;
				float2 UV3_02444_g58573 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58573 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_00379_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_00380_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_00381_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.z ) ) * W0158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_01418_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_01419_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_01420_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.z ) ) * W1158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_02442_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_02443_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_02444_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.z ) ) * W2158_g58573 ) );
				float4 StochasticBaseMap3286_g58503 = Sample2DTriplanar351_g58573;
				float3 ALBEDO_RGBA1381_g58503 = (StochasticBaseMap3286_g58503).rgb;
				float3 temp_output_3_0_g58503 = ( temp_output_1923_0_g58503 * ALBEDO_RGBA1381_g58503 * _Brightness );
				

				float3 BaseColor = temp_output_3_0_g58503;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			void TriplanarWeights158_g58570( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5 = v.positionOS;
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

				float localStochasticTiling347_g58587 = ( 0.0 );
				float2 temp_output_1955_0_g58503 = (_MainUVs).xy;
				float2 Tiling3202_g58503 = temp_output_1955_0_g58503;
				float2 temp_output_360_0_g58587 = Tiling3202_g58503;
				float3 temp_output_358_0_g58587 = mul( GetWorldToObjectMatrix(), float4( IN.ase_texcoord5.xyz , 0.0 ) ).xyz;
				float UVSpace3168_g58503 = _MainUVSpace;
				float3 lerpResult354_g58587 = lerp( WorldPosition , temp_output_358_0_g58587 , UVSpace3168_g58503);
				float2 temp_output_1953_0_g58503 = (_MainUVs).zw;
				float2 Off3201_g58503 = temp_output_1953_0_g58503;
				float2 temp_output_383_0_g58587 = Off3201_g58503;
				float2 UV347_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 UV1347_g58587 = float2( 0,0 );
				float2 UV2347_g58587 = float2( 0,0 );
				float2 UV3347_g58587 = float2( 0,0 );
				float W1347_g58587 = 0.0;
				float W2347_g58587 = 0.0;
				float W3347_g58587 = 0.0;
				StochasticTiling( UV347_g58587 , UV1347_g58587 , UV2347_g58587 , UV3347_g58587 , W1347_g58587 , W2347_g58587 , W3347_g58587 );
				float2 temp_output_3375_332_g58503 = UV1347_g58587;
				float2 UV1_00379_g58570 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58570 = ( 0.0 );
				float2 newUV264_g58570 = float2( 0,0 );
				float2 temp_output_3375_331_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 temp_output_225_0_g58570 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58570 = ddx( temp_output_225_0_g58570 );
				float2 dx264_g58570 = temp_output_33_0_g58570;
				float2 temp_output_65_0_g58570 = ddy( temp_output_225_0_g58570 );
				float2 dy264_g58570 = temp_output_65_0_g58570;
				{
				 float2 du = float2(dx264_g58570.x, dy264_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58570.x = du.x;
				                dy264_g58570.x = du.y;
				}
				float2 UV0_00_DDX394_g58570 = dx264_g58570;
				float2 UV0_00_DDY395_g58570 = dy264_g58570;
				float3 appendResult361_g58587 = (float3(W1347_g58587 , W2347_g58587 , W3347_g58587));
				float3 temp_output_3375_362_g58503 = appendResult361_g58587;
				float3 Weight_00404_g58570 = temp_output_3375_362_g58503;
				float3 break303_g58570 = Weight_00404_g58570;
				float2 temp_output_3375_333_g58503 = UV2347_g58587;
				float2 UV2_00380_g58570 = temp_output_3375_333_g58503;
				float2 temp_output_3375_334_g58503 = UV3347_g58587;
				float2 UV3_00381_g58570 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58570 = ( 0.0 );
				float3 WorldNormal158_g58570 = WorldNormal;
				float W0158_g58570 = 0.0;
				float W1158_g58570 = 0.0;
				float W2158_g58570 = 0.0;
				TriplanarWeights158_g58570( WorldNormal158_g58570 , W0158_g58570 , W1158_g58570 , W2158_g58570 );
				float localStochasticTiling338_g58587 = ( 0.0 );
				float2 UV338_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 UV1338_g58587 = float2( 0,0 );
				float2 UV2338_g58587 = float2( 0,0 );
				float2 UV3338_g58587 = float2( 0,0 );
				float W1338_g58587 = 0.0;
				float W2338_g58587 = 0.0;
				float W3338_g58587 = 0.0;
				StochasticTiling( UV338_g58587 , UV1338_g58587 , UV2338_g58587 , UV3338_g58587 , W1338_g58587 , W2338_g58587 , W3338_g58587 );
				float2 temp_output_3375_335_g58503 = UV1338_g58587;
				float2 UV1_01418_g58570 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58570 = ( 0.0 );
				float2 newUV265_g58570 = float2( 0,0 );
				float2 temp_output_3375_339_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 temp_output_243_0_g58570 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58570 = ddx( temp_output_243_0_g58570 );
				float2 dx265_g58570 = temp_output_60_0_g58570;
				float2 temp_output_127_0_g58570 = ddy( temp_output_243_0_g58570 );
				float2 dy265_g58570 = temp_output_127_0_g58570;
				{
				 float2 du = float2(dx265_g58570.x, dy265_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58570.x = du.x;
				                dy265_g58570.x = du.y;
				}
				float2 UV0_01_DDX410_g58570 = dx265_g58570;
				float2 UV0_01_DDY409_g58570 = dy265_g58570;
				float3 appendResult363_g58587 = (float3(W1338_g58587 , W2338_g58587 , W3338_g58587));
				float3 temp_output_3375_364_g58503 = appendResult363_g58587;
				float3 Weight_01428_g58570 = temp_output_3375_364_g58503;
				float3 break304_g58570 = Weight_01428_g58570;
				float2 temp_output_3375_336_g58503 = UV2338_g58587;
				float2 UV2_01419_g58570 = temp_output_3375_336_g58503;
				float2 temp_output_3375_337_g58503 = UV3338_g58587;
				float2 UV3_01420_g58570 = temp_output_3375_337_g58503;
				float localStochasticTiling349_g58587 = ( 0.0 );
				float2 UV349_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 UV1349_g58587 = float2( 0,0 );
				float2 UV2349_g58587 = float2( 0,0 );
				float2 UV3349_g58587 = float2( 0,0 );
				float W1349_g58587 = 0.0;
				float W2349_g58587 = 0.0;
				float W3349_g58587 = 0.0;
				StochasticTiling( UV349_g58587 , UV1349_g58587 , UV2349_g58587 , UV3349_g58587 , W1349_g58587 , W2349_g58587 , W3349_g58587 );
				float2 temp_output_3375_342_g58503 = UV1349_g58587;
				float2 UV1_02442_g58570 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58570 = ( 0.0 );
				float2 newUV266_g58570 = float2( 0,0 );
				float2 temp_output_3375_348_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 temp_output_255_0_g58570 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58570 = ddx( temp_output_255_0_g58570 );
				float2 dx266_g58570 = temp_output_112_0_g58570;
				float2 temp_output_35_0_g58570 = ddy( temp_output_255_0_g58570 );
				float2 dy266_g58570 = temp_output_35_0_g58570;
				{
				 float2 du = float2(dx266_g58570.x, dy266_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58570.x = du.x;
				                dy266_g58570.x = du.y;
				}
				float2 UV0_02_DDX431_g58570 = dx266_g58570;
				float2 UV0_02_DDY432_g58570 = dy266_g58570;
				float3 appendResult365_g58587 = (float3(W1349_g58587 , W2349_g58587 , W3349_g58587));
				float3 temp_output_3375_366_g58503 = appendResult365_g58587;
				float3 Weight_02452_g58570 = temp_output_3375_366_g58503;
				float3 break305_g58570 = Weight_02452_g58570;
				float2 temp_output_3375_343_g58503 = UV2349_g58587;
				float2 UV2_02443_g58570 = temp_output_3375_343_g58503;
				float2 temp_output_3375_344_g58503 = UV3349_g58587;
				float2 UV3_02444_g58570 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58570 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_00379_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_00380_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_00381_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.z ) ) * W0158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_01418_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_01419_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_01420_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.z ) ) * W1158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_02442_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_02443_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_02444_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.z ) ) * W2158_g58570 ) );
				float4 StochasticNormal3292_g58503 = Sample2DTriplanar351_g58570;
				float4 NORMAL_RGBA1382_g58503 = StochasticNormal3292_g58503;
				float3 unpack1891_g58503 = UnpackNormalScale( NORMAL_RGBA1382_g58503, _NormalStrength );
				unpack1891_g58503.z = lerp( 1, unpack1891_g58503.z, saturate(_NormalStrength) );
				

				float3 Normal = unpack1891_g58503;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT


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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			
			void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
			{
				float2 vertex1, vertex2, vertex3;
				// Scaling of the input
				float2 uv = UV * 3.464; // 2 * sqrt (3)
				// Skew input space into simplex triangle grid
				const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
				float2 skewedCoord = mul( gridToSkewedGrid, uv );
				// Compute local triangle vertex IDs and local barycentric coordinates
				int2 baseId = int2( floor( skewedCoord ) );
				float3 temp = float3( frac( skewedCoord ), 0 );
				temp.z = 1.0 - temp.x - temp.y;
				if ( temp.z > 0.0 )
				{
					W1 = temp.z;
					W2 = temp.y;
					W3 = temp.x;
					vertex1 = baseId;
					vertex2 = baseId + int2( 0, 1 );
					vertex3 = baseId + int2( 1, 0 );
				}
				else
				{
					W1 = -temp.z;
					W2 = 1.0 - temp.y;
					W3 = 1.0 - temp.x;
					vertex1 = baseId + int2( 1, 1 );
					vertex2 = baseId + int2( 1, 0 );
					vertex3 = baseId + int2( 0, 1 );
				}
				UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
				UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
				UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
				return;
			}
			
			void TriplanarWeights158_g58573( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			
			void TriplanarWeights158_g58570( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			
			void TriplanarWeights158_g58571( float3 WorldNormal, out float W0, out float W1, out float W2 )
			{
				half3 weights = max( abs( WorldNormal.xyz ), 0.000001 );
				weights /= ( weights.x + weights.y + weights.z ).xxx;
				W0 = weights.x;
				W1 = weights.y;
				W2 = weights.z;
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8 = v.positionOS;
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

				float3 temp_output_1923_0_g58503 = (_BaseColor).rgb;
				float localStochasticTiling347_g58587 = ( 0.0 );
				float2 temp_output_1955_0_g58503 = (_MainUVs).xy;
				float2 Tiling3202_g58503 = temp_output_1955_0_g58503;
				float2 temp_output_360_0_g58587 = Tiling3202_g58503;
				float3 temp_output_358_0_g58587 = mul( GetWorldToObjectMatrix(), float4( IN.ase_texcoord8.xyz , 0.0 ) ).xyz;
				float UVSpace3168_g58503 = _MainUVSpace;
				float3 lerpResult354_g58587 = lerp( WorldPosition , temp_output_358_0_g58587 , UVSpace3168_g58503);
				float2 temp_output_1953_0_g58503 = (_MainUVs).zw;
				float2 Off3201_g58503 = temp_output_1953_0_g58503;
				float2 temp_output_383_0_g58587 = Off3201_g58503;
				float2 UV347_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 UV1347_g58587 = float2( 0,0 );
				float2 UV2347_g58587 = float2( 0,0 );
				float2 UV3347_g58587 = float2( 0,0 );
				float W1347_g58587 = 0.0;
				float W2347_g58587 = 0.0;
				float W3347_g58587 = 0.0;
				StochasticTiling( UV347_g58587 , UV1347_g58587 , UV2347_g58587 , UV3347_g58587 , W1347_g58587 , W2347_g58587 , W3347_g58587 );
				float2 temp_output_3375_332_g58503 = UV1347_g58587;
				float2 UV1_00379_g58573 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58573 = ( 0.0 );
				float2 newUV264_g58573 = float2( 0,0 );
				float2 temp_output_3375_331_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zy ) + temp_output_383_0_g58587 );
				float2 temp_output_225_0_g58573 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58573 = ddx( temp_output_225_0_g58573 );
				float2 dx264_g58573 = temp_output_33_0_g58573;
				float2 temp_output_65_0_g58573 = ddy( temp_output_225_0_g58573 );
				float2 dy264_g58573 = temp_output_65_0_g58573;
				{
				 float2 du = float2(dx264_g58573.x, dy264_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58573.x = du.x;
				                dy264_g58573.x = du.y;
				}
				float2 UV0_00_DDX394_g58573 = dx264_g58573;
				float2 UV0_00_DDY395_g58573 = dy264_g58573;
				float3 appendResult361_g58587 = (float3(W1347_g58587 , W2347_g58587 , W3347_g58587));
				float3 temp_output_3375_362_g58503 = appendResult361_g58587;
				float3 Weight_00404_g58573 = temp_output_3375_362_g58503;
				float3 break303_g58573 = Weight_00404_g58573;
				float2 temp_output_3375_333_g58503 = UV2347_g58587;
				float2 UV2_00380_g58573 = temp_output_3375_333_g58503;
				float2 temp_output_3375_334_g58503 = UV3347_g58587;
				float2 UV3_00381_g58573 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58573 = ( 0.0 );
				float3 WorldNormal158_g58573 = WorldNormal;
				float W0158_g58573 = 0.0;
				float W1158_g58573 = 0.0;
				float W2158_g58573 = 0.0;
				TriplanarWeights158_g58573( WorldNormal158_g58573 , W0158_g58573 , W1158_g58573 , W2158_g58573 );
				float localStochasticTiling338_g58587 = ( 0.0 );
				float2 UV338_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 UV1338_g58587 = float2( 0,0 );
				float2 UV2338_g58587 = float2( 0,0 );
				float2 UV3338_g58587 = float2( 0,0 );
				float W1338_g58587 = 0.0;
				float W2338_g58587 = 0.0;
				float W3338_g58587 = 0.0;
				StochasticTiling( UV338_g58587 , UV1338_g58587 , UV2338_g58587 , UV3338_g58587 , W1338_g58587 , W2338_g58587 , W3338_g58587 );
				float2 temp_output_3375_335_g58503 = UV1338_g58587;
				float2 UV1_01418_g58573 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58573 = ( 0.0 );
				float2 newUV265_g58573 = float2( 0,0 );
				float2 temp_output_3375_339_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).zx ) + temp_output_383_0_g58587 );
				float2 temp_output_243_0_g58573 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58573 = ddx( temp_output_243_0_g58573 );
				float2 dx265_g58573 = temp_output_60_0_g58573;
				float2 temp_output_127_0_g58573 = ddy( temp_output_243_0_g58573 );
				float2 dy265_g58573 = temp_output_127_0_g58573;
				{
				 float2 du = float2(dx265_g58573.x, dy265_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58573.x = du.x;
				                dy265_g58573.x = du.y;
				}
				float2 UV0_01_DDX410_g58573 = dx265_g58573;
				float2 UV0_01_DDY409_g58573 = dy265_g58573;
				float3 appendResult363_g58587 = (float3(W1338_g58587 , W2338_g58587 , W3338_g58587));
				float3 temp_output_3375_364_g58503 = appendResult363_g58587;
				float3 Weight_01428_g58573 = temp_output_3375_364_g58503;
				float3 break304_g58573 = Weight_01428_g58573;
				float2 temp_output_3375_336_g58503 = UV2338_g58587;
				float2 UV2_01419_g58573 = temp_output_3375_336_g58503;
				float2 temp_output_3375_337_g58503 = UV3338_g58587;
				float2 UV3_01420_g58573 = temp_output_3375_337_g58503;
				float localStochasticTiling349_g58587 = ( 0.0 );
				float2 UV349_g58587 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 UV1349_g58587 = float2( 0,0 );
				float2 UV2349_g58587 = float2( 0,0 );
				float2 UV3349_g58587 = float2( 0,0 );
				float W1349_g58587 = 0.0;
				float W2349_g58587 = 0.0;
				float W3349_g58587 = 0.0;
				StochasticTiling( UV349_g58587 , UV1349_g58587 , UV2349_g58587 , UV3349_g58587 , W1349_g58587 , W2349_g58587 , W3349_g58587 );
				float2 temp_output_3375_342_g58503 = UV1349_g58587;
				float2 UV1_02442_g58573 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58573 = ( 0.0 );
				float2 newUV266_g58573 = float2( 0,0 );
				float2 temp_output_3375_348_g58503 = ( ( temp_output_360_0_g58587 * (lerpResult354_g58587).xy ) + temp_output_383_0_g58587 );
				float2 temp_output_255_0_g58573 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58573 = ddx( temp_output_255_0_g58573 );
				float2 dx266_g58573 = temp_output_112_0_g58573;
				float2 temp_output_35_0_g58573 = ddy( temp_output_255_0_g58573 );
				float2 dy266_g58573 = temp_output_35_0_g58573;
				{
				 float2 du = float2(dx266_g58573.x, dy266_g58573.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58573.x = du.x;
				                dy266_g58573.x = du.y;
				}
				float2 UV0_02_DDX431_g58573 = dx266_g58573;
				float2 UV0_02_DDY432_g58573 = dy266_g58573;
				float3 appendResult365_g58587 = (float3(W1349_g58587 , W2349_g58587 , W3349_g58587));
				float3 temp_output_3375_366_g58503 = appendResult365_g58587;
				float3 Weight_02452_g58573 = temp_output_3375_366_g58503;
				float3 break305_g58573 = Weight_02452_g58573;
				float2 temp_output_3375_343_g58503 = UV2349_g58587;
				float2 UV2_02443_g58573 = temp_output_3375_343_g58503;
				float2 temp_output_3375_344_g58503 = UV3349_g58587;
				float2 UV3_02444_g58573 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58573 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_00379_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_00380_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_00381_g58573, UV0_00_DDX394_g58573, UV0_00_DDY395_g58573 ) * break303_g58573.z ) ) * W0158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_01418_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_01419_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_01420_g58573, UV0_01_DDX410_g58573, UV0_01_DDY409_g58573 ) * break304_g58573.z ) ) * W1158_g58573 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV1_02442_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV2_02443_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MainTex, sampler_MainTex, UV3_02444_g58573, UV0_02_DDX431_g58573, UV0_02_DDY432_g58573 ) * break305_g58573.z ) ) * W2158_g58573 ) );
				float4 StochasticBaseMap3286_g58503 = Sample2DTriplanar351_g58573;
				float3 ALBEDO_RGBA1381_g58503 = (StochasticBaseMap3286_g58503).rgb;
				float3 temp_output_3_0_g58503 = ( temp_output_1923_0_g58503 * ALBEDO_RGBA1381_g58503 * _Brightness );
				
				float2 UV1_00379_g58570 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58570 = ( 0.0 );
				float2 newUV264_g58570 = float2( 0,0 );
				float2 temp_output_225_0_g58570 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58570 = ddx( temp_output_225_0_g58570 );
				float2 dx264_g58570 = temp_output_33_0_g58570;
				float2 temp_output_65_0_g58570 = ddy( temp_output_225_0_g58570 );
				float2 dy264_g58570 = temp_output_65_0_g58570;
				{
				 float2 du = float2(dx264_g58570.x, dy264_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58570.x = du.x;
				                dy264_g58570.x = du.y;
				}
				float2 UV0_00_DDX394_g58570 = dx264_g58570;
				float2 UV0_00_DDY395_g58570 = dy264_g58570;
				float3 Weight_00404_g58570 = temp_output_3375_362_g58503;
				float3 break303_g58570 = Weight_00404_g58570;
				float2 UV2_00380_g58570 = temp_output_3375_333_g58503;
				float2 UV3_00381_g58570 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58570 = ( 0.0 );
				float3 WorldNormal158_g58570 = WorldNormal;
				float W0158_g58570 = 0.0;
				float W1158_g58570 = 0.0;
				float W2158_g58570 = 0.0;
				TriplanarWeights158_g58570( WorldNormal158_g58570 , W0158_g58570 , W1158_g58570 , W2158_g58570 );
				float2 UV1_01418_g58570 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58570 = ( 0.0 );
				float2 newUV265_g58570 = float2( 0,0 );
				float2 temp_output_243_0_g58570 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58570 = ddx( temp_output_243_0_g58570 );
				float2 dx265_g58570 = temp_output_60_0_g58570;
				float2 temp_output_127_0_g58570 = ddy( temp_output_243_0_g58570 );
				float2 dy265_g58570 = temp_output_127_0_g58570;
				{
				 float2 du = float2(dx265_g58570.x, dy265_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58570.x = du.x;
				                dy265_g58570.x = du.y;
				}
				float2 UV0_01_DDX410_g58570 = dx265_g58570;
				float2 UV0_01_DDY409_g58570 = dy265_g58570;
				float3 Weight_01428_g58570 = temp_output_3375_364_g58503;
				float3 break304_g58570 = Weight_01428_g58570;
				float2 UV2_01419_g58570 = temp_output_3375_336_g58503;
				float2 UV3_01420_g58570 = temp_output_3375_337_g58503;
				float2 UV1_02442_g58570 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58570 = ( 0.0 );
				float2 newUV266_g58570 = float2( 0,0 );
				float2 temp_output_255_0_g58570 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58570 = ddx( temp_output_255_0_g58570 );
				float2 dx266_g58570 = temp_output_112_0_g58570;
				float2 temp_output_35_0_g58570 = ddy( temp_output_255_0_g58570 );
				float2 dy266_g58570 = temp_output_35_0_g58570;
				{
				 float2 du = float2(dx266_g58570.x, dy266_g58570.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58570.x = du.x;
				                dy266_g58570.x = du.y;
				}
				float2 UV0_02_DDX431_g58570 = dx266_g58570;
				float2 UV0_02_DDY432_g58570 = dy266_g58570;
				float3 Weight_02452_g58570 = temp_output_3375_366_g58503;
				float3 break305_g58570 = Weight_02452_g58570;
				float2 UV2_02443_g58570 = temp_output_3375_343_g58503;
				float2 UV3_02444_g58570 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58570 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_00379_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_00380_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_00381_g58570, UV0_00_DDX394_g58570, UV0_00_DDY395_g58570 ) * break303_g58570.z ) ) * W0158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_01418_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_01419_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_01420_g58570, UV0_01_DDX410_g58570, UV0_01_DDY409_g58570 ) * break304_g58570.z ) ) * W1158_g58570 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV1_02442_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.x ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV2_02443_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.y ) + ( SAMPLE_TEXTURE2D_GRAD( _BumpMap, sampler_BumpMap, UV3_02444_g58570, UV0_02_DDX431_g58570, UV0_02_DDY432_g58570 ) * break305_g58570.z ) ) * W2158_g58570 ) );
				float4 StochasticNormal3292_g58503 = Sample2DTriplanar351_g58570;
				float4 NORMAL_RGBA1382_g58503 = StochasticNormal3292_g58503;
				float3 unpack1891_g58503 = UnpackNormalScale( NORMAL_RGBA1382_g58503, _NormalStrength );
				unpack1891_g58503.z = lerp( 1, unpack1891_g58503.z, saturate(_NormalStrength) );
				
				float2 UV1_00379_g58571 = temp_output_3375_332_g58503;
				float localDerivativesCylindrical264_g58571 = ( 0.0 );
				float2 newUV264_g58571 = float2( 0,0 );
				float2 temp_output_225_0_g58571 = temp_output_3375_331_g58503;
				float2 temp_output_33_0_g58571 = ddx( temp_output_225_0_g58571 );
				float2 dx264_g58571 = temp_output_33_0_g58571;
				float2 temp_output_65_0_g58571 = ddy( temp_output_225_0_g58571 );
				float2 dy264_g58571 = temp_output_65_0_g58571;
				{
				 float2 du = float2(dx264_g58571.x, dy264_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx264_g58571.x = du.x;
				                dy264_g58571.x = du.y;
				}
				float2 UV0_00_DDX394_g58571 = dx264_g58571;
				float2 UV0_00_DDY395_g58571 = dy264_g58571;
				float3 Weight_00404_g58571 = temp_output_3375_362_g58503;
				float3 break303_g58571 = Weight_00404_g58571;
				float2 UV2_00380_g58571 = temp_output_3375_333_g58503;
				float2 UV3_00381_g58571 = temp_output_3375_334_g58503;
				float localTriplanarWeights158_g58571 = ( 0.0 );
				float3 WorldNormal158_g58571 = WorldNormal;
				float W0158_g58571 = 0.0;
				float W1158_g58571 = 0.0;
				float W2158_g58571 = 0.0;
				TriplanarWeights158_g58571( WorldNormal158_g58571 , W0158_g58571 , W1158_g58571 , W2158_g58571 );
				float2 UV1_01418_g58571 = temp_output_3375_335_g58503;
				float localDerivativesCylindrical265_g58571 = ( 0.0 );
				float2 newUV265_g58571 = float2( 0,0 );
				float2 temp_output_243_0_g58571 = temp_output_3375_339_g58503;
				float2 temp_output_60_0_g58571 = ddx( temp_output_243_0_g58571 );
				float2 dx265_g58571 = temp_output_60_0_g58571;
				float2 temp_output_127_0_g58571 = ddy( temp_output_243_0_g58571 );
				float2 dy265_g58571 = temp_output_127_0_g58571;
				{
				 float2 du = float2(dx265_g58571.x, dy265_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx265_g58571.x = du.x;
				                dy265_g58571.x = du.y;
				}
				float2 UV0_01_DDX410_g58571 = dx265_g58571;
				float2 UV0_01_DDY409_g58571 = dy265_g58571;
				float3 Weight_01428_g58571 = temp_output_3375_364_g58503;
				float3 break304_g58571 = Weight_01428_g58571;
				float2 UV2_01419_g58571 = temp_output_3375_336_g58503;
				float2 UV3_01420_g58571 = temp_output_3375_337_g58503;
				float2 UV1_02442_g58571 = temp_output_3375_342_g58503;
				float localDerivativesCylindrical266_g58571 = ( 0.0 );
				float2 newUV266_g58571 = float2( 0,0 );
				float2 temp_output_255_0_g58571 = temp_output_3375_348_g58503;
				float2 temp_output_112_0_g58571 = ddx( temp_output_255_0_g58571 );
				float2 dx266_g58571 = temp_output_112_0_g58571;
				float2 temp_output_35_0_g58571 = ddy( temp_output_255_0_g58571 );
				float2 dy266_g58571 = temp_output_35_0_g58571;
				{
				 float2 du = float2(dx266_g58571.x, dy266_g58571.x);
				                du -= (abs(du) > 0.5f) * sign(du);
				 dx266_g58571.x = du.x;
				                dy266_g58571.x = du.y;
				}
				float2 UV0_02_DDX431_g58571 = dx266_g58571;
				float2 UV0_02_DDY432_g58571 = dy266_g58571;
				float3 Weight_02452_g58571 = temp_output_3375_366_g58503;
				float3 break305_g58571 = Weight_02452_g58571;
				float2 UV2_02443_g58571 = temp_output_3375_343_g58503;
				float2 UV3_02444_g58571 = temp_output_3375_344_g58503;
				float4 Sample2DTriplanar351_g58571 = ( ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_00379_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_00380_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_00381_g58571, UV0_00_DDX394_g58571, UV0_00_DDY395_g58571 ) * break303_g58571.z ) ) * W0158_g58571 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_01418_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_01419_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_01420_g58571, UV0_01_DDX410_g58571, UV0_01_DDY409_g58571 ) * break304_g58571.z ) ) * W1158_g58571 ) + ( ( ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV1_02442_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.x ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV2_02443_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.y ) + ( SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_MaskMap, UV3_02444_g58571, UV0_02_DDX431_g58571, UV0_02_DDY432_g58571 ) * break305_g58571.z ) ) * W2158_g58571 ) );
				float4 StochasticMaskMap3293_g58503 = Sample2DTriplanar351_g58571;
				float4 break3298_g58503 = StochasticMaskMap3293_g58503;
				float MASK_B1377_g58503 = break3298_g58503.b;
				
				float MASK_G158_g58503 = break3298_g58503.g;
				float temp_output_2651_0_g58503 = ( 1.0 - MASK_G158_g58503 );
				float lerpResult2650_g58503 = lerp( MASK_G158_g58503 , temp_output_2651_0_g58503 , _SmoothnessSource);
				float temp_output_2693_0_g58503 = ( lerpResult2650_g58503 * _SmoothnessStrength );
				float2 appendResult2645_g58503 = (float2(WorldViewDirection.xy));
				float3 appendResult2644_g58503 = (float3(appendResult2645_g58503 , ( WorldViewDirection.z / 1.06 )));
				float3 break2680_g58503 = unpack1891_g58503;
				float3 normalizeResult2641_g58503 = normalize( ( ( WorldTangent * break2680_g58503.x ) + ( WorldBiTangent * break2680_g58503.y ) + ( WorldNormal * break2680_g58503.z ) ) );
				float3 Normal_Per_Pixel2690_g58503 = normalizeResult2641_g58503;
				float fresnelNdotV2685_g58503 = dot( normalize( Normal_Per_Pixel2690_g58503 ), appendResult2644_g58503 );
				float fresnelNode2685_g58503 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV2685_g58503 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult2636_g58503 = lerp( temp_output_2693_0_g58503 , ( temp_output_2693_0_g58503 - fresnelNode2685_g58503 ) , _SmoothnessFresnelEnable);
				
				float MASK_R1378_g58503 = break3298_g58503.r;
				float lerpResult3415_g58503 = lerp( 1.0 , MASK_R1378_g58503 , _OcclusionStrengthAO);
				float lerpResult3414_g58503 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult2709_g58503 = lerp( lerpResult3415_g58503 , lerpResult3414_g58503 , _OcclusionSource);
				float temp_output_2730_0_g58503 = saturate( lerpResult2709_g58503 );
				

				float3 BaseColor = temp_output_3_0_g58503;
				float3 Normal = unpack1891_g58503;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * MASK_B1377_g58503 );
				float Smoothness = saturate( lerpResult2636_g58503 );
				float Occlusion = temp_output_2730_0_g58503;
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
			half4 _BaseColor;
			float4 _MainUVs;
			int _Cull;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			float _MetallicStrength;
			half _NormalStrength;
			half _MainUVSpace;
			half _OcclusionStrengthAO;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			half _Brightness;
			half _OcclusionSource;
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
Node;AmplifyShaderEditor.IntNode;413;1408,-720;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;437;960,-640;Inherit;False;DESF Core Lit;1;;58503;e0cdd7758f4404849b063afff4596424;39,442,2,1557,0,1749,0,1556,0,2284,5,2283,5,2213,5,2481,5,2411,5,2399,5,2172,5,2282,5,3300,5,3301,5,3299,5,2132,5,3146,5,2311,5,3108,0,3119,0,3076,0,3408,0,3291,1,3290,1,3289,1,3287,1,96,0,2591,0,2559,0,1368,0,2125,0,2131,0,2028,0,1333,0,2126,0,1896,0,1415,0,830,0,2523,1;1;1234;FLOAT3;0,0,0;False;17;FLOAT3;38;FLOAT3;35;FLOAT;37;FLOAT3;1922;FLOAT;33;FLOAT;34;FLOAT;46;FLOAT;814;FLOAT;1660;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;FLOAT3;2760;SAMPLERSTATE;1819;SAMPLERSTATE;1824;SAMPLERSTATE;1818
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;427;1374.904,-640;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;429;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;430;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;431;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;432;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;433;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;434;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;435;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;436;1374.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;428;1408,-640;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Stochastic/Surface Triplanar;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;428;0;437;38
WireConnection;428;1;437;35
WireConnection;428;3;437;37
WireConnection;428;4;437;33
WireConnection;428;5;437;34
ASEEND*/
//CHKSM=A77E511CEC6DF03268D3BB5599C26063BC6FACF1