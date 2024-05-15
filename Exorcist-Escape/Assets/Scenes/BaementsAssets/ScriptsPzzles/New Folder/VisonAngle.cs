using UnityEngine;

public class VisionAngle : MonoBehaviour
{
    public Camera camaraJugador; 
    public LayerMask capaEnemigo;
    [SerializeField] private Llorona llorona;
    private void Update()
    {
        Ray rayo = camaraJugador.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        RaycastHit hit;
        if (Physics.Raycast(rayo, out hit, Mathf.Infinity, capaEnemigo))
        {
            if (hit.collider.TryGetComponent(out Llorona llorona))
            {
                Debug.Log("Lloronahit");
                if (llorona != null)
                {
                    llorona.SetQuedarseQuieto(true);
                }
            }
   
        }
        else
        {
            Debug.Log("Nada");
            if (llorona!= null)
            {
                this.llorona.SetQuedarseQuieto(false);
            }
          
        }
    }
}