using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;
    private AudioSource audioSource;
    [SerializeField] private AudioClip openClip;

    private bool alreadyPlayed = false;
    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        Instance = this;

    }
    private void OnTriggerEnter(Collider other)
    {
        if (audioSource != null)
        {
            if (other.CompareTag("Player") && !alreadyPlayed)
            {
                //audioSource.gameObject.SetActive(true);
                audioSource.clip = openClip;
                audioSource.Play();
                alreadyPlayed = true;
            }
        }
    }
}
