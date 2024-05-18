using System;
using System.Collections;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;


public class DataController : MonoBehaviour
{
    public static DataController instance;
    private PlayerController playerController;

    [SerializeField] private GameObject playerHUD;
    [SerializeField] private GameObject mainMenu;
    
    [SerializeField] private PlayerSettings playerSettings;

    [Serializable]
    public class PlayerSettings
    {
        public GameObject virtualCamera;
        public GameObject mainCamera;
    }


    private readonly string saveFilePath = "./Assets/Scripts/JSON/Data.json";


    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
            playerController = GetComponent<PlayerController>();
        }
        else
        {
            Destroy(gameObject);
        }
        
    }
    public void SavePlayerPosition()
    {

        string currentSceneName = SceneManager.GetActiveScene().name;   
        PlayerData playerData = new(this.transform.position.x, this.transform.position.y, this.transform.position.z, this.transform.rotation.x, this.transform.rotation.y, this.transform.rotation.z, currentSceneName);
        string jsonData = JsonUtility.ToJson(playerData);
        try
        {
            using StreamWriter writer = new(saveFilePath);
            writer.Write(jsonData);
        }
        catch (Exception e)
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

            string currentSceneName = SceneManager.GetActiveScene().name;
            if (currentSceneName != playerData.scenaName)
            {
                using (StreamReader reader = File.OpenText(saveFilePath))
                {
                    StartCoroutine(LoadScene(playerData.scenaName, playerData.posX, playerData.posY, playerData.posZ,playerData.rotX, playerData.rotY, playerData.rotZ));                
                }
            }
            else
            {
                Debug.LogWarning("No se encontr� el archivo en: " + saveFilePath);
            }
        }
        catch (Exception e)
        {
            Debug.LogError("Error al cargar la posici�n: " + e.Message);
        }
    }

    private IEnumerator LoadScene(string sceneName, float posX, float posY, float posZ, float rotX, float rotY, float rotZ)
    {
        var asyncLoadLevel = SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Single);
        while (!asyncLoadLevel.isDone)
        {
            yield return null;
        }
        Destroy(GameObject.FindGameObjectWithTag("SpawnPoint"));

        this.transform.SetPositionAndRotation(new Vector3(posX, posY, posZ), Quaternion.Euler(rotX, rotY, rotZ));
        yield return new WaitForSeconds(1f);
        ActivatePlayerCamera();
    }
    public void ActivatePlayerCamera()
    {
        playerSettings.virtualCamera.SetActive(true);
        playerSettings.mainCamera.SetActive(true);
        if (SceneManager.GetActiveScene().name != "MainMenu")
        {
            mainMenu.SetActive(false);
            playerHUD.SetActive(true);
        }
        playerController.enabled = true;

    }

}
