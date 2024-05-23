using UnityEngine;

public class Save : NonPickableObject
{
    private GameManager gameManager;

    private DataController dataController;

    private void Start()
    {
        gameManager = GameManager.instance;
        dataController = DataController.instance;
    }
    public override void Interact()
    {
        dataController.SavePlayerPosition();
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
