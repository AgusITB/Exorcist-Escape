using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight;
    public Light uvLight;

    private Light currentLight;

    public bool insidePurple;

    InputManager inputManager;

    private void Start()
    {
        inputManager = InputManager.Instance;

        inputManager.toggleLight += ToggleLight;
        inputManager.changeLight += ChangeCurrentLigh;

        currentLight = normalLight;
    }
    private void ChangeCurrentLigh()
    {
        currentLight.gameObject.SetActive(false);

        if (currentLight == uvLight)
            currentLight = normalLight;
        else
            currentLight = uvLight;

        currentLight.gameObject.SetActive(true);
    }
           
    private void ToggleLight()
    {    
        if (currentLight.gameObject.activeSelf == false)
            currentLight.gameObject.SetActive(true);
        else
            currentLight.gameObject.SetActive(false);


    }
}
