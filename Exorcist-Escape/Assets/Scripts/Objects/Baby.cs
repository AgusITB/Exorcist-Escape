public class Baby : PickableObject
{
    public override void Interact()
    {
        onPickUp?.Invoke();
        Destroy(this.gameObject);
    }

    protected override void Collect()
    {
        Interact();
    }
}
