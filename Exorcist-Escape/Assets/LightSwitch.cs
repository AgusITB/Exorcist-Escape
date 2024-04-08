using Unity.VisualScripting;
using UnityEngine;
using static Door;

public class LightSwitch : MonoBehaviour, IInteractable
{
    [SerializeField] private Light[] lights;

    private SwitchState switchState;

    private Collider switchCollider;

    private Animator animator;
    public enum SwitchState
    {
        On,
        Off
    }
    private void Awake()
    {
        switchCollider = GetComponent<Collider>();
        animator = GetComponent<Animator>();
    }
    public void Interact()
    {
        switchState = switchState == SwitchState.On ? SwitchState.Off : SwitchState.On;

        if (switchState == SwitchState.On)
        {
            animator.SetTrigger("TurnOff");
            switchCollider.enabled = false;
            TurnOFFLights();

        }
        else
        {
            animator.SetTrigger("TurnOn");
            switchCollider.enabled = false;
            TurnOnLights();
        }
    }
    private void TurnOnLights()
    {
        foreach (var light in lights)
        {
            light.enabled = true;
        }
    }
    private void TurnOFFLights()
    {
        foreach (var light in lights)
        {
            light.enabled = false;
        }
    }
}


