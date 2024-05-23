using UnityEngine;
using UnityEngine.Video;

public class WhenFInishd : MonoBehaviour
{
    public VideoPlayer videoPlayer;
    public string sceneName;

    void Start()
    {

        if (videoPlayer == null)
        {
            videoPlayer = GetComponent<VideoPlayer>();
        }

        videoPlayer.loopPointReached += OnVideoEnd;
    }

    void OnVideoEnd(VideoPlayer vp)
    {
        StartCoroutine(DataController.instance.LoadSceneWithoutDestroyingSpawnPoint("HouseOutside"));
    }

    private void Update()
    {
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            StartCoroutine(DataController.instance.LoadSceneWithoutDestroyingSpawnPoint("HouseOutside"));
        }
    }
}
