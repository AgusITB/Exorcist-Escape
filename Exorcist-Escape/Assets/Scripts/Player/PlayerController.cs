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

    [SerializeField] private Door currentDoor;
    [SerializeField] private LightSwitch currentLightSwitch;


    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;

        inputManager.interacted += Interact;

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

    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out ICollectable collectable))
        {
            collectable.Collect();
        }      

        if (other.TryGetComponent(out Door interactable))
        {
           currentDoor = interactable.GetComponent<Door>();
        }

        if (other.TryGetComponent(out LightSwitch lightSwitch))
        {
            currentLightSwitch = lightSwitch.GetComponent<LightSwitch>();
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (other.TryGetComponent(out Door _))
        {
            currentDoor = null;
        }
        if (other.TryGetComponent(out LightSwitch _))
        {
            currentLightSwitch = null;
        }
    }
    private void Interact()
    {
        if (currentDoor != null)
        {
            currentDoor.Interact();
            currentDoor = null;
        }
        if (currentLightSwitch != null)
        {
            currentLightSwitch.Interact();
            currentLightSwitch = null;
        }
    }

}
