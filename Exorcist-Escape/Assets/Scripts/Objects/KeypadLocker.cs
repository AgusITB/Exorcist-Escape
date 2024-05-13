using UnityEngine;


public class KeypadLocker : KeypadController
{
    [SerializeField] protected NonPickableObject leftDoor;

    protected override void Enter()
    {
        if (passwordText.text == password)
        {
            if (linkedObject == null)
                return;

            leftDoor.GetComponent<Door>().UnlockDoor();
            linkedObject.GetComponent<Door>().UnlockDoor();
            if (audioSource != null)
                audioSource.PlayOneShot(correctSound);

            passwordText.color = Color.green;
            StartCoroutine(waitAndClear());

        }
        else
        {
            if (audioSource != null)
                audioSource.PlayOneShot(wrongSound);

            passwordText.color = Color.red;
            StartCoroutine(waitAndClear());
        }
    }


}

