using UnityEngine;
using UnityEngine.SceneManagement;


public class BasementDoor : NonPickableObject
{
    public override void Interact()
    {
        Debug.Log("Go to the basement");
        SceneManager.LoadScene("David");
    }
}
