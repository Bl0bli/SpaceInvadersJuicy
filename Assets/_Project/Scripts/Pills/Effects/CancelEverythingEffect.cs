using System;
using UnityEngine;

namespace Leon
{
    [Serializable]
    public class CancelEverything : IPillEffect
    {
        public void Activate(GameState gameState) {
            gameState.ResetCombo();
        }
    }
}
