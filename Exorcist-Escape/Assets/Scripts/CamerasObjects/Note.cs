using UnityEngine;

public class Note : NonPickableObject
{
    public GameObject objectCanvas;
    private bool enable = false;

    private void ToggleUI()
    {
       enable = !enable;
       objectCanvas.SetActive(enable);        
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
