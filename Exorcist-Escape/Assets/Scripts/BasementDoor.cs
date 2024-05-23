public class BasementDoor : NonPickableObject
{
    bool interacted = false;
    private void Awake()
    {
        DontDestroyOnLoad(this);
    }
    public override void Interact()

    {
        if (interacted) return;
        StartCoroutine(DataController.instance.LoadSceneWithoutDestroyingSpawnPoint("FinalHouse"));
        interacted = true;
    }
}
