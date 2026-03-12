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
        public event Action<float> onCurrentComboChangeEvent;
        [SerializeField] private UnityEvent<float> onCurrentMultiplierChange;
        public event Action<float> onCurrentMultiplierChangeEvent;
        [SerializeField] private UnityEvent<float> onCurrentBaseScoreChange;
        public event Action<float> onCurrentBaseScoreChangeEvent;
        [SerializeField] private UnityEvent<float> onTotalScoreChange;
        public event Action<float> onTotalScoreChangeEvent;
        
        public float CurrentCombo
        {
            get => currentCombo;
            set
            {
                currentCombo = value;
                onCurrentComboChangeEvent?.Invoke(value);
                onCurrentComboChange?.Invoke(value);
            }
        }

        public float TotalScore
        {
            get => totalScore;
            set{
                totalScore = value;
                onTotalScoreChangeEvent?.Invoke(value);
                onTotalScoreChange?.Invoke(value);
            }
        }

        public float CurrentMultiplier
        {
            get => currentMultiplier;
            set{
                currentMultiplier = value;
                onCurrentMultiplierChangeEvent?.Invoke(value);
                onCurrentMultiplierChange?.Invoke(value);
            }
        }
        
        public float CurrentBaseScore
        {
            get => currentBaseScore;
            set{
                currentBaseScore = value;
                onCurrentBaseScoreChange?.Invoke(value);
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
            ApplyScore();
            onComboReset?.Invoke();
        }

        public void ApplyScore() {
            TotalScore += CurrentBaseScore * CurrentMultiplier;
            CurrentBaseScore = 0;
            CurrentMultiplier = 1;
        }
    }
}
