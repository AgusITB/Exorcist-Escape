using System;

public abstract class PickableObject : InteractableObject
{
    private Outline gameObjectOutline;
    public Action onPickUp;

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