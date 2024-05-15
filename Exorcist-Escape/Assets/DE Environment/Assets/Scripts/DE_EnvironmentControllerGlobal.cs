/*
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

using DEControllerGUIProperty;
using System;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode, AddComponentMenu("DE Controller Global")]

public class DEController : MonoBehaviour
{

    public WindZone windZone;
    public bool SynchWindZone = false;
    public bool SynchTheVegetationEngine = false;
    public bool SynchMicrosplat = false;
    public float WindStrength = 0.01f;
    public float WindDirection = 0f;
    public int FadeWindDistanceMode = 0;
    public float FadeWindDistanceBias = 0;
    public float WindPulse = 10f;
    public float WindTurbulence = 0.01f;
    public float WindRandomness = 0;

    public bool BillboardWindEnabled = false;
    public float BillboardWindIntensity = 0;

    public bool FabricWindEnabled = false;
    public float FabricWindIntensity = 0;

    public bool SnowEnabled = false;
    public float SnowIntensityTopDown = 1;
    public float SnowIntensityBottomUp = 1;

    public bool SnowTerrainEnabled = false;
    public float SnowTerrainIntensity = 1;

    public bool RainEnabled = false;
    public float RainIntensity = 1;

    public bool WetnessEnabled = false;
    public float WetnessIntensity = 0;

    public bool WetnessTerrainEnabled = false;
    public float WetnessTerrainIntensity = 0;

    public bool EmissionEnabled = false;
    public float EmissionIntensity = 1;

    public bool WindWaterEnabled = false;
    public float WindWaterIntensity = 0;

    [HideInInspector] public List<bool> foldouts;
    [HideInInspector] public List<Action> actions;
    [HideInInspector] public List<GUIContent> guiContent;

    private float windStrength, windDirection, windPulse, windTurbulence;
    private readonly string _WindStrength = "_GlobalWindIntensity", _WindFadeDistanceMode = "_GlobalWindFadeEnabled", _WindFadeDistanceBias = "_GlobalWindFadeBias", _WindDirection = "_GlobalWindDirection", _WindPulse = "_GlobalWindPulse", _WindTurbulence = "_GlobalWindTurbulence", _RandomWind = "_GlobalWindRandomOffset";
    private readonly string _BillboardWindEnabled = "_GlobalWindBillboardEnabled", _BillboardWindIntensity = "_GlobalWindBillboardIntensity";
    private readonly string _FabricWindEnabled = "_GlobalWindFabricEnabled", _FabricWindIntensity = "_GlobalWindFabricIntensity";
    private readonly string _SnowEnabled = "_GlobalSnowEnabled", _SnowIntensityTopDown = "_GlobalSnowIntensityTopDown", _SnowIntensityBottomUp = "_GlobalSnowIntensityBottomUp";
    private readonly string _SnowTerrainEnabled = "_GlobalSnowTerrainEnabled", _SnowTerrainIntensity = "_GlobalSnowTerrainIntensity";
    private readonly string _WetnessEnabled = "_GlobalWetnessEnabled", _WetnessIntensity = "_GlobalWetnessIntensity";
    private readonly string _WetnessTerrainEnabled = "_GlobalWetnessTerrainEnabled", _WetnessTerrainIntensity = "_GlobalWetnessTerrainIntensity";
    private readonly string _EmissionEnabled = "_GlobalEmissionEnabled", _EmissionIntensity = "_GlobalEmissionIntensity";
    private readonly string _RainEnabled = "_GlobalRainEnabled", _RainIntensity = "_GlobalRainIntensity";
    private readonly string _WindWaterEnabled = "_GlobalWindWaterEnabled", _WindWaterIntensity = "_GlobalWindWaterIntensity";


    private void OnDisable()
    {
        ResetShaders();
    }
    private void OnDestroy()
    {
        ResetShaders();
    }
    private void OnEnable()
    {
        SetShaders();
    }
    private void Update()
    {
        SetUpdateValues();
    }
    private void Reset()
    {
        WindStrength = 5f;
        FadeWindDistanceMode = 0;
        FadeWindDistanceBias = 0f;
        WindRandomness = 0.2f;
        WindPulse = 0.5f;
        WindTurbulence = 1f;
        WindDirection = 0;

        BillboardWindEnabled = true;
        BillboardWindIntensity = 0.5f;

        FabricWindEnabled = false;
        FabricWindIntensity = 1f;

        SnowEnabled = false;
        SnowIntensityTopDown = 1;
        SnowIntensityBottomUp = 1;

        SnowTerrainEnabled = false;
        SnowTerrainIntensity = 1;

        WetnessEnabled = false;
        WetnessIntensity = 1f;

        WetnessTerrainEnabled = false;
        WetnessTerrainIntensity = 1f;

        EmissionEnabled = false;
        EmissionIntensity = 0.1f;

        RainEnabled = false;
        RainIntensity = 1;

        WindWaterEnabled = false;
        WindWaterIntensity = 0;

        SetShaders();
    }


    public void SetUpdateValues()
    {
        GetDefaultValues();
        GetWindZoneValues();
    }

    private void GetDefaultValues()
    {
        if (!SynchWindZone && (windStrength != _WindStrength.GetGlobalFloat() || transform.rotation.eulerAngles.y != _WindDirection.GetGlobalFloat() || windPulse != _WindPulse.GetGlobalFloat() || windTurbulence != _WindTurbulence.GetGlobalFloat() || windDirection != _WindDirection.GetGlobalFloat()))
        {
            SetShaders();
            windStrength = _WindStrength.GetGlobalFloat();
            windDirection = _WindDirection.GetGlobalFloat();
            windPulse = _WindPulse.GetGlobalFloat();
            windTurbulence = _WindTurbulence.GetGlobalFloat();
        }
    }

    private void GetWindZoneValues()
    {
        if (windZone && SynchWindZone && (windZone.windMain != WindStrength || windZone.windPulseFrequency != WindPulse || windZone.windTurbulence != windTurbulence))
        {
            WindStrength = windZone.windMain;
            WindPulse = windZone.windPulseFrequency;
            WindTurbulence = windZone.windTurbulence;
            SetShaders();
        }
    }

    public void SetShaders()
    {
        _WindStrength.SetGlobalFloat(WindStrength);
        _WindFadeDistanceMode.SetGlobalInt(FadeWindDistanceMode);
        _WindFadeDistanceBias.SetGlobalFloat(FadeWindDistanceBias);
        _WindDirection.SetGlobalFloat(transform.rotation.eulerAngles.y);
        _WindPulse.SetGlobalFloat(WindPulse);
        _WindTurbulence.SetGlobalFloat(WindTurbulence);
        _RandomWind.SetGlobalFloat(WindRandomness);

        if (BillboardWindEnabled)
        {
            _BillboardWindEnabled.SetGlobalInt(1);
            _BillboardWindIntensity.SetGlobalFloat(BillboardWindIntensity);
        }
        else
            _BillboardWindEnabled.SetGlobalInt(0);

        if (FabricWindEnabled)
        {
            _FabricWindEnabled.SetGlobalInt(1);
            _FabricWindIntensity.SetGlobalFloat(FabricWindIntensity);
        }
        else
            _FabricWindEnabled.SetGlobalInt(0);

        if (SnowEnabled)
        {
            _SnowEnabled.SetGlobalInt(1);
            _SnowIntensityTopDown.SetGlobalFloat(SnowIntensityTopDown);
            _SnowIntensityBottomUp.SetGlobalFloat(SnowIntensityBottomUp);
        }
        else
            _SnowEnabled.SetGlobalInt(0);

        if (SnowTerrainEnabled)
        {
            _SnowTerrainEnabled.SetGlobalInt(1);
            _SnowTerrainIntensity.SetGlobalFloat(SnowTerrainIntensity);
        }
        else
            _SnowTerrainEnabled.SetGlobalInt(0);

        if (RainEnabled)
        {
            _RainEnabled.SetGlobalInt(1);
            _RainIntensity.SetGlobalFloat(RainIntensity);
        }
        else
            _RainEnabled.SetGlobalInt(0);

        if (WetnessEnabled)
        {
            _WetnessEnabled.SetGlobalInt(1);
            _WetnessIntensity.SetGlobalFloat(WetnessIntensity);
        }
        else
            _WetnessEnabled.SetGlobalInt(0);

        if (WetnessTerrainEnabled)
        {
            _WetnessTerrainEnabled.SetGlobalInt(1);
            _WetnessTerrainIntensity.SetGlobalFloat(WetnessTerrainIntensity);
        }
        else
            _WetnessTerrainEnabled.SetGlobalInt(0);

        if (EmissionEnabled)
        {
            _EmissionEnabled.SetGlobalInt(1);
            _EmissionIntensity.SetGlobalFloat(EmissionIntensity);
        }
        else
            _EmissionEnabled.SetGlobalInt(0);

        if (WindWaterEnabled)
        {
            _WindWaterEnabled.SetGlobalInt(1);
            _WindWaterIntensity.SetGlobalFloat(WindWaterIntensity);
        }
        else
            _WindWaterEnabled.SetGlobalInt(0);
    }

    private void ResetShaders()
    {
        _WindStrength.SetGlobalFloat(0);
        _WindFadeDistanceMode.SetGlobalInt(0);
        _WindFadeDistanceBias.SetGlobalFloat(0);
        _WindPulse.SetGlobalFloat(0);
        _WindTurbulence.SetGlobalFloat(0);

        _RandomWind.SetGlobalFloat(0);

        _BillboardWindEnabled.SetGlobalInt(0);
        _BillboardWindIntensity.SetGlobalFloat(0);

        _FabricWindEnabled.SetGlobalFloat(0);
        _SnowEnabled.SetGlobalFloat(0);
        _SnowTerrainEnabled.SetGlobalFloat(0);
        _WetnessEnabled.SetGlobalFloat(0);
        _WetnessIntensity.SetGlobalFloat(0);
        _EmissionEnabled.SetGlobalInt(0);
        _EmissionIntensity.SetGlobalFloat(0);
        _RainEnabled.SetGlobalFloat(0);
        _RainIntensity.SetGlobalFloat(0);
        _WindWaterIntensity.SetGlobalFloat(0);
    }

}


