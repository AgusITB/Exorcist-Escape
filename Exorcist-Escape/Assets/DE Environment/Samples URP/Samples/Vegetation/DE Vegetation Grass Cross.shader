// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Vegetation/Grass Cross"
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
		[DE_DrawerCategory(COLOR,true,_MainTex,0,0)]_CATEGORY_COLOR("CATEGORY_COLOR", Float) = 1
		_GradientColorTop("Gradiant Top", Color) = (1,1,1,0)
		_GradientColorBottom("Gradiant Bottom", Color) = (0.4196078,0.5019608,0.1254902,0)
		_GradientColorHeight("Gradient Color Height", Range( 0 , 1)) = 0.5
		[DE_DrawerToggleNoKeyword]_GradientNoiseEnable("Enable Gradient Noise", Float) = 1
		[DE_DrawerSliderSimple(__GradientNoiseStrengthMin, __GradientNoiseStrengthMax,0, 1)]_GradientNoiseStrengthRemap("Gradient Noise Strength", Vector) = (0,0,0,0)
		[HideInInspector]_GradientNoiseStrengthMin("Gradient Noise Strength Min", Range( 0 , 1)) = 0.5
		[HideInInspector]_GradientNoiseStrengthMax("Gradient Noise Strength Max ", Range( 0 , 1)) = 1
		_GradientNoiseScale("Gradient Noise Scale", Range( 0 , 10)) = 0.5
		_GradientNoiseShift("Gradient Noise Shift", Range( 0 , 1)) = 0
		_Brightness("Brightness", Range( 0 , 2)) = 2
		[DE_DrawerSpace(10)]_SPACE_COLOR("SPACE_COLOR", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS1("CATEGORY_SURFACE INPUTS", Float) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(UV0 _UV1 _UV2 _UV3)]_UVMode("UV Mode", Float) = 0
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine][Space(10)]_BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 0
		_NormalStrength("Normal Strength", Float) = 1
		[Space(10)]_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[Space(10)]_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleLeft]_SmoothnessFresnelEnable("ENABLE FRESNEL", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerFloatEnum(Texture _Vertex Color)][Space(10)]_OcclusionSource("Occlusion Source", Float) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS1("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.texcoord.xy;
				float2 m_UV180_g57818 = v.texcoord1.xy;
				float2 m_UV280_g57818 = v.texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord8.xy = vertexToFrag70_g57818;
				float3 vertexToFrag35_g57793 = ase_worldPos;
				o.ase_texcoord10.xyz = vertexToFrag35_g57793;
				
				o.ase_texcoord9 = v.positionOS;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				o.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord8.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float3 temp_output_55_0_g57793 = (tex2DNode9_g57776).rgb;
				float clampResult101_g57793 = clamp( ( IN.ase_texcoord9.xyz.y / _GradientColorHeight ) , 0.0 , 1.0 );
				float3 lerpResult45_g57793 = lerp( (_GradientColorBottom).rgb , (_GradientColorTop).rgb , clampResult101_g57793);
				float3 temp_output_77_0_g57793 = ( temp_output_55_0_g57793 * lerpResult45_g57793 );
				float3 vertexToFrag35_g57793 = IN.ase_texcoord10.xyz;
				float3 p38_g57793 = ( _GradientNoiseScale * vertexToFrag35_g57793 * 3.0 );
				float localSimpleNoise3D38_g57793 = SimpleNoise3D( p38_g57793 );
				float temp_output_113_0_g57793 = ( _GradientNoiseStrengthMin + ( _GradientNoiseStrengthRemap.x * 0.0 ) );
				float3 lerpResult70_g57793 = lerp( temp_output_55_0_g57793 , temp_output_77_0_g57793 , saturate( ( ( ( localSimpleNoise3D38_g57793 / _GradientNoiseShift ) - temp_output_113_0_g57793 ) / ( _GradientNoiseStrengthMax - temp_output_113_0_g57793 ) ) ));
				float3 lerpResult72_g57793 = lerp( temp_output_77_0_g57793 , lerpResult70_g57793 , _GradientNoiseEnable);
				float3 temp_output_359_66_g57776 = ( lerpResult72_g57793 * _Brightness );
				
				float3 unpack221_g57776 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57818 ), _NormalStrength );
				unpack221_g57776.z = lerp( 1, unpack221_g57776.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57817 = unpack221_g57776;
				float temp_output_50_0_g57817 = _DoubleSidedNormalMode;
				float m_switch64_g57817 = temp_output_50_0_g57817;
				float3 m_Flip64_g57817 = float3(-1,-1,-1);
				float3 m_Mirror64_g57817 = float3(1,1,-1);
				float3 m_None64_g57817 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57817 = _NormalModefloat3switch( m_switch64_g57817 , m_Flip64_g57817 , m_Mirror64_g57817 , m_None64_g57817 );
				float3 switchResult58_g57817 = (((ase_vface>0)?(temp_output_24_0_g57817):(( temp_output_24_0_g57817 * local_NormalModefloat3switch64_g57817 ))));
				
				float2 appendResult387_g57776 = (float2(WorldViewDirection.xy));
				float3 appendResult386_g57776 = (float3(appendResult387_g57776 , ( WorldViewDirection.z / 1.06 )));
				float3 break365_g57776 = unpack221_g57776;
				float3 normalizeResult372_g57776 = normalize( ( ( WorldTangent * break365_g57776.x ) + ( WorldBiTangent * break365_g57776.y ) + ( WorldNormal * break365_g57776.z ) ) );
				float3 Normal_Per_Pixel366_g57776 = normalizeResult372_g57776;
				float fresnelNdotV384_g57776 = dot( normalize( Normal_Per_Pixel366_g57776 ), appendResult386_g57776 );
				float fresnelNode384_g57776 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV384_g57776 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult383_g57776 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode384_g57776 ) , _SmoothnessFresnelEnable);
				
				float lerpResult424_g57776 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult403_g57776 = lerp( ( 1.0 - _OcclusionStrengthAO ) , lerpResult424_g57776 , _OcclusionSource);
				
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , WorldViewDirection );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float3 BaseColor = temp_output_359_66_g57776;
				float3 Normal = switchResult58_g57817;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = _MetallicStrength;
				float Smoothness = saturate( lerpResult383_g57776 );
				float Occlusion = saturate( lerpResult403_g57776 );
				float Alpha = temp_output_98_0_g57823;
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
				float4 ase_color : COLOR;
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
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord3.xy = vertexToFrag70_g57818;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;
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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord3.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float Alpha = temp_output_98_0_g57823;
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
				float4 ase_color : COLOR;
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
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord3.xy = vertexToFrag70_g57818;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord3.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float Alpha = temp_output_98_0_g57823;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.texcoord0.xy;
				float2 m_UV180_g57818 = v.texcoord1.xy;
				float2 m_UV280_g57818 = v.texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord4.xy = vertexToFrag70_g57818;
				float3 vertexToFrag35_g57793 = ase_worldPos;
				o.ase_texcoord6.xyz = vertexToFrag35_g57793;
				
				o.ase_texcoord5 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord4.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float3 temp_output_55_0_g57793 = (tex2DNode9_g57776).rgb;
				float clampResult101_g57793 = clamp( ( IN.ase_texcoord5.xyz.y / _GradientColorHeight ) , 0.0 , 1.0 );
				float3 lerpResult45_g57793 = lerp( (_GradientColorBottom).rgb , (_GradientColorTop).rgb , clampResult101_g57793);
				float3 temp_output_77_0_g57793 = ( temp_output_55_0_g57793 * lerpResult45_g57793 );
				float3 vertexToFrag35_g57793 = IN.ase_texcoord6.xyz;
				float3 p38_g57793 = ( _GradientNoiseScale * vertexToFrag35_g57793 * 3.0 );
				float localSimpleNoise3D38_g57793 = SimpleNoise3D( p38_g57793 );
				float temp_output_113_0_g57793 = ( _GradientNoiseStrengthMin + ( _GradientNoiseStrengthRemap.x * 0.0 ) );
				float3 lerpResult70_g57793 = lerp( temp_output_55_0_g57793 , temp_output_77_0_g57793 , saturate( ( ( ( localSimpleNoise3D38_g57793 / _GradientNoiseShift ) - temp_output_113_0_g57793 ) / ( _GradientNoiseStrengthMax - temp_output_113_0_g57793 ) ) ));
				float3 lerpResult72_g57793 = lerp( temp_output_77_0_g57793 , lerpResult70_g57793 , _GradientNoiseEnable);
				float3 temp_output_359_66_g57776 = ( lerpResult72_g57793 * _Brightness );
				
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float3 BaseColor = temp_output_359_66_g57776;
				float3 Emission = 0;
				float Alpha = temp_output_98_0_g57823;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord2.xy = vertexToFrag70_g57818;
				float3 vertexToFrag35_g57793 = ase_worldPos;
				o.ase_texcoord4.xyz = vertexToFrag35_g57793;
				
				o.ase_texcoord3 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord2.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float3 temp_output_55_0_g57793 = (tex2DNode9_g57776).rgb;
				float clampResult101_g57793 = clamp( ( IN.ase_texcoord3.xyz.y / _GradientColorHeight ) , 0.0 , 1.0 );
				float3 lerpResult45_g57793 = lerp( (_GradientColorBottom).rgb , (_GradientColorTop).rgb , clampResult101_g57793);
				float3 temp_output_77_0_g57793 = ( temp_output_55_0_g57793 * lerpResult45_g57793 );
				float3 vertexToFrag35_g57793 = IN.ase_texcoord4.xyz;
				float3 p38_g57793 = ( _GradientNoiseScale * vertexToFrag35_g57793 * 3.0 );
				float localSimpleNoise3D38_g57793 = SimpleNoise3D( p38_g57793 );
				float temp_output_113_0_g57793 = ( _GradientNoiseStrengthMin + ( _GradientNoiseStrengthRemap.x * 0.0 ) );
				float3 lerpResult70_g57793 = lerp( temp_output_55_0_g57793 , temp_output_77_0_g57793 , saturate( ( ( ( localSimpleNoise3D38_g57793 / _GradientNoiseShift ) - temp_output_113_0_g57793 ) / ( _GradientNoiseStrengthMax - temp_output_113_0_g57793 ) ) ));
				float3 lerpResult72_g57793 = lerp( temp_output_77_0_g57793 , lerpResult70_g57793 , _GradientNoiseEnable);
				float3 temp_output_359_66_g57776 = ( lerpResult72_g57793 * _Brightness );
				
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float3 BaseColor = temp_output_359_66_g57776;
				float Alpha = temp_output_98_0_g57823;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord5.xy = vertexToFrag70_g57818;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord5.xy;
				float3 unpack221_g57776 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57818 ), _NormalStrength );
				unpack221_g57776.z = lerp( 1, unpack221_g57776.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57817 = unpack221_g57776;
				float temp_output_50_0_g57817 = _DoubleSidedNormalMode;
				float m_switch64_g57817 = temp_output_50_0_g57817;
				float3 m_Flip64_g57817 = float3(-1,-1,-1);
				float3 m_Mirror64_g57817 = float3(1,1,-1);
				float3 m_None64_g57817 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57817 = _NormalModefloat3switch( m_switch64_g57817 , m_Flip64_g57817 , m_Mirror64_g57817 , m_None64_g57817 );
				float3 switchResult58_g57817 = (((ase_vface>0)?(temp_output_24_0_g57817):(( temp_output_24_0_g57817 * local_NormalModefloat3switch64_g57817 ))));
				
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float3 Normal = switchResult58_g57817;
				float Alpha = temp_output_98_0_g57823;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.texcoord.xy;
				float2 m_UV180_g57818 = v.texcoord1.xy;
				float2 m_UV280_g57818 = v.texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord8.xy = vertexToFrag70_g57818;
				float3 vertexToFrag35_g57793 = ase_worldPos;
				o.ase_texcoord10.xyz = vertexToFrag35_g57793;
				
				o.ase_texcoord9 = v.positionOS;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				o.ase_texcoord10.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord8.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float3 temp_output_55_0_g57793 = (tex2DNode9_g57776).rgb;
				float clampResult101_g57793 = clamp( ( IN.ase_texcoord9.xyz.y / _GradientColorHeight ) , 0.0 , 1.0 );
				float3 lerpResult45_g57793 = lerp( (_GradientColorBottom).rgb , (_GradientColorTop).rgb , clampResult101_g57793);
				float3 temp_output_77_0_g57793 = ( temp_output_55_0_g57793 * lerpResult45_g57793 );
				float3 vertexToFrag35_g57793 = IN.ase_texcoord10.xyz;
				float3 p38_g57793 = ( _GradientNoiseScale * vertexToFrag35_g57793 * 3.0 );
				float localSimpleNoise3D38_g57793 = SimpleNoise3D( p38_g57793 );
				float temp_output_113_0_g57793 = ( _GradientNoiseStrengthMin + ( _GradientNoiseStrengthRemap.x * 0.0 ) );
				float3 lerpResult70_g57793 = lerp( temp_output_55_0_g57793 , temp_output_77_0_g57793 , saturate( ( ( ( localSimpleNoise3D38_g57793 / _GradientNoiseShift ) - temp_output_113_0_g57793 ) / ( _GradientNoiseStrengthMax - temp_output_113_0_g57793 ) ) ));
				float3 lerpResult72_g57793 = lerp( temp_output_77_0_g57793 , lerpResult70_g57793 , _GradientNoiseEnable);
				float3 temp_output_359_66_g57776 = ( lerpResult72_g57793 * _Brightness );
				
				float3 unpack221_g57776 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57818 ), _NormalStrength );
				unpack221_g57776.z = lerp( 1, unpack221_g57776.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57817 = unpack221_g57776;
				float temp_output_50_0_g57817 = _DoubleSidedNormalMode;
				float m_switch64_g57817 = temp_output_50_0_g57817;
				float3 m_Flip64_g57817 = float3(-1,-1,-1);
				float3 m_Mirror64_g57817 = float3(1,1,-1);
				float3 m_None64_g57817 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57817 = _NormalModefloat3switch( m_switch64_g57817 , m_Flip64_g57817 , m_Mirror64_g57817 , m_None64_g57817 );
				float3 switchResult58_g57817 = (((ase_vface>0)?(temp_output_24_0_g57817):(( temp_output_24_0_g57817 * local_NormalModefloat3switch64_g57817 ))));
				
				float2 appendResult387_g57776 = (float2(WorldViewDirection.xy));
				float3 appendResult386_g57776 = (float3(appendResult387_g57776 , ( WorldViewDirection.z / 1.06 )));
				float3 break365_g57776 = unpack221_g57776;
				float3 normalizeResult372_g57776 = normalize( ( ( WorldTangent * break365_g57776.x ) + ( WorldBiTangent * break365_g57776.y ) + ( WorldNormal * break365_g57776.z ) ) );
				float3 Normal_Per_Pixel366_g57776 = normalizeResult372_g57776;
				float fresnelNdotV384_g57776 = dot( normalize( Normal_Per_Pixel366_g57776 ), appendResult386_g57776 );
				float fresnelNode384_g57776 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV384_g57776 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult383_g57776 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode384_g57776 ) , _SmoothnessFresnelEnable);
				
				float lerpResult424_g57776 = lerp( 1.0 , IN.ase_color.a , _OcclusionStrengthAO);
				float lerpResult403_g57776 = lerp( ( 1.0 - _OcclusionStrengthAO ) , lerpResult424_g57776 , _OcclusionSource);
				
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 temp_output_95_0_g57827 = cross( ddy( WorldPosition ) , ddx( WorldPosition ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , WorldViewDirection );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				float3 BaseColor = temp_output_359_66_g57776;
				float3 Normal = switchResult58_g57817;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = _MetallicStrength;
				float Smoothness = saturate( lerpResult383_g57776 );
				float Occlusion = saturate( lerpResult403_g57776 );
				float Alpha = temp_output_98_0_g57823;
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
				float4 ase_color : COLOR;
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
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord.xy = vertexToFrag70_g57818;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57827 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57823;
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
				float4 ase_color : COLOR;
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
			half4 _GradientColorTop;
			half4 _GradientColorBottom;
			float4 _MainUVs;
			half4 _GradientNoiseStrengthRemap;
			float4 _AlphaRemap;
			float _SPACE_TRANSLUCENCY;
			half _GradientNoiseStrengthMax;
			half _GradientNoiseEnable;
			half _Brightness;
			half _NormalStrength;
			half _DoubleSidedNormalMode;
			float _MetallicStrength;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			half _OcclusionStrengthAO;
			half _OcclusionSource;
			float _AlphaRemapMin;
			float _AlphaRemapMax;
			half _GlancingClipMode;
			float _CATEGORY_ALPHACLIPPING;
			float _SPACE_ALPHACLIP;
			half _GradientNoiseStrengthMin;
			half _GradientNoiseShift;
			half _GradientColorHeight;
			half _AlphaCutoffBias;
			float _CATEGORY_TRANSMISSION;
			float _CATEGORY_COLOR;
			float _SPACE_COLOR;
			float _CATEGORY_SURFACEINPUTS1;
			float _SPACE_SURFACEINPUTS1;
			int _Cull;
			half _WindEnableType;
			half _WindGlobalIntensity;
			half _WindLocalIntensity;
			half _WindEnableMode;
			half _WindLocalRandomOffset;
			half _WindLocalPulseFrequency;
			half _WindLocalDirection;
			half _WindGlobalTurbulence;
			half _WindLocalTurbulence;
			half _WindEnable;
			float _CATEGORY_WIND;
			float _SPACE_WIND;
			float _UVMode;
			half _GradientNoiseScale;
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

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
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
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57833( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float2 float2switchUVMode80_g57818( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
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

				float m_switch2439_g57833 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57833 = mul( GetObjectToWorldMatrix(), float4( v.positionOS.xyz , 0.0 ) ).xyz;
				float3 break2265_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float GlobalWindIntensity3173_g57833 = _GlobalWindIntensity;
				float WIND_MODE2462_g57833 = _WindEnableMode;
				float lerpResult3147_g57833 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57833 ) , _WindLocalIntensity , WIND_MODE2462_g57833);
				float _WIND_STRENGHT2400_g57833 = lerpResult3147_g57833;
				float GlobalWindRandomOffset3174_g57833 = _GlobalWindRandomOffset;
				float lerpResult3149_g57833 = lerp( GlobalWindRandomOffset3174_g57833 , _WindLocalRandomOffset , WIND_MODE2462_g57833);
				float4 transform3073_g57833 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57833 = (float2(transform3073_g57833.x , transform3073_g57833.z));
				float dotResult2341_g57833 = dot( appendResult2307_g57833 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57833 = lerp( 0.8 , ( ( lerpResult3149_g57833 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57833 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57833 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57833 );
				float _WIND_TUBULENCE_RANDOM2274_g57833 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57833 = _GlobalWindPulse;
				float lerpResult3152_g57833 = lerp( GlobalWindPulse3177_g57833 , _WindLocalPulseFrequency , WIND_MODE2462_g57833);
				float _WIND_PULSE2421_g57833 = lerpResult3152_g57833;
				float FUNC_Angle2470_g57833 = ( _WIND_STRENGHT2400_g57833 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 ) - ( VERTEX_POSITION_MATRIX2352_g57833.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57833 );
				float FUNC_Angle_SinA2424_g57833 = sin( FUNC_Angle2470_g57833 );
				float FUNC_Angle_CosA2362_g57833 = cos( FUNC_Angle2470_g57833 );
				float GlobalWindDirection3175_g57833 = _GlobalWindDirection;
				float lerpResult3150_g57833 = lerp( GlobalWindDirection3175_g57833 , _WindLocalDirection , WIND_MODE2462_g57833);
				float _WindDirection2249_g57833 = lerpResult3150_g57833;
				float2 localDirectionalEquation2249_g57833 = DirectionalEquation( _WindDirection2249_g57833 );
				float2 break2469_g57833 = localDirectionalEquation2249_g57833;
				float _WIND_DIRECTION_X2418_g57833 = break2469_g57833.x;
				float lerpResult2258_g57833 = lerp( break2265_g57833.x , ( ( break2265_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2265_g57833.x * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_X2418_g57833);
				float3 break2340_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float3 break2233_g57833 = VERTEX_POSITION_MATRIX2352_g57833;
				float _WIND_DIRECTION_Y2416_g57833 = break2469_g57833.y;
				float lerpResult2275_g57833 = lerp( break2233_g57833.z , ( ( break2233_g57833.y * FUNC_Angle_SinA2424_g57833 ) + ( break2233_g57833.z * FUNC_Angle_CosA2362_g57833 ) ) , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2235_g57833 = (float3(lerpResult2258_g57833 , ( ( break2340_g57833.y * FUNC_Angle_CosA2362_g57833 ) - ( break2340_g57833.z * FUNC_Angle_SinA2424_g57833 ) ) , lerpResult2275_g57833));
				float3 VERTEX_POSITION2282_g57833 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57833 , 0.0 ) ).xyz - v.positionOS.xyz );
				float3 break2518_g57833 = VERTEX_POSITION2282_g57833;
				half FUNC_SinFunction2336_g57833 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57833 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57833 + ( VERTEX_POSITION_MATRIX2352_g57833.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57833 = _GlobalWindTurbulence;
				float lerpResult3151_g57833 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57833 ) , _WindLocalTurbulence , WIND_MODE2462_g57833);
				float _WIND_TUBULENCE2442_g57833 = lerpResult3151_g57833;
				float3 appendResult2480_g57833 = (float3(break2518_g57833.x , ( break2518_g57833.y + ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) ) , break2518_g57833.z));
				float3 VERTEX_LEAF2396_g57833 = appendResult2480_g57833;
				float3 m_Leaf2439_g57833 = VERTEX_LEAF2396_g57833;
				float3 VERTEX_PALM2310_g57833 = ( ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) * _WIND_TUBULENCE2442_g57833 ) + VERTEX_POSITION2282_g57833 );
				float3 m_Palm2439_g57833 = VERTEX_PALM2310_g57833;
				float3 break2486_g57833 = VERTEX_POSITION2282_g57833;
				float temp_output_2514_0_g57833 = ( FUNC_SinFunction2336_g57833 * v.ase_color.b * ( FUNC_Angle2470_g57833 + ( _WIND_STRENGHT2400_g57833 / 200.0 ) ) );
				float lerpResult2482_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_X2418_g57833);
				float lerpResult2484_g57833 = lerp( 0.0 , temp_output_2514_0_g57833 , _WIND_DIRECTION_Y2416_g57833);
				float3 appendResult2489_g57833 = (float3(( break2486_g57833.x + lerpResult2482_g57833 ) , break2486_g57833.y , ( break2486_g57833.z + lerpResult2484_g57833 )));
				float3 VERTEX_GRASS2242_g57833 = appendResult2489_g57833;
				float3 m_Grass2439_g57833 = VERTEX_GRASS2242_g57833;
				float3 m_Simple2439_g57833 = VERTEX_POSITION2282_g57833;
				float clampResult2884_g57833 = clamp( ( _WIND_STRENGHT2400_g57833 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57833 = VERTEX_POSITION2282_g57833;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 break2718_g57833 = ase_worldPos;
				float temp_output_2690_0_g57833 = ( _WIND_RANDOM_OFFSET2244_g57833 * 25.0 );
				float clampResult2691_g57833 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57833 = (float2(temp_output_2690_0_g57833 , ( temp_output_2690_0_g57833 / clampResult2691_g57833 )));
				float3 appendResult2706_g57833 = (float3(break2708_g57833.x , ( break2708_g57833.y + cos( ( ( ( break2718_g57833.x + break2718_g57833.y + break2718_g57833.z ) * 2.0 ) + appendResult2694_g57833 + FUNC_Angle2470_g57833 + _WIND_TUBULENCE2442_g57833 ) ) ).x , break2708_g57833.z));
				float3 temp_output_2613_0_g57833 = ( clampResult2884_g57833 * appendResult2706_g57833 );
				float3 VERTEX_IVY997_g57833 = ( ( ( cos( temp_output_2613_0_g57833 ) + ( -0.3193 * PI ) ) * v.normalOS * 0.2 * ( FUNC_SinFunction2336_g57833 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57833 ) * cross( v.normalOS , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57833 = VERTEX_IVY997_g57833;
				float3 localWind_Typefloat3switch2439_g57833 = Wind_Typefloat3switch2439_g57833( m_switch2439_g57833 , m_Leaf2439_g57833 , m_Palm2439_g57833 , m_Grass2439_g57833 , m_Simple2439_g57833 , m_Ivy2439_g57833 );
				float3 lerpResult3142_g57833 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57833 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				
				float m_switch80_g57818 = _UVMode;
				float2 m_UV080_g57818 = v.ase_texcoord.xy;
				float2 m_UV180_g57818 = v.ase_texcoord1.xy;
				float2 m_UV280_g57818 = v.ase_texcoord2.xy;
				float2 m_UV380_g57818 = v.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57818 = float2switchUVMode80_g57818( m_switch80_g57818 , m_UV080_g57818 , m_UV180_g57818 , m_UV280_g57818 , m_UV380_g57818 );
				float2 Offset235_g57818 = (_MainUVs).zw;
				float2 temp_output_41_0_g57818 = ( ( localfloat2switchUVMode80_g57818 * (_MainUVs).xy ) + Offset235_g57818 );
				float2 vertexToFrag70_g57818 = temp_output_41_0_g57818;
				o.ase_texcoord.xy = vertexToFrag70_g57818;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = lerpResult3142_g57833;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 vertexToFrag70_g57818 = IN.ase_texcoord.xy;
				float4 tex2DNode9_g57776 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57818 );
				float temp_output_22_0_g57823 = tex2DNode9_g57776.a;
				float temp_output_22_0_g57825 = temp_output_22_0_g57823;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_95_0_g57827 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57827 = normalize( temp_output_95_0_g57827 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57823 = dot( normalizeResult96_g57827 , ase_worldViewDir );
				float temp_output_76_0_g57823 = ( 1.0 - abs( dotResult74_g57823 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57823 = 1.0;
				#else
				float staticSwitch281_g57823 = ( 1.0 - ( temp_output_76_0_g57823 * temp_output_76_0_g57823 ) );
				#endif
				float lerpResult80_g57823 = lerp( 1.0 , staticSwitch281_g57823 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57823 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57825 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57825 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57823 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57823;
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
Node;AmplifyShaderEditor.FunctionNode;2894;-4352,-3584;Inherit;False;DESF Core Grass;1;;57776;0538aa5db432eaa45a99d28f92347a48;5,77,2,337,0,101,0,317,0,375,1;0;14;FLOAT3;0;FLOAT3;63;FLOAT;68;FLOAT3;244;FLOAT;72;FLOAT;71;FLOAT3;64;FLOAT3;65;FLOAT3;104;FLOAT;66;FLOAT;67;FLOAT;110;SAMPLERSTATE;182;SAMPLERSTATE;188
Node;AmplifyShaderEditor.FunctionNode;2895;-4288,-3200;Inherit;False;DESF Weather Wind;130;;57833;b135a554f7e4d0b41bba02c61b34ae74;5,3133,1,2371,1,2432,1,3138,0,3139,0;0;1;FLOAT3;2190
Node;AmplifyShaderEditor.IntNode;2902;-3968,-3664;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;1;;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2916;-3966.741,-3584;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2918;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2919;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2920;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2921;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2922;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2923;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2924;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2925;-3966.741,-3631.49;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2917;-3968,-3584;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Vegetation/Grass Cross;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;1;638177043534089645;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;2917;0;2894;0
WireConnection;2917;1;2894;63
WireConnection;2917;3;2894;68
WireConnection;2917;4;2894;72
WireConnection;2917;5;2894;71
WireConnection;2917;6;2894;66
WireConnection;2917;7;2894;67
WireConnection;2917;16;2894;110
WireConnection;2917;8;2895;2190
ASEEND*/
//CHKSM=63A0A2398AC4D32DE95619472D068F3FBE09FD59