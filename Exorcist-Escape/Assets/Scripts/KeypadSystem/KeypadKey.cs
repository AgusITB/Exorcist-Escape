public class KeypadKey : InteractableObject
{
    public string key;

    public override void Interact()
    {
        this.transform.GetComponentInParent<KeypadController>().PasswordEntry(key);
    }
}
