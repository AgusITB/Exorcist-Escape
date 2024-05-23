using UnityEngine;

public class Note : NonPickableObject
{
    public GameObject objectCanvas;
    public override void Interact()
    {
        ToggleUI();
    }
    private void ToggleUI()
    {
       objectCanvas.SetActive(true);        
    }
}
