using UnityEngine;

public class Key : PickableObject
{
    protected AudioClip openClip;

    protected override void Awake()
    {
        base.Awake();
        openClip = Resources.Load<AudioClip>("SFX/PickKey");
    }
    protected override void Collect()
    {

        AudioSource.PlayClipAtPoint(openClip, this.transform.position);
        onPickUp?.Invoke();
        Destroy(this.gameObject);
    }
    public override void Interact()
    {
        this.Collect();
    }
}
