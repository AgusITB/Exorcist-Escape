// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Rain/Glass"
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
		[DE_DrawerCategory(RAIN,true,_RainEnable,0,0)]_CATEGORY_RAIN("CATEGORY_RAIN", Float) = 1
		[DE_DrawerToggleLeft]_RainEnable("ENABLE RAIN", Float) = 0
		[DE_DrawerToggleLeft]_WetnessGlobalInfluenceEnable("ENABLE GLOBAL INFLUENCE ", Float) = 0
		[DE_DrawerToggleLeft][Space(10)]_RainHorizontalEnable("ENABLE RAIN HORIZONTAL", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_RainHorizontalRainMap("Rain Map Horizontal", 2D) = "bump" {}
		[DE_DrawerTilingOffset]_RainHorizontalUVs("RainHorizontal UVs", Vector) = (1,1,0,0)
		_RainHorizontalColumns("Columns", Float) = 8
		_RainHorizontalRows("Rows", Float) = 8
		_RainHorizontalIntensity("Intensity", Range( 0 , 10)) = 9
		_RainHorizontalSpeed("Speed", Range( 0 , 50)) = 15
		[DE_DrawerToggleLeft][Space(10)]_RainVerticalEnable("ENABLE RAIN VERTICAL", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_RainVerticalRainMap("Rain Map Vertical", 2D) = "bump" {}
		[DE_DrawerTilingOffset]_RainVerticalUVs("RainVertical UVs", Vector) = (9,9,0,0)
		_RainVerticalColumns("Columns", Float) = 5
		_RainVerticalRows("Rows", Float) = 5
		_RainVerticalIntensity("Intensity", Range( 0 , 10)) = 6
		_RainVerticalSmoothEdge("Smooth Edge", Range( -0.1 , 0.1)) = 0
		_RainVerticalSpeed("Speed", Range( 0 , 50)) = 22
		[DE_DrawerToggleLeft][Space(10)]_RainStaticEnable("ENABLE RAIN STATIC", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_RainStaticRainMap("Rain Map Static", 2D) = "bump" {}
		[DE_DrawerTilingOffset]_RainStaticUVs("RainStatic UVs", Vector) = (1,1,0,0)
		_RainStaticIntensity("Intensity", Range( 0 , 10)) = 9
		[DE_DrawerToggleLeft][Space(10)]_WetnessEnable("ENABLE WETNESS", Float) = 0
		_Wetness("Wetness", Float) = 1
		_WetnessMask("Wetness Mask", Float) = 0.75
		[DE_DrawerSpace(10)]_SPACE_RAIN("SPACE_RAIN", Float) = 0
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
			#define _ALPHATEST_ON 1
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
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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

			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;


			
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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
				float3 staticSwitch908_g57973 = temp_cast_0;
				#else
				float3 staticSwitch908_g57973 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_746_0_g57962 = staticSwitch908_g57973;
				float3 temp_output_2101_0_g57962 = ( saturate( temp_output_746_0_g57962 ) * 0.2 );
				float lerpResult2117_g57962 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult2115_g57962 = lerp( _Wetness , lerpResult2117_g57962 , _WetnessGlobalInfluenceEnable);
				float temp_output_2122_0_g57962 = saturate( _WetnessMask );
				float3 lerpResult2096_g57962 = lerp( temp_output_746_0_g57962 , temp_output_2101_0_g57962 , saturate( ( saturate( max( 0.0 , lerpResult2115_g57962 ) ) * temp_output_2122_0_g57962 ) ));
				float3 lerpResult2095_g57962 = lerp( temp_output_746_0_g57962 , lerpResult2096_g57962 , _WetnessEnable);
				float3 temp_output_57_747 = lerpResult2095_g57962;
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 Color = temp_output_57_747;
				float Alpha = temp_output_67_23;
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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

			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;
			TEXTURE2D(_GlassNormalMap);
			SAMPLER(sampler_GlassNormalMap);
			TEXTURE2D(_RainVerticalRainMap);
			SAMPLER(sampler_RainVerticalRainMap);
			half _Global_Rain_Intensity;
			int _Global_Rain_Enabled;
			TEXTURE2D(_RainHorizontalRainMap);
			SAMPLER(sampler_RainHorizontalRainMap);
			TEXTURE2D(_RainStaticRainMap);
			SAMPLER(sampler_RainStaticRainMap);
			TEXTURE2D(_SmoothnessMap);
			SAMPLER(sampler_SmoothnessMap);
			TEXTURE2D(_RefractionTransmittanceColorMap);
			SAMPLER(sampler_RefractionTransmittanceColorMap);


			float SpecularModefloatswitch112_g57992( float m_switch, float m_Default, float m_Dielectric, float m_DielectricIOR )
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				
				float2 Offset235_g57982 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57982 = ( ( v.texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57982 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57982 = ( temp_output_41_0_g57982 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g57982;
				float2 break1032_g57970 = ( ( v.texcoord.xy * (_RainVerticalUVs).xy ) + (_RainVerticalUVs).zw );
				float2 appendResult1035_g57970 = (float2(frac( break1032_g57970.x ) , frac( break1032_g57970.y )));
				float temp_output_980_0_g57970 = _RainVerticalColumns;
				float temp_output_994_0_g57970 = _RainVerticalRows;
				float2 appendResult978_g57970 = (float2(temp_output_980_0_g57970 , temp_output_994_0_g57970));
				float temp_output_968_0_g57970 = ( temp_output_980_0_g57970 * temp_output_994_0_g57970 );
				float2 appendResult971_g57970 = (float2(temp_output_968_0_g57970 , temp_output_994_0_g57970));
				float Columns1028_g57970 = temp_output_980_0_g57970;
				float Rows1027_g57970 = temp_output_994_0_g57970;
				float temp_output_1023_0_g57970 = ( fmod( _TimeParameters.x , ( Columns1028_g57970 * Rows1027_g57970 ) ) * _RainVerticalSpeed );
				float clampResult1019_g57970 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57970 - 1.0 ) );
				float temp_output_1043_0_g57970 = frac( ( ( temp_output_1023_0_g57970 + ( clampResult1019_g57970 + 1E-05 ) ) / temp_output_968_0_g57970 ) );
				float2 appendResult969_g57970 = (float2(temp_output_1043_0_g57970 , ( 1.0 - temp_output_1043_0_g57970 )));
				float2 temp_output_1000_0_g57970 = ( ( appendResult1035_g57970 / appendResult978_g57970 ) + ( floor( ( appendResult971_g57970 * appendResult969_g57970 ) ) / appendResult978_g57970 ) );
				float2 vertexToFrag1724_g57962 = temp_output_1000_0_g57970;
				o.ase_texcoord8.zw = vertexToFrag1724_g57962;
				float2 break1032_g57971 = ( ( v.texcoord.xy * (_RainHorizontalUVs).xy ) + (_RainHorizontalUVs).zw );
				float2 appendResult1035_g57971 = (float2(frac( break1032_g57971.x ) , frac( break1032_g57971.y )));
				float temp_output_980_0_g57971 = _RainHorizontalColumns;
				float temp_output_994_0_g57971 = _RainHorizontalRows;
				float2 appendResult978_g57971 = (float2(temp_output_980_0_g57971 , temp_output_994_0_g57971));
				float temp_output_968_0_g57971 = ( temp_output_980_0_g57971 * temp_output_994_0_g57971 );
				float2 appendResult971_g57971 = (float2(temp_output_968_0_g57971 , temp_output_994_0_g57971));
				float Columns1028_g57971 = temp_output_980_0_g57971;
				float Rows1027_g57971 = temp_output_994_0_g57971;
				float temp_output_1023_0_g57971 = ( fmod( _TimeParameters.x , ( Columns1028_g57971 * Rows1027_g57971 ) ) * _RainHorizontalSpeed );
				float clampResult1019_g57971 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57971 - 1.0 ) );
				float temp_output_1043_0_g57971 = frac( ( ( temp_output_1023_0_g57971 + ( clampResult1019_g57971 + 1E-05 ) ) / temp_output_968_0_g57971 ) );
				float2 appendResult969_g57971 = (float2(temp_output_1043_0_g57971 , ( 1.0 - temp_output_1043_0_g57971 )));
				float2 temp_output_1000_0_g57971 = ( ( appendResult1035_g57971 / appendResult978_g57971 ) + ( floor( ( appendResult971_g57971 * appendResult969_g57971 ) ) / appendResult978_g57971 ) );
				float2 vertexToFrag1727_g57962 = temp_output_1000_0_g57971;
				o.ase_texcoord9.xy = vertexToFrag1727_g57962;
				float2 vertexToFrag2257_g57962 = ( ( v.texcoord.xy * (_RainStaticUVs).xy ) + (_RainStaticUVs).zw );
				o.ase_texcoord9.zw = vertexToFrag2257_g57962;
				
				float temp_output_6_0_g57974 = _SmoothnessRotation;
				float temp_output_200_0_g57974 = radians( temp_output_6_0_g57974 );
				float temp_output_13_0_g57974 = cos( temp_output_200_0_g57974 );
				float2 temp_output_9_0_g57974 = float2( 0.5,0.5 );
				float2 break39_g57974 = ( v.texcoord.xy - temp_output_9_0_g57974 );
				float temp_output_14_0_g57974 = sin( temp_output_200_0_g57974 );
				float2 appendResult36_g57974 = (float2(( ( temp_output_13_0_g57974 * break39_g57974.x ) + ( temp_output_14_0_g57974 * break39_g57974.y ) ) , ( ( temp_output_13_0_g57974 * break39_g57974.y ) - ( temp_output_14_0_g57974 * break39_g57974.x ) )));
				float2 Offset235_g57974 = (_SmoothnessUVs).zw;
				float2 temp_output_41_0_g57974 = ( ( ( appendResult36_g57974 * ( (_SmoothnessUVs).xy / 1.0 ) ) + temp_output_9_0_g57974 ) + Offset235_g57974 );
				float2 vertexToFrag70_g57974 = ( temp_output_41_0_g57974 - ( ( ( (_SmoothnessUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.xy = vertexToFrag70_g57974;
				
				o.ase_texcoord10.zw = v.texcoord.xy;

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
				v.normalOS = temp_output_67_978;
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
				float3 staticSwitch908_g57973 = temp_cast_0;
				#else
				float3 staticSwitch908_g57973 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_746_0_g57962 = staticSwitch908_g57973;
				float3 temp_output_2101_0_g57962 = ( saturate( temp_output_746_0_g57962 ) * 0.2 );
				float lerpResult2117_g57962 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult2115_g57962 = lerp( _Wetness , lerpResult2117_g57962 , _WetnessGlobalInfluenceEnable);
				float temp_output_2122_0_g57962 = saturate( _WetnessMask );
				float3 lerpResult2096_g57962 = lerp( temp_output_746_0_g57962 , temp_output_2101_0_g57962 , saturate( ( saturate( max( 0.0 , lerpResult2115_g57962 ) ) * temp_output_2122_0_g57962 ) ));
				float3 lerpResult2095_g57962 = lerp( temp_output_746_0_g57962 , lerpResult2096_g57962 , _WetnessEnable);
				float3 temp_output_57_747 = lerpResult2095_g57962;
				
				float2 vertexToFrag70_g57982 = IN.ase_texcoord8.xy;
				float3 unpack790_g57973 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57982 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57973.z = lerp( 1, unpack790_g57973.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				float3 temp_output_19_0_g57962 = unpack790_g57973;
				float3 _Vector0 = float3(0,0,1);
				float3 MaskVector1485_g57962 = float3(0.001,0.001,0.001);
				float2 vertexToFrag1724_g57962 = IN.ase_texcoord8.zw;
				float lerpResult1584_g57962 = lerp( _RainVerticalIntensity , ( _RainVerticalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityVertical861_g57962 = saturate( lerpResult1584_g57962 );
				float3 unpack1651_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainVerticalRainMap, sampler_RainVerticalRainMap, vertexToFrag1724_g57962 ), IntensityVertical861_g57962 );
				unpack1651_g57962.z = lerp( 1, unpack1651_g57962.z, saturate(IntensityVertical861_g57962) );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break149_g57963 = ( abs( WorldNormal ) - temp_cast_4 );
				float smoothstepResult1521_g57963 = smoothstep( _RainVerticalSmoothEdge , 1.0 , ( break149_g57963.z + 0.5 ));
				float RainMaskVerticalZ1241_g57962 = smoothstepResult1521_g57963;
				float3 lerpResult1138_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalZ1241_g57962);
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g57963 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g57963.x + 0.45 ));
				float RainMaskVerticalX151_g57962 = smoothstepResult1523_g57963;
				float3 lerpResult1261_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalX151_g57962);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g57963 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g57963.y + 0.45 ));
				float RainMaskVerticalY1216_g57962 = smoothstepResult1519_g57963;
				float3 lerpResult1390_g57962 = lerp( lerpResult1138_g57962 , BlendNormal( lerpResult1138_g57962 , lerpResult1261_g57962 ) , RainMaskVerticalY1216_g57962);
				float3 RAIN_VERTICAL127_g57962 = lerpResult1390_g57962;
				float3 lerpResult1543_g57962 = lerp( _Vector0 , RAIN_VERTICAL127_g57962 , _RainVerticalEnable);
				float2 vertexToFrag1727_g57962 = IN.ase_texcoord9.xy;
				float lerpResult1583_g57962 = lerp( _RainHorizontalIntensity , ( _RainHorizontalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityHorizontal814_g57962 = saturate( lerpResult1583_g57962 );
				float3 unpack1661_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainHorizontalRainMap, sampler_RainHorizontalRainMap, vertexToFrag1727_g57962 ), IntensityHorizontal814_g57962 );
				unpack1661_g57962.z = lerp( 1, unpack1661_g57962.z, saturate(IntensityHorizontal814_g57962) );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g57963 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float RainMaskHorizontal152_g57962 = smoothstepResult1517_g57963;
				float3 lerpResult279_g57962 = lerp( MaskVector1485_g57962 , unpack1661_g57962 , RainMaskHorizontal152_g57962);
				float3 RAIN_HORIZONTAL123_g57962 = lerpResult279_g57962;
				float3 lerpResult1544_g57962 = lerp( _Vector0 , RAIN_HORIZONTAL123_g57962 , _RainHorizontalEnable);
				float2 vertexToFrag2257_g57962 = IN.ase_texcoord9.zw;
				float lerpResult1585_g57962 = lerp( _RainStaticIntensity , ( _RainStaticIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityStatic991_g57962 = saturate( lerpResult1585_g57962 );
				float3 unpack1648_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainStaticRainMap, sampler_RainStaticRainMap, vertexToFrag2257_g57962 ), IntensityStatic991_g57962 );
				unpack1648_g57962.z = lerp( 1, unpack1648_g57962.z, saturate(IntensityStatic991_g57962) );
				float3 RAIN_STATIC743_g57962 = unpack1648_g57962;
				float3 lerpResult1545_g57962 = lerp( _Vector0 , RAIN_STATIC743_g57962 , _RainStaticEnable);
				float3 temp_output_2291_0_g57962 = ( ( ( temp_output_19_0_g57962 + lerpResult1543_g57962 ) + lerpResult1544_g57962 ) + lerpResult1545_g57962 );
				float temp_output_1635_0_g57962 = ( _RainEnable + ( ( _CATEGORY_RAIN + _SPACE_RAIN ) * 0.0 ) );
				float3 lerpResult1579_g57962 = lerp( temp_output_19_0_g57962 , temp_output_2291_0_g57962 , temp_output_1635_0_g57962);
				
				float3 temp_output_913_0_g57973 = (float4(0,0,0,1)).rgb;
				
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float m_switch112_g57992 = _SpecularMode;
				float3 temp_output_143_0_g57993 = _MainLightPosition.xyz;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal153_g57992 = unpack790_g57973;
				float3 worldNormal153_g57992 = float3(dot(tanToWorld0,tanNormal153_g57992), dot(tanToWorld1,tanNormal153_g57992), dot(tanToWorld2,tanNormal153_g57992));
				float3 temp_output_144_0_g57993 = worldNormal153_g57992;
				float dotResult137_g57993 = dot( temp_output_143_0_g57993 , temp_output_144_0_g57993 );
				float dotResult201_g57992 = dot( ( temp_output_143_0_g57993 - ( ( dotResult137_g57993 * 2.0 ) * temp_output_144_0_g57993 ) ) , -WorldViewDirection );
				float temp_output_215_0_g57992 = max( saturate( dotResult201_g57992 ) , 0.0 );
				float temp_output_54_0_g57992 = (temp_output_215_0_g57992*_SpecularWrapScale + _SpecularWrapOffset);
				float saferPower63_g57992 = abs( temp_output_54_0_g57992 );
				float temp_output_63_0_g57992 = pow( saferPower63_g57992 , _SpecularPower );
				float m_Default112_g57992 = ( temp_output_63_0_g57992 * _SpecularStrength );
				float temp_output_222_0_g57992 = ( temp_output_63_0_g57992 * 15.0 );
				float lerpResult102_g57992 = lerp( 0.034 , 0.048 , _SpecularStrengthDielectric);
				float m_Dielectric112_g57992 = ( temp_output_222_0_g57992 * lerpResult102_g57992 );
				float m_DielectricIOR112_g57992 = ( temp_output_222_0_g57992 * ( pow( ( _SpecularStrengthDielectricIOR - 1.0 ) , 2.0 ) / pow( ( _SpecularStrengthDielectricIOR + 1.0 ) , 2.0 ) ) );
				float localSpecularModefloatswitch112_g57992 = SpecularModefloatswitch112_g57992( m_switch112_g57992 , m_Default112_g57992 , m_Dielectric112_g57992 , m_DielectricIOR112_g57992 );
				float3 lerpResult80_g57992 = lerp( float3(0,0,0) , saturate( ( ( (_SpecularColor).rgb * ( ase_lightColor.rgb * max( ase_lightColor.a , 0.0 ) ) ) * localSpecularModefloatswitch112_g57992 ) ) , ( _SpecularEnable + ( ( _CATEGORY_SPECULAR + _SPACE_SPECULAR ) * 0.0 ) ));
				
				float2 vertexToFrag70_g57974 = IN.ase_texcoord10.xy;
				float3 temp_output_1014_0_g57973 = (SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_SmoothnessMap, vertexToFrag70_g57974 )).rgb;
				float3 temp_output_1028_0_g57973 = ( 1.0 - temp_output_1014_0_g57973 );
				float3 temp_cast_11 = (0.089).xxx;
				float3 lerpResult992_g57973 = lerp( temp_output_1014_0_g57973 , max( ( temp_output_1028_0_g57973 * temp_output_1028_0_g57973 ) , temp_cast_11 ) , _SmoothnessSource);
				float3 temp_output_991_0_g57973 = ( lerpResult992_g57973 * _SmoothnessStrength );
				float2 appendResult1000_g57973 = (float2(WorldViewDirection.xy));
				float3 appendResult999_g57973 = (float3(appendResult1000_g57973 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV997_g57973 = dot( normalize( unpack790_g57973 ), appendResult999_g57973 );
				float fresnelNode997_g57973 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV997_g57973 , 0.0001 ), _SmoothnessFresnelPower ) );
				float3 temp_cast_14 = (fresnelNode997_g57973).xxx;
				float3 lerpResult996_g57973 = lerp( temp_output_991_0_g57973 , ( temp_output_991_0_g57973 - temp_cast_14 ) , ( _SmoothnessFresnelEnable + ( ( _CATEGORY_SMOOTHNESS + _SPACE_SMOOTHNESS ) * 0.0 ) ));
				float temp_output_2142_0_g57962 = saturate( lerpResult996_g57973 ).x;
				float lerpResult2110_g57962 = lerp( temp_output_2142_0_g57962 , 0.9 , temp_output_2122_0_g57962);
				float lerpResult2109_g57962 = lerp( temp_output_2142_0_g57962 , lerpResult2110_g57962 , _WetnessEnable);
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				
				float2 uv_RefractionTransmittanceColorMap = IN.ase_texcoord10.zw * _RefractionTransmittanceColorMap_ST.xy + _RefractionTransmittanceColorMap_ST.zw;
				

				float3 BaseColor = temp_output_57_747;
				float3 Normal = lerpResult1579_g57962;
				float3 Emission = temp_output_913_0_g57973;
				float3 Specular = lerpResult80_g57992;
				float Metallic = 0;
				float Smoothness = lerpResult2109_g57962;
				float Occlusion = 1;
				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;
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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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

				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;
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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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

				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;

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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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

			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;


			
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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
				float3 staticSwitch908_g57973 = temp_cast_0;
				#else
				float3 staticSwitch908_g57973 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_746_0_g57962 = staticSwitch908_g57973;
				float3 temp_output_2101_0_g57962 = ( saturate( temp_output_746_0_g57962 ) * 0.2 );
				float lerpResult2117_g57962 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult2115_g57962 = lerp( _Wetness , lerpResult2117_g57962 , _WetnessGlobalInfluenceEnable);
				float temp_output_2122_0_g57962 = saturate( _WetnessMask );
				float3 lerpResult2096_g57962 = lerp( temp_output_746_0_g57962 , temp_output_2101_0_g57962 , saturate( ( saturate( max( 0.0 , lerpResult2115_g57962 ) ) * temp_output_2122_0_g57962 ) ));
				float3 lerpResult2095_g57962 = lerp( temp_output_746_0_g57962 , lerpResult2096_g57962 , _WetnessEnable);
				float3 temp_output_57_747 = lerpResult2095_g57962;
				
				float3 temp_output_913_0_g57973 = (float4(0,0,0,1)).rgb;
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 BaseColor = temp_output_57_747;
				float3 Emission = temp_output_913_0_g57973;
				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;

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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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

			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;


			
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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

				float3 temp_cast_0 = (0.0).xxx;
				#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch908_g57973 = temp_cast_0;
				#else
				float3 staticSwitch908_g57973 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_746_0_g57962 = staticSwitch908_g57973;
				float3 temp_output_2101_0_g57962 = ( saturate( temp_output_746_0_g57962 ) * 0.2 );
				float lerpResult2117_g57962 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult2115_g57962 = lerp( _Wetness , lerpResult2117_g57962 , _WetnessGlobalInfluenceEnable);
				float temp_output_2122_0_g57962 = saturate( _WetnessMask );
				float3 lerpResult2096_g57962 = lerp( temp_output_746_0_g57962 , temp_output_2101_0_g57962 , saturate( ( saturate( max( 0.0 , lerpResult2115_g57962 ) ) * temp_output_2122_0_g57962 ) ));
				float3 lerpResult2095_g57962 = lerp( temp_output_746_0_g57962 , lerpResult2096_g57962 , _WetnessEnable);
				float3 temp_output_57_747 = lerpResult2095_g57962;
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 BaseColor = temp_output_57_747;
				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;

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

			#define ASE_NEEDS_VERT_NORMAL
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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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
			TEXTURE2D(_RainVerticalRainMap);
			SAMPLER(sampler_RainVerticalRainMap);
			half _Global_Rain_Intensity;
			int _Global_Rain_Enabled;
			TEXTURE2D(_RainHorizontalRainMap);
			SAMPLER(sampler_RainHorizontalRainMap);
			TEXTURE2D(_RainStaticRainMap);
			SAMPLER(sampler_RainStaticRainMap);


			
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				
				float2 Offset235_g57982 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57982 = ( ( v.ase_texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57982 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57982 = ( temp_output_41_0_g57982 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord5.xy = vertexToFrag70_g57982;
				float2 break1032_g57970 = ( ( v.ase_texcoord.xy * (_RainVerticalUVs).xy ) + (_RainVerticalUVs).zw );
				float2 appendResult1035_g57970 = (float2(frac( break1032_g57970.x ) , frac( break1032_g57970.y )));
				float temp_output_980_0_g57970 = _RainVerticalColumns;
				float temp_output_994_0_g57970 = _RainVerticalRows;
				float2 appendResult978_g57970 = (float2(temp_output_980_0_g57970 , temp_output_994_0_g57970));
				float temp_output_968_0_g57970 = ( temp_output_980_0_g57970 * temp_output_994_0_g57970 );
				float2 appendResult971_g57970 = (float2(temp_output_968_0_g57970 , temp_output_994_0_g57970));
				float Columns1028_g57970 = temp_output_980_0_g57970;
				float Rows1027_g57970 = temp_output_994_0_g57970;
				float temp_output_1023_0_g57970 = ( fmod( _TimeParameters.x , ( Columns1028_g57970 * Rows1027_g57970 ) ) * _RainVerticalSpeed );
				float clampResult1019_g57970 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57970 - 1.0 ) );
				float temp_output_1043_0_g57970 = frac( ( ( temp_output_1023_0_g57970 + ( clampResult1019_g57970 + 1E-05 ) ) / temp_output_968_0_g57970 ) );
				float2 appendResult969_g57970 = (float2(temp_output_1043_0_g57970 , ( 1.0 - temp_output_1043_0_g57970 )));
				float2 temp_output_1000_0_g57970 = ( ( appendResult1035_g57970 / appendResult978_g57970 ) + ( floor( ( appendResult971_g57970 * appendResult969_g57970 ) ) / appendResult978_g57970 ) );
				float2 vertexToFrag1724_g57962 = temp_output_1000_0_g57970;
				o.ase_texcoord5.zw = vertexToFrag1724_g57962;
				float2 break1032_g57971 = ( ( v.ase_texcoord.xy * (_RainHorizontalUVs).xy ) + (_RainHorizontalUVs).zw );
				float2 appendResult1035_g57971 = (float2(frac( break1032_g57971.x ) , frac( break1032_g57971.y )));
				float temp_output_980_0_g57971 = _RainHorizontalColumns;
				float temp_output_994_0_g57971 = _RainHorizontalRows;
				float2 appendResult978_g57971 = (float2(temp_output_980_0_g57971 , temp_output_994_0_g57971));
				float temp_output_968_0_g57971 = ( temp_output_980_0_g57971 * temp_output_994_0_g57971 );
				float2 appendResult971_g57971 = (float2(temp_output_968_0_g57971 , temp_output_994_0_g57971));
				float Columns1028_g57971 = temp_output_980_0_g57971;
				float Rows1027_g57971 = temp_output_994_0_g57971;
				float temp_output_1023_0_g57971 = ( fmod( _TimeParameters.x , ( Columns1028_g57971 * Rows1027_g57971 ) ) * _RainHorizontalSpeed );
				float clampResult1019_g57971 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57971 - 1.0 ) );
				float temp_output_1043_0_g57971 = frac( ( ( temp_output_1023_0_g57971 + ( clampResult1019_g57971 + 1E-05 ) ) / temp_output_968_0_g57971 ) );
				float2 appendResult969_g57971 = (float2(temp_output_1043_0_g57971 , ( 1.0 - temp_output_1043_0_g57971 )));
				float2 temp_output_1000_0_g57971 = ( ( appendResult1035_g57971 / appendResult978_g57971 ) + ( floor( ( appendResult971_g57971 * appendResult969_g57971 ) ) / appendResult978_g57971 ) );
				float2 vertexToFrag1727_g57962 = temp_output_1000_0_g57971;
				o.ase_texcoord6.xy = vertexToFrag1727_g57962;
				float2 vertexToFrag2257_g57962 = ( ( v.ase_texcoord.xy * (_RainStaticUVs).xy ) + (_RainStaticUVs).zw );
				o.ase_texcoord6.zw = vertexToFrag2257_g57962;
				
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

				v.normalOS = temp_output_67_978;
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

				float2 vertexToFrag70_g57982 = IN.ase_texcoord5.xy;
				float3 unpack790_g57973 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57982 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57973.z = lerp( 1, unpack790_g57973.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				float3 temp_output_19_0_g57962 = unpack790_g57973;
				float3 _Vector0 = float3(0,0,1);
				float3 MaskVector1485_g57962 = float3(0.001,0.001,0.001);
				float2 vertexToFrag1724_g57962 = IN.ase_texcoord5.zw;
				float lerpResult1584_g57962 = lerp( _RainVerticalIntensity , ( _RainVerticalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityVertical861_g57962 = saturate( lerpResult1584_g57962 );
				float3 unpack1651_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainVerticalRainMap, sampler_RainVerticalRainMap, vertexToFrag1724_g57962 ), IntensityVertical861_g57962 );
				unpack1651_g57962.z = lerp( 1, unpack1651_g57962.z, saturate(IntensityVertical861_g57962) );
				float3 temp_cast_3 = (0.5).xxx;
				float3 break149_g57963 = ( abs( WorldNormal ) - temp_cast_3 );
				float smoothstepResult1521_g57963 = smoothstep( _RainVerticalSmoothEdge , 1.0 , ( break149_g57963.z + 0.5 ));
				float RainMaskVerticalZ1241_g57962 = smoothstepResult1521_g57963;
				float3 lerpResult1138_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalZ1241_g57962);
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g57963 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g57963.x + 0.45 ));
				float RainMaskVerticalX151_g57962 = smoothstepResult1523_g57963;
				float3 lerpResult1261_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalX151_g57962);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g57963 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g57963.y + 0.45 ));
				float RainMaskVerticalY1216_g57962 = smoothstepResult1519_g57963;
				float3 lerpResult1390_g57962 = lerp( lerpResult1138_g57962 , BlendNormal( lerpResult1138_g57962 , lerpResult1261_g57962 ) , RainMaskVerticalY1216_g57962);
				float3 RAIN_VERTICAL127_g57962 = lerpResult1390_g57962;
				float3 lerpResult1543_g57962 = lerp( _Vector0 , RAIN_VERTICAL127_g57962 , _RainVerticalEnable);
				float2 vertexToFrag1727_g57962 = IN.ase_texcoord6.xy;
				float lerpResult1583_g57962 = lerp( _RainHorizontalIntensity , ( _RainHorizontalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityHorizontal814_g57962 = saturate( lerpResult1583_g57962 );
				float3 unpack1661_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainHorizontalRainMap, sampler_RainHorizontalRainMap, vertexToFrag1727_g57962 ), IntensityHorizontal814_g57962 );
				unpack1661_g57962.z = lerp( 1, unpack1661_g57962.z, saturate(IntensityHorizontal814_g57962) );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g57963 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float RainMaskHorizontal152_g57962 = smoothstepResult1517_g57963;
				float3 lerpResult279_g57962 = lerp( MaskVector1485_g57962 , unpack1661_g57962 , RainMaskHorizontal152_g57962);
				float3 RAIN_HORIZONTAL123_g57962 = lerpResult279_g57962;
				float3 lerpResult1544_g57962 = lerp( _Vector0 , RAIN_HORIZONTAL123_g57962 , _RainHorizontalEnable);
				float2 vertexToFrag2257_g57962 = IN.ase_texcoord6.zw;
				float lerpResult1585_g57962 = lerp( _RainStaticIntensity , ( _RainStaticIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityStatic991_g57962 = saturate( lerpResult1585_g57962 );
				float3 unpack1648_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainStaticRainMap, sampler_RainStaticRainMap, vertexToFrag2257_g57962 ), IntensityStatic991_g57962 );
				unpack1648_g57962.z = lerp( 1, unpack1648_g57962.z, saturate(IntensityStatic991_g57962) );
				float3 RAIN_STATIC743_g57962 = unpack1648_g57962;
				float3 lerpResult1545_g57962 = lerp( _Vector0 , RAIN_STATIC743_g57962 , _RainStaticEnable);
				float3 temp_output_2291_0_g57962 = ( ( ( temp_output_19_0_g57962 + lerpResult1543_g57962 ) + lerpResult1544_g57962 ) + lerpResult1545_g57962 );
				float temp_output_1635_0_g57962 = ( _RainEnable + ( ( _CATEGORY_RAIN + _SPACE_RAIN ) * 0.0 ) );
				float3 lerpResult1579_g57962 = lerp( temp_output_19_0_g57962 , temp_output_2291_0_g57962 , temp_output_1635_0_g57962);
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				float3 Normal = lerpResult1579_g57962;
				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;

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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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

			float _GlobalWetnessEnabled;
			half _GlobalWetnessIntensity;
			TEXTURE2D(_GlassNormalMap);
			SAMPLER(sampler_GlassNormalMap);
			TEXTURE2D(_RainVerticalRainMap);
			SAMPLER(sampler_RainVerticalRainMap);
			half _Global_Rain_Intensity;
			int _Global_Rain_Enabled;
			TEXTURE2D(_RainHorizontalRainMap);
			SAMPLER(sampler_RainHorizontalRainMap);
			TEXTURE2D(_RainStaticRainMap);
			SAMPLER(sampler_RainStaticRainMap);
			TEXTURE2D(_SmoothnessMap);
			SAMPLER(sampler_SmoothnessMap);
			TEXTURE2D(_RefractionTransmittanceColorMap);
			SAMPLER(sampler_RefractionTransmittanceColorMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float SpecularModefloatswitch112_g57992( float m_switch, float m_Default, float m_Dielectric, float m_DielectricIOR )
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				
				float2 Offset235_g57982 = (_NormalUVs).zw;
				float2 temp_output_41_0_g57982 = ( ( v.texcoord.xy * ( (_NormalUVs).xy / 1.0 ) ) + Offset235_g57982 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 vertexToFrag70_g57982 = ( temp_output_41_0_g57982 - ( ( ( (_NormalUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord8.xy = vertexToFrag70_g57982;
				float2 break1032_g57970 = ( ( v.texcoord.xy * (_RainVerticalUVs).xy ) + (_RainVerticalUVs).zw );
				float2 appendResult1035_g57970 = (float2(frac( break1032_g57970.x ) , frac( break1032_g57970.y )));
				float temp_output_980_0_g57970 = _RainVerticalColumns;
				float temp_output_994_0_g57970 = _RainVerticalRows;
				float2 appendResult978_g57970 = (float2(temp_output_980_0_g57970 , temp_output_994_0_g57970));
				float temp_output_968_0_g57970 = ( temp_output_980_0_g57970 * temp_output_994_0_g57970 );
				float2 appendResult971_g57970 = (float2(temp_output_968_0_g57970 , temp_output_994_0_g57970));
				float Columns1028_g57970 = temp_output_980_0_g57970;
				float Rows1027_g57970 = temp_output_994_0_g57970;
				float temp_output_1023_0_g57970 = ( fmod( _TimeParameters.x , ( Columns1028_g57970 * Rows1027_g57970 ) ) * _RainVerticalSpeed );
				float clampResult1019_g57970 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57970 - 1.0 ) );
				float temp_output_1043_0_g57970 = frac( ( ( temp_output_1023_0_g57970 + ( clampResult1019_g57970 + 1E-05 ) ) / temp_output_968_0_g57970 ) );
				float2 appendResult969_g57970 = (float2(temp_output_1043_0_g57970 , ( 1.0 - temp_output_1043_0_g57970 )));
				float2 temp_output_1000_0_g57970 = ( ( appendResult1035_g57970 / appendResult978_g57970 ) + ( floor( ( appendResult971_g57970 * appendResult969_g57970 ) ) / appendResult978_g57970 ) );
				float2 vertexToFrag1724_g57962 = temp_output_1000_0_g57970;
				o.ase_texcoord8.zw = vertexToFrag1724_g57962;
				float2 break1032_g57971 = ( ( v.texcoord.xy * (_RainHorizontalUVs).xy ) + (_RainHorizontalUVs).zw );
				float2 appendResult1035_g57971 = (float2(frac( break1032_g57971.x ) , frac( break1032_g57971.y )));
				float temp_output_980_0_g57971 = _RainHorizontalColumns;
				float temp_output_994_0_g57971 = _RainHorizontalRows;
				float2 appendResult978_g57971 = (float2(temp_output_980_0_g57971 , temp_output_994_0_g57971));
				float temp_output_968_0_g57971 = ( temp_output_980_0_g57971 * temp_output_994_0_g57971 );
				float2 appendResult971_g57971 = (float2(temp_output_968_0_g57971 , temp_output_994_0_g57971));
				float Columns1028_g57971 = temp_output_980_0_g57971;
				float Rows1027_g57971 = temp_output_994_0_g57971;
				float temp_output_1023_0_g57971 = ( fmod( _TimeParameters.x , ( Columns1028_g57971 * Rows1027_g57971 ) ) * _RainHorizontalSpeed );
				float clampResult1019_g57971 = clamp( 0.0 , 1E-05 , ( temp_output_968_0_g57971 - 1.0 ) );
				float temp_output_1043_0_g57971 = frac( ( ( temp_output_1023_0_g57971 + ( clampResult1019_g57971 + 1E-05 ) ) / temp_output_968_0_g57971 ) );
				float2 appendResult969_g57971 = (float2(temp_output_1043_0_g57971 , ( 1.0 - temp_output_1043_0_g57971 )));
				float2 temp_output_1000_0_g57971 = ( ( appendResult1035_g57971 / appendResult978_g57971 ) + ( floor( ( appendResult971_g57971 * appendResult969_g57971 ) ) / appendResult978_g57971 ) );
				float2 vertexToFrag1727_g57962 = temp_output_1000_0_g57971;
				o.ase_texcoord9.xy = vertexToFrag1727_g57962;
				float2 vertexToFrag2257_g57962 = ( ( v.texcoord.xy * (_RainStaticUVs).xy ) + (_RainStaticUVs).zw );
				o.ase_texcoord9.zw = vertexToFrag2257_g57962;
				
				float temp_output_6_0_g57974 = _SmoothnessRotation;
				float temp_output_200_0_g57974 = radians( temp_output_6_0_g57974 );
				float temp_output_13_0_g57974 = cos( temp_output_200_0_g57974 );
				float2 temp_output_9_0_g57974 = float2( 0.5,0.5 );
				float2 break39_g57974 = ( v.texcoord.xy - temp_output_9_0_g57974 );
				float temp_output_14_0_g57974 = sin( temp_output_200_0_g57974 );
				float2 appendResult36_g57974 = (float2(( ( temp_output_13_0_g57974 * break39_g57974.x ) + ( temp_output_14_0_g57974 * break39_g57974.y ) ) , ( ( temp_output_13_0_g57974 * break39_g57974.y ) - ( temp_output_14_0_g57974 * break39_g57974.x ) )));
				float2 Offset235_g57974 = (_SmoothnessUVs).zw;
				float2 temp_output_41_0_g57974 = ( ( ( appendResult36_g57974 * ( (_SmoothnessUVs).xy / 1.0 ) ) + temp_output_9_0_g57974 ) + Offset235_g57974 );
				float2 vertexToFrag70_g57974 = ( temp_output_41_0_g57974 - ( ( ( (_SmoothnessUVs).xy / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				o.ase_texcoord10.xy = vertexToFrag70_g57974;
				
				o.ase_texcoord10.zw = v.texcoord.xy;
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

				v.normalOS = temp_output_67_978;
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
				float3 staticSwitch908_g57973 = temp_cast_0;
				#else
				float3 staticSwitch908_g57973 = ( (_BaseColor).rgb * ( _Brightness + ( ( _CATEGORY_COLOR + _SPACE__COLOR ) * 0.0 ) ) );
				#endif
				float3 temp_output_746_0_g57962 = staticSwitch908_g57973;
				float3 temp_output_2101_0_g57962 = ( saturate( temp_output_746_0_g57962 ) * 0.2 );
				float lerpResult2117_g57962 = lerp( _Wetness , ( _Wetness * _GlobalWetnessEnabled ) , _GlobalWetnessIntensity);
				float lerpResult2115_g57962 = lerp( _Wetness , lerpResult2117_g57962 , _WetnessGlobalInfluenceEnable);
				float temp_output_2122_0_g57962 = saturate( _WetnessMask );
				float3 lerpResult2096_g57962 = lerp( temp_output_746_0_g57962 , temp_output_2101_0_g57962 , saturate( ( saturate( max( 0.0 , lerpResult2115_g57962 ) ) * temp_output_2122_0_g57962 ) ));
				float3 lerpResult2095_g57962 = lerp( temp_output_746_0_g57962 , lerpResult2096_g57962 , _WetnessEnable);
				float3 temp_output_57_747 = lerpResult2095_g57962;
				
				float2 vertexToFrag70_g57982 = IN.ase_texcoord8.xy;
				float3 unpack790_g57973 = UnpackNormalScale( SAMPLE_TEXTURE2D( _GlassNormalMap, sampler_GlassNormalMap, vertexToFrag70_g57982 ), ( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) ) );
				unpack790_g57973.z = lerp( 1, unpack790_g57973.z, saturate(( _GlassNormalStrength + ( ( _CATEGORY_NORMAL + _SPACE_NORMAL ) * 0.0 ) )) );
				float3 temp_output_19_0_g57962 = unpack790_g57973;
				float3 _Vector0 = float3(0,0,1);
				float3 MaskVector1485_g57962 = float3(0.001,0.001,0.001);
				float2 vertexToFrag1724_g57962 = IN.ase_texcoord8.zw;
				float lerpResult1584_g57962 = lerp( _RainVerticalIntensity , ( _RainVerticalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityVertical861_g57962 = saturate( lerpResult1584_g57962 );
				float3 unpack1651_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainVerticalRainMap, sampler_RainVerticalRainMap, vertexToFrag1724_g57962 ), IntensityVertical861_g57962 );
				unpack1651_g57962.z = lerp( 1, unpack1651_g57962.z, saturate(IntensityVertical861_g57962) );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break149_g57963 = ( abs( WorldNormal ) - temp_cast_4 );
				float smoothstepResult1521_g57963 = smoothstep( _RainVerticalSmoothEdge , 1.0 , ( break149_g57963.z + 0.5 ));
				float RainMaskVerticalZ1241_g57962 = smoothstepResult1521_g57963;
				float3 lerpResult1138_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalZ1241_g57962);
				float2 _SmoothX = float2(0,1);
				float smoothstepResult1523_g57963 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g57963.x + 0.45 ));
				float RainMaskVerticalX151_g57962 = smoothstepResult1523_g57963;
				float3 lerpResult1261_g57962 = lerp( MaskVector1485_g57962 , unpack1651_g57962 , RainMaskVerticalX151_g57962);
				float2 _SmoothY = float2(0,1);
				float smoothstepResult1519_g57963 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g57963.y + 0.45 ));
				float RainMaskVerticalY1216_g57962 = smoothstepResult1519_g57963;
				float3 lerpResult1390_g57962 = lerp( lerpResult1138_g57962 , BlendNormal( lerpResult1138_g57962 , lerpResult1261_g57962 ) , RainMaskVerticalY1216_g57962);
				float3 RAIN_VERTICAL127_g57962 = lerpResult1390_g57962;
				float3 lerpResult1543_g57962 = lerp( _Vector0 , RAIN_VERTICAL127_g57962 , _RainVerticalEnable);
				float2 vertexToFrag1727_g57962 = IN.ase_texcoord9.xy;
				float lerpResult1583_g57962 = lerp( _RainHorizontalIntensity , ( _RainHorizontalIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityHorizontal814_g57962 = saturate( lerpResult1583_g57962 );
				float3 unpack1661_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainHorizontalRainMap, sampler_RainHorizontalRainMap, vertexToFrag1727_g57962 ), IntensityHorizontal814_g57962 );
				unpack1661_g57962.z = lerp( 1, unpack1661_g57962.z, saturate(IntensityHorizontal814_g57962) );
				float2 _SmoothH = float2(0,1);
				float smoothstepResult1517_g57963 = smoothstep( _SmoothH.x , _SmoothH.y , ( WorldNormal.y + 0.02 ));
				float RainMaskHorizontal152_g57962 = smoothstepResult1517_g57963;
				float3 lerpResult279_g57962 = lerp( MaskVector1485_g57962 , unpack1661_g57962 , RainMaskHorizontal152_g57962);
				float3 RAIN_HORIZONTAL123_g57962 = lerpResult279_g57962;
				float3 lerpResult1544_g57962 = lerp( _Vector0 , RAIN_HORIZONTAL123_g57962 , _RainHorizontalEnable);
				float2 vertexToFrag2257_g57962 = IN.ase_texcoord9.zw;
				float lerpResult1585_g57962 = lerp( _RainStaticIntensity , ( _RainStaticIntensity * _Global_Rain_Intensity ) , (float)_Global_Rain_Enabled);
				float IntensityStatic991_g57962 = saturate( lerpResult1585_g57962 );
				float3 unpack1648_g57962 = UnpackNormalScale( SAMPLE_TEXTURE2D( _RainStaticRainMap, sampler_RainStaticRainMap, vertexToFrag2257_g57962 ), IntensityStatic991_g57962 );
				unpack1648_g57962.z = lerp( 1, unpack1648_g57962.z, saturate(IntensityStatic991_g57962) );
				float3 RAIN_STATIC743_g57962 = unpack1648_g57962;
				float3 lerpResult1545_g57962 = lerp( _Vector0 , RAIN_STATIC743_g57962 , _RainStaticEnable);
				float3 temp_output_2291_0_g57962 = ( ( ( temp_output_19_0_g57962 + lerpResult1543_g57962 ) + lerpResult1544_g57962 ) + lerpResult1545_g57962 );
				float temp_output_1635_0_g57962 = ( _RainEnable + ( ( _CATEGORY_RAIN + _SPACE_RAIN ) * 0.0 ) );
				float3 lerpResult1579_g57962 = lerp( temp_output_19_0_g57962 , temp_output_2291_0_g57962 , temp_output_1635_0_g57962);
				
				float3 temp_output_913_0_g57973 = (float4(0,0,0,1)).rgb;
				
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float m_switch112_g57992 = _SpecularMode;
				float3 temp_output_143_0_g57993 = _MainLightPosition.xyz;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal153_g57992 = unpack790_g57973;
				float3 worldNormal153_g57992 = float3(dot(tanToWorld0,tanNormal153_g57992), dot(tanToWorld1,tanNormal153_g57992), dot(tanToWorld2,tanNormal153_g57992));
				float3 temp_output_144_0_g57993 = worldNormal153_g57992;
				float dotResult137_g57993 = dot( temp_output_143_0_g57993 , temp_output_144_0_g57993 );
				float dotResult201_g57992 = dot( ( temp_output_143_0_g57993 - ( ( dotResult137_g57993 * 2.0 ) * temp_output_144_0_g57993 ) ) , -WorldViewDirection );
				float temp_output_215_0_g57992 = max( saturate( dotResult201_g57992 ) , 0.0 );
				float temp_output_54_0_g57992 = (temp_output_215_0_g57992*_SpecularWrapScale + _SpecularWrapOffset);
				float saferPower63_g57992 = abs( temp_output_54_0_g57992 );
				float temp_output_63_0_g57992 = pow( saferPower63_g57992 , _SpecularPower );
				float m_Default112_g57992 = ( temp_output_63_0_g57992 * _SpecularStrength );
				float temp_output_222_0_g57992 = ( temp_output_63_0_g57992 * 15.0 );
				float lerpResult102_g57992 = lerp( 0.034 , 0.048 , _SpecularStrengthDielectric);
				float m_Dielectric112_g57992 = ( temp_output_222_0_g57992 * lerpResult102_g57992 );
				float m_DielectricIOR112_g57992 = ( temp_output_222_0_g57992 * ( pow( ( _SpecularStrengthDielectricIOR - 1.0 ) , 2.0 ) / pow( ( _SpecularStrengthDielectricIOR + 1.0 ) , 2.0 ) ) );
				float localSpecularModefloatswitch112_g57992 = SpecularModefloatswitch112_g57992( m_switch112_g57992 , m_Default112_g57992 , m_Dielectric112_g57992 , m_DielectricIOR112_g57992 );
				float3 lerpResult80_g57992 = lerp( float3(0,0,0) , saturate( ( ( (_SpecularColor).rgb * ( ase_lightColor.rgb * max( ase_lightColor.a , 0.0 ) ) ) * localSpecularModefloatswitch112_g57992 ) ) , ( _SpecularEnable + ( ( _CATEGORY_SPECULAR + _SPACE_SPECULAR ) * 0.0 ) ));
				
				float2 vertexToFrag70_g57974 = IN.ase_texcoord10.xy;
				float3 temp_output_1014_0_g57973 = (SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_SmoothnessMap, vertexToFrag70_g57974 )).rgb;
				float3 temp_output_1028_0_g57973 = ( 1.0 - temp_output_1014_0_g57973 );
				float3 temp_cast_11 = (0.089).xxx;
				float3 lerpResult992_g57973 = lerp( temp_output_1014_0_g57973 , max( ( temp_output_1028_0_g57973 * temp_output_1028_0_g57973 ) , temp_cast_11 ) , _SmoothnessSource);
				float3 temp_output_991_0_g57973 = ( lerpResult992_g57973 * _SmoothnessStrength );
				float2 appendResult1000_g57973 = (float2(WorldViewDirection.xy));
				float3 appendResult999_g57973 = (float3(appendResult1000_g57973 , ( WorldViewDirection.z / 1.06 )));
				float fresnelNdotV997_g57973 = dot( normalize( unpack790_g57973 ), appendResult999_g57973 );
				float fresnelNode997_g57973 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV997_g57973 , 0.0001 ), _SmoothnessFresnelPower ) );
				float3 temp_cast_14 = (fresnelNode997_g57973).xxx;
				float3 lerpResult996_g57973 = lerp( temp_output_991_0_g57973 , ( temp_output_991_0_g57973 - temp_cast_14 ) , ( _SmoothnessFresnelEnable + ( ( _CATEGORY_SMOOTHNESS + _SPACE_SMOOTHNESS ) * 0.0 ) ));
				float temp_output_2142_0_g57962 = saturate( lerpResult996_g57973 ).x;
				float lerpResult2110_g57962 = lerp( temp_output_2142_0_g57962 , 0.9 , temp_output_2122_0_g57962);
				float lerpResult2109_g57962 = lerp( temp_output_2142_0_g57962 , lerpResult2110_g57962 , _WetnessEnable);
				
				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				
				float2 uv_RefractionTransmittanceColorMap = IN.ase_texcoord10.zw * _RefractionTransmittanceColorMap_ST.xy + _RefractionTransmittanceColorMap_ST.zw;
				

				float3 BaseColor = temp_output_57_747;
				float3 Normal = lerpResult1579_g57962;
				float3 Emission = temp_output_913_0_g57973;
				float3 Specular = lerpResult80_g57992;
				float Metallic = 0;
				float Smoothness = lerpResult2109_g57962;
				float Occlusion = 1;
				float Alpha = temp_output_67_23;
				float AlphaClipThreshold = 0.0;
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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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

				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				surfaceDescription.Alpha = temp_output_67_23;
				surfaceDescription.AlphaClipThreshold = 0.0;

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
			float4 _RainStaticUVs;
			half4 _BaseColor;
			half4 _RefractionTransmittanceColor;
			float4 _RefractionTransmittanceColorMap_ST;
			half4 _SpecularColor;
			float4 _SmoothnessUVs;
			float4 _RainVerticalUVs;
			float4 _RainHorizontalUVs;
			float4 _NormalUVs;
			half _SpecularStrengthDielectricIOR;
			half _SpecularStrengthDielectric;
			half _SpecularWrapOffset;
			half _SpecularPower;
			half _SpecularWrapScale;
			half _SpecularMode;
			float _SPACE_RAIN;
			half _SpecularStrength;
			half _SpecularEnable;
			float _SPACE_SPECULAR;
			float _CATEGORY_RAIN;
			half _SmoothnessRotation;
			half _SmoothnessSource;
			half _SmoothnessStrength;
			half _SmoothnessFresnelScale;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelEnable;
			float _CATEGORY_SMOOTHNESS;
			float _SPACE_SMOOTHNESS;
			half _RefractionIndex;
			float _CATEGORY_SPECULAR;
			half _RainEnable;
			int _Cull;
			half _RainStaticIntensity;
			half _Brightness;
			float _CATEGORY_COLOR;
			float _SPACE__COLOR;
			float _Wetness;
			half _WetnessGlobalInfluenceEnable;
			float _WetnessMask;
			half _WetnessEnable;
			half _GlassOpacity;
			float _CATEGORY_OPACITY;
			float _SPACE_OPACITY;
			half _GlassNormalStrength;
			float _CATEGORY_NORMAL;
			float _SPACE_NORMAL;
			half _RainVerticalColumns;
			half _RainVerticalRows;
			half _RainVerticalSpeed;
			half _RainVerticalIntensity;
			float _RainVerticalSmoothEdge;
			half _RainVerticalEnable;
			half _RainHorizontalColumns;
			half _RainHorizontalRows;
			half _RainHorizontalSpeed;
			half _RainHorizontalIntensity;
			half _RainHorizontalEnable;
			float _CATEGORY_REFRACTION;
			half _RainStaticEnable;
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
				float dotResult8_g57989 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult9_g57988 = lerp( v.normalOS , -v.normalOS , step( dotResult8_g57989 , -1.0 ));
				float3 temp_output_67_978 = lerpResult9_g57988;
				

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

				v.normalOS = temp_output_67_978;

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

				float temp_output_67_23 = ( 1.0 - ( _GlassOpacity + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				

				surfaceDescription.Alpha = temp_output_67_23;
				surfaceDescription.AlphaClipThreshold = 0.0;

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
Node;AmplifyShaderEditor.WireNode;114;-29.27066,241.2528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;115;-42.27071,325.7527;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-128,432;Inherit;False;Constant;_Float2;Float 2;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;66;-192,512;Inherit;False;DESF Refraction;1;;57959;c0f1594b60ea2514fac11f2154b648f1;0;0;5;FLOAT3;71;FLOAT;6;FLOAT3;7;FLOAT;51;FLOAT3;83
Node;AmplifyShaderEditor.FunctionNode;57;-240,64;Inherit;False;DESF Weather Rain;70;;57962;58c64a46e00b7044aaf191f7451a976c;6,1558,1,1557,1,1556,1,2123,0,2230,0,2238,0;5;746;FLOAT3;0,0,0;False;19;FLOAT3;0,0,1;False;2114;FLOAT;0;False;2142;FLOAT;1;False;2150;FLOAT;0.5;False;3;FLOAT3;747;FLOAT3;0;FLOAT;2171
Node;AmplifyShaderEditor.FunctionNode;67;-560,128;Inherit;False;DESF Core Glass;11;;57973;6c43c8c67906e76419cc83c84e9572d0;3,834,2,981,0,883,0;1;891;FLOAT3;0,0,0;False;10;FLOAT3;905;FLOAT3;22;FLOAT3;499;FLOAT3;806;FLOAT3;18;FLOAT;23;FLOAT;958;FLOAT3;978;SAMPLERSTATE;918;SAMPLERSTATE;919
Node;AmplifyShaderEditor.IntNode;83;128,48;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;106;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;107;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;108;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;109;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;111;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;112;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;113;129.8194,118.0451;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;105;128,128;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Rain/Glass;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;0;638176976783030116;Surface;1;638176976795230719;  Refraction Model;1;638176976836858818;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;1;638176977001257642;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;True;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;104;128,-128;Float;False;False;-1;2;DE_ShaderGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
WireConnection;114;0;67;23
WireConnection;115;0;67;978
WireConnection;57;746;67;905
WireConnection;57;19;67;22
WireConnection;57;2142;67;18
WireConnection;105;0;57;747
WireConnection;105;1;57;0
WireConnection;105;2;67;499
WireConnection;105;9;67;806
WireConnection;105;4;57;2171
WireConnection;105;6;67;23
WireConnection;105;7;77;0
WireConnection;105;12;66;7
WireConnection;105;13;66;6
WireConnection;105;10;67;978
WireConnection;104;0;57;747
WireConnection;104;1;114;0
WireConnection;104;4;115;0
ASEEND*/
//CHKSM=2EF576412529780FF7A7E02029DE17C56FB1F0F8