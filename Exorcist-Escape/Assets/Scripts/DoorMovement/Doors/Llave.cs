using System;
using UnityEngine;

public class Llaves : MonoBehaviour, ICollectable
{
    public Action keyCollected;

    public void Collect()
    {
        Debug.Log("Codigo");
        keyCollected.Invoke();
        Destroy(gameObject);
    }
}
