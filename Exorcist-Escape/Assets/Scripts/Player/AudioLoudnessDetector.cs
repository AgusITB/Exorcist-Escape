using UnityEngine;

public class AudioLoudnessDetector : MonoBehaviour
{
    public int sampleWindow = 64;

    private AudioClip microphoneClip;
    private string microphoneName;

    private void Start()
    {
        MicrophoneToAudioClip(0);
    }
    private void MicrophoneToAudioClip(int microphoneIndex)
    {
        if (Microphone.devices.Length > 0)
        {
            Debug.Log(Microphone.devices.Length);
            foreach (var device in Microphone.devices)
            {

                Debug.Log(device);
            }

            Debug.Log("Used device:" + Microphone.devices[microphoneIndex]);



            microphoneClip = Microphone.Start(Microphone.devices[microphoneIndex], true, 20, AudioSettings.outputSampleRate);
            Debug.Log(microphoneClip);
        }
        if (Microphone.devices.Length == 0)
        {
            Debug.Log("DetectorDisabled");
            enabled = false;
        }
    }

    public float GetLoudnessFromMicrohpone()
    {
        return GetLoudnessFromAudioClip(Microphone.GetPosition(microphoneName), microphoneClip);
    }

    public float GetLoudnessFromAudioClip(int clipPosition, AudioClip clip)
    {
        int startPosition = clipPosition - sampleWindow;

        if (startPosition < 0) return 0;

        float[] waveData = new float[sampleWindow];
        clip.GetData(waveData, startPosition);

        float totalLoudness = 0;

        foreach (var sample in waveData)
        {

            totalLoudness += Mathf.Abs(sample);
        }

        return totalLoudness / sampleWindow;

    }
}
