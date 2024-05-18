using UnityEngine;

public class VisionAngle : MonoBehaviour
{
    public Camera camaraJugador; 
    public LayerMask capaEnemigo;
    public Llorona llorona;
    private void Update()
    {
        Debug.Log("Updating");
        Ray rayo = camaraJugador.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        RaycastHit hit;
        if (Physics.Raycast(rayo, out hit, Mathf.Infinity, capaEnemigo))
        {
            if (hit.collider.TryGetComponent(out Llorona llorona))
            {
                if (llorona != null)
                {
                    llorona.SetQuedarseQuieto(true);
                }
            }
   
        }
        else
        {
            if (llorona!= null)
            {
                this.llorona.SetQuedarseQuieto(false);
            }
          
        }
    }
}