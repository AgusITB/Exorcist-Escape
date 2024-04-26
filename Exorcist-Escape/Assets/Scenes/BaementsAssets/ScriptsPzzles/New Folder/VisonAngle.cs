using UnityEngine;

public class ControlEnemigoDesdeCamara : MonoBehaviour
{
    public Camera camaraJugador; 
    public LayerMask capaEnemigo;

    private void Update()
    {
        Ray rayo = camaraJugador.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        RaycastHit hit;
        if (Physics.Raycast(rayo, out hit, Mathf.Infinity, capaEnemigo))
        {
            ComportamientoEnemigo comportamientoEnemigo = hit.collider.GetComponent<ComportamientoEnemigo>();
            if (comportamientoEnemigo != null)
            {
                comportamientoEnemigo.SetQuedarseQuieto(true);
            }
        }
        else
        {
            ComportamientoEnemigo[] enemigos = FindObjectsOfType<ComportamientoEnemigo>();
            foreach (ComportamientoEnemigo enemigo in enemigos)
            {
                enemigo.SetQuedarseQuieto(false);
            }
        }
    }
}