using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class MultiEffect : IPillEffect
    {
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect[] pillEffects;
        
        public MultiEffect(IPillEffect[] pillEffects) {
            this.pillEffects = pillEffects; 
        }

        public void Activate(GameState gameState) {
            foreach (IPillEffect effect in pillEffects) {
                effect.Activate(gameState);
            }
        }
    }
}
