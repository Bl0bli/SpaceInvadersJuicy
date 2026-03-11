using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Leon
{
    public class Invader : MonoBehaviour
    {
        [SerializeField] private Bullet bulletPrefab = null;
        [SerializeField] private Transform shootAt = null;
        [SerializeField] private string collideWithTag = "Player", collideWithSecondTag = "Tongue";

        private bool _caught = false;
        internal Action<Invader> onDestroy;
        public event Action onDestroyed;
        public event Action onEaten;

        public Vector2Int GridIndex { get; private set; }

        public void Initialize(Vector2Int gridIndex) {
            this.GridIndex = gridIndex;
        }

        public void OnDestroy() {
            onDestroy?.Invoke(this);
        }

        public void OnTriggerEnter2D(Collider2D collision)
        {
            if (collision.gameObject.tag != collideWithTag && collision.gameObject.tag != collideWithSecondTag) {
                return;
            }

            if (collision.gameObject.tag == collideWithSecondTag)
            {
                onEaten?.Invoke();
                collision.gameObject.GetComponentInParent<Tongue>().CatchInvader(this);
                _caught = true;
            }
            else
            {
                Destroy(gameObject, .1f);
                Destroy(collision.gameObject);
            }
        }

        public void Shoot() {
            Instantiate(bulletPrefab, shootAt.position, Quaternion.identity);
        }

        public void TriggerDestroy()
        {
            onDestroyed?.Invoke();
            Destroy(gameObject, .1f);
        }
    }
}