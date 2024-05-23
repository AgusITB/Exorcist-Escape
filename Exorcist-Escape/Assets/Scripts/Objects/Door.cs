using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class Door : NonPickableObject
{

    public Animator animator;
    private AudioSource audioSource;
    [SerializeField] private AudioClip openClip;
    [SerializeField] private AudioClip closeClip;
    [SerializeField] private AudioClip lockedClip;
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
            llave.onPickUp += UnlockDoor;
        }
        audioSource = GetComponent<AudioSource>();
        audioSource.Pause();    
    }
    public void UnlockDoor()
    {
        lockState = LockState.Unlocked;
    }
    public void LockDoor()
    {
        lockState = LockState.Locked;
    } 
    public override void Interact()
    {

        if (lockState == LockState.Locked)
        {
            audioSource.clip = lockedClip;
            audioSource.Play();
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
