using UnityEngine;

public class Key : PickableObject
{
    protected override void Awake()
    {
        base.Awake();
    }
    protected override void Collect()
    {
        if (pickUpClip != null)
        {
            AudioSource.PlayClipAtPoint(pickUpClip, this.transform.position);
        }
    
        onPickUp?.Invoke();
        Destroy(this.gameObject);
    }
    public override void Interact()
    {
        this.Collect();
    }
}
