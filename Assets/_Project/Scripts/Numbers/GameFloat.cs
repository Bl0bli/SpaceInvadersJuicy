using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class Combo : IFloat
    {
        public float Evaluate(GameState gameState) {
            return gameState.CurrentCombo;
        }
    }
    
    [Serializable]
    public class TotalScore : IFloat
    {
        public float Evaluate(GameState gameState) {
            return gameState.TotalScore;
        }
    }
    
    [Serializable]
    public class BaseScore : IFloat
    {
        public float Evaluate(GameState gameState) {
            return gameState.CurrentBaseScore;
        }
    }
    
    [Serializable]
    public class Multiplier : IFloat
    {
        public float Evaluate(GameState gameState) {
            return gameState.CurrentMultiplier;
        }
    }
}
