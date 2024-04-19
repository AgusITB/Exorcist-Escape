using TMPro;
using UnityEngine;

public abstract class InteractableObject : MonoBehaviour, IInteractable, IInspectable
{
    [SerializeField] protected string id;
    [SerializeField] protected string _name;
    [SerializeField] protected string description;

    private GameObject interactText;
    private GameObject icon;

    private TextMeshProUGUI MeshGui;

    protected void Start()
    {
        //interactText = GameManager.instance.interactText;
        //icon = GameManager.instance.icon;


        //interactText.SetActive(false);
        //icon.SetActive(false);
        //MeshGui = interactText.GetComponentInChildren<TextMeshProUGUI>();
    }
    public abstract void Interact();
    public void ActivateObject()
    {
        interactText.SetActive(true);
        icon.SetActive(true);
        MeshGui.text = description;
    }
    public void DeactivateObject()
    {
        interactText.SetActive(false);
        icon.SetActive(false);
        MeshGui.text = "";
    }

    protected virtual void OnTriggerEnter(Collider other)
    {
        ActivateObject();
    }
    protected virtual void OnTriggerExit(Collider other)
    {
        DeactivateObject();
    }
}
