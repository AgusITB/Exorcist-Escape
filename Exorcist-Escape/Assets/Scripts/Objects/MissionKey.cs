using System;
using UnityEngine;

public class MissionKey : Key
{
    //public Action<Key> missionKeyCollected;

    public GameObject UIIcon;

    protected override void Collect()
    {
        AudioSource.PlayClipAtPoint(openClip, this.transform.position);

        //missionKeyCollected.Invoke(this);
        ChangeUIOpacity();


        Destroy(this.gameObject);
    }
    private void ChangeUIOpacity()
    {//

    }


}
