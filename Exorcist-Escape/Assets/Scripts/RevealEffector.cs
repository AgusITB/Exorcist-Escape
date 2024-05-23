using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RevealEffector : MonoBehaviour
{

    public Transform effector;
    Renderer rend;

    void Start()
    {
        rend = GetComponent<Renderer>();
    }

    void Update()
    {
        rend.sharedMaterial.SetVector("_effectorpos", effector.position);
    }

}
