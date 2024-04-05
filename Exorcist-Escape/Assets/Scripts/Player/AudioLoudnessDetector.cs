using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioLoudnessDetector : MonoBehaviour
{
    public int sampleWindow = 64;

    private AudioClip microphoneClip;

    private void Start()
    {
        MicrophoneToAudioClip(0);
    }
    private void MicrophoneToAudioClip(int microphoneIndex)
    {
        foreach (var name in Microphone.devices)
        {
            Debug.Log(name);
        }

        //string microphoneName = Microphone.devices[1];
        Debug.Log("No hay na");
    }
    public float GetLoudnessFromAudioClip(int clipPosition, AudioClip clip)
    {
        int startPosition = clipPosition - sampleWindow;

        if (startPosition < 0) return 0;

        float[] waveData = new float[sampleWindow];
        clip.GetData(waveData, startPosition);

        float totalLoudness = 0;

        foreach (var sample in waveData) {

            totalLoudness += Mathf.Abs(sample);
        }

        return totalLoudness / sampleWindow;

    }
}
