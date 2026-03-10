using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class Number : IFloat
    {
        [SerializeField] private float value;
        public float Evaluate(GameState gameState) {
            return value;
        }
    }
    
    [Serializable]
    public class Add : IFloat
    {
        
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat a;
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat b;
        
        public float Evaluate(GameState gameState) {
            return a.Evaluate(gameState) + b.Evaluate(gameState);
        }
    }
    
    [Serializable]
    public class Mul : IFloat
    {
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat a;
        [Effect(EffectAttribute.Target.Float)][SerializeReference] private IFloat b;
        
        public float Evaluate(GameState gameState) {
            return a.Evaluate(gameState) * b.Evaluate(gameState);
        }
    }
}
