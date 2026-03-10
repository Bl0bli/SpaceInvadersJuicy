using TMPro;
using UnityEngine;

namespace Leon
{
    public class UIScore : MonoBehaviour
    {
        [SerializeField] private TMP_Text TotalScore;
        [SerializeField] private TMP_Text BaseScore;
        [SerializeField] private TMP_Text Multiplier;
        [SerializeField] private TMP_Text Combo;
        
        public void SetTotalScore(float value) {
            TotalScore.text = Mathf.FloorToInt(value).ToString();
        }

        public void SetMultiplier(float value) {
            Multiplier.text = Mathf.FloorToInt(value).ToString();
        }
        
        public void SetBaseScore(float value) {
            BaseScore.text = Mathf.FloorToInt(value).ToString();
        }
        
        public void SetCombo(float value) {
            Combo.text = $"x{Mathf.FloorToInt(value)}";
        }
    }
}
