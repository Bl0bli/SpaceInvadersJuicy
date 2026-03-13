using System;
using TMPro;
using UnityEngine;
using DG.Tweening;
namespace Leon
{
    public class UIScore : MonoBehaviour
    {
        [Header("Text References")]
        [SerializeField] private TMP_Text TotalScore;
        [SerializeField] private TMP_Text BaseScore;
        [SerializeField] private TMP_Text Multiplier;
        [SerializeField] private TMP_Text Combo;

        [Header("Progression Settings")]
        [SerializeField] private float minScale = 1f;
        [SerializeField] private float maxScaleScores = 2f;
        [SerializeField] private float maxScaleCombo = 4f;
        [SerializeField] private float scoreForMaxScale = 10000f;

        [Header("Punch Animation")]
        [SerializeField] private float punchStrength = 0.3f;
        [SerializeField] private float duration = 0.15f;

        private bool _disabled = false;

        private void Start()
        {
            FXManager.Instance.OnDisableAllToggled += OnDisableAll;
        }

        private void OnDisableAll(bool obj)
        {
            _disabled = obj;
        }

        public void SetTotalScore(float value) {
            TotalScore.text = Mathf.FloorToInt(value).ToString();
            
            float ratio = Mathf.Clamp01(value / scoreForMaxScale);
            float targetScale = Mathf.Lerp(minScale, maxScaleScores, ratio);
            if(!_disabled) AnimateText(TotalScore.transform, targetScale);
        }

        public void SetMultiplier(float value) {
            Multiplier.text = Mathf.FloorToInt(value).ToString();
            
            float multiplierScale = minScale + (value * 0.1f); 
            multiplierScale = Mathf.Min(multiplierScale, maxScaleScores);
            if(!_disabled) AnimateText(Multiplier.transform, multiplierScale);
        }
        
        public void SetBaseScore(float value) {
            BaseScore.text = Mathf.FloorToInt(value).ToString();
            if(!_disabled) AnimateText(BaseScore.transform);
        }
        
        public void SetCombo(float value) {
            Combo.text = $"x{Mathf.FloorToInt(value)}";
            
            float comboScale = minScale + (value * 0.1f); 
            comboScale = Mathf.Min(comboScale, maxScaleCombo);
            if(!_disabled) AnimateText(Combo.transform, comboScale);
        }

        private void AnimateText(Transform target, float baseScale = 1f)
        {
            target.DOKill();

            Vector3 targetVector = new Vector3(baseScale, baseScale, 1f);
            
            Sequence s = DOTween.Sequence();
            s.Append(target.DOScale(targetVector, 0.05f));
            s.Append(target.DOPunchScale(Vector3.one * punchStrength, duration, 5));
        }
    }
}
