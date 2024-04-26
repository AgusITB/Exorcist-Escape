using UnityEngine;
public class LightSwitch : NonPickableObject
{
    [SerializeField] private Light[] lights;

    private SwitchState switchState;

    [SerializeField] private Animator animator;


    public enum SwitchState
    {
        On,
        Off
    }

    private void Awake()
    {
        switchState = SwitchState.Off;
    }
    public override void Interact()
    {

        if (switchState == SwitchState.On)
        {
            animator.SetTrigger("TurnOff");
            TurnOFFLights();
            switchState = SwitchState.Off;
        }
        else
        {
            animator.SetTrigger("TurnOn");
            TurnOnLights();
            switchState = SwitchState.On;
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


