using System;
using UnityEngine;

public class PlayerAim : MonoBehaviour
{
    [SerializeField] private Transform headPos;
    public static PlayerAim Instance;
    private PickableObject currentPickable;

    public static Action playerInteracted;
    private void Awake()
    {
        Instance = this;
    }
    private void Update()
    {
        RaycastHit hit;
        int layerMask = 1 << 8;

        if (Physics.Raycast(headPos.position, headPos.TransformDirection(Vector3.forward), out hit, Mathf.Infinity, layerMask))
        {
            float distance = Vector3.Distance(transform.position, hit.transform.position);
            if (distance <= 1.5f)
            {
                if (hit.transform.TryGetComponent(out PickableObject gameobject))
                {
                    currentPickable = gameobject;
                    gameobject.ActivateOutLine();
                }
                else
                {
                    if (currentPickable != null)
                    {
                        currentPickable.DeactivateOutLine();
                        currentPickable = null;
                    }
                }
            }

        }
        else
        {
            if (currentPickable != null)
            {
                currentPickable.DeactivateOutLine();
                currentPickable = null;
            }
        };
    }
    public void Interact()
    {
        playerInteracted.Invoke();
        RaycastHit hit;
        Debug.DrawLine(headPos.position, headPos.TransformDirection(Vector3.forward) * Mathf.Infinity, Color.red);
        int layerMask = 1 << 8;

        if (Physics.Raycast(headPos.position, headPos.TransformDirection(Vector3.forward), out hit, 1.5f, layerMask))
        {
            Debug.DrawRay(headPos.position, headPos.TransformDirection(Vector3.forward) * hit.distance, Color.red);

            //float distance = Vector3.Distance(transform.position, hit.collider.transform.position);
            //if (distance <= 1.5f)
            //{
                    if (hit.transform.TryGetComponent(out IInteractable gameobject))
                    {
                        gameobject.Interact();
                    };
            //}
        }
    }
}
