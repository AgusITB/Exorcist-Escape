using Cinemachine;
using UnityEngine;

public class CameraBobbing : MonoBehaviour
{
    [SerializeField] private CinemachineImpulseSource m_Source;

    public void Shake()
    {
       m_Source.GenerateImpulse();  
    }
}
