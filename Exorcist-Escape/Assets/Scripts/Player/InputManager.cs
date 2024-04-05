using System;
using UnityEngine;

public class InputManager : MonoBehaviour
{
    private PlayerControls playerControls;

    private static InputManager instance;

    public Action toggleLight;
    public Action changeLight;
    public Action activateObject;



    public static InputManager Instance
    {
        get { return instance; }
    }

    private void Awake()
    {
        if (instance != null && instance != this)
            Destroy(this);
        else 
            instance = this;
        
        playerControls = new PlayerControls();
        playerControls.Player.Flashlight.performed += _ => toggleLight.Invoke();
        playerControls.Player.ToggleLights.started += _ => changeLight.Invoke();
        playerControls.Player.CameraObject.performed += _ => activateObject.Invoke();

    }

    private void OnEnable()
    {
        playerControls.Enable();
    }
    private void OnDisable()
    {
        playerControls.Disable();
    }

    public Vector2 GetPlayerMovement()
    {
        return playerControls.Player.Movement.ReadValue<Vector2>();
    }
    public Vector2 GetMouseDelta()
    {
        return playerControls.Player.Look.ReadValue<Vector2>();
    }
    public bool PlayerCrouchedThisFrame()
    {
        return playerControls.Player.Crouch.WasPressedThisFrame();
    }



}
