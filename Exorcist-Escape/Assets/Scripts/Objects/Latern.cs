using UnityEngine;

public class Latern : PickableObject
{
    public Latern(string id, string name, string description)
    {
        base.id = id;
        base.name = name;
        base.description = description;
    }

    public override void Interact()
    {
        Debug.Log("Hola");
    }

    public override void Throw()
    {
        throw new System.NotImplementedException();
    }
}