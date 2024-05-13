using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    //[SerializeField] private RawImage rawImage;

    //public float scrollSpeed = 0.5f;
    //public float directionChangeInterval = 0.2f; // Interval at which direction changes

    //private int[] ints = { -1, 1 };
    //private float currentScrollSpeed = 0;

    //private float nextDirectionChangeTime;
    //private Vector2 currentOffset;

    [Header("Interact UI")]
    [SerializeField] public GameObject interactText;
    [SerializeField] public GameObject icon;

    public static GameManager instance;
    private void Awake()
    {
        instance = this;
    }
    public void ActivateHud(string text)
    {
        interactText.GetComponentInChildren<TextMeshProUGUI>().text = text;
        interactText.SetActive(true);
        icon.SetActive(true);
    }
    public void DeactivateHud()
    {
        interactText.SetActive(false);
        icon.SetActive(false);

    }
    //void Start()
    //{
    //    nextDirectionChangeTime = Time.time + directionChangeInterval;
    //}

    void Update()
    {
        //float offset;

        //// Check if it's time to change direction
        //if (Time.time >= nextDirectionChangeTime)
        //{
        //    // Invert the direction randomly
        //    currentScrollSpeed = scrollSpeed * ints[Random.Range(0,ints.Length)];
        //    nextDirectionChangeTime = Time.time + directionChangeInterval;
     
        //}

        //// Update the offset based on scroll speed
        //offset = Time.time * currentScrollSpeed;
        
        //currentOffset.y = offset;

        //Vector2 newOffset = new(offset, offset);

        //// Apply the offset to the material
        //rawImage.material.SetTextureOffset("_MainTex", newOffset);


     
    }
}
