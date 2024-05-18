using TMPro;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [Header("Interact UI")]
    public GameObject interactText;
    public GameObject icon;

    public GameObject key1;
    public GameObject key2;
    public GameObject necklace;
    public GameObject baby;

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