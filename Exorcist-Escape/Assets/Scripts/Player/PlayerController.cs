using UnityEngine;


[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour
{
    private CharacterController controller;
   
    private bool groundedPlayer;

    private Vector3 playerVelocity;

    [SerializeField] private float playerSpeed;
    [SerializeField] private float gravityValue;

    [SerializeField] Transform cameraTransform;

    private InputManager inputManager;
    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;
        if (inputManager == null) Debug.LogWarning("There's not an instance of an Input Manager in the scene");

    }

    void Update()
    {
        if (inputManager == null) return;

        groundedPlayer = controller.isGrounded;
        if (groundedPlayer && playerVelocity.y < 0)
        {
            playerVelocity.y = 0f;
        }

        Vector2 movement = inputManager.GetPlayerMovement();
        Vector3 move = new(movement.x, 0, movement.y);
        move = move.x * cameraTransform.right.normalized + move.z * cameraTransform.forward.normalized;
        move.y = 0f;

        controller.Move(playerSpeed * Time.deltaTime * move);

        playerVelocity.y += gravityValue * Time.deltaTime;
        controller.Move(playerVelocity * Time.deltaTime);
    }
}
