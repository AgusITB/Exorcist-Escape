using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class Door : NonPickableObject
{

    public Animator animator;
    private AudioSource audioSource;
    private AudioClip openClip;
    private AudioClip closeClip;

    [SerializeField] private Key llave;

    public enum LockState
    {
        Locked,
        Unlocked
    }
    public enum DoorState
    {
        Closed,
        Opened
    }

    [SerializeField] private LockState lockState;
    [SerializeField] private DoorState doorState;

    private void Awake()
    {
        if (llave != null)
        {
            llave.keyCollected += UnlockDoor;
        }
        audioSource = GetComponent<AudioSource>();
        audioSource.Pause();
        openClip = Resources.Load<AudioClip>("SFX/OpenDoor");
        closeClip = Resources.Load<AudioClip>("SFX/CloseDoor");
    }
    private void UnlockDoor()
    {
        lockState = LockState.Unlocked;
    }
    public override void Interact()
    {
        Debug.Log("Door interacted");
        if (lockState == LockState.Locked)
        {
            Debug.Log("Door locked");
            return;

        }

        doorState = doorState == DoorState.Opened ? DoorState.Closed : DoorState.Opened;

        if (doorState == DoorState.Opened)
        {
            animator.SetTrigger("Open");
            audioSource.clip = openClip;
            audioSource.Play();
        }
        else
        {
            animator.SetTrigger("Close");
            audioSource.clip = closeClip;       
            audioSource.Play();
        }
    }
}
