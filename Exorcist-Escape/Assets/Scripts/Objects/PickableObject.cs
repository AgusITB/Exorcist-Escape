using System;

public abstract class PickableObject : InteractableObject
{
    private Outline gameObjectOutline; 
    protected virtual void Awake()
    {
        gameObjectOutline = GetComponent<Outline>();
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