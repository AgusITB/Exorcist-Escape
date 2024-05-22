using UnityEngine;

public class TriggerMusicaPiano : MonoBehaviour
{

    public GameObject piano;

    private AudioSource pianoAudioSource;

    void Start()
    {
        if (piano != null)
        {
            pianoAudioSource = piano.GetComponent<AudioSource>();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (pianoAudioSource != null)
            {
                pianoAudioSource.enabled = true;
                pianoAudioSource.Play();
                Destroy(gameObject, 1f);
            }
        }
    }
}