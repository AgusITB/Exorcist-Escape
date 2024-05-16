using TMPro;
using UnityEngine;

public class ReadableNote : PickableObject
{

    private NotesManager notesManager;
    private TextMeshPro text;
    protected override void Awake()
    {
        base.Awake();
    
    }
    private void Start()
    {
        text = GetComponentInChildren<TextMeshPro>();
        notesManager = NotesManager.instance;
    }
    public override void Interact()
    {
        this.Collect();     
    }
    protected override void Collect()
    {
        notesManager.ChangeText(text);
        
        if (pickUpClip != null)
        {
            AudioSource.PlayClipAtPoint(pickUpClip, this.transform.position, 0.3f);
        }
       
    }
}

