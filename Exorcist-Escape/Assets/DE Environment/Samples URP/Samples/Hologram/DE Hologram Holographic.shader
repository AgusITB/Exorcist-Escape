// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/Hologram/Holographic"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector][Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 2
		[DE_DrawerCategory(SURFACE INPUTS,true,_Scanline_ScreenSpaceMode,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		[DE_DrawerFloatEnum(Screen Vertical _Screen Horizontal _World Vertical _World Horizontal)]_Scanline_ScreenSpaceMode("Space", Float) = 0
		_Scanline_Tiling("Tiling", Range( 1 , 100)) = 60.35943
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
		_EmissiveIntensity("Emissive Intensity", Float) = 1
		_01_Opacity("Opacity", Range( 0 , 1)) = 0
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.5
		[HDR]_EmissiveColor_02("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensity_02("Emissive Intensity", Float) = 1
		_02_Opacity("Opacity", Range( 0 , 1)) = 0
		[HDR]_EmissiveColor_03("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensity_03("Emissive Intensity", Float) = 1
		_03_Opacity("Opacity", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_GlitchHologram_Map("Noise Map RGB", 2D) = "white" {}
		_GlitchHologram_TilingX("Tiling X", Float) = 35
		_GlitchHologram_TilingY("Tiling Y", Float) = 40
		_GlitchHologram_ScaleX("Scale X", Float) = 50
		_GlitchHologram_ScaleY("Scale Y", Float) = 200
		_GlitchHologram_SurfaceStrength("Surface Strength", Float) = 0.1
		_GlitchHologram_SurfaceOffset("Surface Offset", Float) = 5
		_GlitchHologram_EdgeStrength("Edge Strength", Float) = 0.1
		_GlitchHologram_EdgeOffset("Edge Offset", Float) = 5
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(PULSATE,true,_PulsateEnable,0,0)]_CATEGORY_PULSATE("CATEGORY_PULSATE", Float) = 1
		[DE_DrawerToggleLeft]_PulsateEnable("ENABLE PULSATE", Float) = 0
		_PulsateSize("Pulsate Size", Range( 0 , 1)) = 0.7226666
		_PulsateSpeed("Pulsate Speed", Range( 0 , 1)) = 0.39638
		[DE_DrawerSpace(10)]_SPACE_PULSATE("SPACE_PULSATE", Float) = 0


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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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

				float3 temp_output_19_0_g43761 = _EmissiveColor.rgb;
				float temp_output_21_0_g43761 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g43761 = ( temp_output_19_0_g43761 * temp_output_21_0_g43761 );
				float dotResult227_g43758 = dot( WorldViewDirection , WorldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float2 appendResult310_g43758 = (float2(ScreenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / ScreenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float3 lerpResult175_g43758 = lerp( temp_output_26_0_g43761 , float3( 0,0,0 ) , MASK219_g43758);
				float3 FINAL_SURFACE261_g43758 = lerpResult175_g43758;
				float3 temp_output_19_0_g43759 = _EmissiveColor_02.rgb;
				float temp_output_21_0_g43759 = _EmissiveIntensity_02;
				float3 temp_output_26_0_g43759 = ( temp_output_19_0_g43759 * temp_output_21_0_g43759 );
				float3 lerpResult174_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g43759 , MASK219_g43758);
				float3 FINAL_LINE262_g43758 = lerpResult174_g43758;
				float4 SCANLINE_04_02328_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( temp_output_315_0_g43758 + appendResult316_g43758 ) );
				float4 temp_output_271_0_g43758 = ( _EmissiveColor_03 * SCANLINE_04_02328_g43758 * _EmissiveIntensity_03 );
				float3 temp_output_19_0_g44345 = temp_output_271_0_g43758.rgb;
				float temp_output_21_0_g44345 = _EmissiveIntensity_03;
				float3 temp_output_26_0_g44345 = ( temp_output_19_0_g44345 * temp_output_21_0_g44345 );
				float3 lerpResult260_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g44345 , MASK_EDGE235_g43758);
				float3 FINAL_EDGE269_g43758 = lerpResult260_g43758;
				float3 PULSATE346_g43758 = ( FINAL_SURFACE261_g43758 + FINAL_LINE262_g43758 + FINAL_EDGE269_g43758 );
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float3 lerpResult105_g43758 = lerp( float3( 0,0,0 ) , PULSATE346_g43758 , temp_output_115_0_g43758);
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float3 lerpResult375_g43758 = lerp( PULSATE346_g43758 , lerpResult105_g43758 , temp_output_425_0_g43758);
				float3 PULSATE_FINAL265_g43758 = lerpResult375_g43758;
				float3 temp_output_294_0_g43758 = saturate( PULSATE_FINAL265_g43758 );
				float3 temp_output_453_91 = temp_output_294_0_g43758;
				
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float3 BaseColor = temp_output_453_91;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = temp_output_453_91;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_VERT_NORMAL
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
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float2 appendResult310_g43758 = (float2(ScreenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / ScreenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_VERT_NORMAL
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
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
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
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float2 appendResult310_g43758 = (float2(ScreenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / ScreenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
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
				o.ase_texcoord4.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				
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

				float3 temp_output_19_0_g43761 = _EmissiveColor.rgb;
				float temp_output_21_0_g43761 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g43761 = ( temp_output_19_0_g43761 * temp_output_21_0_g43761 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float4 screenPos = IN.ase_texcoord5;
				float2 appendResult310_g43758 = (float2(screenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / screenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float3 lerpResult175_g43758 = lerp( temp_output_26_0_g43761 , float3( 0,0,0 ) , MASK219_g43758);
				float3 FINAL_SURFACE261_g43758 = lerpResult175_g43758;
				float3 temp_output_19_0_g43759 = _EmissiveColor_02.rgb;
				float temp_output_21_0_g43759 = _EmissiveIntensity_02;
				float3 temp_output_26_0_g43759 = ( temp_output_19_0_g43759 * temp_output_21_0_g43759 );
				float3 lerpResult174_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g43759 , MASK219_g43758);
				float3 FINAL_LINE262_g43758 = lerpResult174_g43758;
				float4 SCANLINE_04_02328_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( temp_output_315_0_g43758 + appendResult316_g43758 ) );
				float4 temp_output_271_0_g43758 = ( _EmissiveColor_03 * SCANLINE_04_02328_g43758 * _EmissiveIntensity_03 );
				float3 temp_output_19_0_g44345 = temp_output_271_0_g43758.rgb;
				float temp_output_21_0_g44345 = _EmissiveIntensity_03;
				float3 temp_output_26_0_g44345 = ( temp_output_19_0_g44345 * temp_output_21_0_g44345 );
				float3 lerpResult260_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g44345 , MASK_EDGE235_g43758);
				float3 FINAL_EDGE269_g43758 = lerpResult260_g43758;
				float3 PULSATE346_g43758 = ( FINAL_SURFACE261_g43758 + FINAL_LINE262_g43758 + FINAL_EDGE269_g43758 );
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float3 lerpResult105_g43758 = lerp( float3( 0,0,0 ) , PULSATE346_g43758 , temp_output_115_0_g43758);
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float3 lerpResult375_g43758 = lerp( PULSATE346_g43758 , lerpResult105_g43758 , temp_output_425_0_g43758);
				float3 PULSATE_FINAL265_g43758 = lerpResult375_g43758;
				float3 temp_output_294_0_g43758 = saturate( PULSATE_FINAL265_g43758 );
				float3 temp_output_453_91 = temp_output_294_0_g43758;
				
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float3 BaseColor = temp_output_453_91;
				float3 Emission = temp_output_453_91;
				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
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
				o.ase_texcoord2.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;

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

				float3 temp_output_19_0_g43761 = _EmissiveColor.rgb;
				float temp_output_21_0_g43761 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g43761 = ( temp_output_19_0_g43761 * temp_output_21_0_g43761 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float4 screenPos = IN.ase_texcoord3;
				float2 appendResult310_g43758 = (float2(screenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / screenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float3 lerpResult175_g43758 = lerp( temp_output_26_0_g43761 , float3( 0,0,0 ) , MASK219_g43758);
				float3 FINAL_SURFACE261_g43758 = lerpResult175_g43758;
				float3 temp_output_19_0_g43759 = _EmissiveColor_02.rgb;
				float temp_output_21_0_g43759 = _EmissiveIntensity_02;
				float3 temp_output_26_0_g43759 = ( temp_output_19_0_g43759 * temp_output_21_0_g43759 );
				float3 lerpResult174_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g43759 , MASK219_g43758);
				float3 FINAL_LINE262_g43758 = lerpResult174_g43758;
				float4 SCANLINE_04_02328_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( temp_output_315_0_g43758 + appendResult316_g43758 ) );
				float4 temp_output_271_0_g43758 = ( _EmissiveColor_03 * SCANLINE_04_02328_g43758 * _EmissiveIntensity_03 );
				float3 temp_output_19_0_g44345 = temp_output_271_0_g43758.rgb;
				float temp_output_21_0_g44345 = _EmissiveIntensity_03;
				float3 temp_output_26_0_g44345 = ( temp_output_19_0_g44345 * temp_output_21_0_g44345 );
				float3 lerpResult260_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g44345 , MASK_EDGE235_g43758);
				float3 FINAL_EDGE269_g43758 = lerpResult260_g43758;
				float3 PULSATE346_g43758 = ( FINAL_SURFACE261_g43758 + FINAL_LINE262_g43758 + FINAL_EDGE269_g43758 );
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float3 lerpResult105_g43758 = lerp( float3( 0,0,0 ) , PULSATE346_g43758 , temp_output_115_0_g43758);
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float3 lerpResult375_g43758 = lerp( PULSATE346_g43758 , lerpResult105_g43758 , temp_output_425_0_g43758);
				float3 PULSATE_FINAL265_g43758 = lerpResult375_g43758;
				float3 temp_output_294_0_g43758 = saturate( PULSATE_FINAL265_g43758 );
				float3 temp_output_453_91 = temp_output_294_0_g43758;
				
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float3 BaseColor = temp_output_453_91;
				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult227_g43758 = dot( ase_worldViewDir , WorldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float2 appendResult310_g43758 = (float2(ScreenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / ScreenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float3 Normal = float3(0, 0, 1);
				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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

				float3 temp_output_19_0_g43761 = _EmissiveColor.rgb;
				float temp_output_21_0_g43761 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g43761 = ( temp_output_19_0_g43761 * temp_output_21_0_g43761 );
				float dotResult227_g43758 = dot( WorldViewDirection , WorldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float2 appendResult310_g43758 = (float2(ScreenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / ScreenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float3 lerpResult175_g43758 = lerp( temp_output_26_0_g43761 , float3( 0,0,0 ) , MASK219_g43758);
				float3 FINAL_SURFACE261_g43758 = lerpResult175_g43758;
				float3 temp_output_19_0_g43759 = _EmissiveColor_02.rgb;
				float temp_output_21_0_g43759 = _EmissiveIntensity_02;
				float3 temp_output_26_0_g43759 = ( temp_output_19_0_g43759 * temp_output_21_0_g43759 );
				float3 lerpResult174_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g43759 , MASK219_g43758);
				float3 FINAL_LINE262_g43758 = lerpResult174_g43758;
				float4 SCANLINE_04_02328_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( temp_output_315_0_g43758 + appendResult316_g43758 ) );
				float4 temp_output_271_0_g43758 = ( _EmissiveColor_03 * SCANLINE_04_02328_g43758 * _EmissiveIntensity_03 );
				float3 temp_output_19_0_g44345 = temp_output_271_0_g43758.rgb;
				float temp_output_21_0_g44345 = _EmissiveIntensity_03;
				float3 temp_output_26_0_g44345 = ( temp_output_19_0_g44345 * temp_output_21_0_g44345 );
				float3 lerpResult260_g43758 = lerp( float3( 0,0,0 ) , temp_output_26_0_g44345 , MASK_EDGE235_g43758);
				float3 FINAL_EDGE269_g43758 = lerpResult260_g43758;
				float3 PULSATE346_g43758 = ( FINAL_SURFACE261_g43758 + FINAL_LINE262_g43758 + FINAL_EDGE269_g43758 );
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * WorldPosition.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * WorldPosition.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float3 lerpResult105_g43758 = lerp( float3( 0,0,0 ) , PULSATE346_g43758 , temp_output_115_0_g43758);
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float3 lerpResult375_g43758 = lerp( PULSATE346_g43758 , lerpResult105_g43758 , temp_output_425_0_g43758);
				float3 PULSATE_FINAL265_g43758 = lerpResult375_g43758;
				float3 temp_output_294_0_g43758 = saturate( PULSATE_FINAL265_g43758 );
				float3 temp_output_453_91 = temp_output_294_0_g43758;
				
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				float3 BaseColor = temp_output_453_91;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = temp_output_453_91;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = PULSATE_OPACITY_FINAL268_g43758;
				float AlphaClipThreshold = lerpResult348_g43758;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
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

				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float4 screenPos = IN.ase_texcoord2;
				float2 appendResult310_g43758 = (float2(screenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / screenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * ase_worldPos.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * ase_worldPos.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				surfaceDescription.Alpha = PULSATE_OPACITY_FINAL268_g43758;
				surfaceDescription.AlphaClipThreshold = lerpResult348_g43758;

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor_02;
			float4 _EmissiveColor;
			float4 _EmissiveColor_03;
			float _02_Opacity;
			float _01_Opacity;
			float _SPACE_PULSATE;
			float _CATEGORY_PULSATE;
			float _PulsateEnable;
			float _PulsateSpeed;
			float _Scanline_Tiling;
			half _Scanline_ScreenSpaceMode;
			float _PulsateSize;
			float _EmissiveIntensity_03;
			float _EmissiveIntensity_02;
			float _CATEGORY_SURFACEINPUTS;
			float _GlitchHologram_TilingY;
			float _GlitchHologram_TilingX;
			float _GlitchHologram_ScaleX;
			float _GlitchHologram_ScaleY;
			float _GlitchHologram_EdgeOffset;
			float _GlitchHologram_EdgeStrength;
			float _GlitchHologram_SurfaceOffset;
			float _GlitchHologram_SurfaceStrength;
			half _EmissionFlags;
			float _EmissiveIntensity;
			int _Cull;
			float _SPACE_SURFACEINPUTS;
			float _03_Opacity;
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

			TEXTURE2D(_GlitchHologram_Map);
			SAMPLER(sampler_Trilinear_Repeat_Aniso2);


			float floatswitch57_g43758( float m_switch, float m_ScreenVertical, float m_ScreenHorizontal, float m_WorldVertical, float m_WorldHorizontal )
			{
				if(m_switch ==0)
					return m_ScreenVertical;
				else if(m_switch ==1)
					return m_ScreenHorizontal;
				else if(m_switch ==2)
					return m_WorldVertical;
				else if(m_switch ==3)
					return m_WorldHorizontal;
				else
				return float(0);
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

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
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

				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float dotResult227_g43758 = dot( ase_worldViewDir , ase_worldNormal );
				float temp_output_226_0_g43758 = abs( dotResult227_g43758 );
				float saferPower231_g43758 = abs( temp_output_226_0_g43758 );
				float MASK_SURFACE240_g43758 = ( ( 1.0 - _GlitchHologram_SurfaceStrength ) * pow( saferPower231_g43758 , _GlitchHologram_SurfaceOffset ) );
				float saferPower224_g43758 = abs( ( 1.0 - temp_output_226_0_g43758 ) );
				float MASK_EDGE235_g43758 = saturate( ( _GlitchHologram_EdgeStrength * pow( saferPower224_g43758 , _GlitchHologram_EdgeOffset ) ) );
				float SCANLINE_04_OpasityMask339_g43758 = ( 1.0 - ( MASK_SURFACE240_g43758 + MASK_EDGE235_g43758 ) );
				float4 screenPos = IN.ase_texcoord2;
				float2 appendResult310_g43758 = (float2(screenPos.xy));
				float2 temp_output_315_0_g43758 = ( distance( float4( _WorldSpaceCameraPos , 0.0 ) , mul( GetObjectToWorldMatrix(), float4(0,0,0,1) ) ) * ( appendResult310_g43758 / screenPos.w ) * _GlitchHologram_ScaleX );
				float2 break303_g43758 = temp_output_315_0_g43758;
				float2 appendResult305_g43758 = (float2(( _GlitchHologram_ScaleY * break303_g43758.x ) , ( break303_g43758.y * _GlitchHologram_TilingX )));
				float2 appendResult316_g43758 = (float2(0.0 , ( ( _TimeParameters.x * 0.05 ) * _GlitchHologram_TilingY )));
				float4 SCANLINE_04_01327_g43758 = SAMPLE_TEXTURE2D( _GlitchHologram_Map, sampler_Trilinear_Repeat_Aniso2, ( appendResult305_g43758 + appendResult316_g43758 ) );
				float lerpResult348_g43758 = lerp( 0.0 , SCANLINE_04_OpasityMask339_g43758 , SCANLINE_04_01327_g43758.r);
				float MASK219_g43758 = lerpResult348_g43758;
				float lerpResult153_g43758 = lerp( ( 1.0 - _01_Opacity ) , 0.0 , MASK219_g43758);
				float FINAL_SURFACE_OPACITY276_g43758 = lerpResult153_g43758;
				float lerpResult154_g43758 = lerp( 0.0 , ( 1.0 - _02_Opacity ) , MASK219_g43758);
				float FINAL_LINE_OPACITY277_g43758 = lerpResult154_g43758;
				float lerpResult282_g43758 = lerp( 0.0 , ( 1.0 - _03_Opacity ) , MASK_EDGE235_g43758);
				float FINAL_EDGE_OPACITY278_g43758 = lerpResult282_g43758;
				float temp_output_150_0_g43758 = saturate( ( FINAL_SURFACE_OPACITY276_g43758 + FINAL_LINE_OPACITY277_g43758 + FINAL_EDGE_OPACITY278_g43758 ) );
				float PULSATE_OPACITY266_g43758 = temp_output_150_0_g43758;
				float m_switch57_g43758 = _Scanline_ScreenSpaceMode;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float4 break65_g43758 = ( ( ase_screenPosNorm * _ScreenParams ) / _Scanline_Tiling );
				float m_ScreenVertical57_g43758 = break65_g43758.x;
				float m_ScreenHorizontal57_g43758 = break65_g43758.y;
				float m_WorldVertical57_g43758 = ( _Scanline_Tiling * ase_worldPos.x );
				float m_WorldHorizontal57_g43758 = ( _Scanline_Tiling * ase_worldPos.y );
				float localfloatswitch57_g43758 = floatswitch57_g43758( m_switch57_g43758 , m_ScreenVertical57_g43758 , m_ScreenHorizontal57_g43758 , m_WorldVertical57_g43758 , m_WorldHorizontal57_g43758 );
				float _SPACE21_g43758 = localfloatswitch57_g43758;
				float smoothstepResult117_g43758 = smoothstep( 0.0 , _PulsateSize , saturate( frac( ( _SPACE21_g43758 + ( ( _TimeParameters.x ) * _PulsateSpeed ) ) ) ));
				float temp_output_115_0_g43758 = ( 1.0 - smoothstepResult117_g43758 );
				float temp_output_425_0_g43758 = ( _PulsateEnable + ( ( _CATEGORY_PULSATE + _SPACE_PULSATE ) * 0.0 ) );
				float lerpResult376_g43758 = lerp( PULSATE_OPACITY266_g43758 , ( PULSATE_OPACITY266_g43758 * temp_output_115_0_g43758 ) , temp_output_425_0_g43758);
				float PULSATE_OPACITY_FINAL268_g43758 = lerpResult376_g43758;
				

				surfaceDescription.Alpha = PULSATE_OPACITY_FINAL268_g43758;
				surfaceDescription.AlphaClipThreshold = lerpResult348_g43758;

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
Node;AmplifyShaderEditor.FunctionNode;453;1024,-640;Inherit;False;DESF Shape Stripes;1;;43758;f2c58fc3915b1044db941ddef7a34007;9,245,2,259,2,296,3,330,3,340,3,332,3,162,1,166,1,295,0;0;4;FLOAT3;91;FLOAT;102;FLOAT;218;FLOAT;372
Node;AmplifyShaderEditor.IntNode;473;1408,-720;Inherit;False;Property;_Cull;Render Face;0;2;[HideInInspector];[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;489;1375.904,-640;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;491;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;492;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;493;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;494;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;495;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;496;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;497;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;498;1375.904,-680.6909;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;490;1408,-640;Float;False;True;-1;2;DE_ShaderGUI;0;12;DE Environment/Hologram/Holographic;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;39;Workflow;1;0;Surface;1;638176382784373582;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_ASETransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_ASETranslucencyStrength;0;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;0;  Scattering;2,True,_ASETranslucencyScattering;0;  Direct;0.9,True,_ASETranslucencyScattering;0;  Ambient;0.1,True,_ASETranslucencyAmbient;0;  Shadow;0.5,True,_ASETranslucencyShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;1;638176382867759489;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;490;0;453;91
WireConnection;490;2;453;91
WireConnection;490;6;453;102
WireConnection;490;7;453;218
WireConnection;490;16;453;372
ASEEND*/
//CHKSM=52234B7771B73C933CA70E794452814C7252FD8F