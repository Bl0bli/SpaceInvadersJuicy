using System;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Leon
{
    [Serializable]
    public struct WeightedPill
    {
        public Pill pill;
        public int weight;
    }
    
    public class PillFactory : MonoBehaviour
    {
        [SerializeField] private WeightedPill[] table;
        
        public Pill GetNewPill() {
            int totalWeight = 0;
            foreach (WeightedPill pill in table) {
                totalWeight += pill.weight;
            }

            int rng = Random.Range(1, totalWeight);
            
            for (int i = 0; i < table.Length; i++) {
                if (rng <= table[i].weight) {
                    return Instantiate(table[i].pill);
                }
                rng -= table[i].weight;
            }
            
            return Instantiate(table[0].pill);
        }
    }
}
