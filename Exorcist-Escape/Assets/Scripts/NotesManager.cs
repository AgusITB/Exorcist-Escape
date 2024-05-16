using Cinemachine;
using TMPro;
using UnityEngine;

public class NotesManager : MonoBehaviour
{
    public static NotesManager instance;
    [SerializeField] private TextMeshProUGUI targetText;
    [SerializeField] private GameObject NoteInspection;
    [SerializeField] private CinemachineInputProvider InputProvider;

    private RectTransform sourceContainer;
    public RectTransform targetContainer;

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
    public void ChangeText(TextMeshPro sourceText)
    {
        sourceContainer = sourceText.gameObject.GetComponent<RectTransform>();
        // Calculate the size ratio
        float widthRatio = targetContainer.rect.width / sourceContainer.rect.width;
        float heightRatio = targetContainer.rect.height / sourceContainer.rect.height;
        float sizeRatio = Mathf.Min(widthRatio, heightRatio);


        isInspecting = !isInspecting;
        InputProvider.enabled = !isInspecting;
        //meshGui.textStyle = text.textStyle;
        //meshGui.text = text.text;

        targetText.text = sourceText.text;

        // Copy font settings
        targetText.font = sourceText.font;
        targetText.fontSize = sourceText.fontSize * sizeRatio;
        targetText.fontStyle = sourceText.fontStyle;
        targetText.color = sourceText.color;

        // Copy alignment
        targetText.alignment = sourceText.alignment;

        // Copy spacing
        targetText.characterSpacing = sourceText.characterSpacing;
        targetText.wordSpacing = sourceText.wordSpacing;
        targetText.lineSpacing = sourceText.lineSpacing;
        targetText.paragraphSpacing = sourceText.paragraphSpacing;

        // Copy other properties as needed
        targetText.enableAutoSizing = sourceText.enableAutoSizing;
        targetText.enableWordWrapping = sourceText.enableWordWrapping;
        targetText.overflowMode = sourceText.overflowMode;
        targetText.richText = sourceText.richText;

        NoteInspection.SetActive(isInspecting);

    }

}

