using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Leon
{
    public class Bullet : MonoBehaviour
    {
        [SerializeField] Vector3 startVelocity;

        // Start is called before the first frame update
        void Awake() {
            Rigidbody2D rb = GetComponent<Rigidbody2D>();
            rb.linearVelocity = startVelocity;
        }
    }
}