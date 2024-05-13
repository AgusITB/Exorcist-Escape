using UnityEngine;

public class LightTrigger : MonoBehaviour
{
    [SerializeField] private GameObject turnOnLight;
    [SerializeField] private GameObject turnOffLight;
    [SerializeField] private AudioClip clip;   
    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out PlayerController controller))
        {

            turnOnLight.SetActive(true);

            if (turnOffLight != null)
            {
                turnOffLight.SetActive(false);
            }
            AudioSource.PlayClipAtPoint(clip, this.transform.position);
            this.gameObject.SetActive(false);
          
        }
    }
}
