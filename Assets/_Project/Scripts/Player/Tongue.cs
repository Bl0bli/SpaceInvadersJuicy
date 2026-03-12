using System;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.Events;

namespace Leon
{
    public class Tongue : MonoBehaviour
    {
        [SerializeField] private Collider2D _colliderTopTongue,_colliderAlongTongue;
        [SerializeField] private UnityEvent onInvaderCaught, OnSwallow, OnFirstCatch;

        public event Action onHit;
        public List<Invader> Invaders => _invaders;
        
        [SerializeField]private List<Invader> _invaders = new List<Invader>();
        private bool _hit = false;

        private void Start()
        {
            DisableCollider();
        }

        public void CatchInvader(Invader invader)
        {
            if (!_hit)
            {
                _hit = true;
                onHit?.Invoke();
                OnFirstCatch?.Invoke();
            }
            if (_colliderAlongTongue.enabled == false) _colliderAlongTongue.enabled = true;
            invader.transform.SetParent(transform);
            _invaders.Add(invader);
            onInvaderCaught?.Invoke();
        }

        public void DisableCollider()
        {
            _hit = false;
            _colliderAlongTongue.enabled = false;
            _colliderTopTongue.enabled = false;
        }

        public void EnableTopColliderTongue() => _colliderTopTongue.enabled = true;

        public void Swallow()
        {
            DisableCollider();
            foreach (Invader invader in _invaders)
            {
                invader.TriggerDestroy();
                OnSwallow?.Invoke();
            }
            _invaders.Clear();
        }
    }
}
