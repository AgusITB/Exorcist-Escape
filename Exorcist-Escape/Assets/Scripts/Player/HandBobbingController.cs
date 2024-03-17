using UnityEngine;

public class HandBobbingController : MonoBehaviour
{
    [SerializeField] private Transform targetTransform;

    [HideInInspector] public Vector3 offset;

    [Header("On mouse move")]
    public float Amount = 0.1f;
    public float maxAmount = 0.1f;
    public float SmoothAmount = 2;

    private Vector3 initialPositon;
    private InputManager inputManager;

    // Start is called before the first frame update
    void Start()
    {
        inputManager = InputManager.Instance;
        initialPositon = transform.localPosition;
    }

    void Update()
    {
        Vector2 mouseDelta = inputManager.GetMouseDelta();
        Vector2 movement = inputManager.GetPlayerMovement();

        if (movement.magnitude > 0)
        {
            // If player is moving arms will respond to movement
            transform.position = targetTransform.position + offset;
       
        }
        else
        {
            // If player is not moving it will create a sway if the player moves the camera
            float movementX = -mouseDelta.x * Amount;
            float movementY = -mouseDelta.y * Amount;

            movementX = Mathf.Clamp(movementX, -maxAmount, maxAmount);
            movementY = Mathf.Clamp(movementY, -maxAmount, maxAmount);

            Vector3 finalPosition = new(movementX, movementY, 0);
            transform.localPosition = Vector3.Lerp(transform.localPosition, finalPosition + initialPositon, Time.deltaTime * SmoothAmount);
        }    

    }
}
