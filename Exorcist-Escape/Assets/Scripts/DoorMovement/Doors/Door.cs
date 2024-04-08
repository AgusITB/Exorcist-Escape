using UnityEngine;


public class Door : MonoBehaviour, IInteractable
{
    public Animator animator;

    [SerializeField] private Key llave;

    [SerializeField ]private BoxCollider doorCollider;

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
        llave.keyCollected += UnlockDoor;
    }
    private void UnlockDoor()
    {
        lockState = LockState.Unlocked;
    }
    public void Interact()
    {
        if (lockState == LockState.Locked)
        {
            Debug.Log("Door locked");
            return;

        }
        Debug.Log("Door interacte0");
        doorState = doorState == DoorState.Opened ? DoorState.Closed : DoorState.Opened;
        if (doorState == DoorState.Opened)
        {
            animator.SetTrigger("Open");
            doorCollider.enabled = false;
        }
        else
        {
            animator.SetTrigger("Close");
            doorCollider.enabled = false;
        }
    }
    

}
