using System;
using UnityEngine;

namespace Leon
{
    public class FXManager : MonoBehaviour
    {
        [SerializeField] private Animator _animator;
        private bool _disableAll = false;

        public static FXManager Instance;
        public event Action<bool> OnDisableAllToggled;

        private void Awake()
        {
            if(Instance != null) Destroy(this);
            Instance = this;
        }

        public void ToggleDisableAll()
        {
            _disableAll = !_disableAll;
            OnDisableAllToggled?.Invoke(_disableAll);
            _animator.SetBool("disable", _disableAll);
        }
    }
}
