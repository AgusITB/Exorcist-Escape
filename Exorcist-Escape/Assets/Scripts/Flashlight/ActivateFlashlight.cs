using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight;
    public Light uvLight;
    public bool insidePurple;

    void Update()
    {
        // Verificar si la linterna est� activada
        if (InputManager.Instance.IsFlashing())
        {
            // Desactivar ambas luces si la linterna est� activada
            normalLight.enabled = true;
            uvLight.enabled = false;
        }
        else if (InputManager.Instance.IsFlashing())
        {
            normalLight.enabled = false;
            uvLight.enabled = true;
        }
        else
        {
            // Si la linterna no est� activada, verificar si se presion� la tecla Z
            if (Input.GetKeyDown(KeyCode.Z))
            {
                // Si la luz normal est� activada, activar la luz UV y desactivar la luz normal
                if (normalLight.enabled)
                {
                    normalLight.enabled = false;
                    uvLight.enabled = true;
                }
                // Si la luz UV est� activada, activar la luz normal y desactivar la luz UV
                else if (uvLight.enabled)
                {
                    normalLight.enabled = true;
                    uvLight.enabled = false;
                }
            }
          

        }
        //gameObject.SetActive(insidePurple);

        //if (InputManager.Instance.IsFlashing())
        //{
        //    normalLight.enabled = false;
        //    uvLight.enabled = false;
        //}
        //else
        //{
        //    //normalLight.enabled = true;
        //    if (Input.GetKeyDown(KeyCode.Z))
        //    {
        //        uvLight.enabled = true;
        //        //normalLight.enabled = false;
        //    }
        //    else
        //    {
        //        uvLight.enabled = false;
        //        normalLight.enabled = true;
        //    }
        //}
    }
}
