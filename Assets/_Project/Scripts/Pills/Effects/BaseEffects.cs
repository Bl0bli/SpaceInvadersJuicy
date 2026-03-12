using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class AddBaseScore : IPillEffect
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat value;
        
        public void Activate(GameState gameState) {
            gameState.CurrentBaseScore += value.Evaluate(gameState);
        }
    }
    
    [Serializable]
    public class AddCombo : IPillEffect
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat value;
        
        public void Activate(GameState gameState) {
            gameState.CurrentCombo += value.Evaluate(gameState);
        }
    }
    
    [Serializable]
    public class AddTotalScore : IPillEffect
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat value;
        
        public void Activate(GameState gameState) {
            gameState.TotalScore += value.Evaluate(gameState);
        }
    }
    
    [Serializable]
    public class AddMultiplyer : IPillEffect
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat value;
        
        public void Activate(GameState gameState) {
            gameState.CurrentMultiplier += value.Evaluate(gameState);
        }
    }
    
    [Serializable]
    public class MultiplyMultiplyer : IPillEffect
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat value;
        
        public void Activate(GameState gameState) {
            gameState.CurrentMultiplier *= value.Evaluate(gameState);
        }
    }
}
