using System;
using UnityEngine;
using UnityEngine.Events;

namespace Leon
{
    [RequireComponent(typeof(Invader))]
    public class Pill : MonoBehaviour
    {
        [Effect(EffectAttribute.Target.Effect)][SerializeReference] private IPillEffect _effect;
        private Invader _owner;
        [SerializeField] private UnityEvent OnEaten;
        
        private void Reset() {
            _owner = GetComponent<Invader>();
        }

        private void OnEnable() {
            if(!_owner) _owner = GetComponent<Invader>();
            _owner.onDestroyed += OnOwnerEaten;
        }

        private void OnDisable() {
            _owner.onDestroyed -= OnOwnerEaten;
        }
        
        private void OnOwnerEaten() {
            Debug.Log("Pill eaten");
            OnEaten?.Invoke();
            GameManager.Instance.GameState.CurrentCombo += 1;
            _effect.Activate(GameManager.Instance.GameState);
        }
    }
}