using System;
using UnityEngine;

namespace Leon
{
    public class BedoAnimation : MonoBehaviour
    {
        [SerializeField] private Material mat;
        private Bedo bedo;
        
        private void Start() {
            bedo = GetComponent<Bedo>();
        }

        private void Update() {
            mat.SetFloat("_Bedo_Consumption", bedo.Advancement);
        }
    }
}
