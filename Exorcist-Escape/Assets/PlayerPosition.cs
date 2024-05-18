using System.Collections;
using UnityEngine;

public class PlayerPosition : MonoBehaviour
{
    // Start is called before the first frame update
    private IEnumerator Start()
    {
        yield return new WaitForSeconds(0.1f);
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        player.transform.position = this.transform.position;
        player.transform.localPosition = this.transform.position;
        DataController.instance.ActivatePlayerCamera();
    }
}
