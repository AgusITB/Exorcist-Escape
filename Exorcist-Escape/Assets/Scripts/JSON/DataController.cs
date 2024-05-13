using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class DataController : MonoBehaviour
{
    private Transform playerTransform;
    public static DataController instance;
    //Ruta relativa del Data.json
    private string saveFilePath = "./Assets/Scripts/JSON/Data.json";
   

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("chekpoint"))
        {
            SavePlayerPosition();

           
        }
    }
    private void Awake()
    {
        playerTransform = GetComponent<Transform>();
        LoadPlayerPosition();
    }
    public void SavePlayerPosition()
    {
        PlayerData playerData = new PlayerData(playerTransform.position.x, playerTransform.position.y, playerTransform.position.z, playerTransform.rotation.x, playerTransform.rotation.y, playerTransform.rotation.z);
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
        try
        {
            if (File.Exists(saveFilePath))
            {
                using (StreamReader reader = File.OpenText(saveFilePath))
                {
                    string jsonData = reader.ReadToEnd();
                    PlayerData playerData = JsonUtility.FromJson<PlayerData>(jsonData);
                    playerTransform.position = new Vector3(playerData.posX, playerData.posY, playerData.posZ);
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
}
