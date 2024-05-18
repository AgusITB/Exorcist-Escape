using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;


public class BasementDoor : NonPickableObject
{
    private void Awake()
    {
        DontDestroyOnLoad(this);
    }
    public override void Interact()
    {
        StartCoroutine(LoadScene());
    }
    private static IEnumerator LoadScene() {

        var asyncLoadLevel = SceneManager.LoadSceneAsync("FinalHouse", LoadSceneMode.Single);
        while (!asyncLoadLevel.isDone)
        {
            GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerController>().enabled = false;
            yield return null;
        }
    }

    //private void OnTriggerEnter(Collider other)
    //{
    //    gameManager.ActivateHud("Go to the basement");
    //}
    //private void OnTriggerExit(Collider other)
    //{
    //    gameManager.DeactivateHud();
    //}
}
