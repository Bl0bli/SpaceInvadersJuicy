using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class Always: IConditional<GameState>
    {
        public bool Evaluate(GameState ctx) {
            return true;
        }
    }
    
    [Serializable]
    public class And: IConditional<GameState>
    {
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> a;
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> b;
        
        public bool Evaluate(GameState ctx) {
            return a.Evaluate(ctx) && b.Evaluate(ctx);
        }
    }
    
    [Serializable]
    public class Or: IConditional<GameState>
    {
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> a;
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> b;
        
        public bool Evaluate(GameState ctx) {
            return a.Evaluate(ctx) || b.Evaluate(ctx);
        }
    }
    
    [Serializable]
    public class Not: IConditional<GameState>
    {
        [Effect(EffectAttribute.Target.Conditional)][SerializeReference] private IConditional<GameState> a;
        
        public bool Evaluate(GameState ctx) {
            return !a.Evaluate(ctx);
        }
    }
}
