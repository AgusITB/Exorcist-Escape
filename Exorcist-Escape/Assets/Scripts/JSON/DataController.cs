using System;
using System.IO;
using UnityEngine;


public class DataController : MonoBehaviour
{
    private Transform controllerTransform;
    public static DataController instance;
    private PlayerController playerController;
    private Transform playerTransform;

    [SerializeField] private PlayerSettings playerSettings;

    [Serializable]
    public class PlayerSettings
    {
        public GameObject virtualCamera;
        public GameObject mainCamera;
    }


    private string saveFilePath = "./Assets/Scripts/JSON/Data.json";


    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
            controllerTransform = GetComponent<Transform>();
            playerController = GetComponent<PlayerController>();
        }
        else
        {
            Destroy(gameObject);
        }
        
    }
    public void SavePlayerPosition()
    {

        string currentSceneName = UnityEngine.SceneManagement.SceneManager.GetActiveScene().name;
        PlayerData playerData = new PlayerData(playerTransform.position.x, playerTransform.position.y, playerTransform.position.z, playerTransform.rotation.x, playerTransform.rotation.y, playerTransform.rotation.z, currentSceneName);
        string jsonData = JsonUtility.ToJson(playerData);
        try
        {
            using (StreamWriter writer = new StreamWriter(saveFilePath))
            {
                writer.Write(jsonData);
            }
        }
        catch (System.Exception e)
        {
            Debug.LogError("Error al guardar la posici�n: " + e.Message);
        }
    }

    public void LoadPlayerPosition()
    {
        if (!File.Exists(saveFilePath))
        {
            Debug.LogWarning("No se encontr� el archivo en: " + saveFilePath);
            return;
        }
        try
        {
            string jsonData = File.ReadAllText(saveFilePath);
            PlayerData playerData = JsonUtility.FromJson<PlayerData>(jsonData);

            string currentSceneName = UnityEngine.SceneManagement.SceneManager.GetActiveScene().name;
            if (currentSceneName != playerData.scenaName)
            {
                using (StreamReader reader = File.OpenText(saveFilePath))
                {


                    UnityEngine.SceneManagement.SceneManager.LoadScene(playerData.scenaName);
                    ActivatePlayerCamera(playerData.scenaName);
                    /// LOAD SCENE SAVED
                    controllerTransform.SetPositionAndRotation(new Vector3(playerData.posX, playerData.posY, playerData.posZ), Quaternion.Euler(playerData.rotX, playerData.rotY, playerData.rotZ));

                }
            }
            else
            {
                Debug.LogWarning("No se encontr� el archivo en: " + saveFilePath);
            }
        }
        catch (System.Exception e)
        {
            Debug.LogError("Error al cargar la posici�n: " + e.Message);
        }
    }

    public void ActivatePlayerCamera(string sceneName)
    {
        Debug.Log("Start");
        playerSettings.virtualCamera.SetActive(true);
        playerSettings.mainCamera.SetActive(true);
        playerController.enabled = true;
    }

}
