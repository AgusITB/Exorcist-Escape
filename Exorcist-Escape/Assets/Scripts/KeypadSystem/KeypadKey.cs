using UnityEngine;


public class KeypadKey : InteractableObject
{
    public string key;

    public override void Interact()
    {
        Debug.Log("Interacted with key");
        this.transform.GetComponentInParent<KeypadController>().PasswordEntry(key);
    }
}
