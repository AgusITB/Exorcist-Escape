using UnityEngine;


[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour
{
    private CharacterController controller;

    private bool groundedPlayer;

    private float verticalVelocity;

    [SerializeField] private float playerSpeed;
    [SerializeField] private float gravityValue;

    [SerializeField] Transform cameraTransform;

    private InputManager inputManager;

    [SerializeField] private float m_StepInterval;
    [SerializeField] private AudioClip[] m_FootstepSounds;    // an array of footstep sounds that will be randomly selected from.
    [SerializeField] private GameObject deathMenu;
    [SerializeField] public GameObject playerHUD;
    private float m_StepCycle;
    private float m_NextStep;

    private AudioSource m_AudioSource;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;

        inputManager.interacted += PlayerAim.Instance.Interact;
        m_AudioSource = GetComponent<AudioSource>();
        if (inputManager == null) Debug.LogWarning("There's not an instance of an Input Manager in the scene");

    }
    private void FixedUpdate()
    {
        ProgressStepCycle();
    }

    private void ProgressStepCycle()
    {

        if (controller.velocity.sqrMagnitude > 0 && (inputManager.GetPlayerMovement().x != 0 || inputManager.GetPlayerMovement().y != 0))
        {
            m_StepCycle += (controller.velocity.magnitude + 1f * playerSpeed) * Time.fixedDeltaTime;
        }

        if (!(m_StepCycle > m_NextStep))
        {
            return;
        }

        m_NextStep = m_StepCycle + m_StepInterval;

        PlayFootStepAudio();
    }
    private void PlayFootStepAudio()
    {
        // pick & play a random footstep sound from the array,
        // excluding sound at index 0
        int n = Random.Range(1, m_FootstepSounds.Length);
        m_AudioSource.clip = m_FootstepSounds[n];
        m_AudioSource.PlayOneShot(m_AudioSource.clip);
        // move picked sound to index 0 so it's not picked next time
        m_FootstepSounds[n] = m_FootstepSounds[0];
        m_FootstepSounds[0] = m_AudioSource.clip;
    }


    void Update()
    {
        if (inputManager == null) return;

        groundedPlayer = controller.isGrounded;

        Vector2 movement = inputManager.GetPlayerMovement();
        Vector3 move = new(movement.x, 0, movement.y);


        // Get the camera's right and forward directions
        Vector3 cameraRight = cameraTransform.right;
        Vector3 cameraForward = cameraTransform.forward;

        // Flatten the camera's forward direction to the horizontal plane
        cameraForward.y = 0;
        cameraForward.Normalize();

        // Flatten the camera's right direction to the horizontal plane
        cameraRight.y = 0;
        cameraRight.Normalize();

        // Calculate the move direction based on the flattened vectors
        move = move.x * cameraRight + move.z * cameraForward;

        // Apply gravity
        if (!groundedPlayer)
        {
            verticalVelocity += gravityValue * Time.deltaTime;
        }
        else
        {
            verticalVelocity = 0f;
        }

        move.y = verticalVelocity;

        controller.Move(playerSpeed * Time.deltaTime * move);

        //move = move.x * cameraTransform.right.normalized + move.z * cameraTransform.forward.normalized;
        //move.y += gravityValue * Time.deltaTime;

        //if (groundedPlayer && move.y < 0)
        //{
        //    move.y = 0f;
        //}
        //controller.Move(playerSpeed * Time.deltaTime * move);

        //playerVelocity.y += gravityValue * Time.deltaTime;
        //controller.Move(playerVelocity * Time.deltaTime);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out Llorona llorona))
        {
            deathMenu.SetActive(true);
            this.enabled = false;
            inputManager.enabled = false;
            playerHUD.SetActive(false);
            Destroy(llorona.gameObject);
        }
    }
}
