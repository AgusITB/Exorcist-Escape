using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight; 
    public Light uvLight; 
    //public GameObject objecto;
    public bool insidePurple;

    //private void OnTriggerStay(Collider other)
    //{
    //    if(other.CompareTag("Purple"))
    //    {
    //        insidePurple = true;
    //    }
    //}
    //private void OnTriggerExit(Collider other)
    //{
    //    if (other.CompareTag("Purple"))
    //    {
    //        insidePurple = false;
    //    }
    //}


    void Update()
    {
        //gameObject.SetActive(insidePurple);

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
