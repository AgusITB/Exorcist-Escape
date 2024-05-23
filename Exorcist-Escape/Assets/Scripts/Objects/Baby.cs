using Cinemachine;
using DG.Tweening;
using UnityEngine;

public class Baby : PickableObject
{
    private bool noteReaded;
    [SerializeField] private GameObject llorona;

    protected override void Awake()
    {
        base.Awake();
        NoteReadEvent.playerReadedTheNote += NoteReaded;
    }
    public override void Interact()
    {
        if (noteReaded)
        {
            if (pickUpClip != null)
            {
                AudioSource.PlayClipAtPoint(pickUpClip, this.transform.position);
            }

            onPickUp?.Invoke();
            Destroy(this.gameObject);

                PlayerController player = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerController>();
                llorona.SetActive(true);
                player.GetComponentInChildren<CinemachineInputProvider>().enabled = false;
                player.enabled = false;
                Camera.main.transform.rotation = Quaternion.identity;
                Camera.main.transform.GetComponent<CinemachineBrain>().enabled = false;
                player.transform.DORotate(new Vector3(0, -39.082f, 0), 0.5f).SetEase(Ease.Linear);
                this.gameObject.SetActive(false);
            
        }
        /**/
    }

    private void NoteReaded()
    {
        noteReaded = true;
    }
    protected override void Collect()
    {
        Interact();
    }
}
