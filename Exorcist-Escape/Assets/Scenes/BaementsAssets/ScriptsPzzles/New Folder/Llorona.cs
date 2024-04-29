using UnityEngine;

public class Llorona : MonoBehaviour
{
    public Transform jugador; 
    public float velocidadPersecucion = 5f; 
    public float distanciaPersecucion = 10f; 
    private bool quedarseQuieto = false;

    private Animator lloronaAnimator;

    private void Awake()
    {
        lloronaAnimator = GetComponent<Animator>();
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
                transform.Translate(Time.deltaTime * velocidadPersecucion * Vector3.forward);
            }
        }
    }
    public void SetQuedarseQuieto(bool estado)
    {
        if (estado)
        {
            lloronaAnimator.SetBool("IsWalking", false);
        }
        else
        {
            lloronaAnimator.SetBool("IsWalking", true);
        }

        quedarseQuieto = estado;
    }
}