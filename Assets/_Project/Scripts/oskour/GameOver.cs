using System;
using TMPro;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Leon
{
    [ExecuteAlways]
    public class GameOver : MonoBehaviour
    {
        private TMP_Text text;

        private void Start() {
            text = GetComponent<TMP_Text>();
            
            FXManager.Instance.ToggleDisableAll();
            }

        private void Update() {
            text.color = Random.ColorHSV(0,1,1,1,1,1);
        }
    }
}
