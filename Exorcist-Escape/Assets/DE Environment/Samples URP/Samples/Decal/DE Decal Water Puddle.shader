// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader  "DE Environment/Decal/Water Puddle"
{
	Properties
    {
        [HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
        [HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
        [DE_DrawerCategory(COLOR,true,_DecalColor,0,0)]_CATEGORY_COLOR("CATEGORY_COLOR", Float) = 1
        [HDR]_DecalColor("Color", Color) = (1,1,1,1)
        [DE_DrawerToggleLeft]_DecalColorSpaceDouble("Color Space Double", Float) = 0
        [DE_DrawerToggleLeft]_DecalMainLightInfluence("Main Light Influence", Float) = 0
        [DE_DrawerSpace(10)]_SPACE_COLOR("SPACE_COLOR", Float) = 0
        [DE_DrawerCategory(OPACITY,true,_DecalOpacityGlobal,0,0)]_CATEGORY_OPACITY("CATEGORY_OPACITY", Float) = 1
        [DE_DrawerToggleLeft]_DecalEdgeMask("Edge Mask", Float) = 0
        _DecalOpacityGlobal("Opacity Global", Range( 0 , 1)) = 0
        [DE_DrawerFloatEnum(BaseMap Alpha _MAOS Smoothness Channel)]_DecalOpacityMOASChannel("Opacity MOAS Channel", Float) = 0
        [DE_DrawerFloatEnum(BaseMap Alpha _MAOS Smoothness Channel)]_DecalOpacityNormalChannel("Opacity Normal Channel", Float) = 0
        [DE_DrawerSpace(10)]_SPACE_OPACITY("SPACE_OPACITY", Float) = 0
        [DE_DrawerCategory(DECAL MAP,true,_BaseColorMap,0,0)]_CATEGORY_DECALMAP("CATEGORY_DECAL MAP", Float) = 1
        [DE_DrawerTextureSingleLine]_BaseColorMap("Base Map", 2D) = "white" {}
        [DE_DrawerFloatEnum(Red _Green _Blue _Alpha)]_BaseColorMapChannel("Base Map Channel", Float) = 0
        _WaterLevel("Water Level", Range( 0 , 1)) = 0.5
        _UVRotation("UV Rotation", Float) = 0
        [Normal][DE_DrawerTextureSingleLine]_NormalMap("Normal Map", 2D) = "bump" {}
        _NormalStrength("Normal Strength", Float) = 1
        [DE_DrawerTextureSingleLine]_MaskMap("Mask MAOS", 2D) = "white" {}
        _MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
        _OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
        _SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
        [DE_DrawerSpace(10)]_SPACE_DECALMAP("SPACE_DECAL MAP", Float) = 0
        [DE_DrawerCategory(REFLECTION,true,_DecalReflectionEnable,0,0)]_CATEGORY_REFLECTION("CATEGORY_REFLECTION", Float) = 0
        [DE_DrawerToggleLeft]_DecalReflectionEnable("ENABLE REFLECTION", Float) = 0
        [HDR][DE_DrawerTextureSingleLine]_WaterReflectionCubemap("Reflection Cubemap", CUBE) = "white" {}
        _DecalReflectionCloud("Reflection Cloud", Range( 0 , 1)) = 1
        _DecalReflectionWobble("Reflection Wobble", Range( 0 , 0.1)) = 0
        _DecalReflectionSmoothness("Reflection Smoothness", Range( 0 , 2)) = 2
        _DecalReflectionBumpScale("Reflection Bump Scale", Range( 0 , 1)) = 0.05
        _WaterReflectionBumpClamp("Reflection Bump Clamp", Range( 0 , 0.15)) = 0.15
        [DE_DrawerToggleNoKeyword]_DecalReflectionEnableFresnel("Enable Fresnel", Float) = 0
        _DecalReflectionFresnelStrength("Fresnel Strength", Range( 0.001 , 1)) = 0.15
        _DecalReflectionFresnelScale("Fresnel Scale", Range( 0 , 1)) = 0.5
        _DecalReflectionFresnelBias("Fresnel Bias", Range( 0 , 1)) = 1
        [DE_DrawerSpace(10)]_SPACE_REFLECTION("SPACE_REFLECTION", Float) = 0


        [HideInInspector] _DrawOrder("Draw Order", Range(-50, 50)) = 0
        [HideInInspector][Enum(Depth Bias, 0, View Bias, 1)] _DecalMeshBiasType("DecalMesh BiasType", Float) = 0

        [HideInInspector] _DecalMeshDepthBias("DecalMesh DepthBias", Float) = 0
        [HideInInspector] _DecalMeshViewBias("DecalMesh ViewBias", Float) = 0

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

        [HideInInspector] _DecalAngleFadeSupported("Decal Angle Fade Supported", Float) = 1
    }

    SubShader
    {
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "PreviewType"="Plane" "DisableBatching"="LODFading" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalDecalSubTarget" }

		HLSLINCLUDE
		#pragma target 3.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"
		ENDHLSL

		
        Pass
        {
			
            Name "DBufferProjector"
            Tags { "LightMode"="DBufferProjector" }

			Cull Front
			Blend 0 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			Blend 1 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			Blend 2 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			ZTest Greater
			ZWrite Off
			ColorMask RGBA
			ColorMask RGBA 1
			ColorMask RGBA 2

            HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define DECAL_ANGLE_FADE 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag

		    #pragma exclude_renderers glcore gles gles3 
			#pragma multi_compile_instancing
			#pragma editor_sync_compilation

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _DECAL_LAYERS

			

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define HAVE_MESH_MODIFICATION
            #define SHADERPASS SHADERPASS_DBUFFER_PROJECTOR

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
			};

			struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(SurfaceDescription surfaceDescription, float angleFadeFactor, out DecalSurfaceData surfaceData)
            {
                half4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
                half fadeFactor = clamp(normalToWorld[0][3], 0.0f, 1.0f) * angleFadeFactor;
                float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
                float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    surfaceData.normalWS.xyz = mul((half3x3)normalToWorld, surfaceDescription.NormalTS.xyz);
                #else
                    surfaceData.normalWS.xyz = normalToWorld[2].xyz;
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			PackedVaryings Vert(Attributes inputMesh  )
			{
				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				packedOutput.ase_texcoord.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord.w = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				OUTPUT_DBUFFER(outDBuffer)
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif


				#if UNITY_REVERSED_Z
					float depth = LoadSceneDepth(packedInput.positionCS.xy);
				#else
					float depth = lerp(UNITY_NEAR_CLIP_VALUE, 1, LoadSceneDepth(packedInput.positionCS.xy));
				#endif

				#if defined(DECAL_RECONSTRUCT_NORMAL)
					#if defined(_DECAL_NORMAL_BLEND_HIGH)
						half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
					#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
						half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
					#else
						half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
					#endif
				#elif defined(DECAL_LOAD_NORMAL)
					half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
				#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;

				float3 positionWS = ComputeWorldSpacePosition(positionSS, depth, UNITY_MATRIX_I_VP);


				float3 positionDS = TransformWorldToObject(positionWS);
				positionDS = positionDS * float3(1.0, -1.0, 1.0);

				float clipValue = 0.5 - Max3(abs(positionDS).x, abs(positionDS).y, abs(positionDS).z);
				clip(clipValue);

				float2 texCoord = positionDS.xz + float2(0.5, 0.5);

				float4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
				float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
				float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);
				texCoord.xy = texCoord.xy * scale + offset;

				float2 texCoord0 = texCoord;
				float2 texCoord1 = texCoord;
				float2 texCoord2 = texCoord;
				float2 texCoord3 = texCoord;

				float3 worldTangent = TransformObjectToWorldDir(float3(1, 0, 0));
				float3 worldNormal = TransformObjectToWorldDir(float3(0, 1, 0));
				float3 worldBitangent = TransformObjectToWorldDir(float3(0, 0, 1));

				#ifdef DECAL_ANGLE_FADE
					half2 angleFade = half2(normalToWorld[1][3], normalToWorld[2][3]);

					if (angleFade.y < 0.0f)
					{
						half3 decalNormal = half3(normalToWorld[0].z, normalToWorld[1].z, normalToWorld[2].z);
						half dotAngle = dot(normalWS, decalNormal);
						angleFadeFactor = saturate(angleFade.x + angleFade.y * (dotAngle * (dotAngle - 2.0)));
					}
				#endif

				half3 viewDirectionWS = half3(1.0, 1.0, 1.0);
				DecalSurfaceData surfaceData;

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( texCoord0 - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 tanToWorld0 = float3( worldTangent.x, worldBitangent.x, worldNormal.x );
				float3 tanToWorld1 = float3( worldTangent.y, worldBitangent.y, worldNormal.y );
				float3 tanToWorld2 = float3( worldTangent.z, worldBitangent.z, worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - positionWS );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl199_g58192 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( worldNormal, ase_worldViewDir );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float lerpResult152_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityMOASChannel);
				float lerpResult409_g58192 = lerp( lerpResult152_g58192 , ( lerpResult152_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness =( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult409_g58192;
				#endif

				GetSurfaceData(surfaceDescription, angleFadeFactor, surfaceData);
				ENCODE_INTO_DBUFFER(surfaceData, outDBuffer);

                #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
                positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
                #endif

			}
            ENDHLSL
        }

		
        Pass
        {
			
            Name "DecalScreenSpaceProjector"
            Tags { "LightMode"="DecalScreenSpaceProjector" }

			Cull Front
			Blend SrcAlpha OneMinusSrcAlpha
			ZTest Greater
			ZWrite Off

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define DECAL_ANGLE_FADE 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma editor_sync_compilation

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile _ _FORWARD_PLUS

			

			#pragma multi_compile _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH
			#pragma multi_compile _ _DECAL_LAYERS

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TEXCOORD0
            #define VARYINGS_NEED_NORMAL_WS
			#define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_VIEWDIRECTION_WS
            #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
            #define VARYINGS_NEED_SH
            #define VARYINGS_NEED_STATIC_LIGHTMAP_UV
            #define VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"

		    #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
				float3 Emission;
			};

			struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float3 viewDirectionWS : TEXCOORD1;
				float2 staticLightmapUV : TEXCOORD2;
				float2 dynamicLightmapUV : TEXCOORD3;
				float3 sh : TEXCOORD4;
				float4 fogFactorAndVertexLight : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(SurfaceDescription surfaceDescription, float angleFadeFactor, out DecalSurfaceData surfaceData)
            {
                half4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
                half fadeFactor = clamp(normalToWorld[0][3], 0.0f, 1.0f) * angleFadeFactor;
                float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
                float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
                	surfaceData.emissive.rgb = half3(surfaceDescription.Emission.rgb * fadeFactor);
				#endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    surfaceData.normalWS.xyz = mul((half3x3)normalToWorld, surfaceDescription.NormalTS.xyz);
                #else
                    surfaceData.normalWS.xyz = normalToWorld[2].xyz;
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			void InitializeInputData(PackedVaryings input, float3 positionWS, half3 normalWS, half3 viewDirectionWS, out InputData inputData)
			{
				inputData = (InputData)0;

				inputData.positionWS = positionWS;
				inputData.normalWS = normalWS;
				inputData.viewDirectionWS = viewDirectionWS;
				inputData.shadowCoord = float4(0, 0, 0, 0);

				inputData.fogCoord = half(input.fogFactorAndVertexLight.x);
				inputData.vertexLighting = half3(input.fogFactorAndVertexLight.yzw);

				#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, input.dynamicLightmapUV.xy, half3(input.sh), normalWS);
				#elif defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, half3(input.sh), normalWS);
				#endif

				#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.staticLightmapUV);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV && LIGHTMAP_ON)
						inputData.staticLightmapUV = input.staticLightmapUV;
					#elif defined(VARYINGS_NEED_SH)
						inputData.vertexSH = input.sh;
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);
			}

			void GetSurface(DecalSurfaceData decalSurfaceData, inout SurfaceData surfaceData)
			{
				surfaceData.albedo = decalSurfaceData.baseColor.rgb;
				surfaceData.metallic = saturate(decalSurfaceData.metallic);
				surfaceData.specular = 0;
				surfaceData.smoothness = saturate(decalSurfaceData.smoothness);
				surfaceData.occlusion = decalSurfaceData.occlusion;
				surfaceData.emission = decalSurfaceData.emissive;
				surfaceData.alpha = saturate(decalSurfaceData.baseColor.w);
				surfaceData.clearCoatMask = 0;
				surfaceData.clearCoatSmoothness = 1;
			}

			PackedVaryings Vert(Attributes inputMesh  )
			{
				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				packedOutput.ase_texcoord6.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord6.w = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);
				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);

				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				half fogFactor = 0;
				#if !defined(_FOG_FRAGMENT)
					fogFactor = ComputeFogFactor(packedOutput.positionCS.z);
				#endif
				half3 vertexLight = VertexLighting(positionWS, normalWS);
				packedOutput.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				packedOutput.normalWS.xyz =  normalWS;
				packedOutput.viewDirectionWS.xyz =  GetWorldSpaceViewDir(positionWS);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(inputMesh.uv1, unity_LightmapST, packedOutput.staticLightmapUV);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					packedOutput.dynamicLightmapUV.xy = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					packedOutput.sh.xyz =  float3(SampleSHVertex(half3(normalWS)));
				#endif

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out half4 outColor : SV_Target0
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif

				#if UNITY_REVERSED_Z
					float depth = LoadSceneDepth(packedInput.positionCS.xy);
				#else
					float depth = lerp(UNITY_NEAR_CLIP_VALUE, 1, LoadSceneDepth(packedInput.positionCS.xy));
				#endif

				#if defined(DECAL_RECONSTRUCT_NORMAL)
					#if defined(_DECAL_NORMAL_BLEND_HIGH)
						half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
					#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
						half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
					#else
						half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
					#endif
				#elif defined(DECAL_LOAD_NORMAL)
					half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
				#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;

				float3 positionWS = ComputeWorldSpacePosition(positionSS, depth, UNITY_MATRIX_I_VP);

				float3 positionDS = TransformWorldToObject(positionWS);
				positionDS = positionDS * float3(1.0, -1.0, 1.0);

				float clipValue = 0.5 - Max3(abs(positionDS).x, abs(positionDS).y, abs(positionDS).z);
				clip(clipValue);

				float2 texCoord = positionDS.xz + float2(0.5, 0.5);

				float4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
				float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
				float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);
				texCoord.xy = texCoord.xy * scale + offset;

				float2 texCoord0 = texCoord;
				float2 texCoord1 = texCoord;
				float2 texCoord2 = texCoord;
				float2 texCoord3 = texCoord;

				float3 worldTangent = TransformObjectToWorldDir(float3(1, 0, 0));
				float3 worldNormal = TransformObjectToWorldDir(float3(0, 1, 0));
				float3 worldBitangent = TransformObjectToWorldDir(float3(0, 0, 1));

				#ifdef DECAL_ANGLE_FADE
					half2 angleFade = half2(normalToWorld[1][3], normalToWorld[2][3]);

					if (angleFade.y < 0.0f)
					{
						half3 decalNormal = half3(normalToWorld[0].z, normalToWorld[1].z, normalToWorld[2].z);
						half dotAngle = dot(normalWS, decalNormal);
						angleFadeFactor = saturate(angleFade.x + angleFade.y * (dotAngle * (dotAngle - 2.0)));
					}
				#endif

				half3 viewDirectionWS = half3(packedInput.viewDirectionWS);

				DecalSurfaceData surfaceData;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( texCoord0 - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 tanToWorld0 = float3( worldTangent.x, worldBitangent.x, worldNormal.x );
				float3 tanToWorld1 = float3( worldTangent.y, worldBitangent.y, worldNormal.y );
				float3 tanToWorld2 = float3( worldTangent.z, worldBitangent.z, worldNormal.z );
				float3 worldRefl199_g58192 = normalize( reflect( -packedInput.viewDirectionWS, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( worldNormal, packedInput.viewDirectionWS );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float lerpResult152_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityMOASChannel);
				float lerpResult409_g58192 = lerp( lerpResult152_g58192 , ( lerpResult152_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;
				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult409_g58192;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = float3(0, 0, 0);
				#endif

				GetSurfaceData( surfaceDescription, angleFadeFactor, surfaceData);

				#ifdef DECAL_RECONSTRUCT_NORMAL
					surfaceData.normalWS.xyz = normalize(lerp(normalWS.xyz, surfaceData.normalWS.xyz, surfaceData.normalWS.w));
				#endif

				InputData inputData;
				InitializeInputData( packedInput, positionWS, surfaceData.normalWS.xyz, viewDirectionWS, inputData);

				SurfaceData surface = (SurfaceData)0;
				GetSurface(surfaceData, surface);

				half4 color = UniversalFragmentPBR(inputData, surface);
				color.rgb = MixFog(color.rgb, inputData.fogCoord);
				outColor = color;

               #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
               positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
               #endif

			}
			ENDHLSL
        }

		
        Pass
        {
            
			Name "DecalGBufferProjector"
            Tags { "LightMode"="DecalGBufferProjector" }

			Cull Front
			Blend 0 SrcAlpha OneMinusSrcAlpha
			Blend 1 SrcAlpha OneMinusSrcAlpha
			Blend 2 SrcAlpha OneMinusSrcAlpha
			Blend 3 SrcAlpha OneMinusSrcAlpha
			ZTest Greater
			ZWrite Off
			ColorMask RGB
			ColorMask 0 1
			ColorMask RGB 2
			ColorMask RGB 3

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define DECAL_ANGLE_FADE 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma editor_sync_compilation

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH
			#pragma multi_compile _ _DECAL_LAYERS
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TEXCOORD0
			#define VARYINGS_NEED_NORMAL_WS
			#define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_VIEWDIRECTION_WS
            #define VARYINGS_NEED_SH
            #define VARYINGS_NEED_STATIC_LIGHTMAP_UV
            #define VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DECAL_GBUFFER_PROJECTOR

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"

		    #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
				float3 Emission;
			};

			struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float3 viewDirectionWS : TEXCOORD1;
				float2 staticLightmapUV : TEXCOORD2;
				float2 dynamicLightmapUV : TEXCOORD3;
				float3 sh : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(SurfaceDescription surfaceDescription, float angleFadeFactor, out DecalSurfaceData surfaceData)
            {
                half4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
                half fadeFactor = clamp(normalToWorld[0][3], 0.0f, 1.0f) * angleFadeFactor;
                float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
                float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceData.emissive.rgb = half3(surfaceDescription.Emission.rgb * fadeFactor);
				#endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    surfaceData.normalWS.xyz = mul((half3x3)normalToWorld, surfaceDescription.NormalTS.xyz);
                #else
                    surfaceData.normalWS.xyz = normalToWorld[2].xyz;
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			void InitializeInputData(PackedVaryings input, float3 positionWS, half3 normalWS, half3 viewDirectionWS, out InputData inputData)
			{
				inputData = (InputData)0;

				inputData.positionWS = positionWS;
				inputData.normalWS = normalWS;
				inputData.viewDirectionWS = viewDirectionWS;

				inputData.shadowCoord = float4(0, 0, 0, 0);

				#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
					inputData.fogCoord = float4(input.fogFactorAndVertexLight.x);
					inputData.vertexLighting = half3(input.fogFactorAndVertexLight.yzw);
				#endif

				#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, input.dynamicLightmapUV.xy, half3(input.sh), normalWS);
				#elif defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, half3(input.sh), normalWS);
				#endif

				#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.staticLightmapUV);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV && LIGHTMAP_ON)
						inputData.staticLightmapUV = input.staticLightmapUV;
					#elif defined(VARYINGS_NEED_SH)
						inputData.vertexSH = input.sh;
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);
			}

			void GetSurface(DecalSurfaceData decalSurfaceData, inout SurfaceData surfaceData)
			{
				surfaceData.albedo = decalSurfaceData.baseColor.rgb;
				surfaceData.metallic = saturate(decalSurfaceData.metallic);
				surfaceData.specular = 0;
				surfaceData.smoothness = saturate(decalSurfaceData.smoothness);
				surfaceData.occlusion = decalSurfaceData.occlusion;
				surfaceData.emission = decalSurfaceData.emissive;
				surfaceData.alpha = saturate(decalSurfaceData.baseColor.w);
				surfaceData.clearCoatMask = 0;
				surfaceData.clearCoatSmoothness = 1;
			}

			PackedVaryings Vert(Attributes inputMesh  )
			{
				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				packedOutput.ase_texcoord5.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord5.w = 0;

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				packedOutput.positionCS = TransformWorldToHClip(positionWS);
				packedOutput.normalWS.xyz =  normalWS;
				packedOutput.viewDirectionWS.xyz =  GetWorldSpaceViewDir(positionWS);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(inputMesh.uv1, unity_LightmapST, packedOutput.staticLightmapUV);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					packedOutput.dynamicLightmapUV.xy = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					packedOutput.sh = float3(SampleSHVertex(half3(normalWS)));
				#endif

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out FragmentOutput fragmentOutput
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif

				#if UNITY_REVERSED_Z
					float depth = LoadSceneDepth(packedInput.positionCS.xy);
				#else
					float depth = lerp(UNITY_NEAR_CLIP_VALUE, 1, LoadSceneDepth(packedInput.positionCS.xy));
				#endif

				#if defined(DECAL_RECONSTRUCT_NORMAL)
					#if defined(_DECAL_NORMAL_BLEND_HIGH)
						half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
					#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
						half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
					#else
						half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
					#endif
				#elif defined(DECAL_LOAD_NORMAL)
					half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
				#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;

				float3 positionWS = ComputeWorldSpacePosition(positionSS, depth, UNITY_MATRIX_I_VP);

				float3 positionDS = TransformWorldToObject(positionWS);
				positionDS = positionDS * float3(1.0, -1.0, 1.0);

				float clipValue = 0.5 - Max3(abs(positionDS).x, abs(positionDS).y, abs(positionDS).z);
				clip(clipValue);

				float2 texCoord = positionDS.xz + float2(0.5, 0.5);

				float4x4 normalToWorld = UNITY_ACCESS_INSTANCED_PROP(Decal, _NormalToWorld);
				float2 scale = float2(normalToWorld[3][0], normalToWorld[3][1]);
				float2 offset = float2(normalToWorld[3][2], normalToWorld[3][3]);
				texCoord.xy = texCoord.xy * scale + offset;

				float2 texCoord0 = texCoord;
				float2 texCoord1 = texCoord;
				float2 texCoord2 = texCoord;
				float2 texCoord3 = texCoord;

				float3 worldTangent = TransformObjectToWorldDir(float3(1, 0, 0));
				float3 worldNormal = TransformObjectToWorldDir(float3(0, 1, 0));
				float3 worldBitangent = TransformObjectToWorldDir(float3(0, 0, 1));

				#ifdef DECAL_ANGLE_FADE
					half2 angleFade = half2(normalToWorld[1][3], normalToWorld[2][3]);

					if (angleFade.y < 0.0f)
					{
						half3 decalNormal = half3(normalToWorld[0].z, normalToWorld[1].z, normalToWorld[2].z);
						half dotAngle = dot(normalWS, decalNormal);
						angleFadeFactor = saturate(angleFade.x + angleFade.y * (dotAngle * (dotAngle - 2.0)));
					}
				#endif

				half3 viewDirectionWS = half3(packedInput.viewDirectionWS);
				DecalSurfaceData surfaceData;

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( texCoord0 - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 tanToWorld0 = float3( worldTangent.x, worldBitangent.x, worldNormal.x );
				float3 tanToWorld1 = float3( worldTangent.y, worldBitangent.y, worldNormal.y );
				float3 tanToWorld2 = float3( worldTangent.z, worldBitangent.z, worldNormal.z );
				float3 worldRefl199_g58192 = normalize( reflect( -packedInput.viewDirectionWS, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( worldNormal, packedInput.viewDirectionWS );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float lerpResult152_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityMOASChannel);
				float lerpResult409_g58192 = lerp( lerpResult152_g58192 , ( lerpResult152_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion =saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult409_g58192;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = float3(0, 0, 0);
				#endif

				GetSurfaceData(surfaceDescription, angleFadeFactor, surfaceData);

				InputData inputData;
				InitializeInputData(packedInput, positionWS, surfaceData.normalWS.xyz, viewDirectionWS, inputData);

				SurfaceData surface = (SurfaceData)0;
				GetSurface(surfaceData, surface);

				BRDFData brdfData;
				InitializeBRDFData(surface.albedo, surface.metallic, 0, surface.smoothness, surface.alpha, brdfData);

				#ifdef _MATERIAL_AFFECTS_ALBEDO
					#ifdef DECAL_RECONSTRUCT_NORMAL
						half3 normalGI = normalize(lerp(normalWS.xyz, surfaceData.normalWS.xyz, surfaceData.normalWS.w));
					#else
						half3 normalGI = surfaceData.normalWS.xyz;
					#endif

					Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
					MixRealtimeAndBakedGI(mainLight, normalGI, inputData.bakedGI, inputData.shadowMask);
					half3 color = GlobalIllumination(brdfData, inputData.bakedGI, surface.occlusion, normalGI, inputData.viewDirectionWS);
				#else
					half3 color = 0;
				#endif

				half3 packedNormalWS = PackNormal(surfaceData.normalWS.xyz);
				fragmentOutput.GBuffer0 = half4(surfaceData.baseColor.rgb, surfaceData.baseColor.a);
				fragmentOutput.GBuffer1 = 0;
				fragmentOutput.GBuffer2 = half4(packedNormalWS, surfaceData.normalWS.a);
				fragmentOutput.GBuffer3 = half4(surfaceData.emissive + color, surfaceData.baseColor.a);

				#if OUTPUT_SHADOWMASK
					fragmentOutput.GBuffer4 = inputData.shadowMask;
				#endif

                #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
                positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
                #endif

			}
            ENDHLSL
        }

		
        Pass
        {
            
			Name "DBufferMesh"
            Tags { "LightMode"="DBufferMesh" }

			Blend 0 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			Blend 1 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			Blend 2 SrcAlpha OneMinusSrcAlpha, Zero OneMinusSrcAlpha
			ZTest LEqual
			ZWrite Off
			ColorMask RGBA
			ColorMask RGBA 1
			ColorMask RGBA 2

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma editor_sync_compilation

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _DECAL_LAYERS

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_TEXCOORD1
            #define ATTRIBUTES_NEED_TEXCOORD2
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_NORMAL_WS
            #define VARYINGS_NEED_TANGENT_WS
            #define VARYINGS_NEED_TEXCOORD0

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DBUFFER_MESH

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

            #define ASE_NEEDS_VERT_NORMAL
            #define ASE_NEEDS_VERT_TANGENT


			struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
			};

			struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 texCoord0 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(PackedVaryings input, SurfaceDescription surfaceDescription, out DecalSurfaceData surfaceData)
            {
                #if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
                #endif

                half fadeFactor = half(1.0);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    float sgn = input.tangentWS.w;
                    float3 bitangent = sgn * cross(input.normalWS.xyz, input.tangentWS.xyz);
                    half3x3 tangentToWorld = half3x3(input.tangentWS.xyz, bitangent.xyz, input.normalWS.xyz);

                    surfaceData.normalWS.xyz = normalize(TransformTangentToWorld(surfaceDescription.NormalTS, tangentToWorld));
                #else
                    surfaceData.normalWS.xyz = half3(input.normalWS);
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			void MeshDecalsPositionZBias(inout PackedVaryings input)
			{
            #if UNITY_REVERSED_Z
				input.positionCS.z -= _DecalMeshDepthBias;
            #else
				input.positionCS.z += _DecalMeshDepthBias;
            #endif
			}

			PackedVaryings Vert(Attributes inputMesh  )
			{
				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_VIEW_BIAS)
				{
					float3 viewDirectionOS = GetObjectSpaceNormalizeViewDir(inputMesh.positionOS);
					inputMesh.positionOS += viewDirectionOS * (_DecalMeshViewBias);
				}

				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				packedOutput.ase_texcoord4.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord4.w = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);

				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				packedOutput.positionWS.xyz =  positionWS;
				packedOutput.normalWS.xyz =  normalWS;
				packedOutput.tangentWS.xyzw =  tangentWS;
				packedOutput.texCoord0.xyzw =  inputMesh.uv0;
				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_DEPTH_BIAS)
				{
					MeshDecalsPositionZBias(packedOutput);
				}

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				OUTPUT_DBUFFER(outDBuffer)
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif

				#if defined(DECAL_RECONSTRUCT_NORMAL)
					#if defined(_DECAL_NORMAL_BLEND_HIGH)
						half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
					#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
						half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
					#else
						half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
					#endif
				#elif defined(DECAL_LOAD_NORMAL)
					half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
				#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;
				float3 positionWS = packedInput.positionWS.xyz;
				half3 viewDirectionWS = half3(1.0, 1.0, 1.0);

				DecalSurfaceData surfaceData;
				SurfaceDescription surfaceDescription;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( packedInput.texCoord0.xy - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( packedInput.tangentWS.xyz.x, ase_worldBitangent.x, packedInput.normalWS.x );
				float3 tanToWorld1 = float3( packedInput.tangentWS.xyz.y, ase_worldBitangent.y, packedInput.normalWS.y );
				float3 tanToWorld2 = float3( packedInput.tangentWS.xyz.z, ase_worldBitangent.z, packedInput.normalWS.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - packedInput.positionWS );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl199_g58192 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( packedInput.normalWS, ase_worldViewDir );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float lerpResult152_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityMOASChannel);
				float lerpResult409_g58192 = lerp( lerpResult152_g58192 , ( lerpResult152_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult409_g58192;
				#endif

				GetSurfaceData(packedInput, surfaceDescription, surfaceData);
				ENCODE_INTO_DBUFFER(surfaceData, outDBuffer);

                #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
                positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
                #endif
			}

            ENDHLSL
        }

		
        Pass
        {
            
			Name "DecalScreenSpaceMesh"
            Tags { "LightMode"="DecalScreenSpaceMesh" }

			Blend SrcAlpha OneMinusSrcAlpha
			ZTest LEqual
			ZWrite Off

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define USE_UNITY_CROSSFADE 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma editor_sync_compilation

			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH
			#pragma multi_compile _ _DECAL_LAYERS

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_TEXCOORD1
            #define ATTRIBUTES_NEED_TEXCOORD2
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_NORMAL_WS
            #define VARYINGS_NEED_VIEWDIRECTION_WS
            #define VARYINGS_NEED_TANGENT_WS
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
            #define VARYINGS_NEED_SH
            #define VARYINGS_NEED_STATIC_LIGHTMAP_UV
            #define VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DECAL_SCREEN_SPACE_MESH

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT


            struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
				float3 Emission;
			};

            struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 texCoord0 : TEXCOORD3;
				float3 viewDirectionWS : TEXCOORD4;
				float2 staticLightmapUV : TEXCOORD5;
				float2 dynamicLightmapUV : TEXCOORD6;
				float3 sh : TEXCOORD7;
				float4 fogFactorAndVertexLight : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(PackedVaryings input, SurfaceDescription surfaceDescription, out DecalSurfaceData surfaceData)
            {
                #if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
                #endif

                half fadeFactor = half(1.0);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceData.emissive.rgb = half3(surfaceDescription.Emission.rgb * fadeFactor);
				#endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    float sgn = input.tangentWS.w;
                    float3 bitangent = sgn * cross(input.normalWS.xyz, input.tangentWS.xyz);
                    half3x3 tangentToWorld = half3x3(input.tangentWS.xyz, bitangent.xyz, input.normalWS.xyz);

                    surfaceData.normalWS.xyz = normalize(TransformTangentToWorld(surfaceDescription.NormalTS, tangentToWorld));
                #else
                    surfaceData.normalWS.xyz = half3(input.normalWS);
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }


            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			void MeshDecalsPositionZBias(inout PackedVaryings input)
			{
			#if UNITY_REVERSED_Z
				input.positionCS.z -= _DecalMeshDepthBias;
			#else
				input.positionCS.z += _DecalMeshDepthBias;
			#endif
			}

			void InitializeInputData(PackedVaryings input, float3 positionWS, half3 normalWS, half3 viewDirectionWS, out InputData inputData)
			{
				inputData = (InputData)0;

				inputData.positionWS = positionWS;
				inputData.normalWS = normalWS;
				inputData.viewDirectionWS = viewDirectionWS;

				inputData.shadowCoord = float4(0, 0, 0, 0);

				#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
					inputData.fogCoord = half(input.fogFactorAndVertexLight.x);
					inputData.vertexLighting = half3(input.fogFactorAndVertexLight.yzw);
				#endif

				#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, input.dynamicLightmapUV.xy, half3(input.sh), normalWS);
				#elif defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, half3(input.sh), normalWS);
				#endif

				#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.staticLightmapUV);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV && LIGHTMAP_ON)
						inputData.staticLightmapUV = input.staticLightmapUV;
					#elif defined(VARYINGS_NEED_SH)
						inputData.vertexSH = input.sh;
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);
			}

			void GetSurface(DecalSurfaceData decalSurfaceData, inout SurfaceData surfaceData)
			{
				surfaceData.albedo = decalSurfaceData.baseColor.rgb;
				surfaceData.metallic = saturate(decalSurfaceData.metallic);
				surfaceData.specular = 0;
				surfaceData.smoothness = saturate(decalSurfaceData.smoothness);
				surfaceData.occlusion = decalSurfaceData.occlusion;
				surfaceData.emission = decalSurfaceData.emissive;
				surfaceData.alpha = saturate(decalSurfaceData.baseColor.w);
				surfaceData.clearCoatMask = 0;
				surfaceData.clearCoatSmoothness = 1;
			}

			PackedVaryings Vert(Attributes inputMesh  )
			{
				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_VIEW_BIAS)
				{
					float3 viewDirectionOS = GetObjectSpaceNormalizeViewDir(inputMesh.positionOS);
					inputMesh.positionOS += viewDirectionOS * (_DecalMeshViewBias);
				}

				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				packedOutput.ase_texcoord9.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord9.w = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);
				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				half fogFactor = 0;
				#if !defined(_FOG_FRAGMENT)
					fogFactor = ComputeFogFactor(packedOutput.positionCS.z);
				#endif

				half3 vertexLight = VertexLighting(positionWS, normalWS);
				packedOutput.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_DEPTH_BIAS)
				{
					MeshDecalsPositionZBias(packedOutput);
				}

				packedOutput.positionWS.xyz = positionWS;
				packedOutput.normalWS.xyz =  normalWS;
				packedOutput.tangentWS.xyzw =  tangentWS;
				packedOutput.texCoord0.xyzw =  inputMesh.uv0;
				packedOutput.viewDirectionWS.xyz =  GetWorldSpaceViewDir(positionWS);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(inputMesh.uv1, unity_LightmapST, packedOutput.staticLightmapUV);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					packedOutput.dynamicLightmapUV.xy = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					packedOutput.sh = float3(SampleSHVertex(half3(normalWS)));
				#endif

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
						out half4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif

				#if defined(DECAL_RECONSTRUCT_NORMAL)
					#if defined(_DECAL_NORMAL_BLEND_HIGH)
						half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
					#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
						half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
					#else
						half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
					#endif
				#elif defined(DECAL_LOAD_NORMAL)
					half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
				#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;
				float3 positionWS = packedInput.positionWS.xyz;
				half3 viewDirectionWS = half3(packedInput.viewDirectionWS);

				DecalSurfaceData surfaceData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( packedInput.texCoord0.xy - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 ase_worldBitangent = packedInput.ase_texcoord9.xyz;
				float3 tanToWorld0 = float3( packedInput.tangentWS.xyz.x, ase_worldBitangent.x, packedInput.normalWS.x );
				float3 tanToWorld1 = float3( packedInput.tangentWS.xyz.y, ase_worldBitangent.y, packedInput.normalWS.y );
				float3 tanToWorld2 = float3( packedInput.tangentWS.xyz.z, ase_worldBitangent.z, packedInput.normalWS.z );
				float3 worldRefl199_g58192 = normalize( reflect( -packedInput.viewDirectionWS, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( packedInput.normalWS, packedInput.viewDirectionWS );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float lerpResult152_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityMOASChannel);
				float lerpResult409_g58192 = lerp( lerpResult152_g58192 , ( lerpResult152_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult409_g58192;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = float3(0, 0, 0);
				#endif

				GetSurfaceData(packedInput, surfaceDescription, surfaceData);

				#ifdef DECAL_RECONSTRUCT_NORMAL
					surfaceData.normalWS.xyz = normalize(lerp(normalWS.xyz, surfaceData.normalWS.xyz, surfaceData.normalWS.w));
				#endif

				InputData inputData;
				InitializeInputData(packedInput, positionWS, surfaceData.normalWS.xyz, viewDirectionWS, inputData);

				SurfaceData surface = (SurfaceData)0;
				GetSurface(surfaceData, surface);

				half4 color = UniversalFragmentPBR(inputData, surface);
				color.rgb = MixFog(color.rgb, inputData.fogCoord);
				outColor = color;

                #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
                positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
                #endif

			}
            ENDHLSL
        }

		
        Pass
        {
            
			Name "DecalGBufferMesh"
            Tags { "LightMode"="DecalGBufferMesh" }

			Blend 0 SrcAlpha OneMinusSrcAlpha
			Blend 1 SrcAlpha OneMinusSrcAlpha
			Blend 2 SrcAlpha OneMinusSrcAlpha
			Blend 3 SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			ColorMask RGB
			ColorMask 0 1
			ColorMask RGB 2
			ColorMask RGB 3

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define USE_UNITY_CROSSFADE 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma editor_sync_compilation

			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _DECAL_NORMAL_BLEND_LOW _DECAL_NORMAL_BLEND_MEDIUM _DECAL_NORMAL_BLEND_HIGH
			#pragma multi_compile _ _DECAL_LAYERS
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_TEXCOORD1
            #define ATTRIBUTES_NEED_TEXCOORD2
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_NORMAL_WS
            #define VARYINGS_NEED_VIEWDIRECTION_WS
            #define VARYINGS_NEED_TANGENT_WS
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
            #define VARYINGS_NEED_SH
            #define VARYINGS_NEED_STATIC_LIGHTMAP_UV
            #define VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DECAL_GBUFFER_MESH

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
			#endif

			

			
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT


			struct SurfaceDescription
			{
				float3 BaseColor;
				float Alpha;
				float3 NormalTS;
				float NormalAlpha;
				float Metallic;
				float Occlusion;
				float Smoothness;
				float MAOSAlpha;
				float3 Emission;
			};

            struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 texCoord0 : TEXCOORD3;
				float3 viewDirectionWS : TEXCOORD4;
				float2 staticLightmapUV : TEXCOORD5;
				float2 dynamicLightmapUV : TEXCOORD6;
				float3 sh : TEXCOORD7;
				float4 fogFactorAndVertexLight : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float WaterMaskfloatswitch33_g58192( float m_switch, float m_Red, float m_Green, float m_Blue, float m_Alpha )
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
			

            void GetSurfaceData(PackedVaryings input, SurfaceDescription surfaceDescription, out DecalSurfaceData surfaceData)
            {
                #if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
                #endif

                half fadeFactor = half(1.0);

                ZERO_INITIALIZE(DecalSurfaceData, surfaceData);
                surfaceData.occlusion = half(1.0);
                surfaceData.smoothness = half(0);

                #ifdef _MATERIAL_AFFECTS_NORMAL
                    surfaceData.normalWS.w = half(1.0);
                #else
                    surfaceData.normalWS.w = half(0.0);
                #endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceData.emissive.rgb = half3(surfaceDescription.Emission.rgb * fadeFactor);
				#endif

                surfaceData.baseColor.xyz = half3(surfaceDescription.BaseColor);
                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);

                #if defined(_MATERIAL_AFFECTS_NORMAL)
                    float sgn = input.tangentWS.w;
                    float3 bitangent = sgn * cross(input.normalWS.xyz, input.tangentWS.xyz);
                    half3x3 tangentToWorld = half3x3(input.tangentWS.xyz, bitangent.xyz, input.normalWS.xyz);

                    surfaceData.normalWS.xyz = normalize(TransformTangentToWorld(surfaceDescription.NormalTS, tangentToWorld));
                #else
                    surfaceData.normalWS.xyz = half3(input.normalWS);
                #endif

                surfaceData.normalWS.w = surfaceDescription.NormalAlpha * fadeFactor;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceData.metallic = half(surfaceDescription.Metallic);
					surfaceData.occlusion = half(surfaceDescription.Occlusion);
					surfaceData.smoothness = half(surfaceDescription.Smoothness);
					surfaceData.MAOSAlpha = half(surfaceDescription.MAOSAlpha * fadeFactor);
				#endif
            }

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			void MeshDecalsPositionZBias(inout PackedVaryings input)
			{
			#if UNITY_REVERSED_Z
				input.positionCS.z -= _DecalMeshDepthBias;
			#else
				input.positionCS.z += _DecalMeshDepthBias;
			#endif
			}

			void InitializeInputData(PackedVaryings input, float3 positionWS, half3 normalWS, half3 viewDirectionWS, out InputData inputData)
			{
				inputData = (InputData)0;

				inputData.positionWS = positionWS;
				inputData.normalWS = normalWS;
				inputData.viewDirectionWS = viewDirectionWS;

				inputData.shadowCoord = float4(0, 0, 0, 0);

				inputData.fogCoord = half(input.fogFactorAndVertexLight.x);
				inputData.vertexLighting = half3(input.fogFactorAndVertexLight.yzw);

				#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, input.dynamicLightmapUV.xy, half3(input.sh), normalWS);
				#elif defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.bakedGI = SAMPLE_GI(input.staticLightmapUV, half3(input.sh), normalWS);
				#endif

				#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV)
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.staticLightmapUV);
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(VARYINGS_NEED_DYNAMIC_LIGHTMAP_UV) && defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(VARYINGS_NEED_STATIC_LIGHTMAP_UV && LIGHTMAP_ON)
						inputData.staticLightmapUV = input.staticLightmapUV;
					#elif defined(VARYINGS_NEED_SH)
						inputData.vertexSH = input.sh;
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);
			}

			void GetSurface(DecalSurfaceData decalSurfaceData, inout SurfaceData surfaceData)
			{
				surfaceData.albedo = decalSurfaceData.baseColor.rgb;
				surfaceData.metallic = saturate(decalSurfaceData.metallic);
				surfaceData.specular = 0;
				surfaceData.smoothness = saturate(decalSurfaceData.smoothness);
				surfaceData.occlusion = decalSurfaceData.occlusion;
				surfaceData.emission = decalSurfaceData.emissive;
				surfaceData.alpha = saturate(decalSurfaceData.baseColor.w);
				surfaceData.clearCoatMask = 0;
				surfaceData.clearCoatSmoothness = 1;
			}

			PackedVaryings Vert(Attributes inputMesh  )
			{
				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_VIEW_BIAS)
				{
					float3 viewDirectionOS = GetObjectSpaceNormalizeViewDir(inputMesh.positionOS);
					inputMesh.positionOS += viewDirectionOS * (_DecalMeshViewBias);
				}

				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				packedOutput.ase_texcoord9.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord9.w = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				if (_DecalMeshBiasType == DECALMESHDEPTHBIASTYPE_DEPTH_BIAS)
				{
					MeshDecalsPositionZBias(packedOutput);
				}

				packedOutput.positionWS.xyz = positionWS;
				packedOutput.normalWS.xyz =  normalWS;
				packedOutput.tangentWS.xyzw =  tangentWS;
				packedOutput.texCoord0.xyzw =  inputMesh.uv0;
				packedOutput.viewDirectionWS.xyz =  GetWorldSpaceViewDir(positionWS);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(inputMesh.uv1, unity_LightmapST, packedOutput.staticLightmapUV);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					packedOutput.dynamicLightmapUV.xy = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					packedOutput.sh.xyz =  float3(SampleSHVertex(half3(normalWS)));
				#endif

				half fogFactor = 0;
				#if !defined(_FOG_FRAGMENT)
						fogFactor = ComputeFogFactor(packedOutput.positionCS.z);
				#endif

				half3 vertexLight = VertexLighting(positionWS, normalWS);
				packedOutput.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out FragmentOutput fragmentOutput
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				half angleFadeFactor = 1.0;

            #ifdef _DECAL_LAYERS
            #ifdef _RENDER_PASS_ENABLED
				uint surfaceRenderingLayer = DecodeMeshRenderingLayer(LOAD_FRAMEBUFFER_INPUT(GBUFFER4, packedInput.positionCS.xy).r);
            #else
				uint surfaceRenderingLayer = LoadSceneRenderingLayer(packedInput.positionCS.xy);
            #endif
				uint projectorRenderingLayer = uint(UNITY_ACCESS_INSTANCED_PROP(Decal, _DecalLayerMaskFromDecal));
				clip((surfaceRenderingLayer & projectorRenderingLayer) - 0.1);
            #endif

			#if defined(DECAL_RECONSTRUCT_NORMAL)
				#if defined(_DECAL_NORMAL_BLEND_HIGH)
					half3 normalWS = half3(ReconstructNormalTap9(packedInput.positionCS.xy));
				#elif defined(_DECAL_NORMAL_BLEND_MEDIUM)
					half3 normalWS = half3(ReconstructNormalTap5(packedInput.positionCS.xy));
				#else
					half3 normalWS = half3(ReconstructNormalDerivative(packedInput.positionCS.xy));
				#endif
			#elif defined(DECAL_LOAD_NORMAL)
				half3 normalWS = half3(LoadSceneNormals(packedInput.positionCS.xy));
			#endif

				float2 positionSS = packedInput.positionCS.xy * _ScreenSize.zw;
				float3 positionWS = packedInput.positionWS.xyz;
				half3 viewDirectionWS = half3(packedInput.viewDirectionWS);

				DecalSurfaceData surfaceData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( packedInput.texCoord0.xy - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 ase_worldBitangent = packedInput.ase_texcoord9.xyz;
				float3 tanToWorld0 = float3( packedInput.tangentWS.xyz.x, ase_worldBitangent.x, packedInput.normalWS.x );
				float3 tanToWorld1 = float3( packedInput.tangentWS.xyz.y, ase_worldBitangent.y, packedInput.normalWS.y );
				float3 tanToWorld2 = float3( packedInput.tangentWS.xyz.z, ase_worldBitangent.z, packedInput.normalWS.z );
				float3 worldRefl199_g58192 = normalize( reflect( -packedInput.viewDirectionWS, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( packedInput.normalWS, packedInput.viewDirectionWS );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				
				float m_switch33_g58192 = _BaseColorMapChannel;
				float localStochasticTiling159_g58197 = ( 0.0 );
				float2 UV159_g58197 = temp_output_370_0_g58192;
				float4 TexelSize159_g58197 = _BaseColorMap_TexelSize;
				float4 Offsets159_g58197 = float4( 0,0,0,0 );
				float2 Weights159_g58197 = float2( 0,0 );
				{
				UV159_g58197 = UV159_g58197 * TexelSize159_g58197.zw - 0.5;
				float2 f = frac( UV159_g58197 );
				UV159_g58197 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58197.x - 0.5, UV159_g58197.x + 1.5, UV159_g58197.y - 0.5, UV159_g58197.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58197 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58197.xyxy;
				Weights159_g58197 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58196 = Offsets159_g58197;
				float2 Input_FetchWeights143_g58196 = Weights159_g58197;
				float2 break46_g58196 = Input_FetchWeights143_g58196;
				float4 lerpResult20_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yw ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xw ) , break46_g58196.x);
				float4 lerpResult40_g58196 = lerp( SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).yz ) , SAMPLE_TEXTURE2D( _BaseColorMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58196).xz ) , break46_g58196.x);
				float4 lerpResult22_g58196 = lerp( lerpResult20_g58196 , lerpResult40_g58196 , break46_g58196.y);
				float4 Output_Fetch2D44_g58196 = lerpResult22_g58196;
				float4 break50_g58196 = Output_Fetch2D44_g58196;
				float temp_output_336_155_g58192 = break50_g58196.r;
				float m_Red33_g58192 = ( temp_output_336_155_g58192 * temp_output_336_155_g58192 );
				float temp_output_336_152_g58192 = break50_g58196.g;
				float m_Green33_g58192 = ( temp_output_336_152_g58192 * temp_output_336_152_g58192 );
				float temp_output_336_153_g58192 = break50_g58196.b;
				float m_Blue33_g58192 = ( temp_output_336_153_g58192 * temp_output_336_153_g58192 );
				float temp_output_336_154_g58192 = break50_g58196.a;
				float m_Alpha33_g58192 = ( temp_output_336_154_g58192 * temp_output_336_154_g58192 );
				float localWaterMaskfloatswitch33_g58192 = WaterMaskfloatswitch33_g58192( m_switch33_g58192 , m_Red33_g58192 , m_Green33_g58192 , m_Blue33_g58192 , m_Alpha33_g58192 );
				float temp_output_182_0_g58192 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_180_0_g58192 = ( ( saturate( ( _WaterLevel * 10.0 ) ) * saturate( (0.0 + (localWaterMaskfloatswitch33_g58192 - 0.0) * (( ( saturate( ( _WaterLevel + -0.1 ) ) * 50.0 ) + 1.0 ) - 0.0) / (1.0 - 0.0)) ) ) * temp_output_182_0_g58192 );
				float3 worldToObj6_g58211 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g58211 = ( worldToObj6_g58211 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g58211 = ( temp_output_3_0_g58211 * ( 1.0 - temp_output_3_0_g58211 ) );
				float temp_output_12_0_g58211 = ( ( break10_g58211.x * break10_g58211.y ) * break10_g58211.z );
				float temp_output_413_0_g58192 = saturate( ( ( temp_output_12_0_g58211 * temp_output_12_0_g58211 ) * 500000.0 ) );
				float lerpResult410_g58192 = lerp( temp_output_180_0_g58192 , ( temp_output_180_0_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				
				float localStochasticTiling159_g58200 = ( 0.0 );
				float2 UV159_g58200 = temp_output_370_0_g58192;
				float4 TexelSize159_g58200 = _MaskMap_TexelSize;
				float4 Offsets159_g58200 = float4( 0,0,0,0 );
				float2 Weights159_g58200 = float2( 0,0 );
				{
				UV159_g58200 = UV159_g58200 * TexelSize159_g58200.zw - 0.5;
				float2 f = frac( UV159_g58200 );
				UV159_g58200 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58200.x - 0.5, UV159_g58200.x + 1.5, UV159_g58200.y - 0.5, UV159_g58200.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58200 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58200.xyxy;
				Weights159_g58200 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58201 = Offsets159_g58200;
				float2 Input_FetchWeights143_g58201 = Weights159_g58200;
				float2 break46_g58201 = Input_FetchWeights143_g58201;
				float4 lerpResult20_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yw ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xw ) , break46_g58201.x);
				float4 lerpResult40_g58201 = lerp( SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).yz ) , SAMPLE_TEXTURE2D( _MaskMap, sampler_BaseColorMap, (Input_FetchOffsets70_g58201).xz ) , break46_g58201.x);
				float4 lerpResult22_g58201 = lerp( lerpResult20_g58201 , lerpResult40_g58201 , break46_g58201.y);
				float4 Output_Fetch2D44_g58201 = lerpResult22_g58201;
				float4 break50_g58201 = Output_Fetch2D44_g58201;
				float temp_output_360_153_g58192 = break50_g58201.b;
				float temp_output_153_0_g58192 = ( temp_output_360_153_g58192 * temp_output_182_0_g58192 );
				float lerpResult151_g58192 = lerp( temp_output_180_0_g58192 , temp_output_153_0_g58192 , _DecalOpacityNormalChannel);
				float lerpResult408_g58192 = lerp( lerpResult151_g58192 , ( lerpResult151_g58192 * temp_output_413_0_g58192 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult249_g58192;
				surfaceDescription.Alpha = lerpResult410_g58192;
				surfaceDescription.NormalTS = unpack80_g58192;
				surfaceDescription.NormalAlpha = lerpResult408_g58192;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( break50_g58201.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( break50_g58201.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( temp_output_360_153_g58192 * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = 1;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = float3(0, 0, 0);
				#endif

				GetSurfaceData(packedInput, surfaceDescription, surfaceData);

				InputData inputData;
				InitializeInputData(packedInput, positionWS, surfaceData.normalWS.xyz, viewDirectionWS, inputData);

				SurfaceData surface = (SurfaceData)0;
				GetSurface(surfaceData, surface);

				BRDFData brdfData;
				InitializeBRDFData(surface.albedo, surface.metallic, 0, surface.smoothness, surface.alpha, brdfData);

				#ifdef _MATERIAL_AFFECTS_ALBEDO
					#ifdef DECAL_RECONSTRUCT_NORMAL
						half3 normalGI = normalize(lerp(normalWS.xyz, surfaceData.normalWS.xyz, surfaceData.normalWS.w));
					#else
						half3 normalGI = surfaceData.normalWS.xyz;
					#endif

					Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
					MixRealtimeAndBakedGI(mainLight, normalGI, inputData.bakedGI, inputData.shadowMask);
					half3 color = GlobalIllumination(brdfData, inputData.bakedGI, surface.occlusion, normalGI, inputData.viewDirectionWS);
				#else
					half3 color = 0;
				#endif

				half3 packedNormalWS = PackNormal(surfaceData.normalWS.xyz);
				fragmentOutput.GBuffer0 = half4(surfaceData.baseColor.rgb, surfaceData.baseColor.a);
				fragmentOutput.GBuffer1 = 0;
				fragmentOutput.GBuffer2 = half4(packedNormalWS, surfaceData.normalWS.a);
				fragmentOutput.GBuffer3 = half4(surfaceData.emissive + color, surfaceData.baseColor.a);

				#if OUTPUT_SHADOWMASK
					fragmentOutput.GBuffer4 = inputData.shadowMask;
				#endif

                #if defined(_FOVEATED_RENDERING_NON_UNIFORM_RASTER)
                positionSS = RemapFoveatedRenderingDistortCS(packedInput.positionCS.xy, true) * _ScreenSize.zw;
                #endif

			}

            ENDHLSL
        }

		
        Pass
        {
            
			Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull Back

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define ASE_SRP_VERSION 140010
			#ifdef UNITY_COLORSPACE_GAMMA//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(2.0, 2.0, 2.0, 2.0)//ASE Color Space Def
			#else // Linear values//ASE Color Space Def
			#define unity_ColorSpaceDouble half4(4.59479380, 4.59479380, 4.59479380, 2.0)//ASE Color Space Def
			#endif//ASE Color Space Def
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile_instancing
			#pragma editor_sync_compilation
			#pragma vertex Vert
			#pragma fragment Frag

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_DEPTHONLY
			#define SCENEPICKINGPASS 1

			#if _RENDER_PASS_ENABLED
			#define GBUFFER3 0
			#define GBUFFER4 1
			FRAMEBUFFER_INPUT_HALF(GBUFFER3);
			FRAMEBUFFER_INPUT_HALF(GBUFFER4);
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
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DecalInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderVariablesDecal.hlsl"

			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL


			struct Attributes
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
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
			half4 _DecalColor;
			float4 _NormalMap_TexelSize;
			float4 _MaskMap_TexelSize;
			float4 _BaseColorMap_TexelSize;
			float _CATEGORY_REFLECTION;
			half _DecalReflectionEnable;
			float _SPACE_REFLECTION;
			half _WaterLevel;
			half _BaseColorMapChannel;
			half _DecalOpacityGlobal;
			float _SPACE_OPACITY;
			half _DecalReflectionEnableFresnel;
			float _DecalEdgeMask;
			half _DecalOpacityNormalChannel;
			half _MetallicStrength;
			half _OcclusionStrengthAO;
			float _CATEGORY_OPACITY;
			half _DecalReflectionFresnelScale;
			half _DecalReflectionFresnelBias;
			half _DecalReflectionFresnelStrength;
			half _DecalReflectionCloud;
			half _DecalReflectionSmoothness;
			half _DecalReflectionWobble;
			half _WaterReflectionBumpClamp;
			half _DecalReflectionBumpScale;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			half _UVRotation;
			float _DecalColorSpaceDouble;
			half _DecalMainLightInfluence;
			half _SmoothnessStrength;
			half _DecalOpacityMOASChannel;
			float _DrawOrder;
			float _DecalMeshBiasType;
			float _DecalMeshDepthBias;
			float _DecalMeshViewBias;
			#if defined(DECAL_ANGLE_FADE)
			float _DecalAngleFadeSupported;
			#endif
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
				float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
            #endif

			TEXTURECUBE(_WaterReflectionCubemap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);


			float3 GetMainLightColorNode10_g58210( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR)
            #define DECAL_PROJECTOR
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_MESH) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_MESH
            #endif

            #if (SHADERPASS == SHADERPASS_DBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DBUFFER_MESH)
            #define DECAL_DBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_SCREEN_SPACE_MESH)
            #define DECAL_SCREEN_SPACE
            #endif

            #if (SHADERPASS == SHADERPASS_DECAL_GBUFFER_PROJECTOR) || (SHADERPASS == SHADERPASS_DECAL_GBUFFER_MESH)
            #define DECAL_GBUFFER
            #endif

            #if (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_PROJECTOR) || (SHADERPASS == SHADERPASS_FORWARD_EMISSIVE_MESH)
            #define DECAL_FORWARD_EMISSIVE
            #endif

            #if ((!defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_ALBEDO)) || (defined(_MATERIAL_AFFECTS_NORMAL) && defined(_MATERIAL_AFFECTS_NORMAL_BLEND))) && (defined(DECAL_SCREEN_SPACE) || defined(DECAL_GBUFFER))
            #define DECAL_RECONSTRUCT_NORMAL
            #elif defined(DECAL_ANGLE_FADE)
            #define DECAL_LOAD_NORMAL
            #endif

            #ifdef _DECAL_LAYERS
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareRenderingLayerTexture.hlsl"
            #endif

            #if defined(DECAL_LOAD_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
            #endif

            #if defined(DECAL_PROJECTOR) || defined(DECAL_RECONSTRUCT_NORMAL)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
            #endif

            #ifdef DECAL_MESH
            #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DecalMeshBiasTypeEnum.cs.hlsl"
            #endif

            #ifdef DECAL_RECONSTRUCT_NORMAL
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/NormalReconstruction.hlsl"
            #endif

			PackedVaryings Vert(Attributes inputMesh  )
			{
				PackedVaryings packedOutput;
				ZERO_INITIALIZE(PackedVaryings, packedOutput);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, packedOutput);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(packedOutput);

				inputMesh.tangentOS = float4( 1, 0, 0, -1 );
				inputMesh.normalOS = float3( 0, 1, 0 );

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				packedOutput.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				packedOutput.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				packedOutput.ase_texcoord3.xyz = ase_worldBitangent;
				float3 ase_worldPos = TransformObjectToWorld( (inputMesh.positionOS).xyz );
				packedOutput.ase_texcoord4.xyz = ase_worldPos;
				
				packedOutput.ase_texcoord.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord.w = 0;
				packedOutput.ase_texcoord1.w = 0;
				packedOutput.ase_texcoord2.w = 0;
				packedOutput.ase_texcoord3.w = 0;
				packedOutput.ase_texcoord4.w = 0;

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out float4 outColor : SV_Target0
				
			)
			{
				float3 temp_output_329_0_g58192 = (_DecalColor).rgb;
				float3 Color10_g58210 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g58210 = GetMainLightColorNode10_g58210( Color10_g58210 );
				float3 lerpResult143_g58192 = lerp( temp_output_329_0_g58192 , ( temp_output_329_0_g58192 * Color10_g58210 ) , _DecalMainLightInfluence);
				float3 lerpResult192_g58192 = lerp( lerpResult143_g58192 , ( lerpResult143_g58192 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				float localStochasticTiling159_g58199 = ( 0.0 );
				float temp_output_6_0_g58204 = _UVRotation;
				float temp_output_200_0_g58204 = radians( temp_output_6_0_g58204 );
				float temp_output_13_0_g58204 = cos( temp_output_200_0_g58204 );
				float2 temp_output_9_0_g58204 = float2( 0.5,0.5 );
				float2 break39_g58204 = ( packedInput.ase_texcoord.xyz.xy - temp_output_9_0_g58204 );
				float temp_output_14_0_g58204 = sin( temp_output_200_0_g58204 );
				float2 appendResult36_g58204 = (float2(( ( temp_output_13_0_g58204 * break39_g58204.x ) + ( temp_output_14_0_g58204 * break39_g58204.y ) ) , ( ( temp_output_13_0_g58204 * break39_g58204.y ) - ( temp_output_14_0_g58204 * break39_g58204.x ) )));
				float2 Offset235_g58204 = float2( 0,0 );
				float2 temp_output_41_0_g58204 = ( ( ( appendResult36_g58204 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g58204 ) + Offset235_g58204 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_370_0_g58192 = ( temp_output_41_0_g58204 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float2 UV159_g58199 = temp_output_370_0_g58192;
				float4 TexelSize159_g58199 = _NormalMap_TexelSize;
				float4 Offsets159_g58199 = float4( 0,0,0,0 );
				float2 Weights159_g58199 = float2( 0,0 );
				{
				UV159_g58199 = UV159_g58199 * TexelSize159_g58199.zw - 0.5;
				float2 f = frac( UV159_g58199 );
				UV159_g58199 -= f;
				float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
				float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
				float4 xs = xn * xn * xn;
				float4 ys = yn * yn * yn;
				float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
				float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
				float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
				float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
				float4 c = float4( UV159_g58199.x - 0.5, UV159_g58199.x + 1.5, UV159_g58199.y - 0.5, UV159_g58199.y + 1.5 );
				float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
				float w0 = s.x / ( s.x + s.y );
				float w1 = s.z / ( s.z + s.w );
				Offsets159_g58199 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize159_g58199.xyxy;
				Weights159_g58199 = float2( w0, w1 );
				}
				float4 Input_FetchOffsets70_g58198 = Offsets159_g58199;
				float2 Input_FetchWeights143_g58198 = Weights159_g58199;
				float2 break46_g58198 = Input_FetchWeights143_g58198;
				float4 lerpResult20_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yw ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xw ) , break46_g58198.x);
				float4 lerpResult40_g58198 = lerp( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).yz ) , SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, (Input_FetchOffsets70_g58198).xz ) , break46_g58198.x);
				float4 lerpResult22_g58198 = lerp( lerpResult20_g58198 , lerpResult40_g58198 , break46_g58198.y);
				float4 Output_Fetch2D44_g58198 = lerpResult22_g58198;
				float3 unpack80_g58192 = UnpackNormalScale( Output_Fetch2D44_g58198, ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack80_g58192.z = lerp( 1, unpack80_g58192.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				float3 Normal255_g58192 = unpack80_g58192;
				float2 temp_cast_1 = (-_WaterReflectionBumpClamp).xx;
				float2 temp_cast_2 = (_WaterReflectionBumpClamp).xx;
				float2 clampResult200_g58192 = clamp( ( (( Normal255_g58192 * 50.0 )).xy * _DecalReflectionBumpScale ) , temp_cast_1 , temp_cast_2 );
				float4 appendResult228_g58192 = (float4(1.0 , 0.0 , 1.0 , Normal255_g58192.x));
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = packedInput.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl199_g58192 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld1, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ), dot( tanToWorld2, ASEUnpackNormalRGB(appendResult228_g58192,0.15) ) ) ) );
				float4 texCUBENode234_g58192 = SAMPLE_TEXTURECUBE_LOD( _WaterReflectionCubemap, sampler_BaseColorMap, ( float3( clampResult200_g58192 ,  0.0 ) + worldRefl199_g58192 + _DecalReflectionWobble ), ( 1.0 - _DecalReflectionSmoothness ) );
				float4 temp_cast_4 = (texCUBENode234_g58192.r).xxxx;
				float4 lerpResult221_g58192 = lerp( texCUBENode234_g58192 , temp_cast_4 , _DecalReflectionCloud);
				float3 temp_output_330_0_g58192 = (lerpResult221_g58192).rgb;
				float fresnelNdotV206_g58192 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode206_g58192 = ( _DecalReflectionFresnelBias + _DecalReflectionFresnelScale * pow( max( 1.0 - fresnelNdotV206_g58192 , 0.0001 ), 5.0 ) );
				float3 lerpResult242_g58192 = lerp( float3( 0,0,0 ) , temp_output_330_0_g58192 , ( _DecalReflectionFresnelStrength * fresnelNode206_g58192 ));
				float3 lerpResult241_g58192 = lerp( temp_output_330_0_g58192 , lerpResult242_g58192 , _DecalReflectionEnableFresnel);
				float3 Reflection260_g58192 = lerpResult241_g58192;
				float3 lerpResult249_g58192 = lerp( lerpResult192_g58192 , ( ( ( 1.0 - 0.5 ) * Reflection260_g58192 ) + ( lerpResult192_g58192 * 0.5 ) ) , ( _DecalReflectionEnable + ( ( _CATEGORY_REFLECTION + _SPACE_REFLECTION ) * 0.0 ) ));
				

				float3 BaseColor = lerpResult249_g58192;

				outColor = _SelectionID;
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
Node;AmplifyShaderEditor.FunctionNode;102;-384,0;Inherit;False;DESF Core Decal Water Puddle;0;;58192;a596bb5dcebb7c345b64d3e066dd252e;9,145,1,82,1,116,0,112,0,115,0,129,0,128,0,127,0,319,1;0;8;FLOAT3;72;FLOAT;181;FLOAT3;62;FLOAT;175;FLOAT;172;FLOAT;171;FLOAT;170;FLOAT;176
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;103;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DBufferProjector;0;0;DBufferProjector;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DBufferProjector;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;104;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalProjectorForwardEmissive;0;1;DecalProjectorForwardEmissive;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;8;5;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalProjectorForwardEmissive;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;106;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalGBufferProjector;0;3;DecalGBufferProjector;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;True;1;False;;False;False;False;True;False;False;False;False;0;False;;False;True;True;True;True;False;0;False;;False;True;True;True;True;False;0;False;;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalGBufferProjector;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;107;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DBufferMesh;0;4;DBufferMesh;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DBufferMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;108;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalMeshForwardEmissive;0;5;DecalMeshForwardEmissive;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;8;5;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DecalMeshForwardEmissive;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;109;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalScreenSpaceMesh;0;6;DecalScreenSpaceMesh;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DecalScreenSpaceMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalGBufferMesh;0;7;DecalGBufferMesh;1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;True;True;True;True;False;0;False;;False;True;True;True;True;False;0;False;;False;False;False;True;2;False;;False;False;True;1;LightMode=DecalGBufferMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;111;0,0;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;ScenePickingPass;0;8;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;105;0,0;Float;False;True;-1;2;DE_ShaderGUI;0;14;DE Environment/Decal/Water Puddle;c2a467ab6d5391a4ea692226d82ffefd;True;DecalScreenSpaceProjector;0;2;DecalScreenSpaceProjector;9;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalScreenSpaceProjector;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;7;Affect BaseColor;1;0;Affect Normal;1;0;Blend;1;0;Affect MAOS;1;638177062788302379;Affect Emission;0;638177062851898892;Support LOD CrossFade;1;638177062874429604;Angle Fade;1;0;0;9;True;False;True;True;True;False;True;True;True;False;;True;0
WireConnection;105;0;102;72
WireConnection;105;1;102;181
WireConnection;105;2;102;62
WireConnection;105;3;102;175
WireConnection;105;4;102;172
WireConnection;105;5;102;171
WireConnection;105;6;102;170
WireConnection;105;7;102;176
ASEEND*/
//CHKSM=08F370C936A8ED98187C44C0BCC160A97F9D701E