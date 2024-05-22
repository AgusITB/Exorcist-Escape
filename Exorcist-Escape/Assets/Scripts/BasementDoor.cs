public class BasementDoor : NonPickableObject
{
    private void Awake()
    {
        DontDestroyOnLoad(this);
    }
    public override void Interact()
    {
        StartCoroutine(DataController.instance.LoadSceneWithoutDestroyingSpawnPoint("FinalHouse"));
    }
}
