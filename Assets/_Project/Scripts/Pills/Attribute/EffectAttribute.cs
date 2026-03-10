using System;
using UnityEngine;

namespace Leon
{
    [AttributeUsage(AttributeTargets.Field)]
    public class EffectAttribute : PropertyAttribute
    {
        public enum Target
        {
            Effect,
            Conditional,
            Float
        }

        private Target target;
        
        public EffectAttribute(Target target) {
            this.target = target;
        }

        private static Type[] EffectTypes = new[]
        {
            typeof(NoEffect),
            typeof(MultiEffect),
            typeof(ConditionalEffect),
            typeof(AddBaseScore),
            typeof(AddMultiplyer),
            typeof(MultiplyMultiplyer),
            typeof(AddTotalScore),
            typeof(CancelEverything)
        };
        
        private static Type[] ConditionalTypes = new[]
        {
            typeof(Always), 
            typeof(And),
            typeof(Or),
            typeof(Not),
            typeof(ComboLEqual),
            typeof(ComboGEqual)
        };
        
        private static Type[] FloatTypes = new[]
        {
            typeof(Number), 
            typeof(Add),
            typeof(Mul),
            typeof(Combo),
            typeof(TotalScore),
            typeof(BaseScore),
            typeof(Multiplier)
        };

        public Type[] GetTypes() {
            return target switch
            {
                Target.Effect => EffectTypes,
                Target.Conditional => ConditionalTypes,
                Target.Float => FloatTypes,
                _ => throw new ArgumentOutOfRangeException()
            };
        }
    }
}
