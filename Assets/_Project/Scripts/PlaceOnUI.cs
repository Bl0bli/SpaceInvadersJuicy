using System;
using UnityEngine;

namespace Leon
{
    public class PlaceOnUI : MonoBehaviour
    {
        [SerializeField] private Transform _uiElement;

        private void Start() {
            //transform.position = _uiElement.position;
            //GetComponent<ParticleSystemForceField>().enabled = true;
        }
    }
}
