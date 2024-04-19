using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VisonAngle : MonoBehaviour
{
    public GameObject objetivo;

    [Range(0, 180)]
    public int conoVisual;
    public int rangoVisual;
    public GameObject indicadorVisual;

    [Header("Read Only")]
    public bool estoyViendoAlObjetivo;
    public bool objetivoDentroDelRangoVisual;

    public void FuncionConoVisual()
    {
        Vector3 dirDeAaB = (objetivo.transform.position - transform.position).normalized;
        float prodPunto = Vector3.Dot(dirDeAaB, transform.forward);
        float anguloTransformado = (1 - (conoVisual * 0.005555f));
        if(anguloTransformado <= 0)
        {
            anguloTransformado = 0;
        }
        float distanciaAlObjetivo;
        distanciaAlObjetivo = Vector3.Distance(objetivo.transform.position, transform.position);
        if (distanciaAlObjetivo <= rangoVisual)
        {
            objetivoDentroDelRangoVisual = true;
        }
        else { objetivoDentroDelRangoVisual = false; }
        if(objetivoDentroDelRangoVisual && prodPunto > anguloTransformado)
        {
            estoyViendoAlObjetivo = true;
            indicadorVisual.SetActive(true);
        }
        else { estoyViendoAlObjetivo = false; indicadorVisual.SetActive(false); }
    }
   void Update()
    {
        FuncionConoVisual();
    }
}
