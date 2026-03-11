using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Serialization;

namespace Leon
{
    public class GameState : MonoBehaviour
    {
        private float totalScore = 0;
        private float currentMultiplier = 0;
        private float currentBaseScore = 0;
        private float currentCombo = 0;

        public static event Action onComboReset;
        [SerializeField] private UnityEvent<float> onCurrentComboChange;
        [SerializeField] private UnityEvent<float> onCurrentMultiplierChange;
        [SerializeField] private UnityEvent<float> onCurrentBaseScoreChange;
        [SerializeField] private UnityEvent<float> onTotalScoreChange;
        
        public float CurrentCombo
        {
            get => currentCombo;
            set
            {
                currentCombo = value;
                onCurrentComboChange?.Invoke(value);
            }
        }

        public float TotalScore
        {
            get => totalScore;
            set{
                totalScore = value;
                onTotalScoreChange?.Invoke(value);
            }
        }

        public float CurrentMultiplier
        {
            get => currentMultiplier;
            set{
                currentMultiplier = value;
                onCurrentMultiplierChange?.Invoke(value);
            }
        }
        
        public float CurrentBaseScore
        {
            get => currentBaseScore;
            set{
                currentBaseScore = value;
                onCurrentBaseScoreChange?.Invoke(value);
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
