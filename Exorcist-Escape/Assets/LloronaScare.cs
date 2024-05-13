
using System.Collections;
using UnityEngine;
using UnityEngine.InputSystem.XR;

public class LloronaScare : MonoBehaviour
{
    [SerializeField] private GameObject Llorona;
    [SerializeField] private GameObject Frame;
    [SerializeField] private GameObject SpotLight;
    [SerializeField] private AudioClip lloronaScream;

    private void OnTriggerEnter(Collider other)
    {
        if (other.TryGetComponent(out PlayerController controller))
        {

            StartCoroutine(FirstScreamer(controller));
        }
    }

    private IEnumerator FirstScreamer(PlayerController controller)
    {
        controller.enabled = false;
        SpotLight.SetActive(false);
        Frame.SetActive(false);
        Llorona.SetActive(true);
        yield return new WaitForSeconds(2f);
        SpotLight.SetActive(true);
        AudioSource.PlayClipAtPoint(lloronaScream, this.transform.position);

        yield return new WaitForSeconds(1f);

        // Toggle Lights fast
        for (float i = 0.1f; i < 0.5f; i += 0.1f)
        {
            SpotLight.SetActive(false);
            yield return new WaitForSeconds(i);
            SpotLight.SetActive(true);
        }
        SpotLight.SetActive(false);

        yield return new WaitForSeconds(2f);
        Llorona.SetActive(false);

        yield return new WaitForSeconds(1f);
        controller.enabled = true;
        SpotLight.SetActive(true);
    }

}
