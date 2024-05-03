using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MovementInMain : MonoBehaviour
{

         public void NewGame(string sceneName)
        {
            SceneManager.LoadScene(sceneName); // Cargar la escena especificada por el nombre
        }
        public void Continue()
        {
            //Hacer Logica Para Cargar Partida
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
