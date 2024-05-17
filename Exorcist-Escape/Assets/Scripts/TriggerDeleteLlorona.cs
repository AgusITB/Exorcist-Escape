using UnityEngine;

public class TriggerDeleteLLorona : MonoBehaviour
{
    [SerializeField] private Llorona llorona;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            llorona.StopAndDeactivate();
        }
    }

}
