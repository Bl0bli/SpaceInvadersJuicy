using UnityEngine;

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
        
    }
}
