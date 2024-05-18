using UnityEngine;
using UnityEngine.AI;

public class Llorona : MonoBehaviour
{
    private Transform jugador; 
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
        jugador = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        GameObject.FindGameObjectWithTag("Player").GetComponent<VisionAngle>().llorona = this;
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
        Debug.Log(agent.isStopped);
        if (isDeactivated) return;

        if (!quedarseQuieto)
        {  
            if (agent != null)
            {
                agent.destination = jugador.position;
            }
        }
    }
    public void SetStopLlorona()
    {
        lloronaAnimator.enabled = true;
        lloronaAnimator.SetBool("IsWalking", true);
        quedarseQuieto = false;
        agent.destination = jugador.position;
        agent.isStopped = false;
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