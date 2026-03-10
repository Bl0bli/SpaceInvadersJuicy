using System;
using UnityEngine;

namespace Leon
{
    [RequireComponent(typeof(Invader))]
    public class Pill : MonoBehaviour
    {
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect _effect;
        private Invader _owner;

        private void Reset() {
            _owner = GetComponent<Invader>();
        }

        private void OnEnable() {
            if(!_owner) _owner = GetComponent<Invader>();
            Debug.Log($"Owner : {_owner}");
            _owner.onDestroyed += OnOwnerDestroyed;
        }

        private void OnDisable() {
            _owner.onDestroyed -= OnOwnerDestroyed;
        }
        
        
        private void OnOwnerDestroyed() {
            GameManager.Instance.GameState.CurrentCombo += 1;
            _effect.Activate(GameManager.Instance.GameState);
        }
    }
}