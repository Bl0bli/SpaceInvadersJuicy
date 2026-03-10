using System;
using UnityEngine;
using UnityEngine.Serialization;

namespace Leon
{
    public class GameState : MonoBehaviour
    {
        [SerializeField] private UIScore scoreUI;
        private float totalScore = 0;
        private float currentMultiplier = 0;
        private float currentBaseScore = 0;
        private float currentCombo = 0;

        public static event Action onComboReset;
        
        public float CurrentCombo
        {
            get => currentCombo;
            set
            {
                currentCombo = value;
                scoreUI.SetCombo(value);
            }
        }

        public float TotalScore
        {
            get => totalScore;
            set{
                totalScore = value;
                scoreUI.SetTotalScore(value);
            }
        }

        public float CurrentMultiplier
        {
            get => currentMultiplier;
            set{
                currentMultiplier = value;
                scoreUI.SetMultiplier(value);
            }
        }
        
        public float CurrentBaseScore
        {
            get => currentBaseScore;
            set{
                currentBaseScore = value;
                scoreUI.SetBaseScore(value);
            }
        }

        private void Start() {
            TotalScore = 0;
            CurrentBaseScore = 0;
            CurrentMultiplier = 1;
            CurrentCombo = 1;
        }

        public void ResetCombo() {
            CurrentCombo = 0;
            onComboReset?.Invoke();
        }
    }
}
