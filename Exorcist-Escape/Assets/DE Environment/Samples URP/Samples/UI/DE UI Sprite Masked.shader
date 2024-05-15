// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DE Environment/UI/Sprite Masked"
{
    Properties
    {
        [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)

        _StencilComp ("Stencil Comparison", Float) = 8
        _Stencil ("Stencil ID", Float) = 0
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilReadMask ("Stencil Read Mask", Float) = 255

        _ColorMask ("Color Mask", Float) = 15

        [Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0

        [HideInInspector][Header(SURFACE OPTIONS)][Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 2
        [DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
        [Header(SPRITE SHAKE)][DE_DrawerToggleNoKeyword]_Sprite_ModeShake("Enable", Float) = 0
        _Sprite_ShakeIntensity("Intensity", Float) = 0.25
        _Sprite_ShakeInterval("Interval", Float) = 0.5
        [Header(COLOR WAVE)][DE_DrawerToggleLeft]_ModeMaskColorwave("Enable", Float) = 0
        [DE_DrawerToggleNoKeyword]_ColorWaveInverted("Color Wave Inverted", Float) = 0
        [DE_DrawerTextureSingleLine]_MaskColorwave("Color Wave Mask", 2D) = "white" {}
        [DE_DrawerTilingOffset]_MaskUVs("Mask UVs", Vector) = (1,1,0,0)
        [HDR]_WaveA_Color("Color", Color) = (0.4485294,0.313166,0.1517085,1)
        _WaveA_Amplitude("Amplitude", Float) = 0.2
        _WaveA_Width("Width", Float) = 2.5
        _WaveA_Displacement("Displacement", Float) = 0
        [HDR]_WaveB_Color("Color", Color) = (1,0.376056,0.05882353,1)
        _WaveB_Amplitude("Amplitude", Float) = 0.2
        _WaveB_Width("Width", Float) = 2.5
        _WaveB_Displacement("Displacement", Float) = 5

    }

    SubShader
    {
		LOD 0

        Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="True" }

        Stencil
        {
        	Ref [_Stencil]
        	ReadMask [_StencilReadMask]
        	WriteMask [_StencilWriteMask]
        	CompFront [_StencilComp]
        	PassFront [_StencilOp]
        	FailFront Keep
        	ZFailFront Keep
        	CompBack Always
        	PassBack Keep
        	FailBack Keep
        	ZFailBack Keep
        }


        Cull [_Cull]
        Lighting Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Blend SrcAlpha OneMinusSrcAlpha
        ColorMask [_ColorMask]

        
        Pass
        {
            Name "Default"
        CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 3.0

            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            #pragma multi_compile_local _ UNITY_UI_CLIP_RECT
            #pragma multi_compile_local _ UNITY_UI_ALPHACLIP

            #include "UnityShaderVariables.cginc"
            #define ASE_NEEDS_FRAG_COLOR


            struct appdata_t
            {
                float4 vertex   : POSITION;
                float4 color    : COLOR;
                float2 texcoord : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                
            };

            struct v2f
            {
                float4 vertex   : SV_POSITION;
                fixed4 color    : COLOR;
                float2 texcoord  : TEXCOORD0;
                float4 worldPosition : TEXCOORD1;
                float4  mask : TEXCOORD2;
                UNITY_VERTEX_OUTPUT_STEREO
                
            };

            sampler2D _MainTex;
            fixed4 _Color;
            fixed4 _TextureSampleAdd;
            float4 _ClipRect;
            float4 _MainTex_ST;
            float _UIMaskSoftnessX;
            float _UIMaskSoftnessY;

            uniform int _Cull;
            uniform float4 _MainUVs;
            uniform half _Sprite_ShakeIntensity;
            uniform half _Sprite_ShakeInterval;
            uniform half _Sprite_ModeShake;
            uniform half4 _WaveA_Color;
            uniform half _WaveA_Amplitude;
            uniform half _WaveA_Displacement;
            float4 _MainTex_TexelSize;
            uniform half _WaveA_Width;
            uniform half4 _WaveB_Color;
            uniform half _WaveB_Amplitude;
            uniform half _WaveB_Displacement;
            uniform half _WaveB_Width;
            uniform sampler2D _MaskColorwave;
            uniform float4 _MaskUVs;
            uniform float _ColorWaveInverted;
            uniform half _ModeMaskColorwave;

            
            v2f vert(appdata_t v )
            {
                v2f OUT;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);

                

                v.vertex.xyz +=  float3( 0, 0, 0 ) ;

                float4 vPosition = UnityObjectToClipPos(v.vertex);
                OUT.worldPosition = v.vertex;
                OUT.vertex = vPosition;

                float2 pixelSize = vPosition.w;
                pixelSize /= float2(1, 1) * abs(mul((float2x2)UNITY_MATRIX_P, _ScreenParams.xy));

                float4 clampedRect = clamp(_ClipRect, -2e10, 2e10);
                float2 maskUV = (v.vertex.xy - clampedRect.xy) / (clampedRect.zw - clampedRect.xy);
                OUT.texcoord = v.texcoord;
                OUT.mask = float4(v.vertex.xy * 2 - clampedRect.xy - clampedRect.zw, 0.25 / (0.25 * half2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(pixelSize.xy)));

                OUT.color = v.color * _Color;
                return OUT;
            }

            fixed4 frag(v2f IN ) : SV_Target
            {
                //Round up the alpha color coming from the interpolator (to 1.0/256.0 steps)
                //The incoming alpha could have numerical instability, which makes it very sensible to
                //HDR color transparency blend, when it blends with the world's texture.
                const half alphaPrecision = half(0xff);
                const half invAlphaPrecision = half(1.0/alphaPrecision);
                IN.color.a = round(IN.color.a * alphaPrecision)*invAlphaPrecision;

                float2 temp_output_488_0_g39028 = (_MainUVs).xy;
                float2 temp_output_487_0_g39028 = (_MainUVs).zw;
                float2 texCoord343_g39028 = IN.texcoord.xy * temp_output_488_0_g39028 + temp_output_487_0_g39028;
                float2 temp_output_52_0_g39240 = temp_output_487_0_g39028;
                float temp_output_55_0_g39240 = _Sprite_ShakeIntensity;
                float temp_output_56_0_g39240 = _Sprite_ShakeInterval;
                float3 objToWorld51_g39240 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
                float2 appendResult46_g39240 = (float2(objToWorld51_g39240.x , objToWorld51_g39240.z));
                float dotResult2_g39241 = dot( appendResult46_g39240 , float2( 12.9898,78.233 ) );
                float lerpResult6_g39241 = lerp( 155.0 , 200.0 , frac( ( sin( dotResult2_g39241 ) * 43758.55 ) ));
                float temp_output_16_0_g39240 = ( sin( ( _Time.w * 20.0 ) ) * ( temp_output_55_0_g39240 * ( temp_output_55_0_g39240 + 0.02 ) ) * pow( step( ( sin( ( _Time.w * temp_output_56_0_g39240 ) ) * ( temp_output_56_0_g39240 * ( temp_output_56_0_g39240 + lerpResult6_g39241 ) ) ) , 1E-05 ) , 2.0 ) );
                float2 appendResult7_g39240 = (float2(temp_output_16_0_g39240 , ( temp_output_16_0_g39240 * 0.1 )));
                float temp_output_57_0_g39240 = _Sprite_ModeShake;
                float2 lerpResult58_g39240 = lerp( temp_output_52_0_g39240 , ( temp_output_52_0_g39240 + appendResult7_g39240 ) , temp_output_57_0_g39240);
                float2 texCoord347_g39028 = IN.texcoord.xy * temp_output_488_0_g39028 + lerpResult58_g39240;
                float3 temp_output_519_0_g39028 = (tex2D( _MainTex, texCoord347_g39028 )).rgb;
                float3 temp_output_338_0_g39028 = ( (tex2D( _MainTex, texCoord343_g39028 )).rgb * temp_output_519_0_g39028 );
                float lerpResult59_g39240 = lerp( 1.0 , pow( ( temp_output_16_0_g39240 + 1.0 ) , 5.0 ) , temp_output_57_0_g39240);
                float3 lerpResult359_g39028 = lerp( temp_output_338_0_g39028 , ( temp_output_519_0_g39028 * lerpResult59_g39240 ) , temp_output_338_0_g39028);
                float3 break403_g39028 = lerpResult359_g39028;
                float4 tex2DNode225_g39028 = tex2D( _MainTex, texCoord343_g39028 );
                float Alpha530_g39028 = tex2DNode225_g39028.a;
                float4 appendResult529_g39028 = (float4(break403_g39028.x , break403_g39028.y , break403_g39028.z , Alpha530_g39028));
                float4 temp_output_231_0_g39028 = ( IN.color * ( _TextureSampleAdd + appendResult529_g39028 ) );
                float4 SPRITE282_g39028 = temp_output_231_0_g39028;
                float2 temp_cast_2 = (1.0).xx;
                float2 texCoord199_g39028 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
                float2 temp_output_205_0_g39028 = ( temp_cast_2 - ( texCoord199_g39028 * 2.0 ) );
                float2 temp_output_1_0_g39232 = temp_output_205_0_g39028;
                float mulTime204_g39028 = _Time.y * 2.0;
                float temp_output_16_0_g39232 = mulTime204_g39028;
                float temp_output_8_0_g39232 = (temp_output_1_0_g39232).y;
                float Height206_g39028 = _MainTex_TexelSize.w;
                float2 temp_cast_3 = (1.0).xx;
                float2 temp_output_1_0_g39233 = temp_output_205_0_g39028;
                float temp_output_16_0_g39233 = mulTime204_g39028;
                float temp_output_8_0_g39233 = (temp_output_1_0_g39233).y;
                float2 texCoord178_g39028 = IN.texcoord.xy * (_MaskUVs).xy + (_MaskUVs).zw;
                float4 tex2DNode246_g39028 = tex2D( _MaskColorwave, texCoord178_g39028 );
                float lerpResult502_g39028 = lerp( tex2DNode246_g39028.r , ( 1.0 - tex2DNode246_g39028.r ) , _ColorWaveInverted);
                float4 appendResult236_g39028 = (float4(( ( saturate( ( ( (_WaveA_Color).rgb * abs( ( 1.0 / ( ( ( ( _WaveA_Amplitude * cos( ( ( UNITY_PI * (temp_output_1_0_g39232).x ) + ( UNITY_PI * temp_output_16_0_g39232 ) ) ) * sin( ( ( temp_output_8_0_g39232 * UNITY_PI ) + ( _WaveA_Displacement / 3.0 ) + ( temp_output_16_0_g39232 * UNITY_PI ) ) ) ) + temp_output_8_0_g39232 ) * Height206_g39028 ) / _WaveA_Width ) ) ) ) + ( (_WaveB_Color).rgb * abs( ( 1.0 / ( ( ( ( _WaveB_Amplitude * cos( ( ( UNITY_PI * (temp_output_1_0_g39233).x ) + ( UNITY_PI * temp_output_16_0_g39233 ) ) ) * sin( ( ( temp_output_8_0_g39233 * UNITY_PI ) + ( _WaveB_Displacement / 3.0 ) + ( temp_output_16_0_g39233 * UNITY_PI ) ) ) ) + temp_output_8_0_g39233 ) * Height206_g39028 ) / _WaveB_Width ) ) ) ) ) ) * lerpResult502_g39028 ) + (temp_output_231_0_g39028).rgb ) , (temp_output_231_0_g39028).a));
                float4 lerpResult526_g39028 = lerp( SPRITE282_g39028 , appendResult236_g39028 , _ModeMaskColorwave);
                

                half4 color = lerpResult526_g39028;

                #ifdef UNITY_UI_CLIP_RECT
                half2 m = saturate((_ClipRect.zw - _ClipRect.xy - abs(IN.mask.xy)) * IN.mask.zw);
                color.a *= m.x * m.y;
                #endif

                #ifdef UNITY_UI_ALPHACLIP
                clip (color.a - 0.001);
                #endif

                color.rgb *= color.a;

                return color;
            }
        ENDCG
        }
    }
    CustomEditor "DE_ShaderGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.TemplateShaderPropertyNode;3;-480,-320;Inherit;False;0;0;_TextureSampleAdd;Pass;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateShaderPropertyNode;1;-448,-400;Inherit;False;0;0;_MainTex;Shader;False;0;5;SAMPLER2D;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;75;-224,-384;Inherit;False;DESF Core Sprite;1;;39028;b3adc46ac9a298146b2c537db61848b7;10,354,1,397,0,392,0,387,0,242,1,454,0,449,0,358,0,286,0,250,0;4;238;SAMPLER2D;0,0,0,0;False;18;FLOAT4;0,0,0,0;False;121;SAMPLER2D;0,0,0,0;False;90;FLOAT4;0,0,0,0;False;1;FLOAT4;8
Node;AmplifyShaderEditor.IntNode;85;128,-464;Inherit;False;Property;_Cull;Render Face;0;3;[HideInInspector];[Header];[Enum];Create;False;1;SURFACE OPTIONS;0;1;Front,2,Back,1,Both,0;True;0;False;2;2;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;128,-384;Float;False;True;-1;2;DE_ShaderGUI;0;3;DE Environment/UI/Sprite Masked;5056123faa0c79b47ab6ad7e8bf059a4;True;Default;0;0;Default;2;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;True;2;True;_Cull;True;True;True;True;True;True;0;True;_ColorMask;False;False;False;False;False;False;False;True;True;0;True;_Stencil;255;True;_StencilReadMask;255;True;_StencilWriteMask;0;True;_StencilComp;0;True;_StencilOp;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;2;False;;True;0;True;unity_GUIZTestMode;False;True;5;Queue=Transparent=Queue=0;IgnoreProjector=True;RenderType=Transparent=RenderType;PreviewType=Plane;CanUseSpriteAtlas=True;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;75;238;1;0
WireConnection;75;18;3;0
WireConnection;0;0;75;8
ASEEND*/
//CHKSM=9590B997259A4514E21592B8ABCCE1E91F25C13B