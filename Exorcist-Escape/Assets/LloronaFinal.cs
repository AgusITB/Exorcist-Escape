using System.Collections;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.SceneManagement;

public class LloronaFinal : PickableObject
{
    [SerializeField] private Transform target;
    public float velocidadPersecucion = 5f;
    public float distanciaPersecucion = 10f;
    private Animator lloronaAnimator;

    [SerializeField] private NavMeshAgent agent;

    public AudioLoudnessDetector detector;

    [SerializeField] private float currentLoudnessSensibility = 500;
    [SerializeField] private float threshold = 0.1f;

    [SerializeField] private GameObject baby;

    [SerializeField] private GameObject babyPosition;

    private bool alreadyInteracted = false;
    protected override void Awake()
    {
        base.Awake();
        lloronaAnimator = GetComponent<Animator>();
        agent = GetComponent<NavMeshAgent>();

    }
    private void Start()
    {
        agent.destination = target.position; /*GameObject.FindGameObjectWithTag("Player").transform.position;*/
    }
    public void StopAndDeactivate()
    {
        if (agent != null)
        {
            agent.isStopped = true;
            agent.ResetPath();
        }
        gameObject.SetActive(false);
    }
    void Update()
    {
        if (!agent.pathPending)
        {
            if (agent.enabled == true)
            {
                if (agent.remainingDistance <= agent.stoppingDistance)
                {
                    if (!agent.hasPath || agent.velocity.sqrMagnitude == 0f)
                    {

                        lloronaAnimator.SetBool("IsWalking", false);
                        agent.enabled = false;
                    }
                }
                else
                {
                    if (detector.enabled == true)
                    {
                        if (agent != null)
                        {
                            float loudness = detector.GetLoudnessFromMicrohpone() * currentLoudnessSensibility;
                            if (loudness < threshold) loudness = 0.01f;


                            if (loudness > 1f)
                            {
                                agent.isStopped = false;
                                lloronaAnimator.SetBool("IsWalking", true);
                            }
                            else
                            {
                                agent.isStopped = true;
                                lloronaAnimator.SetBool("IsWalking", false);
                            }

                        }
                    }
                    else
                    {
                        lloronaAnimator.SetBool("IsWalking", true);
                    }
                }

            }
        }


    }
    public override void Interact()
    {
        if (!alreadyInteracted)
        {
            Collect();
            alreadyInteracted = true;
            StartCoroutine(LoadSceneWait());
        }
    }
    private IEnumerator LoadSceneWait()
    {
        yield return new WaitForSeconds(1.5f);
        SceneManager.LoadScene("Creditos");
        GameObject.FindGameObjectWithTag("Player").SetActive(false);
    }
    protected override void Collect()
    {

        GameObject baby = Instantiate(this.baby, babyPosition.transform.position, this.transform.rotation);
        baby.transform.localScale = new Vector3(35, 35, 35);
        baby.transform.SetParent(this.transform);
    }
}