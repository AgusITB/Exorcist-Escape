using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight; 
    public Light uvLight; 

    void Update()
    {
       
        if (InputManager.Instance.IsFlashing())
        {
            
            normalLight.enabled = false;
            uvLight.enabled = true;
        }
        else
        {
           
            normalLight.enabled = true;
            uvLight.enabled = false;
        }
    }
}
