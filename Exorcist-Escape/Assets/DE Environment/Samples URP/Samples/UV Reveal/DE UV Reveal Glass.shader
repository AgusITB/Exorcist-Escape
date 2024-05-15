// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/UV Reveal/Glass"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector][Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 2
		[DE_DrawerCategory(REFRACTION,true,_RefractionIndex,0,0)]_CATEGORY_REFRACTION("CATEGORY_REFRACTION", Float) = 0
		_RefractionIndex("Index of Refraction", Range( 0 , 2.5)) = 0.01
		[DE_DrawerTextureSingleLine]_RefractionTransmittanceColorMap("Transmittance Color Map", 2D) = "white" {}
		[HDR]_RefractionTransmittanceColor("Transmittance Color", Color) = (0.8235294,0.8235294,0.8235294,0)
		[DE_DrawerSpace(10)]_SPACE_REFRACTION("SPACE_REFRACTION", Float) = 0
		[DE_DrawerCategory(COLOR,true,_Brightness,0,0)]_CATEGORY_COLOR("CATEGORY_COLOR", Float) = 1
		_BaseColor("Base Color", Color) = (0,0,0,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerSpace(10)]_SPACE__COLOR("SPACE__COLOR", Float) = 0
		[DE_DrawerCategory(OPACITY,true,_GlassOpacity,0,0)]_CATEGORY_OPACITY("CATEGORY_OPACITY", Float) = 1
		_GlassOpacity("Opacity", Range( 0 , 1)) = 0.85
		[DE_DrawerSpace(10)]_SPACE_OPACITY("SPACE_OPACITY", Float) = 0
		[DE_DrawerCategory(NORMAL,true,_GlassNormalMap,0,0)]_CATEGORY_NORMAL("CATEGORY_NORMAL", Float) = 1
		[Normal][DE_DrawerTextureSingleLine]_GlassNormalMap("Normal Map", 2D) = "white" {}
		_GlassNormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTilingOffset]_NormalUVs("Normal UVs", Vector) = (1,1,0,0)
		[DE_DrawerSpace(10)]_SPACE_NORMAL("SPACE_NORMAL", Float) = 0
		[DE_DrawerCategory(SMOOTHNESS,true,_SmoothnessMap,0,0)]_CATEGORY_SMOOTHNESS("CATEGORY_SMOOTHNESS", Float) = 1
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_SmoothnessSource("Smoothness Source", Float) = 1
		[DE_DrawerTextureSingleLine]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_SmoothnessUVs("Smoothness UVs", Vector) = (1,1,0,0)
		_SmoothnessRotation("Rotation", Float) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.65
		[DE_DrawerToggleLeft]_SmoothnessFresnelEnable("ENABLE FRESNEL", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerSpace(10)]_SPACE_SMOOTHNESS("SPACE_SMOOTHNESS", Float) = 0
		[DE_DrawerCategory(UV LIGHT REVEAL,true,_UVLight00Enable,0,0)]_CATEGORY_UVLIGHTREVEAL00("CATEGORY_UV LIGHT REVEAL00", Float) = 1
		[DE_DrawerToggleLeft]_UVLight00Enable("ENABLE UV LIGHT REVEAL ", Float) = 0
		[HDR]_UVLight00Color("Color", Color) = (1,1,1,1)
		[DE_DrawerToggleNoKeyword]_UVLight00MainLightInfluence("Main Light Influence", Float) = 0
		_UVLight00Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_UVLight00Map("UV Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_UVLight00UVs("UVLight00 UVs", Vector) = (1,1,0,0)
		_UVLight00Rotation("Rotation", Float) = 0
		[DE_DrawerFloatEnum(Front _Back _Both)]_UVLight00EmissiveRenderFace("Emissive Render Face", Float) = 2
		[DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
		_UVLight00FilteredColor("UV Filtered Color", Color) = (0.4039216,0,1,1)
		_UVLight00Threshold("Threshold Reveal Color", Range( 0 , 1)) = 0.25
		_UVLight00ThresholdTemp("Threshold Reveal Color Temp", Range( 0 , 1)) = 0.25
		[DE_DrawerSpace(10)]_SPACE_UVLIGHTREVEL00("SPACE_UV LIGHT REVEL00", Float) = 0
		[DE_DrawerCategory(UV LIGHT REVEAL,true,_UVLight01Enable,0,0)]_CATEGORY_UVLIGHTREVEAL01("CATEGORY_UV LIGHT REVEAL01", Float) = 1
		[DE_DrawerToggleLeft]_UVLight01Enable("ENABLE UV LIGHT REVEAL", Float) = 0
		[HDR]_UVLight01Color("Color", Color) = (1,1,1,1)
		[DE_DrawerToggleNoKeyword]_UVLight01MainLightInfluence("Main Light Influence", Float) = 0
		_UVLight01Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_UVLight01Map("UV Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_UVLight01UVs("UVLight01 UVs", Vector) = (1,1,0,0)
		_UVLight01Rotation("Rotation", Float) = 0
		[DE_DrawerFloatEnum(Front _Back _Both)]_UVLight01EmissiveRenderFace("Emissive Render Face", Float) = 2
		_UVLight01FilteredColor("UV Filtered Color", Color) = (0.4039216,0,1,1)
		_UVLight01Threshold("Threshold Reveal Color", Range( 0 , 1)) = 0.25
		_UVLight01ThresholdTemp("Threshold Reveal Color Temp", Range( 0 , 1)) = 0.25
		[DE_DrawerSpace(10)]_SPACE_UVLIGHTREVEL01("SPACE_UV LIGHT REVEL01", Float) = 0
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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Lit" }

		Cull [_Cull]
		ZWrite Off
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
			Name "ExtraPrePass"
			

			Blend One Zero
			Cull Back
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
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
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_UVLight00Map);
			SAMPLER(sampler_UVLight00Map);
			TEXTURE2D(_UVLight01Map);
			SAMPLER(sampler_UVLight01Map);


			float3 GetMainLightColorNode10_g57812( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 AdditionalLightsFlat14x( float3 WorldPosition, float2 ScreenUV )
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
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 Blackbody416_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
			
			float3 GetMainLightColorNode10_g57813( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 Blackbody424_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
			}
			

			VertexOutput VertexFunction ( VertexInput v  )
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float temp_output_6_0_g57803 = _UVLight00Rotation;
				float temp_output_200_0_g57803 = radians( temp_output_6_0_g57803 );
				float temp_output_13_0_g57803 = cos( temp_output_200_0_g57803 );
				float2 temp_output_9_0_g57803 = float2( 0.5,0.5 );
				float2 break39_g57803 = ( v.ase_texcoord.xy - temp_output_9_0_g57803 );
				float temp_output_14_0_g57803 = sin( temp_output_200_0_g57803 );
				float2 appendResult36_g57803 = (float2(( ( temp_output_13_0_g57803 * break39_g57803.x ) + ( temp_output_14_0_g57803 * break39_g57803.y ) ) , ( ( temp_output_13_0_g57803 * break39_g57803.y ) - ( temp_output_14_0_g57803 * break39_g57803.x ) )));
				float2 Offset235_g57803 = (_UVLight00UVs).zw;
				float2 temp_output_41_0_g57803 = ( ( ( appendResult36_g57803 * ( (_UVLight00UVs).xy / 1.0 ) ) + temp_output_9_0_g57803 ) + Offset235_g57803 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57803 = ( temp_output_41_0_g57803 - ( ( ( (_UVLight00UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord3.xy = vertexToFrag70_g57803;
				o.ase_texcoord4.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				float temp_output_6_0_g57806 = _UVLight01Rotation;
				float temp_output_200_0_g57806 = radians( temp_output_6_0_g57806 );
				float temp_output_13_0_g57806 = cos( temp_output_200_0_g57806 );
				float2 temp_output_9_0_g57806 = float2( 0.5,0.5 );
				float2 break39_g57806 = ( v.ase_texcoord.xy - temp_output_9_0_g57806 );
				float temp_output_14_0_g57806 = sin( temp_output_200_0_g57806 );
				float2 appendResult36_g57806 = (float2(( ( temp_output_13_0_g57806 * break39_g57806.x ) + ( temp_output_14_0_g57806 * break39_g57806.y ) ) , ( ( temp_output_13_0_g57806 * break39_g57806.y ) - ( temp_output_14_0_g57806 * break39_g57806.x ) )));
				float2 Offset235_g57806 = (_UVLight01UVs).zw;
				float2 temp_output_41_0_g57806 = ( ( ( appendResult36_g57806 * ( (_UVLight01UVs).xy / 1.0 ) ) + temp_output_9_0_g57806 ) + Offset235_g57806 );
				float2 vertexToFrag70_g57806 = ( temp_output_41_0_g57806 - ( ( ( (_UVLight01UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord3.zw = vertexToFrag70_g57806;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;

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

				v.normalOS = temp_output_335_978;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
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

			half4 frag ( VertexOutput IN  ) : SV_Target
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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57814 = temp_cast_0;
				#else
				float3 staticSwitch908_g57814 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_23_0_g57797 = staticSwitch908_g57814;
				float m_switch278_g57797 = _UVLight00EmissiveRenderFace;
				float3 temp_output_520_0_g57797 = (_UVLight00Color).rgb;
				float3 Color10_g57812 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57812 = GetMainLightColorNode10_g57812( Color10_g57812 );
				float3 lerpResult521_g57797 = lerp( temp_output_520_0_g57797 , ( temp_output_520_0_g57797 * Color10_g57812 ) , _UVLight00MainLightInfluence);
				float2 vertexToFrag70_g57803 = IN.ase_texcoord3.xy;
				float4 tex2DNode21_g57797 = SAMPLE_TEXTURE2D( _UVLight00Map, sampler_UVLight00Map, vertexToFrag70_g57803 );
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult10_g57801 = normalize( ( float3( 0,0,0 ) + ase_worldViewDir ) );
				float dotResult4_g57801 = dot( ase_worldNormal , normalizeResult10_g57801 );
				float temp_output_517_0_g57797 = dotResult4_g57801;
				float3 worldPosValue187_g57802 = WorldPosition;
				float3 WorldPosition431_g57802 = worldPosValue187_g57802;
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g57802 = (ase_screenPosNorm).xy;
				float2 ScreenUV431_g57802 = ScreenUV190_g57802;
				float3 localAdditionalLightsFlat14x431_g57802 = AdditionalLightsFlat14x( WorldPosition431_g57802 , ScreenUV431_g57802 );
				float3 temp_output_549_126_g57797 = localAdditionalLightsFlat14x431_g57802;
				float3 temp_output_477_0_g57797 = (temp_output_549_126_g57797).xyz;
				float3 normalizeResult17_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_211_0_g57797 = (_UVLight00FilteredColor).rgb;
				float lerpResult413_g57797 = lerp( 1000.0 , 7800.0 , _UVLight00ThresholdTemp);
				float temp_output_448_0_g57797 = abs( lerpResult413_g57797 );
				float Temperature416_g57797 = temp_output_448_0_g57797;
				float3 localBlackbody416_g57797 = Blackbody416_g57797( Temperature416_g57797 );
				float3 UVLight00FilteredColor426_g57797 = ( temp_output_211_0_g57797 * localBlackbody416_g57797 );
				float3 normalizeResult7_g57797 = ASESafeNormalize( UVLight00FilteredColor426_g57797 );
				float dotResult11_g57797 = dot( normalizeResult17_g57797 , normalizeResult7_g57797 );
				float temp_output_13_0_g57797 =  ( dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) > 1.0 ? 0.0 : dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) <= 1.0 && dotResult11_g57797 + ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_22_0_g57797 = ( ( lerpResult521_g57797 * (tex2DNode21_g57797).rgb * _UVLight00Brightness ) * ( temp_output_517_0_g57797 * temp_output_13_0_g57797 ) );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57811 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_280_0_g57797 = (1.0 + (sign( dotResult8_g57811 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult275_g57797 = lerp( temp_output_22_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front278_g57797 = lerpResult275_g57797;
				float3 lerpResult274_g57797 = lerp( float3( 0,0,0 ) , temp_output_22_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back278_g57797 = lerpResult274_g57797;
				float3 m_Both278_g57797 = temp_output_22_0_g57797;
				float3 localEmissiveCullfloat3switch278_g57797 = EmissiveCullfloat3switch( m_switch278_g57797 , m_Front278_g57797 , m_Back278_g57797 , m_Both278_g57797 );
				float temp_output_402_0_g57797 = ( _UVLight00Enable + ( ( _CATEGORY_UVLIGHTREVEAL00 + _SPACE_UVLIGHTREVEL00 ) * 0.0 ) );
				float3 lerpResult195_g57797 = lerp( temp_output_23_0_g57797 , ( temp_output_23_0_g57797 + localEmissiveCullfloat3switch278_g57797 ) , temp_output_402_0_g57797);
				float m_switch259_g57797 = _UVLight01EmissiveRenderFace;
				float3 temp_output_534_0_g57797 = (_UVLight01Color).rgb;
				float3 Color10_g57813 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57813 = GetMainLightColorNode10_g57813( Color10_g57813 );
				float3 lerpResult535_g57797 = lerp( temp_output_534_0_g57797 , ( temp_output_534_0_g57797 * Color10_g57813 ) , _UVLight01MainLightInfluence);
				float2 vertexToFrag70_g57806 = IN.ase_texcoord3.zw;
				float4 tex2DNode56_g57797 = SAMPLE_TEXTURE2D( _UVLight01Map, sampler_UVLight01Map, vertexToFrag70_g57806 );
				float3 normalizeResult49_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_213_0_g57797 = (_UVLight01FilteredColor).rgb;
				float lerpResult422_g57797 = lerp( 1000.0 , 7800.0 , _UVLight01ThresholdTemp);
				float temp_output_449_0_g57797 = abs( lerpResult422_g57797 );
				float Temperature424_g57797 = temp_output_449_0_g57797;
				float3 localBlackbody424_g57797 = Blackbody424_g57797( Temperature424_g57797 );
				float3 UVLight01FilteredColor427_g57797 = ( temp_output_213_0_g57797 * localBlackbody424_g57797 );
				float3 normalizeResult48_g57797 = ASESafeNormalize( UVLight01FilteredColor427_g57797 );
				float dotResult46_g57797 = dot( normalizeResult49_g57797 , normalizeResult48_g57797 );
				float temp_output_42_0_g57797 =  ( dotResult46_g57797 - _UVLight01Threshold > 1.0 ? 0.0 : dotResult46_g57797 - _UVLight01Threshold <= 1.0 && dotResult46_g57797 + _UVLight01Threshold >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_40_0_g57797 = ( ( lerpResult535_g57797 * (tex2DNode56_g57797).rgb * _UVLight01Brightness ) * ( temp_output_517_0_g57797 * temp_output_42_0_g57797 ) );
				float3 lerpResult266_g57797 = lerp( temp_output_40_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front259_g57797 = lerpResult266_g57797;
				float3 lerpResult258_g57797 = lerp( float3( 0,0,0 ) , temp_output_40_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back259_g57797 = lerpResult258_g57797;
				float3 m_Both259_g57797 = temp_output_40_0_g57797;
				float3 localEmissiveCullfloat3switch259_g57797 = EmissiveCullfloat3switch( m_switch259_g57797 , m_Front259_g57797 , m_Back259_g57797 , m_Both259_g57797 );
				float temp_output_403_0_g57797 = ( _UVLight01Enable + ( ( _CATEGORY_UVLIGHTREVEAL01 + _SPACE_UVLIGHTREVEL01 ) * 0.0 ) );
				float3 lerpResult197_g57797 = lerp( lerpResult195_g57797 , ( lerpResult195_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float temp_output_492_0_g57797 = ( tex2DNode21_g57797.a * temp_output_13_0_g57797 );
				float Alpha311_g57797 = ( temp_output_492_0_g57797 + ( tex2DNode56_g57797.a * temp_output_42_0_g57797 ) );
				float3 lerpResult309_g57797 = lerp( temp_output_23_0_g57797 , lerpResult197_g57797 , Alpha311_g57797);
				float3 linearToGamma462_g57797 = FastLinearToSRGB( lerpResult309_g57797 );
				float3 temp_output_391_0 = linearToGamma462_g57797;
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 Color = temp_output_391_0;
				float Alpha = temp_output_335_23;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One One, One OneMinusSrcAlpha
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_UVLight00Map);
			SAMPLER(sampler_UVLight00Map);
			TEXTURE2D(_UVLight01Map);
			SAMPLER(sampler_UVLight01Map);
			TEXTURE2D(_GlassNormalMap);
			SAMPLER(sampler_GlassNormalMap);
			TEXTURE2D(_SmoothnessMap);
			SAMPLER(sampler_SmoothnessMap);
			TEXTURE2D(_RefractionTransmittanceColorMap);
			SAMPLER(sampler_RefractionTransmittanceColorMap);


			float3 GetMainLightColorNode10_g57812( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 AdditionalLightsFlat14x( float3 WorldPosition, float2 ScreenUV )
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
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 Blackbody416_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
			
			float3 GetMainLightColorNode10_g57813( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 Blackbody424_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float temp_output_6_0_g57803 = _UVLight00Rotation;
				float temp_output_200_0_g57803 = radians( temp_output_6_0_g57803 );
				float temp_output_13_0_g57803 = cos( temp_output_200_0_g57803 );
				float2 temp_output_9_0_g57803 = float2( 0.5,0.5 );
				float2 break39_g57803 = ( v.texcoord.xy - temp_output_9_0_g57803 );
				float temp_output_14_0_g57803 = sin( temp_output_200_0_g57803 );
				float2 appendResult36_g57803 = (float2(( ( temp_output_13_0_g57803 * break39_g57803.x ) + ( temp_output_14_0_g57803 * break39_g57803.y ) ) , ( ( temp_output_13_0_g57803 * break39_g57803.y ) - ( temp_output_14_0_g57803 * break39_g57803.x ) )));
				float2 Offset235_g57803 = (_UVLight00UVs).zw;
				float2 temp_output_41_0_g57803 = ( ( ( appendResult36_g57803 * ( (_UVLight00UVs).xy / 1.0 ) ) + temp_output_9_0_g57803 ) + Offset235_g57803 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57803 = ( temp_output_41_0_g57803 - ( ( ( (_UVLight00UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g57803;
				float temp_output_6_0_g57806 = _UVLight01Rotation;
				float temp_output_200_0_g57806 = radians( temp_output_6_0_g57806 );
				float temp_output_13_0_g57806 = cos( temp_output_200_0_g57806 );
				float2 temp_output_9_0_g57806 = float2( 0.5,0.5 );
				float2 break39_g57806 = ( v.texcoord.xy - temp_output_9_0_g57806 );
				float temp_output_14_0_g57806 = sin( temp_output_200_0_g57806 );
				float2 appendResult36_g57806 = (float2(( ( temp_output_13_0_g57806 * break39_g57806.x ) + ( temp_output_14_0_g57806 * break39_g57806.y ) ) , ( ( temp_output_13_0_g57806 * break39_g57806.y ) - ( temp_output_14_0_g57806 * break39_g57806.x ) )));
				float2 Offset235_g57806 = (_UVLight01UVs).zw;
				float2 temp_output_41_0_g57806 = ( ( ( appendResult36_g57806 * ( (_UVLight01UVs).xy / 1.0 ) ) + temp_output_9_0_g57806 ) + Offset235_g57806 );
				float2 vertexToFrag70_g57806 = ( temp_output_41_0_g57806 - ( ( ( (_UVLight01UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g57806;
				
				float2 Offset235_g57823 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57823 = ( ( v.texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57823 );
				float2 vertexToFrag70_g57823 = ( temp_output_41_0_g57823 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag70_g57823;
				
				float temp_output_6_0_g57815 = _SmoothnessRotation;
				float temp_output_200_0_g57815 = radians( temp_output_6_0_g57815 );
				float temp_output_13_0_g57815 = cos( temp_output_200_0_g57815 );
				float2 temp_output_9_0_g57815 = float2( 0.5,0.5 );
				float2 break39_g57815 = ( v.texcoord.xy - temp_output_9_0_g57815 );
				float temp_output_14_0_g57815 = sin( temp_output_200_0_g57815 );
				float2 appendResult36_g57815 = (float2(( ( temp_output_13_0_g57815 * break39_g57815.x ) + ( temp_output_14_0_g57815 * break39_g57815.y ) ) , ( ( temp_output_13_0_g57815 * break39_g57815.y ) - ( temp_output_14_0_g57815 * break39_g57815.x ) )));
				float2 Offset235_g57815 = (_SmoothnessUVs).zw;
				float2 temp_output_41_0_g57815 = ( ( ( appendResult36_g57815 * ( (_SmoothnessUVs).xy / 1.0 ) ) + temp_output_9_0_g57815 ) + Offset235_g57815 );
				float2 vertexToFrag70_g57815 = ( temp_output_41_0_g57815 - ( ( ( (_SmoothnessUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.zw = vertexToFrag70_g57815;
				
				o.ase_texcoord10.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
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
				v.normalOS = temp_output_335_978;
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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57814 = temp_cast_0;
				#else
				float3 staticSwitch908_g57814 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_23_0_g57797 = staticSwitch908_g57814;
				float m_switch278_g57797 = _UVLight00EmissiveRenderFace;
				float3 temp_output_520_0_g57797 = (_UVLight00Color).rgb;
				float3 Color10_g57812 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57812 = GetMainLightColorNode10_g57812( Color10_g57812 );
				float3 lerpResult521_g57797 = lerp( temp_output_520_0_g57797 , ( temp_output_520_0_g57797 * Color10_g57812 ) , _UVLight00MainLightInfluence);
				float2 vertexToFrag70_g57803 = IN.ase_texcoord8.xy;
				float4 tex2DNode21_g57797 = SAMPLE_TEXTURE2D( _UVLight00Map, sampler_UVLight00Map, vertexToFrag70_g57803 );
				float3 normalizeResult10_g57801 = normalize( ( float3( 0,0,0 ) + WorldViewDirection ) );
				float dotResult4_g57801 = dot( WorldNormal , normalizeResult10_g57801 );
				float temp_output_517_0_g57797 = dotResult4_g57801;
				float3 worldPosValue187_g57802 = WorldPosition;
				float3 WorldPosition431_g57802 = worldPosValue187_g57802;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g57802 = (ase_screenPosNorm).xy;
				float2 ScreenUV431_g57802 = ScreenUV190_g57802;
				float3 localAdditionalLightsFlat14x431_g57802 = AdditionalLightsFlat14x( WorldPosition431_g57802 , ScreenUV431_g57802 );
				float3 temp_output_549_126_g57797 = localAdditionalLightsFlat14x431_g57802;
				float3 temp_output_477_0_g57797 = (temp_output_549_126_g57797).xyz;
				float3 normalizeResult17_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_211_0_g57797 = (_UVLight00FilteredColor).rgb;
				float lerpResult413_g57797 = lerp( 1000.0 , 7800.0 , _UVLight00ThresholdTemp);
				float temp_output_448_0_g57797 = abs( lerpResult413_g57797 );
				float Temperature416_g57797 = temp_output_448_0_g57797;
				float3 localBlackbody416_g57797 = Blackbody416_g57797( Temperature416_g57797 );
				float3 UVLight00FilteredColor426_g57797 = ( temp_output_211_0_g57797 * localBlackbody416_g57797 );
				float3 normalizeResult7_g57797 = ASESafeNormalize( UVLight00FilteredColor426_g57797 );
				float dotResult11_g57797 = dot( normalizeResult17_g57797 , normalizeResult7_g57797 );
				float temp_output_13_0_g57797 =  ( dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) > 1.0 ? 0.0 : dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) <= 1.0 && dotResult11_g57797 + ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_22_0_g57797 = ( ( lerpResult521_g57797 * (tex2DNode21_g57797).rgb * _UVLight00Brightness ) * ( temp_output_517_0_g57797 * temp_output_13_0_g57797 ) );
				float dotResult8_g57811 = dot( WorldNormal , WorldViewDirection );
				float temp_output_280_0_g57797 = (1.0 + (sign( dotResult8_g57811 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult275_g57797 = lerp( temp_output_22_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front278_g57797 = lerpResult275_g57797;
				float3 lerpResult274_g57797 = lerp( float3( 0,0,0 ) , temp_output_22_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back278_g57797 = lerpResult274_g57797;
				float3 m_Both278_g57797 = temp_output_22_0_g57797;
				float3 localEmissiveCullfloat3switch278_g57797 = EmissiveCullfloat3switch( m_switch278_g57797 , m_Front278_g57797 , m_Back278_g57797 , m_Both278_g57797 );
				float temp_output_402_0_g57797 = ( _UVLight00Enable + ( ( _CATEGORY_UVLIGHTREVEAL00 + _SPACE_UVLIGHTREVEL00 ) * 0.0 ) );
				float3 lerpResult195_g57797 = lerp( temp_output_23_0_g57797 , ( temp_output_23_0_g57797 + localEmissiveCullfloat3switch278_g57797 ) , temp_output_402_0_g57797);
				float m_switch259_g57797 = _UVLight01EmissiveRenderFace;
				float3 temp_output_534_0_g57797 = (_UVLight01Color).rgb;
				float3 Color10_g57813 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57813 = GetMainLightColorNode10_g57813( Color10_g57813 );
				float3 lerpResult535_g57797 = lerp( temp_output_534_0_g57797 , ( temp_output_534_0_g57797 * Color10_g57813 ) , _UVLight01MainLightInfluence);
				float2 vertexToFrag70_g57806 = IN.ase_texcoord8.zw;
				float4 tex2DNode56_g57797 = SAMPLE_TEXTURE2D( _UVLight01Map, sampler_UVLight01Map, vertexToFrag70_g57806 );
				float3 normalizeResult49_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_213_0_g57797 = (_UVLight01FilteredColor).rgb;
				float lerpResult422_g57797 = lerp( 1000.0 , 7800.0 , _UVLight01ThresholdTemp);
				float temp_output_449_0_g57797 = abs( lerpResult422_g57797 );
				float Temperature424_g57797 = temp_output_449_0_g57797;
				float3 localBlackbody424_g57797 = Blackbody424_g57797( Temperature424_g57797 );
				float3 UVLight01FilteredColor427_g57797 = ( temp_output_213_0_g57797 * localBlackbody424_g57797 );
				float3 normalizeResult48_g57797 = ASESafeNormalize( UVLight01FilteredColor427_g57797 );
				float dotResult46_g57797 = dot( normalizeResult49_g57797 , normalizeResult48_g57797 );
				float temp_output_42_0_g57797 =  ( dotResult46_g57797 - _UVLight01Threshold > 1.0 ? 0.0 : dotResult46_g57797 - _UVLight01Threshold <= 1.0 && dotResult46_g57797 + _UVLight01Threshold >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_40_0_g57797 = ( ( lerpResult535_g57797 * (tex2DNode56_g57797).rgb * _UVLight01Brightness ) * ( temp_output_517_0_g57797 * temp_output_42_0_g57797 ) );
				float3 lerpResult266_g57797 = lerp( temp_output_40_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front259_g57797 = lerpResult266_g57797;
				float3 lerpResult258_g57797 = lerp( float3( 0,0,0 ) , temp_output_40_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back259_g57797 = lerpResult258_g57797;
				float3 m_Both259_g57797 = temp_output_40_0_g57797;
				float3 localEmissiveCullfloat3switch259_g57797 = EmissiveCullfloat3switch( m_switch259_g57797 , m_Front259_g57797 , m_Back259_g57797 , m_Both259_g57797 );
				float temp_output_403_0_g57797 = ( _UVLight01Enable + ( ( _CATEGORY_UVLIGHTREVEAL01 + _SPACE_UVLIGHTREVEL01 ) * 0.0 ) );
				float3 lerpResult197_g57797 = lerp( lerpResult195_g57797 , ( lerpResult195_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float temp_output_492_0_g57797 = ( tex2DNode21_g57797.a * temp_output_13_0_g57797 );
				float Alpha311_g57797 = ( temp_output_492_0_g57797 + ( tex2DNode56_g57797.a * temp_output_42_0_g57797 ) );
				float3 lerpResult309_g57797 = lerp( temp_output_23_0_g57797 , lerpResult197_g57797 , Alpha311_g57797);
				float3 linearToGamma462_g57797 = FastLinearToSRGB( lerpResult309_g57797 );
				float3 temp_output_391_0 = linearToGamma462_g57797;
				
				float2 vertexToFrag70_g57823 = IN.ase_texcoord9.xy;
				float3 unpack790_g57814 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57823 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57814.z = lerp( 1, unpack790_g57814.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				
				float4 color221_g57797 = IsGammaSpace() ? float4(0.003921569,0,0,0) : float4(0.000303527,0,0,0);
				float3 temp_output_557_0_g57797 = (color221_g57797).rgb;
				float3 lerpResult293_g57797 = lerp( temp_output_557_0_g57797 , localEmissiveCullfloat3switch278_g57797 , temp_output_402_0_g57797);
				float3 lerpResult296_g57797 = lerp( lerpResult293_g57797 , ( lerpResult293_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float3 lerpResult505_g57797 = lerp( float3( 0,0,0 ) , lerpResult296_g57797 , Alpha311_g57797);
				float3 temp_output_913_0_g57814 = (float4(0,0,0,1)).rgb;
				float3 temp_output_220_0_g57797 = ( lerpResult505_g57797 + temp_output_913_0_g57814 );
				float3 linearToGamma289_g57797 = FastLinearToSRGB( temp_output_220_0_g57797 );
				
				float2 vertexToFrag70_g57815 = IN.ase_texcoord9.zw;
				float3 temp_output_1014_0_g57814 = (SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_SmoothnessMap, vertexToFrag70_g57815 )).rgb;
				float3 temp_output_1028_0_g57814 = ( 1.0 - temp_output_1014_0_g57814 );
				float3 temp_cast_2 = (0.089).xxx;
				float3 lerpResult992_g57814 = lerp( temp_output_1014_0_g57814 , max( ( temp_output_1028_0_g57814 * temp_output_1028_0_g57814 ) , temp_cast_2 ) , _SmoothnessSource);
				float3 temp_output_991_0_g57814 = ( lerpResult992_g57814 * _SmoothnessStrength );
				float2 appendResult1000_g57814 = (float2(WorldViewDirection.xy));
				float3 appendResult999_g57814 = (float3(appendResult1000_g57814 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV997_g57814 = dot( normalize( unpack790_g57814 ), appendResult999_g57814 );
				float fresnelNode997_g57814 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV997_g57814 , 0.0001 ), _SmoothnessFresnelPower ) );
				float3 temp_cast_5 = (fresnelNode997_g57814).xxx;
				float3 lerpResult996_g57814 = lerp( temp_output_991_0_g57814 , ( temp_output_991_0_g57814 - temp_cast_5 ) , ( _SmoothnessFresnelEnable + ( ( _CATEGORY_SMOOTHNESS + _SPACE_SMOOTHNESS ) * 0.0 ) ));
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				
				float2 uv_RefractionTransmittanceColorMap = IN.ase_texcoord10.xy * _RefractionTransmittanceColorMap_ST.xy + _RefractionTransmittanceColorMap_ST.zw;
				

				float3 BaseColor = temp_output_391_0;
				float3 Normal = unpack790_g57814;
				float3 Emission = linearToGamma289_g57797;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = saturate( lerpResult996_g57814 ).x;
				float Occlusion = 1;
				float Alpha = temp_output_335_23;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = ( (SAMPLE_TEXTURE2D( _RefractionTransmittanceColorMap, sampler_RefractionTransmittanceColorMap, uv_RefractionTransmittanceColorMap )).rgb * (_RefractionTransmittanceColor).rgb );
				float RefractionIndex = ( 1.0 - ( _RefractionIndex + ( ( 0.0 + _CATEGORY_REFRACTION + _SPACE_REFRACTION ) * 0.0 ) ) );
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
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


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
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				

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

				v.normalOS = temp_output_335_978;

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

				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float Alpha = temp_output_335_23;
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
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


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
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				

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

				v.normalOS = temp_output_335_978;

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

				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float Alpha = temp_output_335_23;
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
			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_UVLight00Map);
			SAMPLER(sampler_UVLight00Map);
			TEXTURE2D(_UVLight01Map);
			SAMPLER(sampler_UVLight01Map);


			float3 GetMainLightColorNode10_g57812( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 AdditionalLightsFlat14x( float3 WorldPosition, float2 ScreenUV )
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
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 Blackbody416_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
			
			float3 GetMainLightColorNode10_g57813( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 Blackbody424_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float temp_output_6_0_g57803 = _UVLight00Rotation;
				float temp_output_200_0_g57803 = radians( temp_output_6_0_g57803 );
				float temp_output_13_0_g57803 = cos( temp_output_200_0_g57803 );
				float2 temp_output_9_0_g57803 = float2( 0.5,0.5 );
				float2 break39_g57803 = ( v.texcoord0.xy - temp_output_9_0_g57803 );
				float temp_output_14_0_g57803 = sin( temp_output_200_0_g57803 );
				float2 appendResult36_g57803 = (float2(( ( temp_output_13_0_g57803 * break39_g57803.x ) + ( temp_output_14_0_g57803 * break39_g57803.y ) ) , ( ( temp_output_13_0_g57803 * break39_g57803.y ) - ( temp_output_14_0_g57803 * break39_g57803.x ) )));
				float2 Offset235_g57803 = (_UVLight00UVs).zw;
				float2 temp_output_41_0_g57803 = ( ( ( appendResult36_g57803 * ( (_UVLight00UVs).xy / 1.0 ) ) + temp_output_9_0_g57803 ) + Offset235_g57803 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57803 = ( temp_output_41_0_g57803 - ( ( ( (_UVLight00UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.xy = vertexToFrag70_g57803;
				o.ase_texcoord5.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord6 = screenPos;
				float temp_output_6_0_g57806 = _UVLight01Rotation;
				float temp_output_200_0_g57806 = radians( temp_output_6_0_g57806 );
				float temp_output_13_0_g57806 = cos( temp_output_200_0_g57806 );
				float2 temp_output_9_0_g57806 = float2( 0.5,0.5 );
				float2 break39_g57806 = ( v.texcoord0.xy - temp_output_9_0_g57806 );
				float temp_output_14_0_g57806 = sin( temp_output_200_0_g57806 );
				float2 appendResult36_g57806 = (float2(( ( temp_output_13_0_g57806 * break39_g57806.x ) + ( temp_output_14_0_g57806 * break39_g57806.y ) ) , ( ( temp_output_13_0_g57806 * break39_g57806.y ) - ( temp_output_14_0_g57806 * break39_g57806.x ) )));
				float2 Offset235_g57806 = (_UVLight01UVs).zw;
				float2 temp_output_41_0_g57806 = ( ( ( appendResult36_g57806 * ( (_UVLight01UVs).xy / 1.0 ) ) + temp_output_9_0_g57806 ) + Offset235_g57806 );
				float2 vertexToFrag70_g57806 = ( temp_output_41_0_g57806 - ( ( ( (_UVLight01UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord4.zw = vertexToFrag70_g57806;
				
				
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

				v.normalOS = temp_output_335_978;

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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57814 = temp_cast_0;
				#else
				float3 staticSwitch908_g57814 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_23_0_g57797 = staticSwitch908_g57814;
				float m_switch278_g57797 = _UVLight00EmissiveRenderFace;
				float3 temp_output_520_0_g57797 = (_UVLight00Color).rgb;
				float3 Color10_g57812 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57812 = GetMainLightColorNode10_g57812( Color10_g57812 );
				float3 lerpResult521_g57797 = lerp( temp_output_520_0_g57797 , ( temp_output_520_0_g57797 * Color10_g57812 ) , _UVLight00MainLightInfluence);
				float2 vertexToFrag70_g57803 = IN.ase_texcoord4.xy;
				float4 tex2DNode21_g57797 = SAMPLE_TEXTURE2D( _UVLight00Map, sampler_UVLight00Map, vertexToFrag70_g57803 );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult10_g57801 = normalize( ( float3( 0,0,0 ) + ase_worldViewDir ) );
				float dotResult4_g57801 = dot( ase_worldNormal , normalizeResult10_g57801 );
				float temp_output_517_0_g57797 = dotResult4_g57801;
				float3 worldPosValue187_g57802 = WorldPosition;
				float3 WorldPosition431_g57802 = worldPosValue187_g57802;
				float4 screenPos = IN.ase_texcoord6;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g57802 = (ase_screenPosNorm).xy;
				float2 ScreenUV431_g57802 = ScreenUV190_g57802;
				float3 localAdditionalLightsFlat14x431_g57802 = AdditionalLightsFlat14x( WorldPosition431_g57802 , ScreenUV431_g57802 );
				float3 temp_output_549_126_g57797 = localAdditionalLightsFlat14x431_g57802;
				float3 temp_output_477_0_g57797 = (temp_output_549_126_g57797).xyz;
				float3 normalizeResult17_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_211_0_g57797 = (_UVLight00FilteredColor).rgb;
				float lerpResult413_g57797 = lerp( 1000.0 , 7800.0 , _UVLight00ThresholdTemp);
				float temp_output_448_0_g57797 = abs( lerpResult413_g57797 );
				float Temperature416_g57797 = temp_output_448_0_g57797;
				float3 localBlackbody416_g57797 = Blackbody416_g57797( Temperature416_g57797 );
				float3 UVLight00FilteredColor426_g57797 = ( temp_output_211_0_g57797 * localBlackbody416_g57797 );
				float3 normalizeResult7_g57797 = ASESafeNormalize( UVLight00FilteredColor426_g57797 );
				float dotResult11_g57797 = dot( normalizeResult17_g57797 , normalizeResult7_g57797 );
				float temp_output_13_0_g57797 =  ( dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) > 1.0 ? 0.0 : dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) <= 1.0 && dotResult11_g57797 + ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_22_0_g57797 = ( ( lerpResult521_g57797 * (tex2DNode21_g57797).rgb * _UVLight00Brightness ) * ( temp_output_517_0_g57797 * temp_output_13_0_g57797 ) );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57811 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_280_0_g57797 = (1.0 + (sign( dotResult8_g57811 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult275_g57797 = lerp( temp_output_22_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front278_g57797 = lerpResult275_g57797;
				float3 lerpResult274_g57797 = lerp( float3( 0,0,0 ) , temp_output_22_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back278_g57797 = lerpResult274_g57797;
				float3 m_Both278_g57797 = temp_output_22_0_g57797;
				float3 localEmissiveCullfloat3switch278_g57797 = EmissiveCullfloat3switch( m_switch278_g57797 , m_Front278_g57797 , m_Back278_g57797 , m_Both278_g57797 );
				float temp_output_402_0_g57797 = ( _UVLight00Enable + ( ( _CATEGORY_UVLIGHTREVEAL00 + _SPACE_UVLIGHTREVEL00 ) * 0.0 ) );
				float3 lerpResult195_g57797 = lerp( temp_output_23_0_g57797 , ( temp_output_23_0_g57797 + localEmissiveCullfloat3switch278_g57797 ) , temp_output_402_0_g57797);
				float m_switch259_g57797 = _UVLight01EmissiveRenderFace;
				float3 temp_output_534_0_g57797 = (_UVLight01Color).rgb;
				float3 Color10_g57813 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57813 = GetMainLightColorNode10_g57813( Color10_g57813 );
				float3 lerpResult535_g57797 = lerp( temp_output_534_0_g57797 , ( temp_output_534_0_g57797 * Color10_g57813 ) , _UVLight01MainLightInfluence);
				float2 vertexToFrag70_g57806 = IN.ase_texcoord4.zw;
				float4 tex2DNode56_g57797 = SAMPLE_TEXTURE2D( _UVLight01Map, sampler_UVLight01Map, vertexToFrag70_g57806 );
				float3 normalizeResult49_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_213_0_g57797 = (_UVLight01FilteredColor).rgb;
				float lerpResult422_g57797 = lerp( 1000.0 , 7800.0 , _UVLight01ThresholdTemp);
				float temp_output_449_0_g57797 = abs( lerpResult422_g57797 );
				float Temperature424_g57797 = temp_output_449_0_g57797;
				float3 localBlackbody424_g57797 = Blackbody424_g57797( Temperature424_g57797 );
				float3 UVLight01FilteredColor427_g57797 = ( temp_output_213_0_g57797 * localBlackbody424_g57797 );
				float3 normalizeResult48_g57797 = ASESafeNormalize( UVLight01FilteredColor427_g57797 );
				float dotResult46_g57797 = dot( normalizeResult49_g57797 , normalizeResult48_g57797 );
				float temp_output_42_0_g57797 =  ( dotResult46_g57797 - _UVLight01Threshold > 1.0 ? 0.0 : dotResult46_g57797 - _UVLight01Threshold <= 1.0 && dotResult46_g57797 + _UVLight01Threshold >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_40_0_g57797 = ( ( lerpResult535_g57797 * (tex2DNode56_g57797).rgb * _UVLight01Brightness ) * ( temp_output_517_0_g57797 * temp_output_42_0_g57797 ) );
				float3 lerpResult266_g57797 = lerp( temp_output_40_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front259_g57797 = lerpResult266_g57797;
				float3 lerpResult258_g57797 = lerp( float3( 0,0,0 ) , temp_output_40_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back259_g57797 = lerpResult258_g57797;
				float3 m_Both259_g57797 = temp_output_40_0_g57797;
				float3 localEmissiveCullfloat3switch259_g57797 = EmissiveCullfloat3switch( m_switch259_g57797 , m_Front259_g57797 , m_Back259_g57797 , m_Both259_g57797 );
				float temp_output_403_0_g57797 = ( _UVLight01Enable + ( ( _CATEGORY_UVLIGHTREVEAL01 + _SPACE_UVLIGHTREVEL01 ) * 0.0 ) );
				float3 lerpResult197_g57797 = lerp( lerpResult195_g57797 , ( lerpResult195_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float temp_output_492_0_g57797 = ( tex2DNode21_g57797.a * temp_output_13_0_g57797 );
				float Alpha311_g57797 = ( temp_output_492_0_g57797 + ( tex2DNode56_g57797.a * temp_output_42_0_g57797 ) );
				float3 lerpResult309_g57797 = lerp( temp_output_23_0_g57797 , lerpResult197_g57797 , Alpha311_g57797);
				float3 linearToGamma462_g57797 = FastLinearToSRGB( lerpResult309_g57797 );
				float3 temp_output_391_0 = linearToGamma462_g57797;
				
				float4 color221_g57797 = IsGammaSpace() ? float4(0.003921569,0,0,0) : float4(0.000303527,0,0,0);
				float3 temp_output_557_0_g57797 = (color221_g57797).rgb;
				float3 lerpResult293_g57797 = lerp( temp_output_557_0_g57797 , localEmissiveCullfloat3switch278_g57797 , temp_output_402_0_g57797);
				float3 lerpResult296_g57797 = lerp( lerpResult293_g57797 , ( lerpResult293_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float3 lerpResult505_g57797 = lerp( float3( 0,0,0 ) , lerpResult296_g57797 , Alpha311_g57797);
				float3 temp_output_913_0_g57814 = (float4(0,0,0,1)).rgb;
				float3 temp_output_220_0_g57797 = ( lerpResult505_g57797 + temp_output_913_0_g57814 );
				float3 linearToGamma289_g57797 = FastLinearToSRGB( temp_output_220_0_g57797 );
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 BaseColor = temp_output_391_0;
				float3 Emission = linearToGamma289_g57797;
				float Alpha = temp_output_335_23;
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

			Blend One One, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_UVLight00Map);
			SAMPLER(sampler_UVLight00Map);
			TEXTURE2D(_UVLight01Map);
			SAMPLER(sampler_UVLight01Map);


			float3 GetMainLightColorNode10_g57812( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 AdditionalLightsFlat14x( float3 WorldPosition, float2 ScreenUV )
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
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 Blackbody416_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
			
			float3 GetMainLightColorNode10_g57813( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 Blackbody424_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float temp_output_6_0_g57803 = _UVLight00Rotation;
				float temp_output_200_0_g57803 = radians( temp_output_6_0_g57803 );
				float temp_output_13_0_g57803 = cos( temp_output_200_0_g57803 );
				float2 temp_output_9_0_g57803 = float2( 0.5,0.5 );
				float2 break39_g57803 = ( v.ase_texcoord.xy - temp_output_9_0_g57803 );
				float temp_output_14_0_g57803 = sin( temp_output_200_0_g57803 );
				float2 appendResult36_g57803 = (float2(( ( temp_output_13_0_g57803 * break39_g57803.x ) + ( temp_output_14_0_g57803 * break39_g57803.y ) ) , ( ( temp_output_13_0_g57803 * break39_g57803.y ) - ( temp_output_14_0_g57803 * break39_g57803.x ) )));
				float2 Offset235_g57803 = (_UVLight00UVs).zw;
				float2 temp_output_41_0_g57803 = ( ( ( appendResult36_g57803 * ( (_UVLight00UVs).xy / 1.0 ) ) + temp_output_9_0_g57803 ) + Offset235_g57803 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57803 = ( temp_output_41_0_g57803 - ( ( ( (_UVLight00UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord2.xy = vertexToFrag70_g57803;
				o.ase_texcoord3.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				float temp_output_6_0_g57806 = _UVLight01Rotation;
				float temp_output_200_0_g57806 = radians( temp_output_6_0_g57806 );
				float temp_output_13_0_g57806 = cos( temp_output_200_0_g57806 );
				float2 temp_output_9_0_g57806 = float2( 0.5,0.5 );
				float2 break39_g57806 = ( v.ase_texcoord.xy - temp_output_9_0_g57806 );
				float temp_output_14_0_g57806 = sin( temp_output_200_0_g57806 );
				float2 appendResult36_g57806 = (float2(( ( temp_output_13_0_g57806 * break39_g57806.x ) + ( temp_output_14_0_g57806 * break39_g57806.y ) ) , ( ( temp_output_13_0_g57806 * break39_g57806.y ) - ( temp_output_14_0_g57806 * break39_g57806.x ) )));
				float2 Offset235_g57806 = (_UVLight01UVs).zw;
				float2 temp_output_41_0_g57806 = ( ( ( appendResult36_g57806 * ( (_UVLight01UVs).xy / 1.0 ) ) + temp_output_9_0_g57806 ) + Offset235_g57806 );
				float2 vertexToFrag70_g57806 = ( temp_output_41_0_g57806 - ( ( ( (_UVLight01UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord2.zw = vertexToFrag70_g57806;
				
				
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

				v.normalOS = temp_output_335_978;

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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57814 = temp_cast_0;
				#else
				float3 staticSwitch908_g57814 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_23_0_g57797 = staticSwitch908_g57814;
				float m_switch278_g57797 = _UVLight00EmissiveRenderFace;
				float3 temp_output_520_0_g57797 = (_UVLight00Color).rgb;
				float3 Color10_g57812 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57812 = GetMainLightColorNode10_g57812( Color10_g57812 );
				float3 lerpResult521_g57797 = lerp( temp_output_520_0_g57797 , ( temp_output_520_0_g57797 * Color10_g57812 ) , _UVLight00MainLightInfluence);
				float2 vertexToFrag70_g57803 = IN.ase_texcoord2.xy;
				float4 tex2DNode21_g57797 = SAMPLE_TEXTURE2D( _UVLight00Map, sampler_UVLight00Map, vertexToFrag70_g57803 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult10_g57801 = normalize( ( float3( 0,0,0 ) + ase_worldViewDir ) );
				float dotResult4_g57801 = dot( ase_worldNormal , normalizeResult10_g57801 );
				float temp_output_517_0_g57797 = dotResult4_g57801;
				float3 worldPosValue187_g57802 = WorldPosition;
				float3 WorldPosition431_g57802 = worldPosValue187_g57802;
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g57802 = (ase_screenPosNorm).xy;
				float2 ScreenUV431_g57802 = ScreenUV190_g57802;
				float3 localAdditionalLightsFlat14x431_g57802 = AdditionalLightsFlat14x( WorldPosition431_g57802 , ScreenUV431_g57802 );
				float3 temp_output_549_126_g57797 = localAdditionalLightsFlat14x431_g57802;
				float3 temp_output_477_0_g57797 = (temp_output_549_126_g57797).xyz;
				float3 normalizeResult17_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_211_0_g57797 = (_UVLight00FilteredColor).rgb;
				float lerpResult413_g57797 = lerp( 1000.0 , 7800.0 , _UVLight00ThresholdTemp);
				float temp_output_448_0_g57797 = abs( lerpResult413_g57797 );
				float Temperature416_g57797 = temp_output_448_0_g57797;
				float3 localBlackbody416_g57797 = Blackbody416_g57797( Temperature416_g57797 );
				float3 UVLight00FilteredColor426_g57797 = ( temp_output_211_0_g57797 * localBlackbody416_g57797 );
				float3 normalizeResult7_g57797 = ASESafeNormalize( UVLight00FilteredColor426_g57797 );
				float dotResult11_g57797 = dot( normalizeResult17_g57797 , normalizeResult7_g57797 );
				float temp_output_13_0_g57797 =  ( dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) > 1.0 ? 0.0 : dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) <= 1.0 && dotResult11_g57797 + ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_22_0_g57797 = ( ( lerpResult521_g57797 * (tex2DNode21_g57797).rgb * _UVLight00Brightness ) * ( temp_output_517_0_g57797 * temp_output_13_0_g57797 ) );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57811 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_280_0_g57797 = (1.0 + (sign( dotResult8_g57811 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult275_g57797 = lerp( temp_output_22_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front278_g57797 = lerpResult275_g57797;
				float3 lerpResult274_g57797 = lerp( float3( 0,0,0 ) , temp_output_22_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back278_g57797 = lerpResult274_g57797;
				float3 m_Both278_g57797 = temp_output_22_0_g57797;
				float3 localEmissiveCullfloat3switch278_g57797 = EmissiveCullfloat3switch( m_switch278_g57797 , m_Front278_g57797 , m_Back278_g57797 , m_Both278_g57797 );
				float temp_output_402_0_g57797 = ( _UVLight00Enable + ( ( _CATEGORY_UVLIGHTREVEAL00 + _SPACE_UVLIGHTREVEL00 ) * 0.0 ) );
				float3 lerpResult195_g57797 = lerp( temp_output_23_0_g57797 , ( temp_output_23_0_g57797 + localEmissiveCullfloat3switch278_g57797 ) , temp_output_402_0_g57797);
				float m_switch259_g57797 = _UVLight01EmissiveRenderFace;
				float3 temp_output_534_0_g57797 = (_UVLight01Color).rgb;
				float3 Color10_g57813 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57813 = GetMainLightColorNode10_g57813( Color10_g57813 );
				float3 lerpResult535_g57797 = lerp( temp_output_534_0_g57797 , ( temp_output_534_0_g57797 * Color10_g57813 ) , _UVLight01MainLightInfluence);
				float2 vertexToFrag70_g57806 = IN.ase_texcoord2.zw;
				float4 tex2DNode56_g57797 = SAMPLE_TEXTURE2D( _UVLight01Map, sampler_UVLight01Map, vertexToFrag70_g57806 );
				float3 normalizeResult49_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_213_0_g57797 = (_UVLight01FilteredColor).rgb;
				float lerpResult422_g57797 = lerp( 1000.0 , 7800.0 , _UVLight01ThresholdTemp);
				float temp_output_449_0_g57797 = abs( lerpResult422_g57797 );
				float Temperature424_g57797 = temp_output_449_0_g57797;
				float3 localBlackbody424_g57797 = Blackbody424_g57797( Temperature424_g57797 );
				float3 UVLight01FilteredColor427_g57797 = ( temp_output_213_0_g57797 * localBlackbody424_g57797 );
				float3 normalizeResult48_g57797 = ASESafeNormalize( UVLight01FilteredColor427_g57797 );
				float dotResult46_g57797 = dot( normalizeResult49_g57797 , normalizeResult48_g57797 );
				float temp_output_42_0_g57797 =  ( dotResult46_g57797 - _UVLight01Threshold > 1.0 ? 0.0 : dotResult46_g57797 - _UVLight01Threshold <= 1.0 && dotResult46_g57797 + _UVLight01Threshold >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_40_0_g57797 = ( ( lerpResult535_g57797 * (tex2DNode56_g57797).rgb * _UVLight01Brightness ) * ( temp_output_517_0_g57797 * temp_output_42_0_g57797 ) );
				float3 lerpResult266_g57797 = lerp( temp_output_40_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front259_g57797 = lerpResult266_g57797;
				float3 lerpResult258_g57797 = lerp( float3( 0,0,0 ) , temp_output_40_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back259_g57797 = lerpResult258_g57797;
				float3 m_Both259_g57797 = temp_output_40_0_g57797;
				float3 localEmissiveCullfloat3switch259_g57797 = EmissiveCullfloat3switch( m_switch259_g57797 , m_Front259_g57797 , m_Back259_g57797 , m_Both259_g57797 );
				float temp_output_403_0_g57797 = ( _UVLight01Enable + ( ( _CATEGORY_UVLIGHTREVEAL01 + _SPACE_UVLIGHTREVEL01 ) * 0.0 ) );
				float3 lerpResult197_g57797 = lerp( lerpResult195_g57797 , ( lerpResult195_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float temp_output_492_0_g57797 = ( tex2DNode21_g57797.a * temp_output_13_0_g57797 );
				float Alpha311_g57797 = ( temp_output_492_0_g57797 + ( tex2DNode56_g57797.a * temp_output_42_0_g57797 ) );
				float3 lerpResult309_g57797 = lerp( temp_output_23_0_g57797 , lerpResult197_g57797 , Alpha311_g57797);
				float3 linearToGamma462_g57797 = FastLinearToSRGB( lerpResult309_g57797 );
				float3 temp_output_391_0 = linearToGamma462_g57797;
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 BaseColor = temp_output_391_0;
				float Alpha = temp_output_335_23;
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
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_GlassNormalMap);
			SAMPLER(sampler_GlassNormalMap);


			
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float2 Offset235_g57823 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57823 = ( ( v.ase_texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57823 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57823 = ( temp_output_41_0_g57823 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.xy = vertexToFrag70_g57823;
				
				
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

				v.normalOS = temp_output_335_978;
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

				float2 vertexToFrag70_g57823 = IN.ase_texcoord5.xy;
				float3 unpack790_g57814 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57823 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57814.z = lerp( 1, unpack790_g57814.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 Normal = unpack790_g57814;
				float Alpha = temp_output_335_23;
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

			Blend One One, One OneMinusSrcAlpha
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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

			TEXTURE2D(_UVLight00Map);
			SAMPLER(sampler_UVLight00Map);
			TEXTURE2D(_UVLight01Map);
			SAMPLER(sampler_UVLight01Map);
			TEXTURE2D(_GlassNormalMap);
			SAMPLER(sampler_GlassNormalMap);
			TEXTURE2D(_SmoothnessMap);
			SAMPLER(sampler_SmoothnessMap);
			TEXTURE2D(_RefractionTransmittanceColorMap);
			SAMPLER(sampler_RefractionTransmittanceColorMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float3 GetMainLightColorNode10_g57812( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 AdditionalLightsFlat14x( float3 WorldPosition, float2 ScreenUV )
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
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTFLAT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 Blackbody416_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
			
			float3 GetMainLightColorNode10_g57813( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 Blackbody424_g57797( float Temperature )
			{
				float3 color = float3(255.0, 255.0, 255.0);
				color.x = 56100000. * pow(Temperature,(-3.0 / 2.0)) + 148.0;
				color.y = 100.04 * log(Temperature) - 623.6;
				if (Temperature > 6500.0) color.y = 35200000.0 * pow(Temperature,(-3.0 / 2.0)) + 184.0;
				color.z = 194.18 * log(Temperature) - 1448.6;
				color = clamp(color, 0.0, 255.0)/255.0;
				if (Temperature < 1000.0) color *= Temperature/1000.0;
				return color;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				
				float temp_output_6_0_g57803 = _UVLight00Rotation;
				float temp_output_200_0_g57803 = radians( temp_output_6_0_g57803 );
				float temp_output_13_0_g57803 = cos( temp_output_200_0_g57803 );
				float2 temp_output_9_0_g57803 = float2( 0.5,0.5 );
				float2 break39_g57803 = ( v.texcoord.xy - temp_output_9_0_g57803 );
				float temp_output_14_0_g57803 = sin( temp_output_200_0_g57803 );
				float2 appendResult36_g57803 = (float2(( ( temp_output_13_0_g57803 * break39_g57803.x ) + ( temp_output_14_0_g57803 * break39_g57803.y ) ) , ( ( temp_output_13_0_g57803 * break39_g57803.y ) - ( temp_output_14_0_g57803 * break39_g57803.x ) )));
				float2 Offset235_g57803 = (_UVLight00UVs).zw;
				float2 temp_output_41_0_g57803 = ( ( ( appendResult36_g57803 * ( (_UVLight00UVs).xy / 1.0 ) ) + temp_output_9_0_g57803 ) + Offset235_g57803 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57803 = ( temp_output_41_0_g57803 - ( ( ( (_UVLight00UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g57803;
				float temp_output_6_0_g57806 = _UVLight01Rotation;
				float temp_output_200_0_g57806 = radians( temp_output_6_0_g57806 );
				float temp_output_13_0_g57806 = cos( temp_output_200_0_g57806 );
				float2 temp_output_9_0_g57806 = float2( 0.5,0.5 );
				float2 break39_g57806 = ( v.texcoord.xy - temp_output_9_0_g57806 );
				float temp_output_14_0_g57806 = sin( temp_output_200_0_g57806 );
				float2 appendResult36_g57806 = (float2(( ( temp_output_13_0_g57806 * break39_g57806.x ) + ( temp_output_14_0_g57806 * break39_g57806.y ) ) , ( ( temp_output_13_0_g57806 * break39_g57806.y ) - ( temp_output_14_0_g57806 * break39_g57806.x ) )));
				float2 Offset235_g57806 = (_UVLight01UVs).zw;
				float2 temp_output_41_0_g57806 = ( ( ( appendResult36_g57806 * ( (_UVLight01UVs).xy / 1.0 ) ) + temp_output_9_0_g57806 ) + Offset235_g57806 );
				float2 vertexToFrag70_g57806 = ( temp_output_41_0_g57806 - ( ( ( (_UVLight01UVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.zw = vertexToFrag70_g57806;
				
				float2 Offset235_g57823 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57823 = ( ( v.texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57823 );
				float2 vertexToFrag70_g57823 = ( temp_output_41_0_g57823 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.xy = vertexToFrag70_g57823;
				
				float temp_output_6_0_g57815 = _SmoothnessRotation;
				float temp_output_200_0_g57815 = radians( temp_output_6_0_g57815 );
				float temp_output_13_0_g57815 = cos( temp_output_200_0_g57815 );
				float2 temp_output_9_0_g57815 = float2( 0.5,0.5 );
				float2 break39_g57815 = ( v.texcoord.xy - temp_output_9_0_g57815 );
				float temp_output_14_0_g57815 = sin( temp_output_200_0_g57815 );
				float2 appendResult36_g57815 = (float2(( ( temp_output_13_0_g57815 * break39_g57815.x ) + ( temp_output_14_0_g57815 * break39_g57815.y ) ) , ( ( temp_output_13_0_g57815 * break39_g57815.y ) - ( temp_output_14_0_g57815 * break39_g57815.x ) )));
				float2 Offset235_g57815 = (_SmoothnessUVs).zw;
				float2 temp_output_41_0_g57815 = ( ( ( appendResult36_g57815 * ( (_SmoothnessUVs).xy / 1.0 ) ) + temp_output_9_0_g57815 ) + Offset235_g57815 );
				float2 vertexToFrag70_g57815 = ( temp_output_41_0_g57815 - ( ( ( (_SmoothnessUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord9.zw = vertexToFrag70_g57815;
				
				o.ase_texcoord10.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
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

				v.normalOS = temp_output_335_978;
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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57814 = temp_cast_0;
				#else
				float3 staticSwitch908_g57814 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_23_0_g57797 = staticSwitch908_g57814;
				float m_switch278_g57797 = _UVLight00EmissiveRenderFace;
				float3 temp_output_520_0_g57797 = (_UVLight00Color).rgb;
				float3 Color10_g57812 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57812 = GetMainLightColorNode10_g57812( Color10_g57812 );
				float3 lerpResult521_g57797 = lerp( temp_output_520_0_g57797 , ( temp_output_520_0_g57797 * Color10_g57812 ) , _UVLight00MainLightInfluence);
				float2 vertexToFrag70_g57803 = IN.ase_texcoord8.xy;
				float4 tex2DNode21_g57797 = SAMPLE_TEXTURE2D( _UVLight00Map, sampler_UVLight00Map, vertexToFrag70_g57803 );
				float3 normalizeResult10_g57801 = normalize( ( float3( 0,0,0 ) + WorldViewDirection ) );
				float dotResult4_g57801 = dot( WorldNormal , normalizeResult10_g57801 );
				float temp_output_517_0_g57797 = dotResult4_g57801;
				float3 worldPosValue187_g57802 = WorldPosition;
				float3 WorldPosition431_g57802 = worldPosValue187_g57802;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV190_g57802 = (ase_screenPosNorm).xy;
				float2 ScreenUV431_g57802 = ScreenUV190_g57802;
				float3 localAdditionalLightsFlat14x431_g57802 = AdditionalLightsFlat14x( WorldPosition431_g57802 , ScreenUV431_g57802 );
				float3 temp_output_549_126_g57797 = localAdditionalLightsFlat14x431_g57802;
				float3 temp_output_477_0_g57797 = (temp_output_549_126_g57797).xyz;
				float3 normalizeResult17_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_211_0_g57797 = (_UVLight00FilteredColor).rgb;
				float lerpResult413_g57797 = lerp( 1000.0 , 7800.0 , _UVLight00ThresholdTemp);
				float temp_output_448_0_g57797 = abs( lerpResult413_g57797 );
				float Temperature416_g57797 = temp_output_448_0_g57797;
				float3 localBlackbody416_g57797 = Blackbody416_g57797( Temperature416_g57797 );
				float3 UVLight00FilteredColor426_g57797 = ( temp_output_211_0_g57797 * localBlackbody416_g57797 );
				float3 normalizeResult7_g57797 = ASESafeNormalize( UVLight00FilteredColor426_g57797 );
				float dotResult11_g57797 = dot( normalizeResult17_g57797 , normalizeResult7_g57797 );
				float temp_output_13_0_g57797 =  ( dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) > 1.0 ? 0.0 : dotResult11_g57797 - ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) <= 1.0 && dotResult11_g57797 + ( _UVLight00Threshold + ( _EmissionFlags * 0.0 ) ) >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_22_0_g57797 = ( ( lerpResult521_g57797 * (tex2DNode21_g57797).rgb * _UVLight00Brightness ) * ( temp_output_517_0_g57797 * temp_output_13_0_g57797 ) );
				float dotResult8_g57811 = dot( WorldNormal , WorldViewDirection );
				float temp_output_280_0_g57797 = (1.0 + (sign( dotResult8_g57811 ) - -1.0) * (0.0 - 1.0) / (1.0 - -1.0));
				float3 lerpResult275_g57797 = lerp( temp_output_22_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front278_g57797 = lerpResult275_g57797;
				float3 lerpResult274_g57797 = lerp( float3( 0,0,0 ) , temp_output_22_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back278_g57797 = lerpResult274_g57797;
				float3 m_Both278_g57797 = temp_output_22_0_g57797;
				float3 localEmissiveCullfloat3switch278_g57797 = EmissiveCullfloat3switch( m_switch278_g57797 , m_Front278_g57797 , m_Back278_g57797 , m_Both278_g57797 );
				float temp_output_402_0_g57797 = ( _UVLight00Enable + ( ( _CATEGORY_UVLIGHTREVEAL00 + _SPACE_UVLIGHTREVEL00 ) * 0.0 ) );
				float3 lerpResult195_g57797 = lerp( temp_output_23_0_g57797 , ( temp_output_23_0_g57797 + localEmissiveCullfloat3switch278_g57797 ) , temp_output_402_0_g57797);
				float m_switch259_g57797 = _UVLight01EmissiveRenderFace;
				float3 temp_output_534_0_g57797 = (_UVLight01Color).rgb;
				float3 Color10_g57813 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57813 = GetMainLightColorNode10_g57813( Color10_g57813 );
				float3 lerpResult535_g57797 = lerp( temp_output_534_0_g57797 , ( temp_output_534_0_g57797 * Color10_g57813 ) , _UVLight01MainLightInfluence);
				float2 vertexToFrag70_g57806 = IN.ase_texcoord8.zw;
				float4 tex2DNode56_g57797 = SAMPLE_TEXTURE2D( _UVLight01Map, sampler_UVLight01Map, vertexToFrag70_g57806 );
				float3 normalizeResult49_g57797 = ASESafeNormalize( temp_output_477_0_g57797 );
				float3 temp_output_213_0_g57797 = (_UVLight01FilteredColor).rgb;
				float lerpResult422_g57797 = lerp( 1000.0 , 7800.0 , _UVLight01ThresholdTemp);
				float temp_output_449_0_g57797 = abs( lerpResult422_g57797 );
				float Temperature424_g57797 = temp_output_449_0_g57797;
				float3 localBlackbody424_g57797 = Blackbody424_g57797( Temperature424_g57797 );
				float3 UVLight01FilteredColor427_g57797 = ( temp_output_213_0_g57797 * localBlackbody424_g57797 );
				float3 normalizeResult48_g57797 = ASESafeNormalize( UVLight01FilteredColor427_g57797 );
				float dotResult46_g57797 = dot( normalizeResult49_g57797 , normalizeResult48_g57797 );
				float temp_output_42_0_g57797 =  ( dotResult46_g57797 - _UVLight01Threshold > 1.0 ? 0.0 : dotResult46_g57797 - _UVLight01Threshold <= 1.0 && dotResult46_g57797 + _UVLight01Threshold >= 1.0 ? 1.0 : 0.0 ) ;
				float3 temp_output_40_0_g57797 = ( ( lerpResult535_g57797 * (tex2DNode56_g57797).rgb * _UVLight01Brightness ) * ( temp_output_517_0_g57797 * temp_output_42_0_g57797 ) );
				float3 lerpResult266_g57797 = lerp( temp_output_40_0_g57797 , float3( 0,0,0 ) , temp_output_280_0_g57797);
				float3 m_Front259_g57797 = lerpResult266_g57797;
				float3 lerpResult258_g57797 = lerp( float3( 0,0,0 ) , temp_output_40_0_g57797 , temp_output_280_0_g57797);
				float3 m_Back259_g57797 = lerpResult258_g57797;
				float3 m_Both259_g57797 = temp_output_40_0_g57797;
				float3 localEmissiveCullfloat3switch259_g57797 = EmissiveCullfloat3switch( m_switch259_g57797 , m_Front259_g57797 , m_Back259_g57797 , m_Both259_g57797 );
				float temp_output_403_0_g57797 = ( _UVLight01Enable + ( ( _CATEGORY_UVLIGHTREVEAL01 + _SPACE_UVLIGHTREVEL01 ) * 0.0 ) );
				float3 lerpResult197_g57797 = lerp( lerpResult195_g57797 , ( lerpResult195_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float temp_output_492_0_g57797 = ( tex2DNode21_g57797.a * temp_output_13_0_g57797 );
				float Alpha311_g57797 = ( temp_output_492_0_g57797 + ( tex2DNode56_g57797.a * temp_output_42_0_g57797 ) );
				float3 lerpResult309_g57797 = lerp( temp_output_23_0_g57797 , lerpResult197_g57797 , Alpha311_g57797);
				float3 linearToGamma462_g57797 = FastLinearToSRGB( lerpResult309_g57797 );
				float3 temp_output_391_0 = linearToGamma462_g57797;
				
				float2 vertexToFrag70_g57823 = IN.ase_texcoord9.xy;
				float3 unpack790_g57814 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57823 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57814.z = lerp( 1, unpack790_g57814.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				
				float4 color221_g57797 = IsGammaSpace() ? float4(0.003921569,0,0,0) : float4(0.000303527,0,0,0);
				float3 temp_output_557_0_g57797 = (color221_g57797).rgb;
				float3 lerpResult293_g57797 = lerp( temp_output_557_0_g57797 , localEmissiveCullfloat3switch278_g57797 , temp_output_402_0_g57797);
				float3 lerpResult296_g57797 = lerp( lerpResult293_g57797 , ( lerpResult293_g57797 + localEmissiveCullfloat3switch259_g57797 ) , temp_output_403_0_g57797);
				float3 lerpResult505_g57797 = lerp( float3( 0,0,0 ) , lerpResult296_g57797 , Alpha311_g57797);
				float3 temp_output_913_0_g57814 = (float4(0,0,0,1)).rgb;
				float3 temp_output_220_0_g57797 = ( lerpResult505_g57797 + temp_output_913_0_g57814 );
				float3 linearToGamma289_g57797 = FastLinearToSRGB( temp_output_220_0_g57797 );
				
				float2 vertexToFrag70_g57815 = IN.ase_texcoord9.zw;
				float3 temp_output_1014_0_g57814 = (SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_SmoothnessMap, vertexToFrag70_g57815 )).rgb;
				float3 temp_output_1028_0_g57814 = ( 1.0 - temp_output_1014_0_g57814 );
				float3 temp_cast_2 = (0.089).xxx;
				float3 lerpResult992_g57814 = lerp( temp_output_1014_0_g57814 , max( ( temp_output_1028_0_g57814 * temp_output_1028_0_g57814 ) , temp_cast_2 ) , _SmoothnessSource);
				float3 temp_output_991_0_g57814 = ( lerpResult992_g57814 * _SmoothnessStrength );
				float2 appendResult1000_g57814 = (float2(WorldViewDirection.xy));
				float3 appendResult999_g57814 = (float3(appendResult1000_g57814 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV997_g57814 = dot( normalize( unpack790_g57814 ), appendResult999_g57814 );
				float fresnelNode997_g57814 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV997_g57814 , 0.0001 ), _SmoothnessFresnelPower ) );
				float3 temp_cast_5 = (fresnelNode997_g57814).xxx;
				float3 lerpResult996_g57814 = lerp( temp_output_991_0_g57814 , ( temp_output_991_0_g57814 - temp_cast_5 ) , ( _SmoothnessFresnelEnable + ( ( _CATEGORY_SMOOTHNESS + _SPACE_SMOOTHNESS ) * 0.0 ) ));
				
				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				
				float2 uv_RefractionTransmittanceColorMap = IN.ase_texcoord10.xy * _RefractionTransmittanceColorMap_ST.xy + _RefractionTransmittanceColorMap_ST.zw;
				

				float3 BaseColor = temp_output_391_0;
				float3 Normal = unpack790_g57814;
				float3 Emission = linearToGamma289_g57797;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = saturate( lerpResult996_g57814 ).x;
				float Occlusion = 1;
				float Alpha = temp_output_335_23;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = ( (SAMPLE_TEXTURE2D( _RefractionTransmittanceColorMap, sampler_RefractionTransmittanceColorMap, uv_RefractionTransmittanceColorMap )).rgb * (_RefractionTransmittanceColor).rgb );
				float RefractionIndex = ( 1.0 - ( _RefractionIndex + ( ( 0.0 + _CATEGORY_REFRACTION + _SPACE_REFRACTION ) * 0.0 ) ) );
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
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				

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

				v.normalOS = temp_output_335_978;

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

				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				surfaceDescription.Alpha = temp_output_335_23;
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
			#define _SPECULAR_SETUP 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_REFRACTION 1
			#define REQUIRE_OPAQUE_TEXTURE 1
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

			
   //          #if ASE_SRP_VERSION >=140009
			// #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			// #endif
		

			
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _UVLight01UVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _UVLight01FilteredColor;
			half4 _UVLight00Color;
			half4 _UVLight01Color;
			float4 _SmoothnessUVs;
			float4 _UVLight00UVs;
			float4 _NormalUVs;
			half4 _UVLight00FilteredColor;
			float _CATEGORY_NORMAL;
			int _Cull;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _GlassNormalStrength;
			float _SPACE_NORMAL;
			half _SmoothnessStrength;
			half _SmoothnessSource;
			half _GlassOpacity;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			half _SmoothnessRotation;
			float _SPACE_UVLIGHTREVEL01;
			float _UVLight01ThresholdTemp;
			half _UVLight01Enable;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			half _UVLight00EmissiveRenderFace;
			half _UVLight00MainLightInfluence;
			half _UVLight00Rotation;
			half _UVLight00Brightness;
			float _UVLight00ThresholdTemp;
			half _UVLight00Threshold;
			half _EmissionFlags;
			half _UVLight00Enable;
			float _CATEGORY_UVLIGHTREVEAL00;
			float _SPACE_UVLIGHTREVEL00;
			half _UVLight01EmissiveRenderFace;
			half _UVLight01MainLightInfluence;
			half _UVLight01Rotation;
			half _UVLight01Brightness;
			float _CATEGORY_REFRACTION;
			half _UVLight01Threshold;
			float _CATEGORY_UVLIGHTREVEAL01;
			float _SPACE_REFRACTION;
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
				float dotResult8_g57830 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57829 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57830 , -1.0 ));
				float3 temp_output_335_978 = lerpResult9_g57829;
				

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

				v.normalOS = temp_output_335_978;

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

				float temp_output_335_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				surfaceDescription.Alpha = temp_output_335_23;
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
Node;AmplifyShaderEditor.WireNode;389;426.4838,98.71433;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;391;192,-304;Inherit;False;DESF Module UV Reveal;70;;57797;7a0132550ec0e344c83f641c37934d75;5,353,1,360,1,358,1,445,1,444,1;2;23;FLOAT3;0,0,0;False;218;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;219
Node;AmplifyShaderEditor.FunctionNode;335;-128,-128;Inherit;False;DESF Core Glass;11;;57814;6c43c8c67906e76419cc83c84e9572d0;3,834,2,981,0,883,0;1;891;FLOAT3;0,0,0;False;10;FLOAT3;905;FLOAT3;22;FLOAT3;499;FLOAT3;806;FLOAT3;18;FLOAT;23;FLOAT;958;FLOAT3;978;SAMPLERSTATE;918;SAMPLERSTATE;919
Node;AmplifyShaderEditor.WireNode;390;384,-32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;301;512,-384;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;356;192,192;Inherit;False;DESF Refraction;1;;57839;c0f1594b60ea2514fac11f2154b648f1;0;0;5;FLOAT3;71;FLOAT;6;FLOAT3;7;FLOAT;51;FLOAT3;83
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;381;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;382;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;383;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;384;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;1;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;385;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;386;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;1;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;387;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;388;506.8168,-94.27784;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;380;512,-128;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/UV Reveal/Glass;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;1;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;0;638177023432504536;Surface;1;638177023454703059;  Refraction Model;1;638177027274384121;  Blend;2;638177023524889197;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;638177025953523113;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;1;638177023636812284;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;True;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;379;512,-524;Float;False;False;-1;2;DE_ShaderGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
WireConnection;389;0;335;978
WireConnection;391;23;335;905
WireConnection;391;218;335;499
WireConnection;390;0;335;23
WireConnection;380;0;391;0
WireConnection;380;1;335;22
WireConnection;380;2;391;219
WireConnection;380;4;335;18
WireConnection;380;6;335;23
WireConnection;380;12;356;7
WireConnection;380;13;356;6
WireConnection;380;10;335;978
WireConnection;379;0;391;0
WireConnection;379;1;390;0
WireConnection;379;4;389;0
ASEEND*/
//CHKSM=436930A65C7A17D8C160F565823E13F260727D33