using System;
using NaughtyAttributes;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

namespace Leon
{
    [ExecuteAlways]
    public class GlobalMaterialAnimator : MonoBehaviour
    {
        [SerializeField] private VolumeProfile _profile;
        
        [Header("LensDistortion"),SerializeField, Range(-1f,1f), Label("Intensity")] private float _lDIntensity;
        [SerializeField, Range(0f,1f)] private float _xMultiplier;
        [SerializeField, Range(0f,1f)] private float _yMultiplier;
        [SerializeField, Label("Center")] private Vector2 _lDCenter = new Vector2(0.5f,0.5f);
        [SerializeField, Range(0.01f,5f)] private float _scale = 0.01f;

        [Header("Kaleidoscope"), SerializeField] private Material _kaleidoscopeMaterial;
        [SerializeField] private float _enable;

        [Header("ChromaticAberration"), SerializeField]
        private Material _chromaticAberrationMaterial;
        [SerializeField] private float _HDR = 1;
        [SerializeField] private float _Strength = 0;
        [SerializeField] private Vector2 _RScale = new Vector2(1,1);
        [SerializeField] private Vector2 _ROffset = new Vector2(0.02f, - 0.02f);
        [SerializeField] private Vector2 _GScale = new Vector2(1,1);
        [SerializeField] private Vector2 _GOffset;
        [SerializeField] private Vector2 _BScale = new Vector2(1,1);
        [SerializeField] private Vector2 _BOffset = new Vector2(-0.02f, 0.02f);
        [SerializeField] private Vector2 _lensPos;
        [SerializeField] private float _lensStrength = 0;
        [SerializeField] private float _lensMin = -0.2f;
        [SerializeField] private float _lensMax = 0.5f;
        [SerializeField] private float _Lens_MultipleOrSingle = 0;
        [SerializeField] private float _Boiling = 0;

        [Header("ChampiEffects"), SerializeField]
        private Material _champignonMaterial;
        [SerializeField] private float _champiHDR = 1;
        [SerializeField] private float _champiStrength = 0;
        [SerializeField] private Vector2 _champiRScale = new Vector2(1,1);
        [SerializeField] private Vector2 _champiROffset = new Vector2(0.02f, - 0.02f);
        [SerializeField] private Vector2 _champiGScale = new Vector2(1,1);
        [SerializeField] private Vector2 _champiGOffset;
        [SerializeField] private Vector2 _champiBScale = new Vector2(1,1);
        [SerializeField] private Vector2 _champiBOffset = new Vector2(-0.02f, 0.02f);
        [SerializeField] private Vector2 _champiLensPos;
        [SerializeField] private float _champiLensStrength = 0;
        [SerializeField] private float _champiLensMin = -0.2f;
        [SerializeField] private float _champiLensMax = 0.5f;
        
        [Header("MilkEffects"), SerializeField]
        private Material _milkMaterial;
        [SerializeField] private float _milkHDR = 1;
        [SerializeField] private float _milkStrength = 0;
        [SerializeField] private Vector2 _milkRScale = new Vector2(1,1);
        [SerializeField] private Vector2 _milkROffset = new Vector2(0.02f, - 0.02f);
        [SerializeField] private Vector2 _milkGScale = new Vector2(1,1);
        [SerializeField] private Vector2 _milkGOffset;
        [SerializeField] private Vector2 _milkBScale = new Vector2(1,1);
        [SerializeField] private Vector2 _milkBOffset = new Vector2(-0.02f, 0.02f);
        [SerializeField] private Vector2 _milkLensPos;
        [SerializeField] private float _milkLensStrength = 0;
        [SerializeField] private float _milkLensMin = -0.2f;
        [SerializeField] private float _milkLensMax = 0.5f;
        
        [Header("Sinusoidale"), SerializeField]
        private Material _sinusoidalematerial;

        [SerializeField, Range(0f,0.1f)] private float _power;
        [SerializeField] private float _density;


        [Header("Leon"), SerializeField] private Material _Leon;
        [SerializeField] private float _isHurt = 0;
        [Header("Fond"), SerializeField] private GameObject _bg;
        
        private int currentPhase = -1;

        private void Update() {
            if (_profile.TryGet(out LensDistortion lensDistortion)) {
                lensDistortion.intensity.SetValue(new ClampedFloatParameter(_lDIntensity, -1, 1, true));
                lensDistortion.xMultiplier.SetValue(new ClampedFloatParameter(_xMultiplier, 0, 1, true));
                lensDistortion.yMultiplier.SetValue(new ClampedFloatParameter(_yMultiplier, 0, 1, true));
                lensDistortion.center.SetValue(new Vector2Parameter(_lDCenter, true));
                lensDistortion.scale.SetValue(new ClampedFloatParameter(_scale, 0.01f, 5f, true));
            }
            // Kaleidoscope
            _kaleidoscopeMaterial.SetFloat("_Enable", _enable);
            
            //ChromaticAberration
            _chromaticAberrationMaterial.SetFloat("_HDR", _HDR);
            _chromaticAberrationMaterial.SetFloat("_ChromAb_Strenght", _Strength);
            _chromaticAberrationMaterial.SetVector("_R_Scale", _RScale);
            _chromaticAberrationMaterial.SetVector("_R_Offset", _ROffset);
            _chromaticAberrationMaterial.SetVector("_G_Scale", _GScale);
            _chromaticAberrationMaterial.SetVector("_G_Offset", _GOffset);
            _chromaticAberrationMaterial.SetVector("_B_Scale", _BScale);
            _chromaticAberrationMaterial.SetVector("_B_Offset", _BOffset);
            _chromaticAberrationMaterial.SetVector("_Lens_Pos", _lensPos);
            _chromaticAberrationMaterial.SetFloat("_Lens_Strengh", _lensStrength);
            _chromaticAberrationMaterial.SetFloat("_Lens_Min", _lensMin);
            _chromaticAberrationMaterial.SetFloat("_Lens_Max", _lensMax);
            _chromaticAberrationMaterial.SetFloat("_Lens_MultipleOrSingle", _Lens_MultipleOrSingle);
            _chromaticAberrationMaterial.SetFloat("_Boiling", _Boiling);
            
            //Champignon
            _champignonMaterial.SetFloat("_HDR", _champiHDR);
            _champignonMaterial.SetFloat("_ChromAb_Strenght", _champiStrength);
            _champignonMaterial.SetVector("_R_Scale", _champiRScale);
            _champignonMaterial.SetVector("_R_Offset", _champiROffset);
            _champignonMaterial.SetVector("_G_Scale", _champiGScale);
            _champignonMaterial.SetVector("_G_Offset", _champiGOffset);
            _champignonMaterial.SetVector("_B_Scale", _champiBScale);
            _champignonMaterial.SetVector("_B_Offset", _champiBOffset);
            _champignonMaterial.SetVector("_Lens_Pos", _champiLensPos);
            _champignonMaterial.SetFloat("_Lens_Strengh", _champiLensStrength);
            _champignonMaterial.SetFloat("_Lens_Min", _champiLensMin);
            _champignonMaterial.SetFloat("_Lens_Max", _champiLensMax);
            
            //Milk
            _milkMaterial.SetFloat("_HDR", _milkHDR);
            _milkMaterial.SetFloat("_ChromAb_Strenght", _milkStrength);
            _milkMaterial.SetVector("_R_Scale", _milkRScale);
            _milkMaterial.SetVector("_R_Offset", _milkROffset);
            _milkMaterial.SetVector("_G_Scale", _milkGScale);
            _milkMaterial.SetVector("_G_Offset", _milkGOffset);
            _milkMaterial.SetVector("_B_Scale", _milkBScale);
            _milkMaterial.SetVector("_B_Offset", _milkBOffset);
            _milkMaterial.SetVector("_Lens_Pos", _milkLensPos);
            _milkMaterial.SetFloat("_Lens_Strengh", _milkLensStrength);
            _milkMaterial.SetFloat("_Lens_Min", _milkLensMin);
            _milkMaterial.SetFloat("_Lens_Max", _milkLensMax);
            
            //Sinusoidale
            _sinusoidalematerial.SetFloat("_Power", _power);
            _sinusoidalematerial.SetFloat("_Density", _density);

            //Leon
            _Leon.SetFloat("_isHurt", _isHurt);
        }
        
        public void AddPhaseEffect(int i) {
            while (currentPhase < i) {
                currentPhase += 1;
                PlayPhase(currentPhase);
            }
        }

        private void Start() {
            _Leon.SetFloat("_Multicolor",0f);
        }

        private void PlayPhase(int i) {
            Debug.Log($"PlayPhase : {i}");
            switch (i) {
                case 0: 
                    _Leon.SetFloat("_Multicolor",1f);
                    Debug.Log("Hello");
                    break;
                case 1:
                    PostProcessAnimationPlayer.instance.PlayChromaIdle();
                    break;
                case 2: 
                    PostProcessAnimationPlayer.instance.PlayBulles();
                    break;
                case 3: 
                    _bg.SetActive(true);
                    break;
                default:
                    break;
            }
        }
    }
};
