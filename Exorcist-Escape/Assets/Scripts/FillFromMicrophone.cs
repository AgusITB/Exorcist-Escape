using UnityEngine;


public class FillFromMicrophone : MonoBehaviour
{

    public AudioLoudnessDetector detector;

    [SerializeField] private float minimumSensibility = 100;
    [SerializeField] private float maximumSensibility = 1000;

    [SerializeField] private float currentLoudnessSensibility = 500;
    [SerializeField] private float threshold = 0.1f;

    private void Update()
    {
        float loudness = detector.GetLoudnessFromMicrohpone() * currentLoudnessSensibility;
        if (loudness < threshold) loudness = 0.01f;
        Debug.Log(loudness);

    }
    public void SetLoudnessSensibility(float t)
    {
        currentLoudnessSensibility = Mathf.Lerp(minimumSensibility,maximumSensibility,t);
    }
}
