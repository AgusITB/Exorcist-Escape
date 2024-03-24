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
        inputManager.activateObject += ToggleUI;
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
    //private void Start()
    //{
    //    objectCanvas.SetActive(false);
    //    inputManager = InputManager.Instance;
    //    inputManager.activateObject += ActivateObject;
    //}
    //private void OnTriggerEnter(Collider other)
    //{
    //    if (other.TryGetComponent<IInspectable>(out IInspectable inspectable))
    //    {
    //        Debug.Log("ajsijasi");
    //        objectCanvas.SetActive(true);
    //        inspectable.ActivateObject();
    //    }
    //}
    //public void ActivateObject()
    //{
    //    //if(objectCanvas.activeSelf == true)
    //    //{
    //        thirdPersonCamera.SetActive(false);
    //        firstPersonCamera.SetActive(true);

    //    //}
    //}
}
