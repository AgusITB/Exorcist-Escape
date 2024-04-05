using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class Puerta : MonoBehaviour
{
    public string nombreAnimacion;
    public Animator animator;

    [SerializeField] private Llaves llave;

    public enum LockState
    {
        Unlocked,
        Locked
    }
    public enum DoorState
    {
        Opened,
        Closed
    }

    [SerializeField] bool interactable = false;

    [SerializeField] private LockState lockState;
    [SerializeField] private DoorState doorState;

    private void Awake()
    {
        llave.keyCollected += OpenDoor;
        //InputPlayer.PlayerInteracted += SwitchState;
    }

    private void OpenDoor()
    {
        lockState = LockState.Unlocked;
    }
    private void SwitchState()
    {
        if (interactable)
        {
            switch (lockState)
            {
                case LockState.Unlocked:
                    switch (doorState)
                    {
                        case DoorState.Opened:
                            animator.Play("Close");
                            doorState = DoorState.Closed;
                            interactable = false;
                            break;
                        case DoorState.Closed:
                            animator.Play("Open");
                            doorState = DoorState.Opened;
                            interactable = false;
                            break;
                    }
                    break;
                case LockState.Locked:
                    Debug.Log("estoy cerrada mamahuevo");
                    break;
            }
        }
    }

    private void Interactable()
    {
        interactable = true;
    }
    private void OnTriggerEnter(Collider other)
    {
        interactable = true;
    }
    private void OnTriggerExit(Collider other)
    {
        interactable = false;
    }
}
