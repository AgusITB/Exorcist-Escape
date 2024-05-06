
using UnityEngine;
using UnityEngine.UI;

public class Inventoryitems : MonoBehaviour
{
    [SerializeField] private UIItem[] items;

    private void Awake()
    {
        foreach (UIItem item in items)
        {
            item.pickableObject.onPickUp += () =>
            {
                ChangeOpacity(item);
            };
        }
    }

    public void ChangeOpacity(UIItem key)
    {
        key.UIKey.GetComponent<Image>().color = new Color32(255, 255, 225, 255);
    }
   
}
