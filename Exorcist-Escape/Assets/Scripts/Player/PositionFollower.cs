
using UnityEngine;

public class PositionFollower : MonoBehaviour
{
    [SerializeField] private Transform targetTransform;

    public Vector3 offset;
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
            transform.position = targetTransform.position + offset;
       
        }
        else
        {
            float movementX = -mouseDelta.x * Amount;
            float movementY = -mouseDelta.y * Amount;

            movementX = Mathf.Clamp(movementX, -maxAmount, maxAmount);
            movementY = Mathf.Clamp(movementY, -maxAmount, maxAmount);

            Vector3 finalPosition = new Vector3(movementX, movementY, 0);
            transform.localPosition = Vector3.Lerp(transform.localPosition, finalPosition + initialPositon, Time.deltaTime * SmoothAmount);
        }
    




    }
}
