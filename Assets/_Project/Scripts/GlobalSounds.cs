using System;
using UnityEngine;
using UnityEngine.Events;

namespace Leon
{
    public class GlobalSounds : MonoBehaviour
    {
        [Header("Global")]
        [SerializeField] private AudioClip BaseMusic;
        [SerializeField] private int[] GlobalScoreTresholds;
        [SerializeField] private AudioClip[] music;
        [SerializeField] private AudioClip[] fire;

        [Header("Current")]
        [SerializeField] private int[] CurrentScoreTresholds;
        [SerializeField] private AudioClip[] sounds;

        [Header("References")] 
        [SerializeField] private AudioSource _asMusic;
        [SerializeField] private AudioSource _asFire;
        [SerializeField] private AudioSource _asSounds;
        [SerializeField] private GameState _gameState;

        [SerializeField] private UnityEvent _onPhaseChange;

        private void OnEnable() {
            _gameState.onTotalScoreChangeEvent += OnTotalScoreChange;
            _gameState.onCurrentBaseScoreChangeEvent += OnBaseScoreChange;
        }
        
        private void OnBaseScoreChange(float val) {
            AudioClip newClip = null;
            for (int i = 0; i < CurrentScoreTresholds.Length; i++) {
                if (val > CurrentScoreTresholds[i]) {
                    newClip = sounds[i];
                }
            }
            if (newClip != null) {
                _asSounds.PlayOneShot(newClip);
            }
        }

        private void Start() {
            _asMusic.generator = BaseMusic;
            _asMusic.Play();
        }

        private void OnTotalScoreChange(float val) {
            AudioClip newClipMusic = null;
            AudioClip newClipFire = null;
            for (int i = 0; i < GlobalScoreTresholds.Length; i++) {
                if (val > GlobalScoreTresholds[i]) {
                    newClipMusic = music[i];
                    newClipFire = fire[i];
                }
            }

            if (_asMusic.generator != newClipMusic && newClipMusic) {
                _asMusic.generator = newClipMusic;
                _onPhaseChange?.Invoke();
                _asMusic.Play();
            }
            
            if (_asFire.generator != newClipFire && newClipFire) {
                _asFire.generator = newClipFire;
                _asFire.Play();
            }
        }
    }
}
