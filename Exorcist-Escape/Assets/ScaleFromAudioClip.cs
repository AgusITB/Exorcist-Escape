using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class ScaleFromAudioClip : MonoBehaviour
{
    public AudioSource source;
    public Vector3 minScale, maxScale;
    public AudioLoudnessDetector detector;

    public float loudnessSensibility = 100f;
    public float threshold = 0.1f;
    


    private void Update()
    {
        float loudness = detector.GetLoudnessFromAudioClip(source.timeSamples, source.clip) * loudnessSensibility;
        Debug.Log(loudness);
        if (loudness < threshold) loudness = 0f;

        transform.localScale = Vector3.Lerp(minScale,maxScale, loudness);   
    
    
    }
}
