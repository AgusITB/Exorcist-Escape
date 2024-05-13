using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Save : NonPickableObject
{
    private GameManager gameManager;

    private void Awake()
    {
        gameManager = GameManager.instance;
       
    }
    public override void Interact()
    {
        Debug.Log("Save...");
    }
    private void OnTriggerEnter(Collider other)
    {

        gameManager.ActivateHud("Save Game....");

    }
    private void OnTriggerExit(Collider other)
    {
        gameManager.DeactivateHud();
    }
}
