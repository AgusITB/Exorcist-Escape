using UnityEngine;
using UnityEngine.UI;

public class FillFromMicrophone : MonoBehaviour
{
    public Image audioBar;
    public Slider sensitivitySlider;

    public AudioLoudnessDetector detector;

    [SerializeField] private float minimumSensibility = 100;
    [SerializeField] private float maximumSensibility = 1000;

    [SerializeField] private float currentLoudnessSensibility = 500;
    [SerializeField] private float threshold = 0.1f;

    private void Start()
    {
        if (sensitivitySlider == null) return;
        sensitivitySlider.value = .5f;
        SetLoudnessSensibility(sensitivitySlider.value);
    }

    private void Update()
    {
        float loudness = detector.GetLoudnessFromMicrohpone() * currentLoudnessSensibility;
        if (loudness < threshold) loudness = 0.01f;
        audioBar.fillAmount = loudness; 

    }
    public void SetLoudnessSensibility(float t)
    {
        currentLoudnessSensibility = Mathf.Lerp(minimumSensibility,maximumSensibility,t);
    }
}
