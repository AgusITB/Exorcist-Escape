using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Oven : NonPickableObject
{
    Animator ovenAnimator;
    private void Awake()
    {
        ovenAnimator = GetComponent<Animator>();
    }
    public override void Interact()
    {
        ovenAnimator.SetTrigger("OpenOven");
    }

}
