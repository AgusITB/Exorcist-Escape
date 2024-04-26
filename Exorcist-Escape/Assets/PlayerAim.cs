using UnityEngine;

public class PlayerAim : MonoBehaviour
{
    [SerializeField] private Transform headPos;
    public static PlayerAim Instance;

    private void Awake()
    {
        Instance = this;
    }
    private void Update()
    {
        Debug.DrawLine(headPos.position, headPos.TransformDirection(Vector3.forward) * Mathf.Infinity, Color.red);
    }
    public void Interact()
    {
        RaycastHit hit;
        Debug.DrawLine(headPos.position, headPos.TransformDirection(Vector3.forward) * Mathf.Infinity, Color.red);
        int layerMask = 1 << 8;

        if (Physics.Raycast(headPos.position, headPos.TransformDirection(Vector3.forward), out hit, Mathf.Infinity, layerMask))
        {
            Debug.DrawRay(headPos.position, headPos.TransformDirection(Vector3.forward) * hit.distance, Color.red);

            float distance = Vector3.Distance(transform.position, hit.transform.position);
            if (distance <= 1.5f)
            {
                    if (hit.transform.TryGetComponent(out IInteractable gameobject))
                    {
                 
                        gameobject.Interact();
                    };
            }
        }
    }
    private void OnDrawGizmos()
    {
       
    }
}
