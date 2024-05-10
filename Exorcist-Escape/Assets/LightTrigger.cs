using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightTrigger : MonoBehaviour
{
    [SerializeField] private GameObject turnOnLight;
    [SerializeField] private GameObject turnOffLight;
    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out PlayerController controller))
        {
            turnOnLight.SetActive(true);

            if (turnOffLight != null)
            {
                turnOffLight.SetActive(false);
            }


        }
    }
}
