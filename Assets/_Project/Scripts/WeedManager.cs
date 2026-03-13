using System;
using System.Collections;
using UnityEngine;

namespace Leon
{
    public class WeedManager : MonoBehaviour
    {
        [SerializeField] private ParticleSystem _weed;
        [SerializeField] private ParticleSystem _pill;
        [SerializeField] private ParticleSystem _cake;
        private bool active = false;
        private bool _disabled = false;
        

        public void OnGainBaseScore() {
            if(!active || _disabled) return;
            _weed.Play();
        }
        
        public void OnGainTotalScore() {
            if(!active || _disabled) return;
            
            _pill.Play();
        }
        
        public void OnGainMultiplier() {
            if(!active || _disabled) return;
            
            _cake.Play();
        }

        private void Start() {
            StartCoroutine(WaitAbit());
            FXManager.Instance.OnDisableAllToggled += DisableToggle;
        }

        private void DisableToggle(bool obj)
        {
            _disabled = obj;
        }

        private IEnumerator WaitAbit() {
            yield return new WaitForSeconds(1f);
            active = true;
        }
    }
}
