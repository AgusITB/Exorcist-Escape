
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


        SpotLight.SetActive(true);
        yield return new WaitForSeconds(0.5f);
        SpotLight.SetActive(false);
        yield return new WaitForSeconds(0.1f);
        SpotLight.SetActive(true);
        yield return new WaitForSeconds(0.1f);
        SpotLight.SetActive(false);
        yield return new WaitForSeconds(0.4f);
        SpotLight.SetActive(true);
        yield return new WaitForSeconds(0.3f);
        SpotLight.SetActive(false);
        yield return new WaitForSeconds(0.1f);
        SpotLight.SetActive(true);
        yield return new WaitForSeconds(2f);

        SpotLight.SetActive(false);
        Llorona.SetActive(false);

        yield return new WaitForSeconds(1f);
        controller.enabled = true;
        SpotLight.SetActive(true);
    }

}
