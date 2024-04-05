using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class prueba : MonoBehaviour
{

    public Light lighta;
    public Color color;

    public Renderer cube;

    // Start is called before the first frame update
    void Start()
    {
        color = lighta.color;
    }

    // Update is called once per frame
    void Update()
    {    
        if (lighta.color == cube.material.GetColor("_Color")) 
        {
            cube.material.SetColor("_LightColor", Color.white);
        }else
        {
            cube.material.SetColor("_LightColor", lighta.color);
        }
    }
}
