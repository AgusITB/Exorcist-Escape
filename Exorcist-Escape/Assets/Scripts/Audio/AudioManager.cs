using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;
    private AudioSource audioSource;
    [SerializeField] private AudioClip openClip;
    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        Instance = this;

    }
    private void OnTriggerEnter(Collider other)
    {
        if (audioSource != null)
        {
            if (other.CompareTag("Player"))
            {
                //audioSource.gameObject.SetActive(true);
                audioSource.clip = openClip;
                audioSource.Play();
                
            }
        }
    }
}
