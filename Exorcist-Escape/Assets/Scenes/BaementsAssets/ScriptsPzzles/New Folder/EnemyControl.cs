using UnityEngine;

public class ComportamientoEnemigo : MonoBehaviour
{
    public Transform jugador; 
    public float velocidadPersecucion = 5f; 
    public float distanciaPersecucion = 10f; 
    private bool quedarseQuieto = false;

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
                transform.Translate(Vector3.forward * velocidadPersecucion * Time.deltaTime);
            }
        }
    }
    public void SetQuedarseQuieto(bool estado)
    {
        quedarseQuieto = estado;
    }
}