using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class Reveal : MonoBehaviour
{
    public Light lightUv;
    public Material material;
   
    void Update()
    {
        material.SetVector("MyLightPosition", lightUv.transform.position);
        material.SetVector("MyLightDirection", -lightUv.transform.forward);
        //material.SetVector("MyLightAngle", lightUv.spotAngle);
    }
}
