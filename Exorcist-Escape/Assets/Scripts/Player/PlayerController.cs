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

    [SerializeField] private PickableObject pickableObject;
    [SerializeField] private NonPickableObject nonPickableObject;

    
    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;

        inputManager.interacted += PlayerAim.Instance.Interact;
        
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

        //if (other.TryGetComponent(out PickableObject interactable))
        //{
        //    pickableObject = interactable.GetComponent<PickableObject>();
        //}

        //if (other.TryGetComponent(out NonPickableObject lightSwitch))
        //{
        //    nonPickableObject = lightSwitch.GetComponent<NonPickableObject>();
        //}
    }
    private void OnTriggerExit(Collider other)
    {
        //if (other.TryGetComponent(out PickableObject _))
        //{
        //    pickableObject = null;
        //}
        //if (other.TryGetComponent(out NonPickableObject _))
        //{
        //    nonPickableObject = null;
        //}
    }
    private void Interact()
    {
        //if (pickableObject != null)
        //{
        //    pickableObject.Interact();
        //    pickableObject = null;
        //}
        //if (nonPickableObject != null)
        //{
        //    nonPickableObject.Interact();
        //    nonPickableObject = null;

        //}
    }

}
