using UnityEngine;
using UnityEngine.AI;

public class Llorona : MonoBehaviour
{
    public Transform jugador; 
    public float velocidadPersecucion = 5f; 
    public float distanciaPersecucion = 10f; 
    private bool quedarseQuieto = false;
    private Animator lloronaAnimator;
    private bool isDeactivated = false;

    [SerializeField] private NavMeshAgent agent;
    private void Awake()
    {
        lloronaAnimator = GetComponent<Animator>();
        agent = GetComponent<NavMeshAgent>();
    }
    public void StopAndDeactivate()
    {
        if (agent != null)
        {
            agent.isStopped = true;
            agent.ResetPath(); 
        }
        isDeactivated = true;
        gameObject.SetActive(false);
    }
    void Update()
    {
        if (isDeactivated) return;

        if (!quedarseQuieto)
        {  
            if (agent != null)
            {
                agent.destination = jugador.position;
            }
        }
    }
    public void SetQuedarseQuieto(bool estado)
    {
        if (agent != null)
        {
            if (estado)
            {
                if (agent.isOnNavMesh)
                {
                    agent.isStopped = true;
                }
                lloronaAnimator.SetBool("IsWalking", false);
            }
            else
            {
                if (agent.isOnNavMesh)
                {
                    agent.isStopped = false;
                }
                lloronaAnimator.SetBool("IsWalking", true);
            }

            quedarseQuieto = estado;
        }

    }
}