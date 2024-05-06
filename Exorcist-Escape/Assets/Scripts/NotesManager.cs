using Cinemachine;
using TMPro;
using UnityEngine;

public class NotesManager : MonoBehaviour
{
    public static NotesManager instance;
    [SerializeField] private TextMeshProUGUI meshGui;
    [SerializeField] private GameObject NoteInspection;
    [SerializeField] private CinemachineInputProvider InputProvider;
    public bool isInspecting = false;
    private void Awake()
    {
        instance = this;
 
    }
    private void HideNote()
    {
        NoteInspection.SetActive(false);
        //isInspecting = false;
    }
    public void ChangeText(string text)
    {
     
        isInspecting = !isInspecting;
        InputProvider.enabled = !isInspecting;
        meshGui.text = text;
        NoteInspection.SetActive(isInspecting);
     
    }

}

