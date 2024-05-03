using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEngine.Rendering.DebugUI;

public class Inventoryitems : MonoBehaviour
{
    [SerializeField] private Key key1;
    [SerializeField] private Key key2;
    [SerializeField] private Key necklace;

    //private void Awake()
    //{
    //    key1.missionKeyCollected += ChangeOpacity;
    //    key2.missionKeyCollected += ChangeOpacity;
    //    necklace.missionKeyCollected += ChangeOpacity;
    //}

    public void ChangeOpacity(Key key)
    {

        switch (key.name)
        {
            case "Key":
                Debug.Log(key.name);
                //idValue.text = "Nº." + bbddValues.aliens[0].alienId.ToString();
                //nameValue.text = bbddValues.aliens[0].alienName;
                //descriptionValue.text = bbddValues.aliens[0].alienDescription;
                break;
            case "Key2":
                Debug.Log(key.name);
                //idValue.text = "Nº." + bbddValues.aliens[3].alienId.ToString();
                //nameValue.text = bbddValues.aliens[3].alienName;
                //descriptionValue.text = bbddValues.aliens[3].alienDescription;
                break;
            case "necklace":
                Debug.Log(key.name);
                //idValue.text = "Nº." + bbddValues.aliens[2].alienId.ToString();
                //nameValue.text = bbddValues.aliens[2].alienName;
                //descriptionValue.text = bbddValues.aliens[2].alienDescription;
                break;
            case "EscenaCaballito":
                Debug.Log("EscenaCaballito");
                //idValue.text = "Nº." + bbddValues.aliens[1].alienId.ToString();
                //nameValue.text = bbddValues.aliens[1].alienName;
                //descriptionValue.text = bbddValues.aliens[1].alienDescription;
                break;
            default:
                //idValue.text = "ERROR";
                break;
        }
    } 
}
