using UnityEngine;
using UnityEngine.AI;

public class Llorona : MonoBehaviour
{
    public Transform jugador; 
    public float velocidadPersecucion = 5f; 
    public float distanciaPersecucion = 10f; 
    private bool quedarseQuieto = false;
    private Animator lloronaAnimator;

    [SerializeField] private NavMeshAgent agent;
    private void Awake()
    {
        lloronaAnimator = GetComponent<Animator>();
        agent = GetComponent<NavMeshAgent>();
    }

    void Update()
    {
        if (!quedarseQuieto)
        {  
            float distanciaAlJugador = Vector3.Distance(transform.position, jugador.position);
            if (distanciaAlJugador < distanciaPersecucion)
            {  
                Vector3 direccionPersecucion = jugador.position - transform.position;
                direccionPersecucion.y = 0f; 
                transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(direccionPersecucion), 0.1f);
                agent.destination = jugador.position;
                //transform.Translate(Time.deltaTime * velocidadPersecucion * Vector3.forward);
            }
        }
    }
    public void SetQuedarseQuieto(bool estado)
    {
        if (estado)
        {
            agent.isStopped = true;
            lloronaAnimator.SetBool("IsWalking", false);
        }
        else
        {
            lloronaAnimator.SetBool("IsWalking", true);
        }

        quedarseQuieto = estado;
    }
}