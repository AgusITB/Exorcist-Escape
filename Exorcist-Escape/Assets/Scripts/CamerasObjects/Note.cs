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
    protected override void OnTriggerExit(Collider other)
    {
        base.OnTriggerExit(other);
        objectCanvas.SetActive(false);
    }
}
