using UnityEngine;

[RequireComponent(typeof(HandBobbingController))]
public class ViewBobbing : MonoBehaviour
{
    [Header("On move")]
    [SerializeField] private float effectIntensity;
    [SerializeField] private float effectIntensityX;
    [SerializeField] private float effectSpeed;

    private HandBobbingController bobbingController;
    private Vector3 originalOffset;
    private float sinTime;


    private InputManager inputManager;


    void Start()
    {
        bobbingController = GetComponent<HandBobbingController>();
        inputManager = InputManager.Instance;
        originalOffset = bobbingController.offset;
    }
    void Update()
    {
        Vector2 inputVector = inputManager.GetPlayerMovement();

        if(inputVector.magnitude > 0f)
        {
            sinTime += Time.deltaTime * effectSpeed;
        }
        else
        {
            sinTime = 0f;
        }

        float sinAmountY = -Mathf.Abs(effectIntensity * Mathf.Sin(sinTime));
        Vector3 sinAmountX = effectIntensity * effectIntensityX * Mathf.Cos(sinTime) * bobbingController.transform.right;

        bobbingController.offset = new Vector3
        {
            x = originalOffset.x,
            y = originalOffset.y + sinAmountY,
            z = originalOffset.z
        };


        bobbingController.offset += sinAmountX;
    }
}
