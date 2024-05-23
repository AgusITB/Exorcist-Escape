// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader  "DE Environment/Decal/Standard"
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
        [DE_DrawerTextureSingleLine]_BaseColorMap("Base Map", 2D) = "black" {}
        _UVRotation("UV Rotation", Float) = 0
        [Normal][DE_DrawerTextureSingleLine]_NormalMap("Normal Map", 2D) = "bump" {}
        _NormalStrength("Normal Strength", Float) = 1
        [DE_DrawerTextureSingleLine]_MaskMap("Mask MAOS", 2D) = "white" {}
        _MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
        _OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
        _SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
        [DE_DrawerSpace(10)]_SPACE_DECALMAP("SPACE_DECAL MAP", Float) = 0
        [DE_DrawerCategory(EMISSION,true,_DecalEmissiveEnable,0,0)]_CATEGORY_EMISSION("CATEGORY_EMISSION", Float) = 1
        [DE_DrawerToggleLeft]_DecalEmissiveEnable("ENABLE EMISSION", Float) = 0
        [HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
        [DE_DrawerTextureSingleLine]_EmissiveColorMap("Emission Map", 2D) = "white" {}
        [DE_DrawerEmissionFlags]_EmissionFlags("Global Illumination", Float) = 0
        _EmissiveIntensity("Emissive Intensity", Float) = 1
        [DE_DrawerSpace(10)]_SPACE_EMISSION("SPACE_EMISSION", Float) = 0


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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				packedOutput.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord.zw = 0;

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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( texCoord0 - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness =( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
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
			
            Name "DecalProjectorForwardEmissive"
            Tags { "LightMode"="DecalProjectorForwardEmissive" }

			Cull Front
			Blend 0 SrcAlpha One
			ZTest Greater
			ZWrite Off

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define DECAL_ANGLE_FADE 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define _MATERIAL_AFFECTS_EMISSION 1
			#define USE_UNITY_CROSSFADE 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag
			#pragma multi_compile_instancing
			#pragma editor_sync_compilation

			#pragma multi_compile _ _DECAL_LAYERS

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"

            #define HAVE_MESH_MODIFICATION

            #define SHADERPASS SHADERPASS_FORWARD_EMISSIVE_PROJECTOR

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct SurfaceDescription
			{
				float Alpha;
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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_EmissiveColorMap);


			
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

                surfaceData.baseColor.w = half(surfaceDescription.Alpha * fadeFactor);
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

				packedOutput.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord.zw = 0;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(inputMesh.positionOS.xyz);
				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out half4 outEmissive : SV_Target0
				
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

				float2 texCoord0 = texCoord;
				float2 texCoord1 = texCoord;
				float2 texCoord2 = texCoord;
				float2 texCoord3 = texCoord;

				float3 worldTangent = TransformObjectToWorldDir(float3(1, 0, 0));
				float3 worldNormal = TransformObjectToWorldDir(float3(0, 1, 0));
				float3 worldBitangent = TransformObjectToWorldDir(float3(0, 0, 1));

				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( texCoord0 - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				surfaceDescription.Alpha = lerpResult613_g44348;

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
				#endif

				GetSurfaceData( surfaceDescription, angleFadeFactor, surfaceData);

				outEmissive.rgb = surfaceData.emissive;
				outEmissive.a = surfaceData.baseColor.a;

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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissiveColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				packedOutput.ase_texcoord6.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord6.zw = 0;

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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( texCoord0 - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;
				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissiveColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				packedOutput.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord5.zw = 0;

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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( texCoord0 - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion =saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( packedInput.texCoord0.xy - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
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
            
			Name "DecalMeshForwardEmissive"
            Tags { "LightMode"="DecalMeshForwardEmissive" }

			Blend 0 SrcAlpha One
			ZTest LEqual
			ZWrite Off

			HLSLPROGRAM

			#define _MATERIAL_AFFECTS_ALBEDO 1
			#define _MATERIAL_AFFECTS_NORMAL 1
			#define _MATERIAL_AFFECTS_NORMAL_BLEND 1
			#define  _MATERIAL_AFFECTS_MAOS 1
			#define _MATERIAL_AFFECTS_EMISSION 1
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

            #define SHADERPASS SHADERPASS_FORWARD_EMISSIVE_MESH

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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissiveColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			

            void GetSurfaceData(SurfaceDescription surfaceDescription, float4 positionCS, out DecalSurfaceData surfaceData)
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

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out half4 outEmissive : SV_Target0
				
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
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( packedInput.texCoord0.xy - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
				#endif

				GetSurfaceData(surfaceDescription, packedInput.positionCS, surfaceData);

				outEmissive.rgb = surfaceData.emissive;
				outEmissive.a = surfaceData.baseColor.a;

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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissiveColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( packedInput.texCoord0.xy - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float lerpResult172_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityMOASChannel);
				float lerpResult615_g44348 = lerp( lerpResult172_g44348 , ( lerpResult172_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = lerpResult615_g44348;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            CBUFFER_START(UnityPerMaterial)
			half4 _DecalColor;
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissiveColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( packedInput.texCoord0.xy - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				
				float BaseColor_Alpha255_g44348 = tex2DNode205_g44348.a;
				float temp_output_257_0_g44348 = ( 1.0 - ( _DecalOpacityGlobal + ( ( _CATEGORY_OPACITY + _SPACE_OPACITY ) * 0.0 ) ) );
				float temp_output_176_0_g44348 = ( BaseColor_Alpha255_g44348 * temp_output_257_0_g44348 );
				float3 worldToObj6_g57925 = mul( GetWorldToObjectMatrix(), float4( packedInput.positionWS, 1 ) ).xyz;
				float3 temp_output_3_0_g57925 = ( worldToObj6_g57925 + float3( 0.5,0.5,0.5 ) );
				float3 break10_g57925 = ( temp_output_3_0_g57925 * ( 1.0 - temp_output_3_0_g57925 ) );
				float temp_output_12_0_g57925 = ( ( break10_g57925.x * break10_g57925.y ) * break10_g57925.z );
				float temp_output_608_0_g44348 = saturate( ( ( temp_output_12_0_g57925 * temp_output_12_0_g57925 ) * 500000.0 ) );
				float lerpResult613_g44348 = lerp( temp_output_176_0_g44348 , ( temp_output_176_0_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				float3 unpack297_g44348 = UnpackNormalScale( SAMPLE_TEXTURE2D_GRAD( _NormalMap, sampler_NormalMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) ), ( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) ) );
				unpack297_g44348.z = lerp( 1, unpack297_g44348.z, saturate(( _NormalStrength + ( ( _CATEGORY_DECALMAP + 0.0 + _SPACE_DECALMAP + _CATEGORY_COLOR + _SPACE_COLOR ) * 0.0 ) )) );
				
				float4 tex2DNode203_g44348 = SAMPLE_TEXTURE2D_GRAD( _MaskMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float temp_output_177_0_g44348 = ( tex2DNode203_g44348.b * temp_output_257_0_g44348 );
				float lerpResult171_g44348 = lerp( temp_output_176_0_g44348 , temp_output_177_0_g44348 , _DecalOpacityNormalChannel);
				float lerpResult614_g44348 = lerp( lerpResult171_g44348 , ( lerpResult171_g44348 * temp_output_608_0_g44348 ) , _DecalEdgeMask);
				
				half4 color307_g44348 = IsGammaSpace() ? half4(0.003921569,0,0,0) : half4(0.000303527,0,0,0);
				float3 temp_output_312_0_g44348 = (_EmissiveColor).rgb;
				float3 temp_output_19_0_g57922 = temp_output_312_0_g44348;
				float temp_output_21_0_g57922 = ( _EmissiveIntensity + ( _EmissionFlags * 0.0 ) );
				float3 temp_output_26_0_g57922 = ( temp_output_19_0_g57922 * temp_output_21_0_g57922 );
				float3 temp_output_187_0_g44348 = ( ( temp_output_312_0_g44348 * temp_output_26_0_g57922 ) * (SAMPLE_TEXTURE2D_GRAD( _EmissiveColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) )).rgb );
				float3 lerpResult305_g44348 = lerp( (color307_g44348).rgb , ( temp_output_176_0_g44348 * temp_output_187_0_g44348 ) , ( _DecalEmissiveEnable + ( ( _CATEGORY_EMISSION + _SPACE_EMISSION ) * 0.0 ) ));
				

				surfaceDescription.BaseColor = lerpResult325_g44348;
				surfaceDescription.Alpha = lerpResult613_g44348;
				surfaceDescription.NormalTS = unpack297_g44348;
				surfaceDescription.NormalAlpha = lerpResult614_g44348;

				#if defined( _MATERIAL_AFFECTS_MAOS )
					surfaceDescription.Metallic = ( tex2DNode203_g44348.r * _MetallicStrength );
					surfaceDescription.Occlusion = saturate( ( tex2DNode203_g44348.g * ( 1.0 - _OcclusionStrengthAO ) ) );
					surfaceDescription.Smoothness = ( tex2DNode203_g44348.b * _SmoothnessStrength );
					surfaceDescription.MAOSAlpha = 1;
				#endif

				#if defined( _MATERIAL_AFFECTS_EMISSION )
					surfaceDescription.Emission = lerpResult305_g44348;
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
			#define _MATERIAL_AFFECTS_EMISSION 1
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
			half4 _EmissiveColor;
			half _DecalEmissiveEnable;
			half _EmissionFlags;
			half _EmissiveIntensity;
			half _DecalOpacityMOASChannel;
			half _SmoothnessStrength;
			half _OcclusionStrengthAO;
			half _MetallicStrength;
			half _DecalOpacityNormalChannel;
			float _SPACE_COLOR;
			float _CATEGORY_COLOR;
			float _SPACE_DECALMAP;
			float _CATEGORY_DECALMAP;
			half _NormalStrength;
			float _DecalEdgeMask;
			float _SPACE_OPACITY;
			float _CATEGORY_OPACITY;
			half _DecalOpacityGlobal;
			float _DecalColorSpaceDouble;
			half _UVRotation;
			half _DecalMainLightInfluence;
			float _CATEGORY_EMISSION;
			float _SPACE_EMISSION;
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

			TEXTURE2D(_BaseColorMap);
			SAMPLER(sampler_BaseColorMap);


			float3 GetMainLightColorNode10_g57924( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
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

				packedOutput.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				packedOutput.ase_texcoord.zw = 0;

				float3 positionWS = TransformObjectToWorld(inputMesh.positionOS);
				packedOutput.positionCS = TransformWorldToHClip(positionWS);

				return packedOutput;
			}

			void Frag(PackedVaryings packedInput,
				out float4 outColor : SV_Target0
				
			)
			{
				float3 temp_output_208_0_g44348 = (_DecalColor).rgb;
				float3 Color10_g57924 = float3( 0,0,0 );
				float3 localGetMainLightColorNode10_g57924 = GetMainLightColorNode10_g57924( Color10_g57924 );
				float3 lerpResult212_g44348 = lerp( temp_output_208_0_g44348 , ( temp_output_208_0_g44348 * Color10_g57924 ) , _DecalMainLightInfluence);
				float temp_output_6_0_g57916 = _UVRotation;
				float temp_output_200_0_g57916 = radians( temp_output_6_0_g57916 );
				float temp_output_13_0_g57916 = cos( temp_output_200_0_g57916 );
				float2 temp_output_9_0_g57916 = float2( 0.5,0.5 );
				float2 break39_g57916 = ( packedInput.ase_texcoord.xy - temp_output_9_0_g57916 );
				float temp_output_14_0_g57916 = sin( temp_output_200_0_g57916 );
				float2 appendResult36_g57916 = (float2(( ( temp_output_13_0_g57916 * break39_g57916.x ) + ( temp_output_14_0_g57916 * break39_g57916.y ) ) , ( ( temp_output_13_0_g57916 * break39_g57916.y ) - ( temp_output_14_0_g57916 * break39_g57916.x ) )));
				float2 Offset235_g57916 = float2( 0,0 );
				float2 temp_output_41_0_g57916 = ( ( ( appendResult36_g57916 * ( float2( 1,1 ) / 1.0 ) ) + temp_output_9_0_g57916 ) + Offset235_g57916 );
				float2 _ConstantAnchor = float2(0.5,0.5);
				float2 temp_output_592_0_g44348 = ( temp_output_41_0_g57916 - ( ( ( float2( 1,1 ) / 1.0 ) * _ConstantAnchor ) - _ConstantAnchor ) );
				float4 tex2DNode205_g44348 = SAMPLE_TEXTURE2D_GRAD( _BaseColorMap, sampler_BaseColorMap, temp_output_592_0_g44348, ddx( temp_output_592_0_g44348 ), ddy( temp_output_592_0_g44348 ) );
				float3 temp_output_264_0_g44348 = (tex2DNode205_g44348).rgb;
				float3 temp_output_263_0_g44348 = ( lerpResult212_g44348 * temp_output_264_0_g44348 );
				float3 lerpResult325_g44348 = lerp( temp_output_263_0_g44348 , ( temp_output_263_0_g44348 * (unity_ColorSpaceDouble).rgb ) , _DecalColorSpaceDouble);
				

				float3 BaseColor = lerpResult325_g44348;

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
Node;AmplifyShaderEditor.FunctionNode;57;-416,-128;Inherit;False;DESF Core Decal Sample Standard;0;;44348;36c01ea649e585b4780747536960508e;7,320,1,118,1,425,0,336,0,426,0,220,0,195,0;0;9;FLOAT3;92;FLOAT;91;FLOAT3;89;FLOAT;86;FLOAT;90;FLOAT;87;FLOAT;88;FLOAT;85;FLOAT3;84
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;68;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DBufferProjector;0;0;DBufferProjector;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DBufferProjector;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;69;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalProjectorForwardEmissive;0;1;DecalProjectorForwardEmissive;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;8;5;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalProjectorForwardEmissive;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;71;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalGBufferProjector;0;3;DecalGBufferProjector;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;True;1;False;;False;False;False;True;False;False;False;False;0;False;;False;True;True;True;True;False;0;False;;False;True;True;True;True;False;0;False;;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalGBufferProjector;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;72;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DBufferMesh;0;4;DBufferMesh;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;True;2;5;False;;10;False;;1;0;False;;10;False;;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DBufferMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;73;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalMeshForwardEmissive;0;5;DecalMeshForwardEmissive;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;8;5;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DecalMeshForwardEmissive;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;74;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalScreenSpaceMesh;0;6;DecalScreenSpaceMesh;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=DecalScreenSpaceMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;75;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;DecalGBufferMesh;0;7;DecalGBufferMesh;1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;True;True;True;True;False;0;False;;False;True;True;True;True;False;0;False;;False;False;False;True;2;False;;False;False;True;1;LightMode=DecalGBufferMesh;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;76;30,-62;Float;False;False;-1;2;DE_ShaderGUIDecal;0;1;New Amplify Shader;c2a467ab6d5391a4ea692226d82ffefd;True;ScenePickingPass;0;8;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;70;0,-128;Float;False;True;-1;2;DE_ShaderGUI;0;14;DE Environment/Decal/Standard;c2a467ab6d5391a4ea692226d82ffefd;True;DecalScreenSpaceProjector;0;2;DecalScreenSpaceProjector;9;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;PreviewType=Plane;DisableBatching=LODFading=DisableBatching;ShaderGraphShader=true;ShaderGraphTargetId=UniversalDecalSubTarget;True;3;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;2;False;;False;True;1;LightMode=DecalScreenSpaceProjector;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;7;Affect BaseColor;1;0;Affect Normal;1;0;Blend;1;0;Affect MAOS;1;638177062108117768;Affect Emission;1;638177062112587387;Support LOD CrossFade;1;638177062116925450;Angle Fade;1;0;0;9;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;70;0;57;92
WireConnection;70;1;57;91
WireConnection;70;2;57;89
WireConnection;70;3;57;86
WireConnection;70;4;57;90
WireConnection;70;5;57;87
WireConnection;70;6;57;88
WireConnection;70;7;57;85
WireConnection;70;8;57;84
ASEEND*/
//CHKSM=57CE47A6EA2F9BFA5BB4F29AF0DA0C173A0B8C1E