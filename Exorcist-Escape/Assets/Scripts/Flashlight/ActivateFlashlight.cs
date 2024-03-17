using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight; // Referencia a la luz normal
    public Light uvLight; // Referencia a la luz ultravioleta

    void Update()
    {
        // Verifica si la linterna está activa y alterna entre las luces
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
