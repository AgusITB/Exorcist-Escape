using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Windows;


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

    [SerializeField] private float m_StepInterval;
    [SerializeField] private AudioClip[] m_FootstepSounds;    // an array of footstep sounds that will be randomly selected from.
    [SerializeField] private GameObject deathMenu;
    [SerializeField] private GameObject playerHUD;
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
        ProgressStepCycle(2);
    }

    private void ProgressStepCycle(float speed)
    {
        if (controller.velocity.sqrMagnitude > 0 && (inputManager.GetPlayerMovement().x != 0 || inputManager.GetPlayerMovement().y != 0))
        {
            m_StepCycle += (controller.velocity.magnitude + (speed * 1f)) * Time.fixedDeltaTime;
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
