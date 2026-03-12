using System;
using UnityEngine;
using UnityEngine.Events;

namespace Leon
{
    public class Bedo : MonoBehaviour
    {
        [SerializeField] private float totalTime;
        [SerializeField] private float thresholdLastChance;

        [SerializeField] private UnityEvent OnLastChance;
        [SerializeField] private UnityEvent OnEndBedo;
        
        private float remainingTime;
        private bool isLastChance;

        public float Advancement => remainingTime / totalTime;

        private void Update() {
            remainingTime -= Time.deltaTime;
            if (remainingTime < 0) {
                remainingTime = 0;
                OnEndBedo?.Invoke();
            }
            if (isLastChance || !(remainingTime < thresholdLastChance)) return;
            isLastChance = true;
            OnLastChance?.Invoke();
        }
    }
}
