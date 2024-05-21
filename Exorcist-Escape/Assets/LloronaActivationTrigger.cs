using UnityEngine;

public class LloronaActivationTrigger : MonoBehaviour
{
    [SerializeField] private Llorona llorona;

    [SerializeField] private Door door;



    private void OnTriggerEnter(Collider other)
    {
        if(other.TryGetComponent(out PlayerController playerController))
        {
            playerController.gameObject.GetComponent<DataController>().SavePlayerPosition();
            door.Interact();
            door.LockDoor();
            llorona.GetComponent<Animator>().enabled = true;
            llorona.enabled = true;
            this.gameObject.SetActive(false);
        }
    }

}
