using System;
using UnityEngine;

public abstract class PickableObject : InteractableObject
{
    private Outline gameObjectOutline;
    public Action onPickUp;

    [SerializeField] protected AudioClip pickUpClip;
    
    protected virtual void Awake()
    {
        gameObjectOutline = GetComponent<Outline>();
        DeactivateOutLine();
    }
    public void ActivateOutLine()
    {
        gameObjectOutline.enabled = true;
    }
    public void DeactivateOutLine()
    {
        gameObjectOutline.enabled = false;
    }

    protected abstract void Collect();




}