using UnityEngine;

public class ActivateFlashlight : MonoBehaviour
{
    public Light normalLight;
    public Light uvLight;
    private Animator animator;
    private Light currentLight;

    public bool insidePurple;

    InputManager inputManager;
    [SerializeField] private AudioClip activateLight;

   
    private void Start()
    {
        //animator = GetComponentInParent<Animator>();
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
        AudioSource.PlayClipAtPoint(activateLight, this.transform.position);
    }
           
    private void ToggleLight()
    {    
        if (currentLight.gameObject.activeSelf == false)
        {
            currentLight.gameObject.SetActive(true);
            //animator.SetBool("On", true);
        }
        else
        {
            currentLight.gameObject.SetActive(false);
            //animator.SetBool("On", false);
        }
        AudioSource.PlayClipAtPoint(activateLight,this.transform.position);

    }
}
