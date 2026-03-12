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

        public void OnGainBaseScore() {
            if(!active) return;
            _weed.Play();
        }
        
        public void OnGainTotalScore() {
            if(!active) return;
            
            _pill.Play();
        }
        
        public void OnGainMultiplier() {
            if(!active) return;
            
            _cake.Play();
        }

        private void Start() {
            StartCoroutine(WaitAbit());
        }

        private IEnumerator WaitAbit() {
            yield return new WaitForSeconds(1f);
            active = true;
        }
    }
}
