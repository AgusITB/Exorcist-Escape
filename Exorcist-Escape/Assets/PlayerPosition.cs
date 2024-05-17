using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPosition : MonoBehaviour
{
    // Start is called before the first frame update
    IEnumerator Start()
    {
        yield return new WaitForSeconds(2f);
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        player.transform.position = this.transform.position;
        player.transform.localPosition = this.transform.position;
        DataController.instance.ActivatePlayerCamera("FinalHouse");
    }
}
