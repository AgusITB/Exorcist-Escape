using UnityEngine;

public class PlayerAim : MonoBehaviour
{
    public Transform headPos;
    public static PlayerAim Instance;

    private void Awake()
    {
        Instance = this;
    }
    public void Interact()
    {
        RaycastHit hit;
        Debug.DrawRay(headPos.position, headPos.TransformDirection(Vector3.forward) * Mathf.Infinity, Color.red);

        if (Physics.Raycast(headPos.position, headPos.TransformDirection(Vector3.forward), out hit, Mathf.Infinity))
        {
            Debug.DrawRay(headPos.position, headPos.TransformDirection(Vector3.forward) * hit.distance, Color.red);

            float distance = Vector3.Distance(transform.position, hit.transform.position);
            if (distance <= 1.5f)
            {
                if (hit.transform.name == "DoorMesh")
                {
                    if (hit.transform.TryGetComponent(out IInteractable gameobject))
                    {
                        gameobject.Interact();
                    };
                }
                
            }
        }
    }
}
