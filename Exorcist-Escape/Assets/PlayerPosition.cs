using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerPosition : MonoBehaviour
{
    private void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }
    private void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }
    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        StartCoroutine(TPPlayer());
    }
    // Start is called before the first frame update
    private IEnumerator TPPlayer()
    {
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        player.GetComponent<PlayerController>().enabled = false;
        yield return new WaitForSeconds(2f);
        player.transform.position = this.transform.position;
        player.transform.localPosition = this.transform.position;
        DataController.instance.ActivatePlayerCamera();
    }

    
}
