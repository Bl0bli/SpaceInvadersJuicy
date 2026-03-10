using UnityEngine;

namespace Leon
{
    public interface IConditional<T>
    {
        public bool Evaluate(T ctx);
    }
}
