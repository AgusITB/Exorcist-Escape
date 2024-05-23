using System.Collections;
using UnityEngine;
using UnityEngine.Video;
using System;

public class SustoScreamer : MonoBehaviour
{
    private void OnTriggerEnter(Collider collision)
    {
        if (collision.TryGetComponent(out PlayerController player))
        {
            player.enabled = false;
            StartCoroutine(waitTillVideoEnd(player));
        }
  
      
    }
    IEnumerator waitTillVideoEnd(PlayerController player)
    {
        VideoPlayer vp = player.playerHUD.GetComponentInChildren<VideoPlayer>();
        vp.gameObject.SetActive(true);
        vp.Play();
        yield return new WaitForSeconds(Convert.ToSingle(vp.clip.length));
        player.enabled = true;
        this.gameObject.SetActive(false);
        player.playerHUD.GetComponentInChildren<VideoPlayer>().gameObject.SetActive(false);
    }
}
