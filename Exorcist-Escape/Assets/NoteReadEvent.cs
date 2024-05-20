using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NoteReadEvent : MonoBehaviour
{
    public static Action playerReadedTheNote;
    [SerializeField] private ReadableNote note;

    private void Start()
    {
        note.NoteReaded += playerReadedTheNote.Invoke;
    }

}
