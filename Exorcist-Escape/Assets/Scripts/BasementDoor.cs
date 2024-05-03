using UnityEngine;
using UnityEngine.SceneManagement;


public class BasementDoor : NonPickableObject
{
    private GameManager gameManager;

    private void Awake()
    {
        gameManager = GameManager.instance;
    }
    public override void Interact()
    {
        Debug.Log("Go to the basement");
        SceneManager.LoadScene("House");
    }

    private void OnTriggerEnter(Collider other)
    {
        gameManager.ActivateHud("Go to the basement");
    }
    private void OnTriggerExit(Collider other)
    {
        gameManager.DeactivateHud();
    }
}
