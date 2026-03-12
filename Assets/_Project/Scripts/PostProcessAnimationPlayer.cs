using System;
using UnityEngine;

namespace Leon
{
    public class PostProcessAnimationPlayer : MonoBehaviour
    {
        public static PostProcessAnimationPlayer instance;
        private static readonly int kaleidoscope = Animator.StringToHash("Kaleidoscope");
        private static readonly int lensMilk = Animator.StringToHash("LensMilk");
        private static readonly int lensDrug = Animator.StringToHash("LensDrug");
        private static readonly int chroma = Animator.StringToHash("Chroma");
        private static readonly int chromaIdle = Animator.StringToHash("ChromaIdle");

        [SerializeField] private Animator _anim;

        private void Awake() {
            if (instance == null) {
                instance = this;
            }
            else Destroy(this);
        }
        
        public void PlayKaleidoscope() {
            _anim.SetTrigger(kaleidoscope);
        }
        
        public void PlayLensMilk() {
            _anim.SetTrigger(lensMilk);
        }
        
        public void PlayLensDrug() {
            _anim.SetTrigger(lensDrug);
        }
        
        public void PlayChroma() {
            _anim.SetTrigger(chroma);
        }
        
        public void PlayChromaIdle() {
            _anim.SetTrigger(chromaIdle);
        }
        
    }
}
