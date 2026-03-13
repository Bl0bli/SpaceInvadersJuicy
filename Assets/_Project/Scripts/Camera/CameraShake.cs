using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

namespace Leon
{
    public class CameraShake : MonoBehaviour
    {
        [Header("Shake Params")] 
        [SerializeField] private float _duration = 0.1f;
        [SerializeField] private float _strenght = 0.5f;
        [SerializeField] private int _vibratio = 10;
        [SerializeField] private float _randomness = 90;
        [SerializeField] private bool _snapping = false;
        [SerializeField] private bool _fadeOut = true;
        public static CameraShake Instance;

        private int _playCount = 0;
        private bool _disabled = false;

        private void Awake()
        {
            if(Instance != null) Destroy(this);
            Instance = this;
        }

        private void Start()
        {
            FXManager.Instance.OnDisableAllToggled += OnDisableAll;
        }

        private void OnDisableAll(bool val)
        {
            _disabled = val;
            if (!_disabled)
            {
                StopAllCoroutines();
                _playCount = 0;
            }
        }

        public void Shake(float duration = 0.2f, float strength = 0.5f)
        {
            if (_disabled) return;
            transform.DOComplete(); 
            
            transform.DOShakePosition(duration, strength, 10, 90, false, true);
        }

        public void Shake()
        {
            if (_disabled) return;
            transform.DOComplete(); 
            transform.DOShakePosition(_duration, _strenght, _vibratio, _randomness, _snapping, _fadeOut);
        }

        public void ShakeAll()
        {
            if (_disabled) return;
            StartCoroutine(ShakeAllRoutine());
        }

        public void Register()
        {
            if (_disabled) return;
            _playCount++;
        }

        IEnumerator ShakeAllRoutine()
        {
            for (int i = 0; i < _playCount; i++)
            {
                Shake();
                yield return new WaitForSeconds(_duration);
            }

            _playCount = 0;
        }
    }
}
