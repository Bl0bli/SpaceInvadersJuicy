using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

namespace Leon
{
    public class Player : MonoBehaviour
    {
        [SerializeField] private float deadzone = 0.3f;
        [SerializeField] private float speed = 1f;

        [SerializeField] private Bullet bulletPrefab = null;
        [SerializeField] private Transform shootAt = null;
        [SerializeField] private float shootCooldown = 1f;
        [SerializeField] private string collideWithTag = "Untagged";

        private float lastShootTimestamp = Mathf.NegativeInfinity;
        private float _moves = 0;

        void Update()
        {
            UpdateMovement();
            //UpdateActions();
        }

        public void UpdateInputMoves(InputAction.CallbackContext ctx)
        {
            _moves = ctx.ReadValue<Vector2>().x;
        }
        public void UpdateMovement()
        {
            if (Mathf.Abs(_moves) < deadzone) { return; }

            _moves = Mathf.Sign(_moves);
            float delta = _moves * speed * Time.deltaTime;
            transform.position = GameManager.Instance.KeepInBounds(transform.position + Vector3.right * delta);
        }

        public void UpdateActions(InputAction.CallbackContext ctx)
        {
            if (ctx.performed && Time.time > lastShootTimestamp + shootCooldown)
            {
                Shoot();
            }
        }

        void Shoot()
        {
            Instantiate(bulletPrefab, shootAt.position, Quaternion.identity);
            lastShootTimestamp = Time.time;
        }

        public void OnTriggerEnter2D(Collider2D collision)
        {
            if (collision.gameObject.tag != collideWithTag) { return; }
            
            GameManager.Instance.ResetCombo();
        }
    }
}

