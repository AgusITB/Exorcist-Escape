using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;


public class BasementDoor : NonPickableObject
{
    private GameManager gameManager;

    private void Awake()
    {
        gameManager = GameManager.instance;
        DontDestroyOnLoad(this);
    }
    public override void Interact()
    {
        Debug.Log("Go to the basement");

        StartCoroutine(LoadScene());
    }


    private static IEnumerator LoadScene() {

        var asyncLoadLevel = SceneManager.LoadSceneAsync(2, LoadSceneMode.Single);
        while (!asyncLoadLevel.isDone)
        {
            Debug.Log("Loading the Scene");
            yield return null;
        }
        Debug.Log("Hello");
        DataController.instance.ActivatePlayerCamera("FinalHouse");


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
