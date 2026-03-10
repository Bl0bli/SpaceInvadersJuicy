using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class ComboLEqual : IConditional<GameState>
    {
        [SerializeField] private int value;
        
        public bool Evaluate(GameState ctx) {
            return ctx.CurrentCombo <= value;
        }
    }
    [Serializable]
    public class ComboGEqual : IConditional<GameState>
    {
        [SerializeField] private int value;
        
        public bool Evaluate(GameState ctx) {
            return ctx.CurrentCombo >= value;
        }
    }
}
