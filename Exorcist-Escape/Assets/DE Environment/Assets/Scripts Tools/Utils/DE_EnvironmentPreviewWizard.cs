/*  
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch 
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

using UnityEngine;
[ExecuteInEditMode]
[AddComponentMenu("DE Environment/Preview Wizard")]
public class DE_EnvironmentPreviewWizard : MonoBehaviour
{
    [HideInInspector] public Material[] materials;
    public void OnDestroy()
    {
        LoadDefaultShaders();
    }
    public void LoadDefaultShaders()
    {
        var r = GetComponent<MeshRenderer>();
        if (r)
            r.sharedMaterials = materials;
    }
}