using TMPro;
using UnityEngine;

public class NotesManager : MonoBehaviour
{
    public static NotesManager instance;
    [SerializeField] private TextMeshProUGUI meshGui;
    [SerializeField] private GameObject NoteInspection;
    private void Awake()
    {
        instance = this;
        PlayerAim.playerInteracted += HideNote;
    }
    private void HideNote()
    {
        NoteInspection.SetActive(false);
    }
    public void ChangeText(string text)
    {
        meshGui.text = text;
        NoteInspection.SetActive(true);
    }

}

