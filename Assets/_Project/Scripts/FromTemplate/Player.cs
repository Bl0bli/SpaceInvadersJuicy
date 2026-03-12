using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.InputSystem;

namespace Leon
{
    public class Player : MonoBehaviour
    {
        [Header("Editor Params")] 
        [SerializeField] private bool _stopMovesWhenTongueStretch = false;
        
        [SerializeField] private float deadzone = 0.3f;
        [SerializeField] private float speed = 1f;

        [SerializeField] private Bullet bulletPrefab = null;
        [SerializeField] private float shootCooldown = 1f;
        [SerializeField] private string collideWithTag = "Untagged";
        
        [Header("Tongue")]
        [SerializeField] private Transform _tongueTransform;

        [SerializeField] private Tongue _tongue;

        [SerializeField] private float _animTimeStretch = 1, _animTimeUnStretch = 1;
        [SerializeField] private float _tongueMAXDist;
        [SerializeField] private float _tongueFreezingTime;
        [SerializeField] private AnimationCurve _stretchTongueCurve, _unStretchTongueCurve;

        [SerializeField] private UnityEvent OnTongueStretch; 
        [SerializeField] private UnityEvent OnTongueUnStretch; 

        private float lastShootTimestamp = Mathf.NegativeInfinity;
        private float _moves = 0;
        private Vector3 _target;
        float _startY = 0;
        private Coroutine _stretchRoutine;
        private bool _stretching = false;

        private void Start()
        {
            _startY = _tongueTransform.position.y;
            _tongue.onHit += StopStretch;
        }

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
            if (Mathf.Abs(_moves) < deadzone || (_stopMovesWhenTongueStretch && _stretching)) { return; }

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
            //Instantiate(bulletPrefab, shootAt.position, Quaternion.identity);
            lastShootTimestamp = Time.time;
            _stretchRoutine = StartCoroutine(StretchTongue());
        }

        public void OnTriggerEnter2D(Collider2D collision)
        {
            if (collision.gameObject.tag != collideWithTag) { return; }
            
            GameManager.Instance.ResetCombo();
        }

        IEnumerator StretchTongue()
        {
            _stretching = true;
            float t = 0;
            OnTongueStretch?.Invoke();
            while (t < _animTimeStretch)
            {
                t += Time.deltaTime;
                float p = _stretchTongueCurve.Evaluate(t / _animTimeStretch);
                _tongueTransform.position = new Vector3(_tongueTransform.position.x,
                    Mathf.Lerp(_startY, _startY + _tongueMAXDist, p), _tongueTransform.position.z);
                yield return new WaitForEndOfFrame();
            }
            _tongueTransform.position = new Vector3(_tongueTransform.position.x, _startY + _tongueMAXDist, _tongueTransform.position.z);

            yield return StartCoroutine(UnStretchTongue(_tongueTransform.position.y));
        }

        IEnumerator UnStretchTongue(float startDist)
        {
            yield return new WaitForSeconds(_tongueFreezingTime);
            OnTongueUnStretch?.Invoke();
            float t = 0;
            while (t < _animTimeUnStretch)
            {
                t += Time.deltaTime;
                float p = _unStretchTongueCurve.Evaluate(1-(t/_animTimeStretch));
                _tongueTransform.position = new Vector3(_tongueTransform.position.x,
                    Mathf.Lerp(_startY, startDist, p), _tongueTransform.position.z);
                yield return new WaitForEndOfFrame();
            }
            _tongueTransform.position = new Vector3(_tongueTransform.position.x, _startY, _tongueTransform.position.z);
            _tongue.Swallow();
            _stretching = false;
        }

        private void StopStretch()
        {
            StopCoroutine(_stretchRoutine);
            StartCoroutine(UnStretchTongue(_tongueTransform.position.y));
        }
    }
}

