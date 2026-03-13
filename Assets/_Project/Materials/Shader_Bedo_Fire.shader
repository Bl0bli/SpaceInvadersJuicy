// Made with Amplify Shader Editor v1.9.9.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Shader_Bedo_Fire"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_MainTex( "_MainTex", 2D ) = "white" {}
		[HDR] _Fire_Color( "Fire_Color", Color ) = ( 4, 2.21304, 0.9584904, 0 )
		_Fire_Offset( "Fire_Offset", Float ) = 0.3
		_Fire_Scale( "Fire_Scale", Range( 0.001, 0.4 ) ) = 0.05107023
		_Embers_Scale( "Embers_Scale", Range( 0.001, 0.4 ) ) = 0.12
		_Burned_Color( "Burned_Color", Color ) = ( 0.2150944, 0.1631983, 0.1213457, 0 )
		_Burnt_Offset( "Burnt_Offset", Float ) = 0.15
		_Burnt_Scale( "Burnt_Scale", Float ) = 0.075
		_AlphaGradient_Offset( "AlphaGradient_Offset", Float ) = 0.15
		_Alpha_Offset( "Alpha_Offset", Float ) = 0.33
		_Bedo_Consumption( "Bedo_Consumption", Range( 0, 1 ) ) = 0
		_Alpha_Noise( "Alpha_Noise", 2D ) = "white" {}
		_A_Noise_Tile( "A_Noise_Tile", Vector ) = ( 1.5, 1.5, 0, 0 )
		_A_Noise_Pan( "A_Noise_Pan", Vector ) = ( 0, 0.1, 0, 0 )
		_N_Noise_1( "N_Noise_1", 2D ) = "white" {}
		_N1_Tile( "N1_Tile", Vector ) = ( 1, 1, 0, 0 )
		_N1_Pan( "N1_Pan", Vector ) = ( 0, 0.1, 0, 0 )
		_N1_Min( "N1_Min", Float ) = 0.07
		_N1_Max( "N1_Max", Float ) = 0.17
		_N_Noise_2( "N_Noise_2", 2D ) = "white" {}
		_N2_Tile( "N2_Tile", Vector ) = ( 0.5, 0.5, 0, 0 )
		_N2_Pan( "N2_Pan", Vector ) = ( 0, 0.2, 0, 0 )
		_N2_Min( "N2_Min", Float ) = -0.16
		_N2_Max( "N2_Max", Float ) = 1
		_N_Noise_3( "N_Noise_3", 2D ) = "white" {}
		_N3_Tile( "N3_Tile", Vector ) = ( 1, 1.5, 0, 0 )
		_N3_Pan( "N3_Pan", Vector ) = ( 0, 0, 0, 0 )
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

			sampler2D _Alpha_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _MainTex;
			CBUFFER_START( UnityPerMaterial )
			float4 _Burned_Color;
			float4 _Fire_Color;
			float4 _MainTex_ST;
			float2 _N1_Pan;
			float2 _N3_Tile;
			float2 _A_Noise_Pan;
			float2 _A_Noise_Tile;
			float2 _N3_Pan;
			float2 _N2_Tile;
			float2 _N2_Pan;
			float2 _N1_Tile;
			float _AlphaGradient_Offset;
			float _N3_Max;
			float _N3_Min;
			float _N2_Max;
			float _Burnt_Scale;
			float _N1_Max;
			float _N1_Min;
			float _Fire_Scale;
			float _Fire_Offset;
			float _Embers_Scale;
			float _Burnt_Offset;
			float _Bedo_Consumption;
			float _N2_Min;
			float _Alpha_Offset;
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

				float temp_output_343_0 =  (0.0 + ( _Bedo_Consumption - 0.0 ) * ( 0.69 - 0.0 ) / ( 1.0 - 0.0 ) );
				float2 texCoord315 = IN.texCoord0.xy * float2( 0.5,0.5 ) + float2( 0,0 );
				float2 panner320 = ( 1.0 * _Time.y * _A_Noise_Pan + (texCoord315*_A_Noise_Tile + 0.0));
				float smoothstepResult325 = smoothstep( 0.05 , 3.82 , tex2D( _Alpha_Noise, panner320 ).r);
				float2 temp_cast_0 = (smoothstepResult325).xx;
				float2 texCoord248 = IN.texCoord0.xy * float2( 1,1 ) + temp_cast_0;
				float smoothstepResult259 = smoothstep( _Burnt_Scale , 0.0 , abs( ( ( temp_output_343_0 + _Burnt_Offset ) - texCoord248.y ) ));
				float temp_output_257_0 = abs( ( ( temp_output_343_0 + _Fire_Offset ) - texCoord248.y ) );
				float smoothstepResult267 = smoothstep( _Embers_Scale , 0.0 , temp_output_257_0);
				float smoothstepResult254 = smoothstep( _Fire_Scale , 0.0 , temp_output_257_0);
				float2 texCoord42 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner48 = ( 1.0 * _Time.y * _N1_Pan + (texCoord42*_N1_Tile + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 texCoord65 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner69 = ( 1.0 * _Time.y * _N2_Pan + (texCoord65*_N2_Tile + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 texCoord83 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner90 = ( 1.0 * _Time.y * _N3_Pan + (texCoord83*_N3_Tile + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float Fire_Move264 = ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 );
				float3 Burnt287 = ( ( ( smoothstepResult259 * ( 1.0 - smoothstepResult267 ) ) * _Burned_Color.rgb ) + ( _Fire_Color.rgb * smoothstepResult254 ) + ( _Fire_Color.rgb * ( ( 1.0 - smoothstepResult254 ) * smoothstepResult267 ) * Fire_Move264 ) );
				float smoothstepResult250 = smoothstep( 0.0 , 0.1 , ( ( temp_output_343_0 + _AlphaGradient_Offset ) - texCoord248.y ));
				float Alpha_Gradient283 = smoothstepResult250;
				float2 uv_MainTex = IN.texCoord0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.color.r , IN.color.g , IN.color.b));
				float3 temp_output_23_0 = ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 );
				float VertexAlpha132 = IN.color.a;
				float smoothstepResult292 = smoothstep( 0.0 , 0.17 , ( ( _Alpha_Offset + temp_output_343_0 ) - texCoord248.y ));
				float Global_Alpha295 = smoothstepResult292;
				float4 appendResult129 = (float4(( Burnt287 + ( Alpha_Gradient283 * temp_output_23_0 ) ) , ( VertexAlpha132 * Global_Alpha295 )));
				

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

			sampler2D _Alpha_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _MainTex;
			CBUFFER_START( UnityPerMaterial )
			float4 _Burned_Color;
			float4 _Fire_Color;
			float4 _MainTex_ST;
			float2 _N1_Pan;
			float2 _N3_Tile;
			float2 _A_Noise_Pan;
			float2 _A_Noise_Tile;
			float2 _N3_Pan;
			float2 _N2_Tile;
			float2 _N2_Pan;
			float2 _N1_Tile;
			float _AlphaGradient_Offset;
			float _N3_Max;
			float _N3_Min;
			float _N2_Max;
			float _Burnt_Scale;
			float _N1_Max;
			float _N1_Min;
			float _Fire_Scale;
			float _Fire_Offset;
			float _Embers_Scale;
			float _Burnt_Offset;
			float _Bedo_Consumption;
			float _N2_Min;
			float _Alpha_Offset;
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

				float temp_output_343_0 =  (0.0 + ( _Bedo_Consumption - 0.0 ) * ( 0.69 - 0.0 ) / ( 1.0 - 0.0 ) );
				float2 texCoord315 = IN.texCoord0.xy * float2( 0.5,0.5 ) + float2( 0,0 );
				float2 panner320 = ( 1.0 * _Time.y * _A_Noise_Pan + (texCoord315*_A_Noise_Tile + 0.0));
				float smoothstepResult325 = smoothstep( 0.05 , 3.82 , tex2D( _Alpha_Noise, panner320 ).r);
				float2 temp_cast_0 = (smoothstepResult325).xx;
				float2 texCoord248 = IN.texCoord0.xy * float2( 1,1 ) + temp_cast_0;
				float smoothstepResult259 = smoothstep( _Burnt_Scale , 0.0 , abs( ( ( temp_output_343_0 + _Burnt_Offset ) - texCoord248.y ) ));
				float temp_output_257_0 = abs( ( ( temp_output_343_0 + _Fire_Offset ) - texCoord248.y ) );
				float smoothstepResult267 = smoothstep( _Embers_Scale , 0.0 , temp_output_257_0);
				float smoothstepResult254 = smoothstep( _Fire_Scale , 0.0 , temp_output_257_0);
				float2 texCoord42 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner48 = ( 1.0 * _Time.y * _N1_Pan + (texCoord42*_N1_Tile + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 texCoord65 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner69 = ( 1.0 * _Time.y * _N2_Pan + (texCoord65*_N2_Tile + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 texCoord83 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner90 = ( 1.0 * _Time.y * _N3_Pan + (texCoord83*_N3_Tile + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float Fire_Move264 = ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 );
				float3 Burnt287 = ( ( ( smoothstepResult259 * ( 1.0 - smoothstepResult267 ) ) * _Burned_Color.rgb ) + ( _Fire_Color.rgb * smoothstepResult254 ) + ( _Fire_Color.rgb * ( ( 1.0 - smoothstepResult254 ) * smoothstepResult267 ) * Fire_Move264 ) );
				float smoothstepResult250 = smoothstep( 0.0 , 0.1 , ( ( temp_output_343_0 + _AlphaGradient_Offset ) - texCoord248.y ));
				float Alpha_Gradient283 = smoothstepResult250;
				float2 uv_MainTex = IN.texCoord0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.color.r , IN.color.g , IN.color.b));
				float3 temp_output_23_0 = ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 );
				float VertexAlpha132 = IN.color.a;
				float smoothstepResult292 = smoothstep( 0.0 , 0.17 , ( ( _Alpha_Offset + temp_output_343_0 ) - texCoord248.y ));
				float Global_Alpha295 = smoothstepResult292;
				float4 appendResult129 = (float4(( Burnt287 + ( Alpha_Gradient283 * temp_output_23_0 ) ) , ( VertexAlpha132 * Global_Alpha295 )));
				

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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR


			sampler2D _Alpha_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _MainTex;
			CBUFFER_START( UnityPerMaterial )
			float4 _Burned_Color;
			float4 _Fire_Color;
			float4 _MainTex_ST;
			float2 _N1_Pan;
			float2 _N3_Tile;
			float2 _A_Noise_Pan;
			float2 _A_Noise_Tile;
			float2 _N3_Pan;
			float2 _N2_Tile;
			float2 _N2_Pan;
			float2 _N1_Tile;
			float _AlphaGradient_Offset;
			float _N3_Max;
			float _N3_Min;
			float _N2_Max;
			float _Burnt_Scale;
			float _N1_Max;
			float _N1_Min;
			float _Fire_Scale;
			float _Fire_Offset;
			float _Embers_Scale;
			float _Burnt_Offset;
			float _Bedo_Consumption;
			float _N2_Min;
			float _Alpha_Offset;
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

				float temp_output_343_0 =  (0.0 + ( _Bedo_Consumption - 0.0 ) * ( 0.69 - 0.0 ) / ( 1.0 - 0.0 ) );
				float2 texCoord315 = IN.ase_texcoord.xy * float2( 0.5,0.5 ) + float2( 0,0 );
				float2 panner320 = ( 1.0 * _Time.y * _A_Noise_Pan + (texCoord315*_A_Noise_Tile + 0.0));
				float smoothstepResult325 = smoothstep( 0.05 , 3.82 , tex2D( _Alpha_Noise, panner320 ).r);
				float2 temp_cast_0 = (smoothstepResult325).xx;
				float2 texCoord248 = IN.ase_texcoord.xy * float2( 1,1 ) + temp_cast_0;
				float smoothstepResult259 = smoothstep( _Burnt_Scale , 0.0 , abs( ( ( temp_output_343_0 + _Burnt_Offset ) - texCoord248.y ) ));
				float temp_output_257_0 = abs( ( ( temp_output_343_0 + _Fire_Offset ) - texCoord248.y ) );
				float smoothstepResult267 = smoothstep( _Embers_Scale , 0.0 , temp_output_257_0);
				float smoothstepResult254 = smoothstep( _Fire_Scale , 0.0 , temp_output_257_0);
				float2 texCoord42 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner48 = ( 1.0 * _Time.y * _N1_Pan + (texCoord42*_N1_Tile + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 texCoord65 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner69 = ( 1.0 * _Time.y * _N2_Pan + (texCoord65*_N2_Tile + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 texCoord83 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner90 = ( 1.0 * _Time.y * _N3_Pan + (texCoord83*_N3_Tile + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float Fire_Move264 = ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 );
				float3 Burnt287 = ( ( ( smoothstepResult259 * ( 1.0 - smoothstepResult267 ) ) * _Burned_Color.rgb ) + ( _Fire_Color.rgb * smoothstepResult254 ) + ( _Fire_Color.rgb * ( ( 1.0 - smoothstepResult254 ) * smoothstepResult267 ) * Fire_Move264 ) );
				float smoothstepResult250 = smoothstep( 0.0 , 0.1 , ( ( temp_output_343_0 + _AlphaGradient_Offset ) - texCoord248.y ));
				float Alpha_Gradient283 = smoothstepResult250;
				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.ase_color.r , IN.ase_color.g , IN.ase_color.b));
				float3 temp_output_23_0 = ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 );
				float VertexAlpha132 = IN.ase_color.a;
				float smoothstepResult292 = smoothstep( 0.0 , 0.17 , ( ( _Alpha_Offset + temp_output_343_0 ) - texCoord248.y ));
				float Global_Alpha295 = smoothstepResult292;
				float4 appendResult129 = (float4(( Burnt287 + ( Alpha_Gradient283 * temp_output_23_0 ) ) , ( VertexAlpha132 * Global_Alpha295 )));
				

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
        	#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
        	#define ASE_NEEDS_FRAG_COLOR


			sampler2D _Alpha_Noise;
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _MainTex;
			CBUFFER_START( UnityPerMaterial )
			float4 _Burned_Color;
			float4 _Fire_Color;
			float4 _MainTex_ST;
			float2 _N1_Pan;
			float2 _N3_Tile;
			float2 _A_Noise_Pan;
			float2 _A_Noise_Tile;
			float2 _N3_Pan;
			float2 _N2_Tile;
			float2 _N2_Pan;
			float2 _N1_Tile;
			float _AlphaGradient_Offset;
			float _N3_Max;
			float _N3_Min;
			float _N2_Max;
			float _Burnt_Scale;
			float _N1_Max;
			float _N1_Min;
			float _Fire_Scale;
			float _Fire_Offset;
			float _Embers_Scale;
			float _Burnt_Offset;
			float _Bedo_Consumption;
			float _N2_Min;
			float _Alpha_Offset;
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

				float temp_output_343_0 =  (0.0 + ( _Bedo_Consumption - 0.0 ) * ( 0.69 - 0.0 ) / ( 1.0 - 0.0 ) );
				float2 texCoord315 = IN.ase_texcoord.xy * float2( 0.5,0.5 ) + float2( 0,0 );
				float2 panner320 = ( 1.0 * _Time.y * _A_Noise_Pan + (texCoord315*_A_Noise_Tile + 0.0));
				float smoothstepResult325 = smoothstep( 0.05 , 3.82 , tex2D( _Alpha_Noise, panner320 ).r);
				float2 temp_cast_0 = (smoothstepResult325).xx;
				float2 texCoord248 = IN.ase_texcoord.xy * float2( 1,1 ) + temp_cast_0;
				float smoothstepResult259 = smoothstep( _Burnt_Scale , 0.0 , abs( ( ( temp_output_343_0 + _Burnt_Offset ) - texCoord248.y ) ));
				float temp_output_257_0 = abs( ( ( temp_output_343_0 + _Fire_Offset ) - texCoord248.y ) );
				float smoothstepResult267 = smoothstep( _Embers_Scale , 0.0 , temp_output_257_0);
				float smoothstepResult254 = smoothstep( _Fire_Scale , 0.0 , temp_output_257_0);
				float2 texCoord42 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner48 = ( 1.0 * _Time.y * _N1_Pan + (texCoord42*_N1_Tile + 0.0));
				float smoothstepResult30 = smoothstep( _N1_Min , _N1_Max , tex2D( _N_Noise_1, panner48 ).r);
				float2 texCoord65 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner69 = ( 1.0 * _Time.y * _N2_Pan + (texCoord65*_N2_Tile + 0.0));
				float smoothstepResult71 = smoothstep( _N2_Min , _N2_Max , tex2D( _N_Noise_2, panner69 ).r);
				float2 texCoord83 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner90 = ( 1.0 * _Time.y * _N3_Pan + (texCoord83*_N3_Tile + 0.0));
				float smoothstepResult94 = smoothstep( _N3_Min , _N3_Max , tex2D( _N_Noise_3, panner90 ).r);
				float Fire_Move264 = ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 );
				float3 Burnt287 = ( ( ( smoothstepResult259 * ( 1.0 - smoothstepResult267 ) ) * _Burned_Color.rgb ) + ( _Fire_Color.rgb * smoothstepResult254 ) + ( _Fire_Color.rgb * ( ( 1.0 - smoothstepResult254 ) * smoothstepResult267 ) * Fire_Move264 ) );
				float smoothstepResult250 = smoothstep( 0.0 , 0.1 , ( ( temp_output_343_0 + _AlphaGradient_Offset ) - texCoord248.y ));
				float Alpha_Gradient283 = smoothstepResult250;
				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 appendResult130 = (float3(IN.ase_color.r , IN.ase_color.g , IN.ase_color.b));
				float3 temp_output_23_0 = ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 );
				float VertexAlpha132 = IN.ase_color.a;
				float smoothstepResult292 = smoothstep( 0.0 , 0.17 , ( ( _Alpha_Offset + temp_output_343_0 ) - texCoord248.y ));
				float Global_Alpha295 = smoothstepResult292;
				float4 appendResult129 = (float4(( Burnt287 + ( Alpha_Gradient283 * temp_output_23_0 ) ) , ( VertexAlpha132 * Global_Alpha295 )));
				

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
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;317;-7056,-48;Inherit;False;Property;_A_Noise_Tile;A_Noise_Tile;12;0;Create;True;0;0;0;False;0;False;1.5,1.5;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;315;-7088,-176;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;-3360,1584;Inherit;False;2044.48;1219.432;;29;42;47;65;48;68;32;33;28;69;30;76;77;70;71;53;50;96;95;94;83;87;90;264;337;338;339;340;341;342;Noise Feu;0,0.9552093,1,1;0;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;318;-6864,-176;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;328;-6832,-48;Inherit;False;Property;_A_Noise_Pan;A_Noise_Pan;13;0;Create;True;0;0;0;False;0;False;0,0.1;0.1,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;305;-5648,-512;Inherit;False;3748;1717;;40;299;298;260;248;251;256;253;258;257;304;262;301;267;303;276;268;297;281;259;302;265;269;294;277;300;249;254;168;275;293;272;266;250;273;292;283;287;295;336;343;Separation Lignes Fire Burn Alpha;1,0.5651821,0,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;-3312,2048;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-3296,1648;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;83;-3328,2480;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;320;-6640,-176;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;337;-3232,1776;Inherit;False;Property;_N1_Tile;N1_Tile;15;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;339;-3280,2176;Inherit;False;Property;_N2_Tile;N2_Tile;20;0;Create;True;0;0;0;False;0;False;0.5,0.5;0.5,0.5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;341;-3264,2624;Inherit;False;Property;_N3_Tile;N3_Tile;25;0;Create;True;0;0;0;False;0;False;1,1.5;1,1.5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;299;-5136,496;Inherit;False;Property;_Fire_Offset;Fire_Offset;2;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;68;-2976,2048;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;-2960,1648;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;-2992,2480;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;322;-6448,-176;Inherit;True;Property;_Alpha_Noise;Alpha_Noise;11;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;ff863930ab4780c4fab388af3c451ae3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;342;-2928,2608;Inherit;False;Property;_N3_Pan;N3_Pan;26;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;340;-2944,2176;Inherit;False;Property;_N2_Pan;N2_Pan;21;0;Create;True;0;0;0;False;0;False;0,0.2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;338;-2928,1776;Inherit;False;Property;_N1_Pan;N1_Pan;16;0;Create;True;0;0;0;False;0;False;0,0.1;0,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;251;-5792,-320;Inherit;False;Property;_Bedo_Consumption;Bedo_Consumption;10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;298;-5040,128;Inherit;False;Property;_Burnt_Offset;Burnt_Offset;6;0;Create;True;0;0;0;False;0;False;0.15;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;260;-4928,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;248;-5600,192;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;69;-2656,2048;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;-2624,1648;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;-2656,2480;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;325;-6048,-176;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0.05;False;2;FLOAT;3.82;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;343;-5472,-192;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.69;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;256;-4816,80;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;253;-4816,528;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.68;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;-2432,1648;Inherit;True;Property;_N_Noise_1;N_Noise_1;14;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;-2448,2048;Inherit;True;Property;_N_Noise_2;N_Noise_2;19;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;-2432,2464;Inherit;True;Property;_N_Noise_3;N_Noise_3;24;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;3e082a8b3a145a14ab1c005c3d1876d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;-2304,1872;Inherit;False;Property;_N1_Min;N1_Min;17;0;Create;True;0;0;0;False;0;False;0.07;0.07;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;-2304,1952;Inherit;False;Property;_N1_Max;N1_Max;18;0;Create;True;0;0;0;False;0;False;0.17;0.17;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;76;-2320,2272;Inherit;False;Property;_N2_Min;N2_Min;22;0;Create;True;0;0;0;False;0;False;-0.16;-0.16;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;77;-2320,2352;Inherit;False;Property;_N2_Max;N2_Max;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;-2144,2608;Inherit;False;Property;_N3_Min;N3_Min;27;0;Create;True;0;0;0;False;0;False;0.14;0.14;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-2144,2688;Inherit;False;Property;_N3_Max;N3_Max;28;0;Create;True;0;0;0;False;0;False;0.38;0.38;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;258;-4624,96;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.68;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;257;-4592,528;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;304;-4608,912;Inherit;False;Property;_Embers_Scale;Embers_Scale;4;0;Create;True;0;0;0;False;0;False;0.12;0.12;0.001;0.4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-1984,2464;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;-2064,1792;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;71;-2064,2048;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;262;-4416,128;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;267;-4304,848;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0.27;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;303;-4512,336;Inherit;False;Property;_Burnt_Scale;Burnt_Scale;7;0;Create;True;0;0;0;False;0;False;0.075;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-1760,1792;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;301;-5024,-48;Inherit;False;Property;_AlphaGradient_Offset;AlphaGradient_Offset;8;0;Create;True;0;0;0;False;0;False;0.15;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;302;-4592,752;Inherit;False;Property;_Fire_Scale;Fire_Scale;3;0;Create;True;0;0;0;False;0;False;0.05107023;0.075;0.001;0.4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;297;-5216,-448;Inherit;False;Property;_Alpha_Offset;Alpha_Offset;9;0;Create;True;0;0;0;False;0;False;0.33;0.375;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;276;-3984,240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;259;-4224,128;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;268;-3792,720;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;264;-1536,1792;Inherit;False;Fire_Move;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;281;-4880,-224;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.53;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;294;-5024,-448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.375;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;-512,-144;Inherit;False;564;453.16;;5;18;24;23;130;132;Sprite Texture;0,0,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;277;-3776,128;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;249;-4576,-176;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.68;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;168;-3776,336;Inherit;False;Property;_Burned_Color;Burned_Color;5;0;Create;True;0;0;0;False;0;False;0.2150944,0.1631983,0.1213457,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;300;-3360,448;Inherit;False;Property;_Fire_Color;Fire_Color;1;1;[HDR];Create;True;0;0;0;False;0;False;4,2.21304,0.9584904,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;269;-3408,720;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;265;-3184,976;Inherit;True;264;Fire_Move;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;254;-4288,528;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0.075;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;293;-4768,-464;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.68;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;24;-464,96;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;275;-3536,160;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;250;-4192,-176;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;266;-2928,736;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;272;-3024,464;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;18;-464,-96;Inherit;True;Property;_MainTex;_MainTex;0;0;Create;True;0;0;0;False;0;False;-1;6f037857f49811a4c9604015e1eaabf7;6f037857f49811a4c9604015e1eaabf7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;130;-288,112;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;283;-3808,-176;Inherit;False;Alpha_Gradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;273;-2656,448;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;292;-4320,-464;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.17;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;23;-128,32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;132;-192,224;Inherit;False;VertexAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;284;144,0;Inherit;False;283;Alpha_Gradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;295;-4048,-464;Inherit;False;Global_Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;287;-2416,448;Inherit;False;Burnt;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;134;464,896;Inherit;True;132;VertexAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;285;400,80;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;288;432,-16;Inherit;False;287;Burnt;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;296;448,1104;Inherit;True;295;Global_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;133;752,784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;289;720,208;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;336;-5040,640;Inherit;False;fire_Offset;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;169;-608,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;170;-464,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;175;-272,1024;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;171;-272,816;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;172;112,400;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;129;896,672;Inherit;True;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;32,784;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;64;384,592;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;136;32,992;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;306;-512,1040;Inherit;True;264;Fire_Move;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;111;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit Forward;0;1;Sprite Unlit Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;112;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;SceneSelectionPass;0;2;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;ScenePickingPass;0;3;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;110;1120,672;Float;False;True;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;5;Shader_Bedo_Fire;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit;0;0;Sprite Unlit;5;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;5;Alpha Clipping;0;0;Disable Color Tint;1;0;Vertex Position;1;0;Debug Display;0;0;External Alpha;0;0;0;4;True;True;True;True;False;;False;0
WireConnection;318;0;315;0
WireConnection;318;1;317;0
WireConnection;320;0;318;0
WireConnection;320;2;328;0
WireConnection;68;0;65;0
WireConnection;68;1;339;0
WireConnection;47;0;42;0
WireConnection;47;1;337;0
WireConnection;87;0;83;0
WireConnection;87;1;341;0
WireConnection;322;1;320;0
WireConnection;260;0;343;0
WireConnection;260;1;299;0
WireConnection;248;1;325;0
WireConnection;69;0;68;0
WireConnection;69;2;340;0
WireConnection;48;0;47;0
WireConnection;48;2;338;0
WireConnection;90;0;87;0
WireConnection;90;2;342;0
WireConnection;325;0;322;1
WireConnection;343;0;251;0
WireConnection;256;0;343;0
WireConnection;256;1;298;0
WireConnection;253;0;260;0
WireConnection;253;1;248;2
WireConnection;28;1;48;0
WireConnection;70;1;69;0
WireConnection;50;1;90;0
WireConnection;258;0;256;0
WireConnection;258;1;248;2
WireConnection;257;0;253;0
WireConnection;94;0;50;1
WireConnection;94;1;95;0
WireConnection;94;2;96;0
WireConnection;30;0;28;1
WireConnection;30;1;32;0
WireConnection;30;2;33;0
WireConnection;71;0;70;1
WireConnection;71;1;76;0
WireConnection;71;2;77;0
WireConnection;262;0;258;0
WireConnection;267;0;257;0
WireConnection;267;1;304;0
WireConnection;53;0;30;0
WireConnection;53;1;71;0
WireConnection;53;2;94;0
WireConnection;276;0;267;0
WireConnection;259;0;262;0
WireConnection;259;1;303;0
WireConnection;268;0;254;0
WireConnection;264;0;53;0
WireConnection;281;0;343;0
WireConnection;281;1;301;0
WireConnection;294;0;297;0
WireConnection;294;1;343;0
WireConnection;277;0;259;0
WireConnection;277;1;276;0
WireConnection;249;0;281;0
WireConnection;249;1;248;2
WireConnection;269;0;268;0
WireConnection;269;1;267;0
WireConnection;254;0;257;0
WireConnection;254;1;302;0
WireConnection;293;0;294;0
WireConnection;293;1;248;2
WireConnection;275;0;277;0
WireConnection;275;1;168;5
WireConnection;250;0;249;0
WireConnection;266;0;300;5
WireConnection;266;1;269;0
WireConnection;266;2;265;0
WireConnection;272;0;300;5
WireConnection;272;1;254;0
WireConnection;130;0;24;1
WireConnection;130;1;24;2
WireConnection;130;2;24;3
WireConnection;283;0;250;0
WireConnection;273;0;275;0
WireConnection;273;1;272;0
WireConnection;273;2;266;0
WireConnection;292;0;293;0
WireConnection;23;0;18;5
WireConnection;23;1;130;0
WireConnection;132;0;24;4
WireConnection;295;0;292;0
WireConnection;287;0;273;0
WireConnection;285;0;284;0
WireConnection;285;1;23;0
WireConnection;133;0;134;0
WireConnection;133;1;296;0
WireConnection;289;0;288;0
WireConnection;289;1;285;0
WireConnection;336;0;299;0
WireConnection;170;0;169;0
WireConnection;175;0;170;0
WireConnection;175;1;306;0
WireConnection;171;1;170;0
WireConnection;172;0;23;0
WireConnection;129;0;289;0
WireConnection;129;3;133;0
WireConnection;176;1;171;0
WireConnection;176;2;175;0
WireConnection;64;0;172;0
WireConnection;64;1;176;0
WireConnection;110;0;129;0
ASEEND*/
//CHKSM=A2D3AF15DE4D64458E292F0A7779B7CC3B5D5421