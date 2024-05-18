using UnityEngine;
using UnityEngine.UI;

public class Inventoryitems : MonoBehaviour
{
    [SerializeField] private UIItem[] items;

    private void Awake()
    {
        foreach (UIItem item in items)
        {
            if (item != null)
            {
                item.pickableObject.onPickUp += () =>
                {
                    ChangeOpacity(item);
                };
            }

        }
    }

    public void ChangeOpacity(UIItem key)
    {
        switch (key.name)
        {
            case "key1":
                GameManager.instance.key1.GetComponent<Image>().color = new Color32(255, 255, 225, 255);
                break;
            case "key2":
                GameManager.instance.key2.GetComponent<Image>().color = new Color32(255, 255, 225, 255);
                break;
            case "necklace":
                GameManager.instance.necklace.GetComponent<Image>().color = new Color32(255, 255, 225, 255);
                break;
            case "baby":
                GameManager.instance.baby.GetComponent<Image>().color = new Color32(255, 255, 225, 255);
                break;
        }
     
    }

}
