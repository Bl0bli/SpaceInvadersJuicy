// Made with Amplify Shader Editor v1.9.9.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Shader_Bedo_Fire"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_MainTex( "_MainTex", 2D ) = "white" {}
		_F_Color( "F_Color", Color ) = ( 1, 0.55326, 0.2396226, 0 )
		_F_Noise( "F_Noise", 2D ) = "white" {}
		_F_X_Tile( "F_X_Tile", Float ) = 1
		_F_Y_Tile( "F_Y_Tile", Float ) = 3
		_F_X_Pan( "F_X_Pan", Float ) = 0
		_F_Y_Pan( "F_Y_Pan", Float ) = 0
		_F_Bot_Min( "F_Bot_Min", Float ) = 0.11
		_F_Bot_Max( "F_Bot_Max", Float ) = 0.81
		_F_Top_Min( "F_Top_Min", Float ) = 0.13
		_F_Top_Max( "F_Top_Max", Float ) = 0.38
		_Burned_Color( "Burned_Color", Color ) = ( 0.2150944, 0.1631983, 0.1213457, 0 )
		_F_Offset_Min( "F_Offset_Min", Float ) = 1.57
		_F_Offset_Max( "F_Offset_Max", Float ) = 2.29
		_B_Noise( "B_Noise", 2D ) = "white" {}
		_B_X_Tile( "B_X_Tile", Float ) = 1
		_B_Y_Tile( "B_Y_Tile", Float ) = 1
		_B_X_Pan( "B_X_Pan", Float ) = 0
		_B_Y_Pan( "B_Y_Pan", Float ) = 0
		_B_Min( "B_Min", Float ) = 0.06
		_B_Max( "B_Max", Float ) = 0.14
		_B_Offset_Min( "B_Offset_Min", Float ) = 1.5
		_B_Offset_Max( "B_Offset_Max", Float ) = 2
		_N_Noise_1( "N_Noise_1", 2D ) = "white" {}
		_N1_X_Tile( "N1_X_Tile", Float ) = 1
		_N1_Y_Tile( "N1_Y_Tile", Float ) = 1
		_N1_X_Pan( "N1_X_Pan", Float ) = 0.1
		_N1_Y_Pan( "N1_Y_Pan", Float ) = 0.1
		_N1_Min( "N1_Min", Float ) = 0.07
		_N1_Max( "N1_Max", Float ) = 0.17
		_N_Noise_2( "N_Noise_2", 2D ) = "white" {}
		_N2_X_Tile( "N2_X_Tile", Float ) = 0.5
		_N2_Y_Tile( "N2_Y_Tile", Float ) = 0.5
		_N2_X_Pan( "N2_X_Pan", Float ) = -0.1
		_N2_Y_Pan( "N2_Y_Pan", Float ) = -0.1
		_N2_Min( "N2_Min", Float ) = 0
		_N2_Max( "N2_Max", Float ) = 1
		_N_Noise_3( "N_Noise_3", 2D ) = "white" {}
		_N3_X_Tile( "N3_X_Tile", Float ) = 1
		_N3_Y_Tile( "N3_Y_Tile", Float ) = 1.5
		_N3_X_Pan( "N3_X_Pan", Float ) = -0.1
		_N3_Y_Pan( "N3_Y_Pan", Float ) = -0.1
		_N3_Min( "N3_Min", Float ) = 0.14
		_N3_Max( "N3_Max", Float ) = 0.38
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" "ShaderGraphShader"="true" }

		Cull Off

		HLSLINCLUDE
		#pragma target 2.0
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		ENDHLSL

		
		Pass
		{
			Name "Sprite Unlit"
            Tags { "LightMode"="Universal2D" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZTest LEqual
			ZWrite Off
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _DISABLE_COLOR_TINT
			#define ASE_VERSION 19907
			#define ASE_SRP_VERSION 170300


			#pragma multi_compile_instancing

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_vertex _ SKINNED_SPRITE

            #define _SURFACE_TYPE_TRANSPARENT 1
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_COLOR
            #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
            #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_COLOR
            #define FEATURES_GRAPH_VERTEX

			#define SHADERPASS SHADERPASS_SPRITEUNLIT

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Fog.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/Core2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/SurfaceData2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging2D.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			half4 _RendererColor;

			sampler2D _MainTex;
			sampler2D _B_Noise;
			sampler2D _F_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float4 _Burned_Color;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N3_Y_Pan;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _N3_X_Pan;
			float _N2_Max;
			float _F_Bot_Max;
			float _F_Bot_Min;
			float _B_Min;
			float _B_Max;
			float _B_X_Pan;
			float _B_Y_Pan;
			float _B_X_Tile;
			float _B_Y_Tile;
			float _B_Offset_Min;
			float _N3_X_Tile;
			float _B_Offset_Max;
			float _F_Top_Max;
			float _F_Offset_Min;
			float _F_Offset_Max;
			float _F_X_Pan;
			float _F_Y_Pan;
			float _F_X_Tile;
			float _F_Y_Tile;
			float _F_Top_Min;
			float _N3_Y_Tile;
			CBUFFER_END


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 color : COLOR;
				
				UNITY_SKINNED_VERTEX_INPUTS
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 texCoord0 : TEXCOORD0;
				float4 color : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#if ETC1_EXTERNAL_ALPHA
				TEXTURE2D(_AlphaTex); SAMPLER(sampler_AlphaTex);
				float _EnableAlphaTexture;
			#endif

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_SKINNED_VERTEX_COMPUTE(v);

				v.positionOS = UnityFlipSprite( v.positionOS, unity_SpriteProps.xy );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS = vertexValue;
				#else
					v.positionOS += vertexValue;
				#endif
				v.normal = v.normal;
				v.tangent.xyz = v.tangent.xyz;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS);

				o.positionCS = vertexInput.positionCS;
				o.positionWS = vertexInput.positionWS;
				o.texCoord0 = v.uv0;
				o.color = v.color * _RendererColor * unity_SpriteColor;
				return o;
			}

			half4 frag( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float4 positionCS = IN.positionCS;
				float3 positionWS = IN.positionWS;

				float2 uv_MainTex = IN.texCoord0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.color.r , IN.color.g , IN.color.b));
				float2 appendResult146 = (float2(_B_X_Pan , _B_Y_Pan));
				float2 texCoord142 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_B_X_Tile , _B_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult163 = smoothstep( ( _B_Offset_Min * 0.5 ) , ( _B_Offset_Max * 0.5 ) , texCoord124.y);
				float temp_output_138_0 = ( tex2D( _B_Noise, panner148 ).r * smoothstepResult163 );
				float smoothstepResult139 = smoothstep( ( _B_Min * 0.5 ) , ( _B_Max * 0.5 ) , temp_output_138_0);
				float temp_output_167_0 = saturate( ( 1.0 - smoothstepResult139 ) );
				float2 texCoord215 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult218 = smoothstep( ( _F_Offset_Min * 0.5 ) , ( _F_Offset_Max * 0.5 ) , texCoord215.y);
				float2 appendResult240 = (float2(_F_X_Pan , _F_Y_Pan));
				float2 texCoord239 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult237 = (float2(_F_X_Tile , _F_Y_Tile));
				float2 panner242 = ( 1.0 * _Time.y * appendResult240 + (texCoord239*appendResult237 + 0.0));
				float smoothstepResult213 = smoothstep( ( _F_Top_Min * 0.5 ) , ( _F_Top_Max * 0.5 ) , ( smoothstepResult218 * tex2D( _F_Noise, panner242 ).r ));
				float temp_output_224_0 = saturate( ( 1.0 - smoothstepResult213 ) );
				float3 FireColor225 = ( 10.0 * _F_Color.rgb );
				float smoothstepResult229 = smoothstep( ( _F_Bot_Min * 0.5 ) , ( _F_Bot_Max * 0.5 ) , temp_output_138_0);
				float temp_output_170_0 = saturate( ( 1.0 - temp_output_167_0 ) );
				float2 appendResult46 = (float2(_N1_X_Pan , _N1_Y_Pan));
				float2 texCoord42 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult43 = (float2(_N1_X_Tile , _N1_Y_Tile));
				float2 panner48 = ( 1.0 * _Time.y * appendResult46 + (texCoord42*appendResult43 + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 appendResult67 = (float2(_N2_X_Pan , _N2_Y_Pan));
				float2 texCoord65 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult66 = (float2(_N2_X_Tile , _N2_Y_Tile));
				float2 panner69 = ( 1.0 * _Time.y * appendResult67 + (texCoord65*appendResult66 + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 appendResult91 = (float2(_N3_X_Pan , _N3_Y_Pan));
				float2 texCoord83 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult82 = (float2(_N3_X_Tile , _N3_Y_Tile));
				float2 panner90 = ( 1.0 * _Time.y * appendResult91 + (texCoord83*appendResult82 + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float VertexAlpha132 = IN.color.a;
				float Alpha135 = temp_output_224_0;
				float4 appendResult129 = (float4(( ( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) * temp_output_167_0 ) + ( ( temp_output_224_0 * FireColor225 * smoothstepResult229 ) + ( _Burned_Color.rgb * temp_output_170_0 ) + ( temp_output_170_0 * ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * FireColor225 ) ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

				float4 Color = appendResult129;
				float AlphaClipThreshold = 0.5;

			#if defined( ALPHA_CLIP_THRESHOLD )
				clip( Color.a - AlphaClipThreshold );
			#endif

			#if defined(DEBUG_DISPLAY)
				SurfaceData2D surfaceData;
				InitializeSurfaceData(Color.rgb, Color.a, surfaceData);
				InputData2D inputData;
				InitializeInputData(positionWS.xy, half2(IN.texCoord0.xy), inputData);
				half4 debugColor = 0;

				SETUP_DEBUG_DATA_2D(inputData, positionWS, positionCS);

				if (CanDebugOverrideOutputColor(surfaceData, inputData, debugColor))
				{
					return debugColor;
				}
			#endif

			#if ETC1_EXTERNAL_ALPHA
				float4 alpha = SAMPLE_TEXTURE2D(_AlphaTex, sampler_AlphaTex, IN.texCoord0.xy);
				Color.a = lerp( Color.a, alpha.r, _EnableAlphaTexture);
			#endif

			#if !defined( _DISABLE_COLOR_TINT )
				Color *= IN.color;
			#endif

				return Color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
            Name "Sprite Unlit Forward"
            Tags { "LightMode"="UniversalForward" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZTest LEqual
			ZWrite Off
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _DISABLE_COLOR_TINT
			#define ASE_VERSION 19907
			#define ASE_SRP_VERSION 170300


			#pragma multi_compile_instancing

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_vertex _ SKINNED_SPRITE

            #define _SURFACE_TYPE_TRANSPARENT 1
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_COLOR
            #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
            #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_COLOR
            #define FEATURES_GRAPH_VERTEX

			#define SHADERPASS SHADERPASS_SPRITEFORWARD

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Fog.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/Core2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/SurfaceData2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging2D.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			half4 _RendererColor;

			sampler2D _MainTex;
			sampler2D _B_Noise;
			sampler2D _F_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float4 _Burned_Color;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N3_Y_Pan;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _N3_X_Pan;
			float _N2_Max;
			float _F_Bot_Max;
			float _F_Bot_Min;
			float _B_Min;
			float _B_Max;
			float _B_X_Pan;
			float _B_Y_Pan;
			float _B_X_Tile;
			float _B_Y_Tile;
			float _B_Offset_Min;
			float _N3_X_Tile;
			float _B_Offset_Max;
			float _F_Top_Max;
			float _F_Offset_Min;
			float _F_Offset_Max;
			float _F_X_Pan;
			float _F_Y_Pan;
			float _F_X_Tile;
			float _F_Y_Tile;
			float _F_Top_Min;
			float _N3_Y_Tile;
			CBUFFER_END


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 color : COLOR;
				
				UNITY_SKINNED_VERTEX_INPUTS
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 texCoord0 : TEXCOORD0;
				float4 color : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#if ETC1_EXTERNAL_ALPHA
				TEXTURE2D( _AlphaTex ); SAMPLER( sampler_AlphaTex );
				float _EnableAlphaTexture;
			#endif

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_SKINNED_VERTEX_COMPUTE(v);

				v.positionOS = UnityFlipSprite( v.positionOS, unity_SpriteProps.xy );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS;
				#else
					float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS = vertexValue;
				#else
					v.positionOS += vertexValue;
				#endif
				v.normal = v.normal;
				v.tangent.xyz = v.tangent.xyz;

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS);

				o.positionCS = vertexInput.positionCS;
				o.positionWS = vertexInput.positionWS;
				o.texCoord0 = v.uv0;
				o.color = v.color * _RendererColor * unity_SpriteColor;
				return o;
			}

			half4 frag( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float4 positionCS = IN.positionCS;
				float3 positionWS = IN.positionWS;

				float2 uv_MainTex = IN.texCoord0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.color.r , IN.color.g , IN.color.b));
				float2 appendResult146 = (float2(_B_X_Pan , _B_Y_Pan));
				float2 texCoord142 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_B_X_Tile , _B_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult163 = smoothstep( ( _B_Offset_Min * 0.5 ) , ( _B_Offset_Max * 0.5 ) , texCoord124.y);
				float temp_output_138_0 = ( tex2D( _B_Noise, panner148 ).r * smoothstepResult163 );
				float smoothstepResult139 = smoothstep( ( _B_Min * 0.5 ) , ( _B_Max * 0.5 ) , temp_output_138_0);
				float temp_output_167_0 = saturate( ( 1.0 - smoothstepResult139 ) );
				float2 texCoord215 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult218 = smoothstep( ( _F_Offset_Min * 0.5 ) , ( _F_Offset_Max * 0.5 ) , texCoord215.y);
				float2 appendResult240 = (float2(_F_X_Pan , _F_Y_Pan));
				float2 texCoord239 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult237 = (float2(_F_X_Tile , _F_Y_Tile));
				float2 panner242 = ( 1.0 * _Time.y * appendResult240 + (texCoord239*appendResult237 + 0.0));
				float smoothstepResult213 = smoothstep( ( _F_Top_Min * 0.5 ) , ( _F_Top_Max * 0.5 ) , ( smoothstepResult218 * tex2D( _F_Noise, panner242 ).r ));
				float temp_output_224_0 = saturate( ( 1.0 - smoothstepResult213 ) );
				float3 FireColor225 = ( 10.0 * _F_Color.rgb );
				float smoothstepResult229 = smoothstep( ( _F_Bot_Min * 0.5 ) , ( _F_Bot_Max * 0.5 ) , temp_output_138_0);
				float temp_output_170_0 = saturate( ( 1.0 - temp_output_167_0 ) );
				float2 appendResult46 = (float2(_N1_X_Pan , _N1_Y_Pan));
				float2 texCoord42 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult43 = (float2(_N1_X_Tile , _N1_Y_Tile));
				float2 panner48 = ( 1.0 * _Time.y * appendResult46 + (texCoord42*appendResult43 + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 appendResult67 = (float2(_N2_X_Pan , _N2_Y_Pan));
				float2 texCoord65 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult66 = (float2(_N2_X_Tile , _N2_Y_Tile));
				float2 panner69 = ( 1.0 * _Time.y * appendResult67 + (texCoord65*appendResult66 + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 appendResult91 = (float2(_N3_X_Pan , _N3_Y_Pan));
				float2 texCoord83 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult82 = (float2(_N3_X_Tile , _N3_Y_Tile));
				float2 panner90 = ( 1.0 * _Time.y * appendResult91 + (texCoord83*appendResult82 + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float VertexAlpha132 = IN.color.a;
				float Alpha135 = temp_output_224_0;
				float4 appendResult129 = (float4(( ( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) * temp_output_167_0 ) + ( ( temp_output_224_0 * FireColor225 * smoothstepResult229 ) + ( _Burned_Color.rgb * temp_output_170_0 ) + ( temp_output_170_0 * ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * FireColor225 ) ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

				float4 Color = appendResult129;
				float AlphaClipThreshold = 0.5;

			#if defined( ALPHA_CLIP_THRESHOLD )
				clip( Color.a - AlphaClipThreshold );
			#endif

			#if defined(DEBUG_DISPLAY)
				SurfaceData2D surfaceData;
				InitializeSurfaceData(Color.rgb, Color.a, surfaceData);
				InputData2D inputData;
				InitializeInputData(positionWS.xy, half2(IN.texCoord0.xy), inputData);
				half4 debugColor = 0;

				SETUP_DEBUG_DATA_2D(inputData, positionWS, positionCS);

				if (CanDebugOverrideOutputColor(surfaceData, inputData, debugColor))
				{
					return debugColor;
				}
			#endif

			#if ETC1_EXTERNAL_ALPHA
				float4 alpha = SAMPLE_TEXTURE2D( _AlphaTex, sampler_AlphaTex, IN.texCoord0.xy );
				Color.a = lerp( Color.a, alpha.r, _EnableAlphaTexture );
			#endif

			#if !defined( _DISABLE_COLOR_TINT )
				Color *= IN.color;
			#endif

				return Color;
			}

			ENDHLSL
		}

		
        Pass
        {
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }

            Cull Off

            HLSLPROGRAM

			#define _DISABLE_COLOR_TINT
			#define ASE_VERSION 19907
			#define ASE_SRP_VERSION 170300


			#pragma multi_compile_instancing

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ DEBUG_DISPLAY SKINNED_SPRITE

            #define _SURFACE_TYPE_TRANSPARENT 1
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
            #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
            #define FEATURES_GRAPH_VERTEX

            #define SHADERPASS SHADERPASS_DEPTHONLY
			#define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/Core2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0


			sampler2D _MainTex;
			sampler2D _B_Noise;
			sampler2D _F_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float4 _Burned_Color;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N3_Y_Pan;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _N3_X_Pan;
			float _N2_Max;
			float _F_Bot_Max;
			float _F_Bot_Min;
			float _B_Min;
			float _B_Max;
			float _B_X_Pan;
			float _B_Y_Pan;
			float _B_X_Tile;
			float _B_Y_Tile;
			float _B_Offset_Min;
			float _N3_X_Tile;
			float _B_Offset_Max;
			float _F_Top_Max;
			float _F_Offset_Min;
			float _F_Offset_Max;
			float _F_X_Pan;
			float _F_Y_Pan;
			float _F_X_Tile;
			float _F_Y_Tile;
			float _F_Top_Min;
			float _N3_Y_Tile;
			CBUFFER_END


            struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_SKINNED_VERTEX_INPUTS
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            int _ObjectId;
            int _PassValue;

			
			VertexOutput vert(VertexInput v )
			{
				VertexOutput o = (VertexOutput)0;

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_SKINNED_VERTEX_COMPUTE(v);

				v.positionOS = UnityFlipSprite( v.positionOS, unity_SpriteProps.xy );

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS = vertexValue;
				#else
					v.positionOS += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS);

				o.positionCS = vertexInput.positionCS;
				return o;
			}

			half4 frag(VertexOutput IN) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.ase_color.r , IN.ase_color.g , IN.ase_color.b));
				float2 appendResult146 = (float2(_B_X_Pan , _B_Y_Pan));
				float2 texCoord142 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_B_X_Tile , _B_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult163 = smoothstep( ( _B_Offset_Min * 0.5 ) , ( _B_Offset_Max * 0.5 ) , texCoord124.y);
				float temp_output_138_0 = ( tex2D( _B_Noise, panner148 ).r * smoothstepResult163 );
				float smoothstepResult139 = smoothstep( ( _B_Min * 0.5 ) , ( _B_Max * 0.5 ) , temp_output_138_0);
				float temp_output_167_0 = saturate( ( 1.0 - smoothstepResult139 ) );
				float2 texCoord215 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult218 = smoothstep( ( _F_Offset_Min * 0.5 ) , ( _F_Offset_Max * 0.5 ) , texCoord215.y);
				float2 appendResult240 = (float2(_F_X_Pan , _F_Y_Pan));
				float2 texCoord239 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult237 = (float2(_F_X_Tile , _F_Y_Tile));
				float2 panner242 = ( 1.0 * _Time.y * appendResult240 + (texCoord239*appendResult237 + 0.0));
				float smoothstepResult213 = smoothstep( ( _F_Top_Min * 0.5 ) , ( _F_Top_Max * 0.5 ) , ( smoothstepResult218 * tex2D( _F_Noise, panner242 ).r ));
				float temp_output_224_0 = saturate( ( 1.0 - smoothstepResult213 ) );
				float3 FireColor225 = ( 10.0 * _F_Color.rgb );
				float smoothstepResult229 = smoothstep( ( _F_Bot_Min * 0.5 ) , ( _F_Bot_Max * 0.5 ) , temp_output_138_0);
				float temp_output_170_0 = saturate( ( 1.0 - temp_output_167_0 ) );
				float2 appendResult46 = (float2(_N1_X_Pan , _N1_Y_Pan));
				float2 texCoord42 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult43 = (float2(_N1_X_Tile , _N1_Y_Tile));
				float2 panner48 = ( 1.0 * _Time.y * appendResult46 + (texCoord42*appendResult43 + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 appendResult67 = (float2(_N2_X_Pan , _N2_Y_Pan));
				float2 texCoord65 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult66 = (float2(_N2_X_Tile , _N2_Y_Tile));
				float2 panner69 = ( 1.0 * _Time.y * appendResult67 + (texCoord65*appendResult66 + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 appendResult91 = (float2(_N3_X_Pan , _N3_Y_Pan));
				float2 texCoord83 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult82 = (float2(_N3_X_Tile , _N3_Y_Tile));
				float2 panner90 = ( 1.0 * _Time.y * appendResult91 + (texCoord83*appendResult82 + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float VertexAlpha132 = IN.ase_color.a;
				float Alpha135 = temp_output_224_0;
				float4 appendResult129 = (float4(( ( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) * temp_output_167_0 ) + ( ( temp_output_224_0 * FireColor225 * smoothstepResult229 ) + ( _Burned_Color.rgb * temp_output_170_0 ) + ( temp_output_170_0 * ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * FireColor225 ) ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

				float4 Color = appendResult129;
				float AlphaClipThreshold = 0.5;

				#if defined( ALPHA_CLIP_THRESHOLD )
					clip( Color.a - AlphaClipThreshold );
				#endif

				return half4(_ObjectId, _PassValue, 1.0, 1.0);
			}

            ENDHLSL
        }

		
        Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

			Cull Off

            HLSLPROGRAM

			#define _DISABLE_COLOR_TINT
			#define ASE_VERSION 19907
			#define ASE_SRP_VERSION 170300


			#pragma multi_compile_instancing

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ DEBUG_DISPLAY SKINNED_SPRITE

            #define _SURFACE_TYPE_TRANSPARENT 1
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
            #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
            #define FEATURES_GRAPH_VERTEX

            #define SHADERPASS SHADERPASS_DEPTHONLY
			#define SCENEPICKINGPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/2D/Include/Core2D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

        	#define ASE_NEEDS_TEXTURE_COORDINATES0
        	#define ASE_NEEDS_FRAG_COLOR
        	#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0


			sampler2D _MainTex;
			sampler2D _B_Noise;
			sampler2D _F_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float4 _Burned_Color;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N3_Y_Pan;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _N3_X_Pan;
			float _N2_Max;
			float _F_Bot_Max;
			float _F_Bot_Min;
			float _B_Min;
			float _B_Max;
			float _B_X_Pan;
			float _B_Y_Pan;
			float _B_X_Tile;
			float _B_Y_Tile;
			float _B_Offset_Min;
			float _N3_X_Tile;
			float _B_Offset_Max;
			float _F_Top_Max;
			float _F_Offset_Min;
			float _F_Offset_Max;
			float _F_X_Pan;
			float _F_Y_Pan;
			float _F_X_Tile;
			float _F_Y_Tile;
			float _F_Top_Min;
			float _N3_Y_Tile;
			CBUFFER_END


            struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_SKINNED_VERTEX_INPUTS
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

            float4 _SelectionID;

			
			VertexOutput vert(VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_SKINNED_VERTEX_COMPUTE(v);

				v.positionOS = UnityFlipSprite( v.positionOS, unity_SpriteProps.xy );

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS = vertexValue;
				#else
					v.positionOS += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.positionOS);

				o.positionCS = vertexInput.positionCS;
				return o;
			}

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.ase_color.r , IN.ase_color.g , IN.ase_color.b));
				float2 appendResult146 = (float2(_B_X_Pan , _B_Y_Pan));
				float2 texCoord142 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_B_X_Tile , _B_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult163 = smoothstep( ( _B_Offset_Min * 0.5 ) , ( _B_Offset_Max * 0.5 ) , texCoord124.y);
				float temp_output_138_0 = ( tex2D( _B_Noise, panner148 ).r * smoothstepResult163 );
				float smoothstepResult139 = smoothstep( ( _B_Min * 0.5 ) , ( _B_Max * 0.5 ) , temp_output_138_0);
				float temp_output_167_0 = saturate( ( 1.0 - smoothstepResult139 ) );
				float2 texCoord215 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult218 = smoothstep( ( _F_Offset_Min * 0.5 ) , ( _F_Offset_Max * 0.5 ) , texCoord215.y);
				float2 appendResult240 = (float2(_F_X_Pan , _F_Y_Pan));
				float2 texCoord239 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult237 = (float2(_F_X_Tile , _F_Y_Tile));
				float2 panner242 = ( 1.0 * _Time.y * appendResult240 + (texCoord239*appendResult237 + 0.0));
				float smoothstepResult213 = smoothstep( ( _F_Top_Min * 0.5 ) , ( _F_Top_Max * 0.5 ) , ( smoothstepResult218 * tex2D( _F_Noise, panner242 ).r ));
				float temp_output_224_0 = saturate( ( 1.0 - smoothstepResult213 ) );
				float3 FireColor225 = ( 10.0 * _F_Color.rgb );
				float smoothstepResult229 = smoothstep( ( _F_Bot_Min * 0.5 ) , ( _F_Bot_Max * 0.5 ) , temp_output_138_0);
				float temp_output_170_0 = saturate( ( 1.0 - temp_output_167_0 ) );
				float2 appendResult46 = (float2(_N1_X_Pan , _N1_Y_Pan));
				float2 texCoord42 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult43 = (float2(_N1_X_Tile , _N1_Y_Tile));
				float2 panner48 = ( 1.0 * _Time.y * appendResult46 + (texCoord42*appendResult43 + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 appendResult67 = (float2(_N2_X_Pan , _N2_Y_Pan));
				float2 texCoord65 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult66 = (float2(_N2_X_Tile , _N2_Y_Tile));
				float2 panner69 = ( 1.0 * _Time.y * appendResult67 + (texCoord65*appendResult66 + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 appendResult91 = (float2(_N3_X_Pan , _N3_Y_Pan));
				float2 texCoord83 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult82 = (float2(_N3_X_Tile , _N3_Y_Tile));
				float2 panner90 = ( 1.0 * _Time.y * appendResult91 + (texCoord83*appendResult82 + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float VertexAlpha132 = IN.ase_color.a;
				float Alpha135 = temp_output_224_0;
				float4 appendResult129 = (float4(( ( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) * temp_output_167_0 ) + ( ( temp_output_224_0 * FireColor225 * smoothstepResult229 ) + ( _Burned_Color.rgb * temp_output_170_0 ) + ( temp_output_170_0 * ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * FireColor225 ) ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

				float4 Color = appendResult129;
				float AlphaClipThreshold = 0.5;

				#if defined( ALPHA_CLIP_THRESHOLD )
					clip( Color.a - AlphaClipThreshold );
				#endif

				return unity_SelectionID;
			}

            ENDHLSL
        }
		
	}
	CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19907
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;235;-3648,-560;Inherit;False;Property;_F_X_Tile;F_X_Tile;3;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;234;-3648,-480;Inherit;False;Property;_F_Y_Tile;F_Y_Tile;4;0;Create;True;0;0;0;False;0;False;3;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;-2368,1488;Inherit;False;2044.48;1219.432;;41;41;40;42;43;44;45;72;73;46;47;66;65;74;75;48;67;68;32;33;28;69;30;76;77;70;71;53;50;96;95;94;80;81;82;83;92;93;87;91;90;226;Noise Feu;0,0.9552093,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;237;-3488,-560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;239;-3648,-704;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;238;-3312,-560;Inherit;False;Property;_F_X_Pan;F_X_Pan;5;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;236;-3312,-480;Inherit;False;Property;_F_Y_Pan;F_Y_Pan;6;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;140;-3392,320;Inherit;False;Property;_B_X_Tile;B_X_Tile;15;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;141;-3392,400;Inherit;False;Property;_B_Y_Tile;B_Y_Tile;16;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;-2320,2096;Inherit;False;Property;_N2_X_Tile;N2_X_Tile;31;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;73;-2320,2176;Inherit;False;Property;_N2_Y_Tile;N2_Y_Tile;32;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;80;-2336,2528;Inherit;False;Property;_N3_X_Tile;N3_X_Tile;38;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;81;-2336,2608;Inherit;False;Property;_N3_Y_Tile;N3_Y_Tile;39;0;Create;True;0;0;0;False;0;False;1.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;-2304,1696;Inherit;False;Property;_N1_X_Tile;N1_X_Tile;24;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;41;-2304,1776;Inherit;False;Property;_N1_Y_Tile;N1_Y_Tile;25;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;143;-3232,320;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;-3392,176;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;-3120,-976;Inherit;False;Property;_F_Offset_Min;F_Offset_Min;12;0;Create;True;0;0;0;False;0;False;1.57;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;-3120,-880;Inherit;False;Property;_F_Offset_Max;F_Offset_Max;13;0;Create;True;0;0;0;False;0;False;2.29;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;240;-3168,-560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;241;-3312,-704;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;-3056,320;Inherit;False;Property;_B_X_Pan;B_X_Pan;17;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;145;-3056,400;Inherit;False;Property;_B_Y_Pan;B_Y_Pan;18;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;66;-2160,2096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;-2320,1952;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;74;-1984,2096;Inherit;False;Property;_N2_X_Pan;N2_X_Pan;33;0;Create;True;0;0;0;False;0;False;-0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-1984,2176;Inherit;False;Property;_N2_Y_Pan;N2_Y_Pan;34;0;Create;True;0;0;0;False;0;False;-0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;82;-2176,2528;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;83;-2336,2384;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;-1984,2528;Inherit;False;Property;_N3_X_Pan;N3_X_Pan;40;0;Create;True;0;0;0;False;0;False;-0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;93;-1984,2608;Inherit;False;Property;_N3_Y_Pan;N3_Y_Pan;41;0;Create;True;0;0;0;False;0;False;-0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-2304,1552;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-2144,1696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-1968,1696;Inherit;False;Property;_N1_X_Pan;N1_X_Pan;26;0;Create;True;0;0;0;False;0;False;0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-1968,1776;Inherit;False;Property;_N1_Y_Pan;N1_Y_Pan;27;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;164;-2816,736;Inherit;False;Property;_B_Offset_Min;B_Offset_Min;21;0;Create;True;0;0;0;False;0;False;1.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;165;-2816,832;Inherit;False;Property;_B_Offset_Max;B_Offset_Max;22;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;146;-2912,320;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;147;-3056,176;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;216;-2944,-976;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;-2944,-880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;215;-3040,-1264;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;242;-2976,-704;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;-2976,1504;Inherit;False;484;365.592;;4;26;27;25;225;Fire_HDR;1,0.4732539,0,1;0;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;68;-1984,1952;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;67;-1840,2096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;-2000,2384;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;91;-1840,2528;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;46;-1824,1696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;-1968,1552;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;124;-2752,448;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;179;-2640,736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;180;-2640,832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;214;-2352,-480;Inherit;False;Property;_F_Top_Min;F_Top_Min;9;0;Create;True;0;0;0;False;0;False;0.13;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;210;-2352,-384;Inherit;False;Property;_F_Top_Max;F_Top_Max;10;0;Create;True;0;0;0;False;0;False;0.38;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;148;-2720,176;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;-2704,-1216;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;-2752,-704;Inherit;True;Property;_F_Noise;F_Noise;2;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;ff863930ab4780c4fab388af3c451ae3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-2864,1552;Inherit;False;Constant;_F_HDR;F_HDR;2;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-2928,1632;Inherit;False;Property;_F_Color;F_Color;1;0;Create;True;0;0;0;False;0;False;1,0.55326,0.2396226,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;69;-1664,1952;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;-1664,2384;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;-1632,1552;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;163;-2400,496;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;149;-2160,672;Inherit;False;Property;_B_Min;B_Min;19;0;Create;True;0;0;0;False;0;False;0.06;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;150;-2160,768;Inherit;False;Property;_B_Max;B_Max;20;0;Create;True;0;0;0;False;0;False;0.14;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;221;-2272,-736;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;212;-2208,-480;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;211;-2208,-384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;137;-2496,176;Inherit;True;Property;_B_Noise;B_Noise;14;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;ff863930ab4780c4fab388af3c451ae3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-2672,1552;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;-512,-144;Inherit;False;564;453.16;;5;18;24;23;130;132;Sprite Texture;0,0,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;-1440,1552;Inherit;True;Property;_N_Noise_1;N_Noise_1;23;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;-1456,1952;Inherit;True;Property;_N_Noise_2;N_Noise_2;30;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;76;-1328,2176;Inherit;False;Property;_N2_Min;N2_Min;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;77;-1328,2256;Inherit;False;Property;_N2_Max;N2_Max;36;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-1152,2592;Inherit;False;Property;_N3_Max;N3_Max;43;0;Create;True;0;0;0;False;0;False;0.38;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;-1152,2512;Inherit;False;Property;_N3_Min;N3_Min;42;0;Create;True;0;0;0;False;0;False;0.14;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;-1440,2368;Inherit;True;Property;_N_Noise_3;N_Noise_3;37;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;3e082a8b3a145a14ab1c005c3d1876d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;-1312,1776;Inherit;False;Property;_N1_Min;N1_Min;28;0;Create;True;0;0;0;False;0;False;0.07;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;-1312,1856;Inherit;False;Property;_N1_Max;N1_Max;29;0;Create;True;0;0;0;False;0;False;0.17;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;138;-2096,400;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;182;-2016,672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;181;-2016,768;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;230;-1968,-80;Inherit;False;Property;_F_Bot_Min;F_Bot_Min;7;0;Create;True;0;0;0;False;0;False;0.11;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;233;-1968,16;Inherit;False;Property;_F_Bot_Max;F_Bot_Max;8;0;Create;True;0;0;0;False;0;False;0.81;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;213;-2048,-736;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;225;-2704,1728;Inherit;False;FireColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;24;-464,96;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;-1072,1696;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;71;-1072,1952;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-992,2368;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;169;-608,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;226;-832,1968;Inherit;False;225;FireColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;-1840,384;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;231;-1824,-80;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;232;-1824,16;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;223;-1824,-736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;18;-464,-96;Inherit;True;Property;_MainTex;_MainTex;0;0;Create;True;0;0;0;False;0;False;-1;6f037857f49811a4c9604015e1eaabf7;6f037857f49811a4c9604015e1eaabf7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;130;-288,112;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-672,1696;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;170;-464,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;168;-608,608;Inherit;False;Property;_Burned_Color;Burned_Color;11;0;Create;True;0;0;0;False;0;False;0.2150944,0.1631983,0.1213457,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;166;-1616,400;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;227;-1680,-496;Inherit;False;225;FireColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;229;-1632,-240;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;224;-1680,-736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;132;-192,224;Inherit;False;VertexAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;23;-128,32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;167;-1440,400;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;171;-272,816;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;175;-272,1024;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;228;-1440,-432;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;135;-1488,-736;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;172;112,400;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;-48,768;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;134;560,912;Inherit;True;132;VertexAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;136;560,1088;Inherit;True;135;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;133;752,784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;64;528,672;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;129;896,672;Inherit;True;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;111;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit Forward;0;1;Sprite Unlit Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;112;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;SceneSelectionPass;0;2;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;ScenePickingPass;0;3;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;110;1120,672;Float;False;True;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;18;Shader_Bedo_Fire;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit;0;0;Sprite Unlit;5;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;5;Alpha Clipping;0;0;Disable Color Tint;1;0;Vertex Position;1;0;Debug Display;0;0;External Alpha;0;0;0;4;True;True;True;True;False;;False;0
WireConnection;237;0;235;0
WireConnection;237;1;234;0
WireConnection;143;0;140;0
WireConnection;143;1;141;0
WireConnection;240;0;238;0
WireConnection;240;1;236;0
WireConnection;241;0;239;0
WireConnection;241;1;237;0
WireConnection;66;0;72;0
WireConnection;66;1;73;0
WireConnection;82;0;80;0
WireConnection;82;1;81;0
WireConnection;43;0;40;0
WireConnection;43;1;41;0
WireConnection;146;0;144;0
WireConnection;146;1;145;0
WireConnection;147;0;142;0
WireConnection;147;1;143;0
WireConnection;216;0;219;0
WireConnection;217;0;220;0
WireConnection;242;0;241;0
WireConnection;242;2;240;0
WireConnection;68;0;65;0
WireConnection;68;1;66;0
WireConnection;67;0;74;0
WireConnection;67;1;75;0
WireConnection;87;0;83;0
WireConnection;87;1;82;0
WireConnection;91;0;92;0
WireConnection;91;1;93;0
WireConnection;46;0;44;0
WireConnection;46;1;45;0
WireConnection;47;0;42;0
WireConnection;47;1;43;0
WireConnection;179;0;164;0
WireConnection;180;0;165;0
WireConnection;148;0;147;0
WireConnection;148;2;146;0
WireConnection;218;0;215;2
WireConnection;218;1;216;0
WireConnection;218;2;217;0
WireConnection;243;1;242;0
WireConnection;69;0;68;0
WireConnection;69;2;67;0
WireConnection;90;0;87;0
WireConnection;90;2;91;0
WireConnection;48;0;47;0
WireConnection;48;2;46;0
WireConnection;163;0;124;2
WireConnection;163;1;179;0
WireConnection;163;2;180;0
WireConnection;221;0;218;0
WireConnection;221;1;243;1
WireConnection;212;0;214;0
WireConnection;211;0;210;0
WireConnection;137;1;148;0
WireConnection;27;0;26;0
WireConnection;27;1;25;5
WireConnection;28;1;48;0
WireConnection;70;1;69;0
WireConnection;50;1;90;0
WireConnection;138;0;137;1
WireConnection;138;1;163;0
WireConnection;182;0;149;0
WireConnection;181;0;150;0
WireConnection;213;0;221;0
WireConnection;213;1;212;0
WireConnection;213;2;211;0
WireConnection;225;0;27;0
WireConnection;30;0;28;1
WireConnection;30;1;32;0
WireConnection;30;2;33;0
WireConnection;71;0;70;1
WireConnection;71;1;76;0
WireConnection;71;2;77;0
WireConnection;94;0;50;1
WireConnection;94;1;95;0
WireConnection;94;2;96;0
WireConnection;169;0;167;0
WireConnection;139;0;138;0
WireConnection;139;1;182;0
WireConnection;139;2;181;0
WireConnection;231;0;230;0
WireConnection;232;0;233;0
WireConnection;223;0;213;0
WireConnection;130;0;24;1
WireConnection;130;1;24;2
WireConnection;130;2;24;3
WireConnection;53;0;30;0
WireConnection;53;1;71;0
WireConnection;53;2;94;0
WireConnection;53;3;226;0
WireConnection;170;0;169;0
WireConnection;166;0;139;0
WireConnection;229;0;138;0
WireConnection;229;1;231;0
WireConnection;229;2;232;0
WireConnection;224;0;223;0
WireConnection;132;0;24;4
WireConnection;23;0;18;5
WireConnection;23;1;130;0
WireConnection;167;0;166;0
WireConnection;171;0;168;5
WireConnection;171;1;170;0
WireConnection;175;0;170;0
WireConnection;175;1;53;0
WireConnection;228;0;224;0
WireConnection;228;1;227;0
WireConnection;228;2;229;0
WireConnection;135;0;224;0
WireConnection;172;0;23;0
WireConnection;172;1;167;0
WireConnection;176;0;228;0
WireConnection;176;1;171;0
WireConnection;176;2;175;0
WireConnection;133;0;134;0
WireConnection;133;1;136;0
WireConnection;64;0;172;0
WireConnection;64;1;176;0
WireConnection;129;0;64;0
WireConnection;129;3;133;0
WireConnection;110;0;129;0
ASEEND*/
//CHKSM=62ED18593AF16E6B466851B2E3BD73DD77589136