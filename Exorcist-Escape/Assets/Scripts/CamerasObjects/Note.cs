using UnityEngine;

public class Note : NonPickableObject
{
    public GameObject objectCanvas;

    private void ToggleUI()
    {
       objectCanvas.SetActive(true);        
    }

    public override void Interact()
    {
        ToggleUI();
    }
}
