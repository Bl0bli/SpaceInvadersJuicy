// Made with Amplify Shader Editor v1.9.9.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Shader_Bedo_Fire"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_MainTex( "_MainTex", 2D ) = "white" {}
		_F_Color( "F_Color", Color ) = ( 1, 0.55326, 0.2396226, 0 )
		_N_Noise_1( "N_Noise_1", 2D ) = "white" {}
		_AN_X_Tile( "AN_X_Tile", Float ) = 0.5
		_N1_X_Tile( "N1_X_Tile", Float ) = 1
		_AN_Y_Tile( "AN_Y_Tile", Float ) = 0.5
		_N1_Y_Tile( "N1_Y_Tile", Float ) = 1
		_N1_X_Pan( "N1_X_Pan", Float ) = 0.1
		_AN_X_Pan( "AN_X_Pan", Float ) = 0.1
		_N1_Y_Pan( "N1_Y_Pan", Float ) = 0.1
		_AN_Y_Pan( "AN_Y_Pan", Float ) = 0.1
		_N1_Min( "N1_Min", Float ) = 0.07
		_AN_Min( "AN_Min", Float ) = 0.12
		_AN_Max( "AN_Max", Float ) = 0.17
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
		_Alpha_Noise( "Alpha_Noise", 2D ) = "white" {}
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
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _Alpha_Noise;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float _AN_Y_Pan;
			float _AN_X_Pan;
			float _AN_Max;
			float _AN_Min;
			float _N3_Y_Tile;
			float _N3_X_Tile;
			float _N3_Y_Pan;
			float _N3_X_Pan;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N2_Max;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _AN_X_Tile;
			float _AN_Y_Tile;
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
				float2 appendResult146 = (float2(_AN_X_Pan , _AN_Y_Pan));
				float2 texCoord142 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_AN_X_Tile , _AN_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult139 = smoothstep( _AN_Min , _AN_Max , ( tex2D( _Alpha_Noise, panner148 ).r * saturate( ( 1.0 - texCoord124.y ) ) ));
				float Alpha135 = smoothstepResult139;
				float4 appendResult129 = (float4(( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) + ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * ( 10.0 * _F_Color.rgb ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

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
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _Alpha_Noise;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float _AN_Y_Pan;
			float _AN_X_Pan;
			float _AN_Max;
			float _AN_Min;
			float _N3_Y_Tile;
			float _N3_X_Tile;
			float _N3_Y_Pan;
			float _N3_X_Pan;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N2_Max;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _AN_X_Tile;
			float _AN_Y_Tile;
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
				float2 appendResult146 = (float2(_AN_X_Pan , _AN_Y_Pan));
				float2 texCoord142 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_AN_X_Tile , _AN_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.texCoord0.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult139 = smoothstep( _AN_Min , _AN_Max , ( tex2D( _Alpha_Noise, panner148 ).r * saturate( ( 1.0 - texCoord124.y ) ) ));
				float Alpha135 = smoothstepResult139;
				float4 appendResult129 = (float4(( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) + ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * ( 10.0 * _F_Color.rgb ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

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
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _Alpha_Noise;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float _AN_Y_Pan;
			float _AN_X_Pan;
			float _AN_Max;
			float _AN_Min;
			float _N3_Y_Tile;
			float _N3_X_Tile;
			float _N3_Y_Pan;
			float _N3_X_Pan;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N2_Max;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _AN_X_Tile;
			float _AN_Y_Tile;
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
				float2 appendResult146 = (float2(_AN_X_Pan , _AN_Y_Pan));
				float2 texCoord142 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_AN_X_Tile , _AN_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult139 = smoothstep( _AN_Min , _AN_Max , ( tex2D( _Alpha_Noise, panner148 ).r * saturate( ( 1.0 - texCoord124.y ) ) ));
				float Alpha135 = smoothstepResult139;
				float4 appendResult129 = (float4(( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) + ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * ( 10.0 * _F_Color.rgb ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

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
			sampler2D _N_Noise_1;
			sampler2D _N_Noise_2;
			sampler2D _N_Noise_3;
			sampler2D _Alpha_Noise;
			CBUFFER_START( UnityPerMaterial )
			float4 _MainTex_ST;
			float4 _F_Color;
			float _AN_Y_Pan;
			float _AN_X_Pan;
			float _AN_Max;
			float _AN_Min;
			float _N3_Y_Tile;
			float _N3_X_Tile;
			float _N3_Y_Pan;
			float _N3_X_Pan;
			float _N3_Max;
			float _N3_Min;
			float _N2_Y_Tile;
			float _N2_X_Tile;
			float _N2_Y_Pan;
			float _N2_X_Pan;
			float _N2_Max;
			float _N2_Min;
			float _N1_Y_Tile;
			float _N1_X_Tile;
			float _N1_Y_Pan;
			float _N1_X_Pan;
			float _N1_Max;
			float _N1_Min;
			float _AN_X_Tile;
			float _AN_Y_Tile;
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
				float2 appendResult146 = (float2(_AN_X_Pan , _AN_Y_Pan));
				float2 texCoord142 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult143 = (float2(_AN_X_Tile , _AN_Y_Tile));
				float2 panner148 = ( 1.0 * _Time.y * appendResult146 + (texCoord142*appendResult143 + 0.0));
				float2 texCoord124 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult139 = smoothstep( _AN_Min , _AN_Max , ( tex2D( _Alpha_Noise, panner148 ).r * saturate( ( 1.0 - texCoord124.y ) ) ));
				float Alpha135 = smoothstepResult139;
				float4 appendResult129 = (float4(( ( tex2D( _MainTex, uv_MainTex ).rgb * appendResult130 ) + ( smoothstepResult30 * smoothstepResult71 * smoothstepResult94 * ( 10.0 * _F_Color.rgb ) ) ) , ( VertexAlpha132 * Alpha135 )));
				

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
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;141;-2624,256;Inherit;False;Property;_AN_Y_Tile;AN_Y_Tile;5;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;140;-2624,176;Inherit;False;Property;_AN_X_Tile;AN_X_Tile;3;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;-2368,1424;Inherit;False;2044.48;1219.432;;40;41;40;42;43;44;45;72;73;46;47;66;65;74;75;48;67;68;32;33;28;69;30;76;77;70;71;53;50;96;95;94;80;81;82;83;92;93;87;91;90;Noise Feu;0,0.9552093,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;145;-2288,256;Inherit;False;Property;_AN_Y_Pan;AN_Y_Pan;10;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;-2624,32;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;143;-2464,176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;-2288,176;Inherit;False;Property;_AN_X_Pan;AN_X_Pan;8;0;Create;True;0;0;0;False;0;False;0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;-2320,2032;Inherit;False;Property;_N2_X_Tile;N2_X_Tile;16;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;73;-2320,2112;Inherit;False;Property;_N2_Y_Tile;N2_Y_Tile;17;0;Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;80;-2336,2464;Inherit;False;Property;_N3_X_Tile;N3_X_Tile;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;81;-2336,2544;Inherit;False;Property;_N3_Y_Tile;N3_Y_Tile;24;0;Create;True;0;0;0;False;0;False;1.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;-2304,1632;Inherit;False;Property;_N1_X_Tile;N1_X_Tile;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;41;-2304,1712;Inherit;False;Property;_N1_Y_Tile;N1_Y_Tile;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;146;-2144,176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;147;-2288,32;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;124;-1968,304;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;66;-2160,2032;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;-2320,1888;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;74;-1984,2032;Inherit;False;Property;_N2_X_Pan;N2_X_Pan;18;0;Create;True;0;0;0;False;0;False;-0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-1984,2112;Inherit;False;Property;_N2_Y_Pan;N2_Y_Pan;19;0;Create;True;0;0;0;False;0;False;-0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;82;-2176,2464;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;83;-2336,2320;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;-1984,2464;Inherit;False;Property;_N3_X_Pan;N3_X_Pan;25;0;Create;True;0;0;0;False;0;False;-0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;93;-1984,2544;Inherit;False;Property;_N3_Y_Pan;N3_Y_Pan;26;0;Create;True;0;0;0;False;0;False;-0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-2304,1488;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-2144,1632;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-1968,1632;Inherit;False;Property;_N1_X_Pan;N1_X_Pan;7;0;Create;True;0;0;0;False;0;False;0.1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-1968,1712;Inherit;False;Property;_N1_Y_Pan;N1_Y_Pan;9;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;148;-1952,32;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;125;-1744,336;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;68;-1984,1888;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;67;-1840,2032;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;-2000,2320;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;91;-1840,2464;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;46;-1824,1632;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;-1968,1488;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;137;-1728,32;Inherit;True;Property;_Alpha_Noise;Alpha_Noise;29;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;126;-1568,336;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;-1696,1024;Inherit;False;484;365.592;;3;26;27;25;Noise_HDR;1,0.4732539,0,1;0;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;69;-1664,1888;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;-1664,2320;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;-208,-112;Inherit;False;564;453.16;;5;18;24;23;130;132;Sprite Texture;0,0,0,1;0;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;-1632,1488;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;138;-1312,272;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;149;-1232,528;Inherit;False;Property;_AN_Min;AN_Min;12;0;Create;True;0;0;0;False;0;False;0.12;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;150;-1232,608;Inherit;False;Property;_AN_Max;AN_Max;13;0;Create;True;0;0;0;False;0;False;0.17;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;-1440,1488;Inherit;True;Property;_N_Noise_1;N_Noise_1;2;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;-1456,1888;Inherit;True;Property;_N_Noise_2;N_Noise_2;15;0;Create;True;0;0;0;False;0;False;-1;aab45972dd2b1eb429da2750f650daa2;aab45972dd2b1eb429da2750f650daa2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;76;-1328,2112;Inherit;False;Property;_N2_Min;N2_Min;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;77;-1328,2192;Inherit;False;Property;_N2_Max;N2_Max;21;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-1152,2528;Inherit;False;Property;_N3_Max;N3_Max;28;0;Create;True;0;0;0;False;0;False;0.38;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;-1152,2448;Inherit;False;Property;_N3_Min;N3_Min;27;0;Create;True;0;0;0;False;0;False;0.14;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;-1440,2304;Inherit;True;Property;_N_Noise_3;N_Noise_3;22;0;Create;True;0;0;0;False;0;False;-1;ff863930ab4780c4fab388af3c451ae3;3e082a8b3a145a14ab1c005c3d1876d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-1584,1072;Inherit;False;Constant;_F_HDR;F_HDR;2;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-1648,1152;Inherit;False;Property;_F_Color;F_Color;1;0;Create;True;0;0;0;False;0;False;1,0.55326,0.2396226,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;24;-160,128;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;-1312,1712;Inherit;False;Property;_N1_Min;N1_Min;11;0;Create;True;0;0;0;False;0;False;0.07;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;-1312,1792;Inherit;False;Property;_N1_Max;N1_Max;14;0;Create;True;0;0;0;False;0;False;0.17;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;-1088,272;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-1392,1248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;-1072,1632;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;71;-1072,1888;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-992,2304;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;18;-160,-64;Inherit;True;Property;_MainTex;_MainTex;0;0;Create;True;0;0;0;False;0;False;-1;6f037857f49811a4c9604015e1eaabf7;6f037857f49811a4c9604015e1eaabf7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;130;16,144;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;132;112,256;Inherit;False;VertexAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;135;-864,272;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;23;176,64;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-672,1632;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;134;560,912;Inherit;False;132;VertexAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;136;560,976;Inherit;False;135;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;133;752,784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;64;528,672;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;129;896,672;Inherit;True;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;111;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit Forward;0;1;Sprite Unlit Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;112;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;SceneSelectionPass;0;2;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;400,304;Float;False;False;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;1;New Amplify Shader;cf964e524c8e69742b1d21fbe2ebcc4a;True;ScenePickingPass;0;3;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;110;1120,672;Float;False;True;-1;3;UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI;0;15;Shader_Bedo_Fire;cf964e524c8e69742b1d21fbe2ebcc4a;True;Sprite Unlit;0;0;Sprite Unlit;5;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;ShaderGraphShader=true;True;0;True;14;all;0;False;True;2;5;False;;10;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;False;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;5;Alpha Clipping;0;0;Disable Color Tint;1;0;Vertex Position;1;0;Debug Display;0;0;External Alpha;0;0;0;4;True;True;True;True;False;;False;0
WireConnection;143;0;140;0
WireConnection;143;1;141;0
WireConnection;146;0;144;0
WireConnection;146;1;145;0
WireConnection;147;0;142;0
WireConnection;147;1;143;0
WireConnection;66;0;72;0
WireConnection;66;1;73;0
WireConnection;82;0;80;0
WireConnection;82;1;81;0
WireConnection;43;0;40;0
WireConnection;43;1;41;0
WireConnection;148;0;147;0
WireConnection;148;2;146;0
WireConnection;125;0;124;2
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
WireConnection;137;1;148;0
WireConnection;126;0;125;0
WireConnection;69;0;68;0
WireConnection;69;2;67;0
WireConnection;90;0;87;0
WireConnection;90;2;91;0
WireConnection;48;0;47;0
WireConnection;48;2;46;0
WireConnection;138;0;137;1
WireConnection;138;1;126;0
WireConnection;28;1;48;0
WireConnection;70;1;69;0
WireConnection;50;1;90;0
WireConnection;139;0;138;0
WireConnection;139;1;149;0
WireConnection;139;2;150;0
WireConnection;27;0;26;0
WireConnection;27;1;25;5
WireConnection;30;0;28;1
WireConnection;30;1;32;0
WireConnection;30;2;33;0
WireConnection;71;0;70;1
WireConnection;71;1;76;0
WireConnection;71;2;77;0
WireConnection;94;0;50;1
WireConnection;94;1;95;0
WireConnection;94;2;96;0
WireConnection;130;0;24;1
WireConnection;130;1;24;2
WireConnection;130;2;24;3
WireConnection;132;0;24;4
WireConnection;135;0;139;0
WireConnection;23;0;18;5
WireConnection;23;1;130;0
WireConnection;53;0;30;0
WireConnection;53;1;71;0
WireConnection;53;2;94;0
WireConnection;53;3;27;0
WireConnection;133;0;134;0
WireConnection;133;1;136;0
WireConnection;64;0;23;0
WireConnection;64;1;53;0
WireConnection;129;0;64;0
WireConnection;129;3;133;0
WireConnection;110;0;129;0
ASEEND*/
//CHKSM=8A05F151F2C659A671A54CCFB3F1C17057479ED7