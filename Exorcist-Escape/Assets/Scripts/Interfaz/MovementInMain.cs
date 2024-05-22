using UnityEngine;
using UnityEngine.SceneManagement;


public class MovementInMain : MonoBehaviour
{

    public void NewGame(string sceneName)
    {
        Debug.Log("Start New Game...");
        SceneManager.LoadScene(sceneName); // Cargar la escena especificada por el nombre
    }

    public void Continue()
    {
        Debug.Log("ContinueGame...");
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
