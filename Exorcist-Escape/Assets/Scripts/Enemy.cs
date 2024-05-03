using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private float speed;
    [SerializeField] private Animator animator;
    // Start is called before the first frame update

    private void Start()
    {
        animator = GetComponent<Animator>();
        animator.SetBool("IsWalking", true);
    }

    // Update is called once per frame
    void Update()
    {
        // Move our position a step closer to the target.
        var step = speed * Time.deltaTime; // calculate distance to move
        Vector3 targetPosition = target.position;
        targetPosition.y = 0;

        transform.position = Vector3.MoveTowards(transform.position, targetPosition, step);
        this.transform.LookAt(targetPosition);


    }
}
