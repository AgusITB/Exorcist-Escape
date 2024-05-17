using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;


public class MovementInMain : MonoBehaviour
{

    public void NewGame(string sceneName)
    {

        SceneManager.LoadScene(sceneName); // Cargar la escena especificada por el nombre
    }
    private static IEnumerator LoadScene(string sceneName)
    {

        var asyncLoadLevel = SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Single);
        while (!asyncLoadLevel.isDone)
        {
            Debug.Log("Loading the Scene");
            yield return null;
        }
        Debug.Log("Hello");
        DataController.instance.ActivatePlayerCamera(sceneName);


    }

    public void Continue()
    {
        if (DataController.instance != null)
        {
            DataController.instance.LoadPlayerPosition();
            Debug.Log("Se ha cargado la posición del jugador.");
        }
        else
        {
            Debug.Log("Es null");
        }
    }
    public void Options()
    {
        //LLamar a la EscenaFunciones
    }

    public void QuitGame()
    {
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
            Application.Quit();
#endif
    }

}
