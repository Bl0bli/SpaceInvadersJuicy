using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class ConditionalEffect : IPillEffect
    {
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> condition;
        
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect onPass;
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect onMiss;
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect always;
        
        public void Activate(GameState gameState) {
            if (condition.Evaluate(gameState)) {
                onPass.Activate(gameState);
            }
            else {
                onMiss.Activate(gameState);
            }
            always.Activate(gameState);
        }
    }
}
