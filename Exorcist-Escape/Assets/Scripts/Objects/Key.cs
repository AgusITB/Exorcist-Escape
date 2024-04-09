using System;
using UnityEngine;

public class Key : MonoBehaviour, ICollectable
{
    public Action keyCollected;

    public void Collect()
    {
        keyCollected.Invoke();
        Destroy(gameObject);
    }
}
