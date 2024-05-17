using System.IO;
using UnityEngine;

public class DataController : MonoBehaviour
{
    [SerializeField] private Transform playerTransform;
    public static DataController instance;
    private string saveFilePath = "./Assets/Scripts/JSON/Data.json";


    private void Awake()
    { 
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
            playerTransform = GetComponent<Transform>();
        }
        else
        {
            Destroy(gameObject);
        }
        // instance = this;
        // LoadPlayerPosition();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("checkpoint"))
        {
            SavePlayerPosition();
        }
    }

    private void Awake()
    {
       
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

                    /// LOAD SCENE SAVED
                    string jsonData = reader.ReadToEnd();
                    PlayerData playerData = JsonUtility.FromJson<PlayerData>(jsonData);
                    playerTransform.position = new Vector3(playerData.posX, playerData.posY, playerData.posZ);

                }
            }
            else
            {
                Debug.LogWarning("No se encontr� el archivo en: " + saveFilePath);
             UnityEngine.SceneManagement.SceneManager.LoadScene(playerData.scenaName);
            }

            playerTransform.position = new Vector3(playerData.posX, playerData.posY, playerData.posZ);
            playerTransform.rotation = Quaternion.Euler(playerData.rotX, playerData.rotY, playerData.rotZ);
        }
        catch (System.Exception e)
        {
            Debug.LogError("Error al cargar la posici�n: " + e.Message);
        }
    }
}
