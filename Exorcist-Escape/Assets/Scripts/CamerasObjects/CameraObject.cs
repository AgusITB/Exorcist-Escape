using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class CameraObject : MonoBehaviour/*, IInspectable*/
{
    public GameObject objectCanvas;
    public GameObject inspection;
    InputManager inputManager;

    private void Start()
    {
        objectCanvas.SetActive(false);
        inspection.SetActive(false);
        inputManager = InputManager.Instance;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            objectCanvas.SetActive(true);
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            objectCanvas.SetActive(false);
            inspection.SetActive(false);
        }
    }

    private void ToggleUI()
    {
        if (objectCanvas.activeSelf)
        {
            objectCanvas.SetActive(false);
            inspection.SetActive(true);
        }
        else if (inspection.activeSelf)
        {
            inspection.SetActive(false);
            objectCanvas.SetActive(true);
        }
    }
}
