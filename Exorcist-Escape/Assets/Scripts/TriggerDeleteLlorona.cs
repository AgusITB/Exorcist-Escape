using System;
using System.Collections;
using UnityEngine;

public class TriggerDeleteLLorona : MonoBehaviour
{
    [SerializeField] private Llorona llorona;

    [SerializeField] private LloronaMaterials[] lloronaMaterials;

    [Serializable]
    public class LloronaMaterials
    {
        public string name;
        public Material shader;
        public SkinnedMeshRenderer lloronaRenderer;
    }
    private void DissolveLlorona()
    {
        GameObject.FindGameObjectWithTag("Player").GetComponent<VisionAngle>().enabled = false;
        
        llorona.SetStopLlorona();
        foreach (LloronaMaterials lloronaMaterial in lloronaMaterials)
        {
            lloronaMaterial.lloronaRenderer.material = lloronaMaterial.shader;  
        }

    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            DissolveLlorona();
            StartCoroutine(WaitToDestroy());
        }
    }

    private IEnumerator WaitToDestroy()
    {
        yield return new WaitForSeconds(2.3f);
        Destroy(this.gameObject);
        llorona.StopAndDeactivate();
    }

}
