using UnityEngine;

public class PlayerTPToSpawnPoint : MonoBehaviour
{
    [SerializeField] private Transform spawnPoint;
    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out PlayerController player))
        {
            player.transform.position = spawnPoint.position;
        }
    }
}
