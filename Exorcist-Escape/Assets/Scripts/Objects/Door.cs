using UnityEngine;


public class Door : NonPickableObject 
{ 

    public Animator animator;

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
        llave.keyCollected += UnlockDoor;
    }
    private void UnlockDoor()
    {
        lockState = LockState.Unlocked;
    }
    public override void Interact()
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
        }
        else
        {
            animator.SetTrigger("Close");       
        }
        DeactivateObject();
    }
}
