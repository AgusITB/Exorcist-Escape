using System.Collections;
using System.Collections.Generic;
using UnityEditor.ShaderGraph.Internal;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    [SerializeField] private Image rawImage;
    private RawImage image;

    public float scrollSpeed = 0.5f;

    void Start()
    {
        image = rawImage.GetComponent<RawImage>();
    }

    void Update()
    {
        float offset = Time.time * scrollSpeed;
        Vector2 newOffset = new Vector2(0, offset);
        image.uvRect = new Rect(newOffset, image.uvRect.size);
    }
}
