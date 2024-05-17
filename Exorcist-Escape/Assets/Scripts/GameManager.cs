using TMPro;
using UnityEditor;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [Header("Interact UI")]
    public GameObject interactText;
    public GameObject icon;


    public static GameManager instance;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
    }

    public void ActivateHud(string text)
    {
        interactText.GetComponentInChildren<TextMeshProUGUI>().text = text;
        interactText.SetActive(true);
        icon.SetActive(true);
    }
    public void DeactivateHud()
    {
        interactText.SetActive(false);
        icon.SetActive(false);

    }
}