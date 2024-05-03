using System;
using Unity.VisualScripting;
using UnityEngine;

public class Key : PickableObject
{
    public Action keyCollected;

    protected AudioClip openClip;

    protected override void Awake()
    {
        base.Awake();
        DeactivateOutLine();
        openClip = Resources.Load<AudioClip>("SFX/PickKey");
    }
    protected override void Collect()
    {

        AudioSource.PlayClipAtPoint(openClip, this.transform.position);
        keyCollected?.Invoke();
        Destroy(this.gameObject);
    }
    public override void Interact()
    {
        this.Collect();
    }
}
