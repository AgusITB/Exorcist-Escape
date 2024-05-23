using UnityEngine;
using UnityEngine.AI;

public class TriggerScript : MonoBehaviour
{
    public GameObject objeto1;
    public GameObject objeto2; // Asigna el segundo objeto desde el editor

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {

            if (objeto1 != null)
            {
                NavMeshAgent navMeshAgent = objeto1.GetComponent<NavMeshAgent>();
                objeto1.GetComponent<Llorona>().enabled = true;
                if (navMeshAgent != null)
                    navMeshAgent.enabled = true;

                Animator animator = objeto1.GetComponent<Animator>();
                if (animator != null)
                    animator.enabled = true;
            }

            Door doorScript = objeto2.GetComponent<Door>();

            if (doorScript != null)
            {
                doorScript.Interact();
                doorScript.LockDoor();
            }
        }
    }
}
