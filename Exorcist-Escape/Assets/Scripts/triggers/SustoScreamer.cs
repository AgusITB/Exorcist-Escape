using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using System;

public class SustoScreamer : MonoBehaviour
{
    public GameObject video;

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.TryGetComponent(out PlayerController player))
        {
            video.SetActive(true);
            player.enabled = false;
            StartCoroutine(waitTillVideoEnd(player));
        }
  
      
    }
    IEnumerator waitTillVideoEnd(PlayerController player)
    {
        yield return new WaitForSeconds(Convert.ToSingle(video.GetComponent<VideoPlayer>().clip.length));
        video.SetActive(false);
        player.enabled = true;
        this.gameObject.SetActive(false);
    }
}
