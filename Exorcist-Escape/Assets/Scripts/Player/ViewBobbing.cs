using UnityEngine;

[RequireComponent(typeof(PositionFollower))]
public class ViewBobbing : MonoBehaviour
{

    [SerializeField] private float effectIntensity;
    [SerializeField] private float effectIntensityX;
    [SerializeField] private float effectSpeed;

    private PositionFollower followerInstance;
    private Vector3 originalOffset;
    private float sinTime;


    private InputManager inputManager;


    void Start()
    {
        followerInstance = GetComponent<PositionFollower>();
        inputManager = InputManager.Instance;
        originalOffset = followerInstance.offset;
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
        Vector3 sinAmountX = followerInstance.transform.right * effectIntensity * Mathf.Cos(sinTime) * effectIntensityX;

        followerInstance.offset = new Vector3
        {
            x = originalOffset.x,
            y = originalOffset.y + sinAmountY,
            z = originalOffset.z
        };


        followerInstance.offset += sinAmountX;
    }
}
