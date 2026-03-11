using System;
using UnityEngine;

namespace Leon
{
    public class PillFactory : MonoBehaviour
    {
        [SerializeField] private Pill _pillPrefab;

        public Pill GetNewPill() {
            return Instantiate(_pillPrefab);
        }
    }
}
