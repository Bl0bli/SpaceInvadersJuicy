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

        [Header("Sinusoidale"), SerializeField]
        private Material _sinusoidalematerial;

        [SerializeField, Range(0f,0.1f)] private float _power;
        [SerializeField] private float _density;
        

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
            
            _sinusoidalematerial.SetFloat("_Power", _power);
            _sinusoidalematerial.SetFloat("_Density", _density);
        }
        
        public void AddPhaseEffect(int i) {
            while (currentPhase < i) {
                currentPhase += 1;
                PlayPhase(currentPhase);
            }
        }

        private void PlayPhase(int i) {
            switch (i) {
                case 0: 
                    break;
                case 1:
                    PostProcessAnimationPlayer.instance.PlayChromaIdle();
                    break;
                case 2: 
                    PostProcessAnimationPlayer.instance.PlayBulles();
                    break;
                case 3: //background
                    break;
                default:
                    break;
            }
        }
    }
};
