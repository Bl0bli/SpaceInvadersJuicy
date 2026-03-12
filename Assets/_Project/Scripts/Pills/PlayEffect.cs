using System;
using UnityEngine;

namespace Leon
{
    public class PlayEffect : MonoBehaviour
    {
        enum Effect
        {
            LensMilk,
            LensDrug,
            Chroma,
            ChromaIdle,
            Kaleidoscope,
            Pill
        }

        [SerializeField] private Effect effect;

        public void Play() {
            switch (effect) {
                case Effect.LensMilk:
                    PostProcessAnimationPlayer.instance.PlayLensMilk();
                    break;
                case Effect.LensDrug:
                    PostProcessAnimationPlayer.instance.PlayLensDrug();
                    break;
                case Effect.Chroma:
                    PostProcessAnimationPlayer.instance.PlayChroma();
                    break;
                case Effect.ChromaIdle:
                    PostProcessAnimationPlayer.instance.PlayChromaIdle();
                    break;
                case Effect.Kaleidoscope:
                    PostProcessAnimationPlayer.instance.PlayKaleidoscope();
                    break;
                case Effect.Pill:
                    PostProcessAnimationPlayer.instance.PlayPill();
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
    }
}
