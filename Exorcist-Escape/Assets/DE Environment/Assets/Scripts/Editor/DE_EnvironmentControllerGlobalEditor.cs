/*
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

#if UNITY_EDITOR

using System.Collections.Generic;
using UnityEditor;
using UnityEngine;


[CustomEditor(typeof(DEController))]
[CanEditMultipleObjects]
public class DE_ControllerGlobalEditor : Editor
{

    private DEController controller;

    private static int currentToolBoxIndex = 0;

    private SerializedProperty windZone,
        SynchWindZone,
        SynchTheVegetationEngine,
        SynchMicrosplat,
        WindStrength,
        FadeWindDistanceMode,
        FadeWindDistanceBias,
        WindPulse,
        WindDirection,
        WindTurbulence,
        WindRandomness;

    private SerializedProperty BillboardWindEnabled, BillboardWindIntensity;
    private SerializedProperty FabricWindEnabled, FabricWindIntensity;
    private SerializedProperty SnowEnabled, SnowIntensityTopDown, SnowIntensityBottomUp;
    private SerializedProperty SnowTerrainEnabled, SnowTerrainIntensity;
    private SerializedProperty RainEnabled, RainIntensity;
    private SerializedProperty WetnessEnabled, WetnessIntensity;
    private SerializedProperty WetnessTerrainEnabled, WetnessTerrainIntensity;
    private SerializedProperty EmissionEnabled, EmissionIntensity;
    private SerializedProperty WindWaterEnabled, WindWaterIntensity;

    private SerializedProperty SavedTab;

    private string windZoneButtonContent;

    #region [Unity Actions]

    private void OnEnable()
    {
        controller = (target as DEController);

        windZone = serializedObject.FindProperty("windZone");

        SynchWindZone = serializedObject.FindProperty("SynchWindZone");
        SynchTheVegetationEngine = serializedObject.FindProperty("SynchTheVegetationEngine");
        SynchMicrosplat = serializedObject.FindProperty("SynchMicrosplat");

        WindStrength = serializedObject.FindProperty("WindStrength");
        FadeWindDistanceMode = serializedObject.FindProperty("FadeWindDistanceMode");
        FadeWindDistanceBias = serializedObject.FindProperty("FadeWindDistanceBias");
        WindPulse = serializedObject.FindProperty("WindPulse");
        WindTurbulence = serializedObject.FindProperty("WindTurbulence");
        WindRandomness = serializedObject.FindProperty("WindRandomness");
        WindDirection = serializedObject.FindProperty("WindDirection");

        BillboardWindEnabled = serializedObject.FindProperty("BillboardWindEnabled");
        BillboardWindIntensity = serializedObject.FindProperty("BillboardWindIntensity");

        FabricWindEnabled = serializedObject.FindProperty("FabricWindEnabled");
        FabricWindIntensity = serializedObject.FindProperty("FabricWindIntensity");

        SnowEnabled = serializedObject.FindProperty("SnowEnabled");
        SnowIntensityTopDown = serializedObject.FindProperty("SnowIntensityTopDown");
        SnowIntensityBottomUp = serializedObject.FindProperty("SnowIntensityBottomUp");

        SnowTerrainEnabled = serializedObject.FindProperty("SnowTerrainEnabled");
        SnowTerrainIntensity = serializedObject.FindProperty("SnowTerrainIntensity");

        WetnessEnabled = serializedObject.FindProperty("WetnessEnabled");
        WetnessIntensity = serializedObject.FindProperty("WetnessIntensity");

        WetnessTerrainEnabled = serializedObject.FindProperty("WetnessTerrainEnabled");
        WetnessTerrainIntensity = serializedObject.FindProperty("WetnessTerrainIntensity");

        EmissionEnabled = serializedObject.FindProperty("EmissionEnabled");
        EmissionIntensity = serializedObject.FindProperty("EmissionIntensity");

        RainEnabled = serializedObject.FindProperty("RainEnabled");
        RainIntensity = serializedObject.FindProperty("RainIntensity");

        WindWaterEnabled = serializedObject.FindProperty("WindWaterEnabled");
        WindWaterIntensity = serializedObject.FindProperty("WindWaterIntensity");

        controller.foldouts = new List<bool>()
        {
            true,
            false,
            false,
            false
        };
        controller.actions = new List<System.Action>()
        {
            WindGUI,
            SnowGUI,
            SnowTerrainGUI,
            WetnessGUI,
            WetnessTerrainGUI,
            EmissionGUI,
            WaterGUI
        };
        controller.guiContent = new List<GUIContent>()
        {
            new GUIContent("Wind", "Click here to open Wind settings"),
            new GUIContent("Snow", "Click here to open Snow settings"),
            new GUIContent("SnowTerrain", "Click here to open Snow Terrain settings"),
            new GUIContent("Wetness", "Click here to open Wetness settings"),
            new GUIContent("WetnessTerrain", "Click here to open WetnessTerrain settings"),
            new GUIContent("Emission", "Click here to open Emission settings"),
            new GUIContent("Water", "Click here to open Water settings")
        };
    }

    public override void OnInspectorGUI()
    {
        EditorGUI.BeginChangeCheck();

        GeneralGUI();
        /*      for (int i = 0; i < controller.foldouts.Count; i++)
              {
                  if (i != controller.foldouts.Count - 1)
                      controller.foldouts[i] = controller.foldouts[i].FoldoutField(controller.guiContent[i]);
                  else
                      controller.foldouts[i] =
                          controller.foldouts[i].FoldoutField(controller.guiContent[i], isLastInRow: true);
                  if (controller.foldouts[i])
                      controller.actions[i]();
              }
              */

        serializedObject.ApplyModifiedProperties();

        if (EditorGUI.EndChangeCheck())
            controller.SetShaders();
    }
    #endregion [Unity Actions]

    #region [GUI]
    private void GeneralGUI()
    {
        currentToolBoxIndex = GUILayout.Toolbar(
            currentToolBoxIndex,
            new string[] { "Wind", "Environmental", "Time of Day" }, null,
            GUI.ToolbarButtonSize.Fixed, GUILayout.Height(50));

        switch (currentToolBoxIndex)
        {
            case 0:
                EditorGUILayout.BeginVertical("Box");
                WindZoneGUI();
                EditorGUILayout.EndVertical();
                WindGUI();
                break;

            case 1:
                EditorGUILayout.BeginVertical("Box");
                SnowGUI();
                EditorGUILayout.EndVertical();
                EditorGUILayout.BeginVertical("Box");
                SnowTerrainGUI();
                EditorGUILayout.EndVertical();
                EditorGUILayout.BeginVertical("Box");
                RainGUI();
                EditorGUILayout.EndVertical();
                EditorGUILayout.BeginVertical("Box");
                WetnessGUI();
                EditorGUILayout.EndVertical();
                EditorGUILayout.BeginVertical("Box");
                WetnessTerrainGUI();
                EditorGUILayout.EndVertical();
                EditorGUILayout.BeginVertical("Box");
                EmissionGUI();
                EditorGUILayout.EndVertical();
                break;

            case 2:
                TimeOfDayGUI();
                break;

            default: break;
        }
    }

    private void TimeOfDayGUI()
    {
        EditorGUILayout.Space();
        GUIStyle s = new GUIStyle(GUI.skin.label);
        s.fontSize = 24;
        s.fontStyle = FontStyle.Bold;
        s.stretchWidth = true;
        s.alignment = TextAnchor.MiddleCenter;
        GUILayout.Box("Coming soon", s, GUILayout.Height(100), GUILayout.ExpandWidth(true));
    }

    private void WindGUI()
    {
        EditorGUILayout.BeginVertical("Box");
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Wind Setting", EditorStyles.boldLabel);
        EditorGUI.BeginDisabledGroup(controller.SynchWindZone && controller.windZone);
        WindStrength.PropertyField("Main", "wind main strength");
        WindTurbulence.PropertyField("Turbulence", "wind variation in wind direction");
        WindPulse.PropertyField("Pulse Frequency", "wind length & frequency of the wind pulses.y");
        EditorGUI.EndDisabledGroup();

        WindDirection.PropertyField("Direction", "wind zone transform rotation Y");
        WindRandomness.PropertyField("Random Offset", "wind randomness offset");
        EditorGUILayout.Space();
        EditorGUILayout.EndVertical();
        EditorGUILayout.BeginVertical("Box");
        BillboardWindGUI();
        EditorGUILayout.EndVertical();

        EditorGUILayout.BeginVertical("Box");
        FadeWindGUI();
        EditorGUILayout.EndVertical();

        EditorGUILayout.BeginVertical("Box");
        ClothEnabledGUI();
        EditorGUILayout.EndVertical();

        EditorGUILayout.BeginVertical("Box");
        WaterGUI();
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space();
    }
    private void WindZoneGUI()
    {
        EditorGUI.BeginDisabledGroup(!controller.windZone);
        SynchWindZone.PropertyField("Sync WindZone", "Synch <Global Controller> with Wind Zone");
        EditorGUI.EndDisabledGroup();
        windZone.PropertyField("Wind Zone", "Unity Wind Zone");
        if (!controller.windZone)
        {
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            if (controller.GetComponent<WindZone>())
                windZoneButtonContent = "Add attached Wind Zone";
            else
                windZoneButtonContent = "Add new Wind Zone";
            if (GUILayout.Button(windZoneButtonContent))
            {
                if (controller.GetComponent<WindZone>())
                    controller.windZone = controller.GetComponent<WindZone>();
                else
                    controller.windZone = controller.gameObject.AddComponent<WindZone>();
            }

            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();
        }
    }
    private void BillboardWindGUI()
    {
        EditorGUILayout.LabelField("Wind Billboard", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        BillboardWindEnabled.intValue = EditorGUILayout.IntPopup(BillboardWindEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.BillboardWindEnabled);
        BillboardWindIntensity.PropertyField("Main");
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void FadeWindGUI()
    {
        Rect vertical = EditorGUILayout.BeginVertical();

        EditorGUILayout.LabelField("Wind Fade", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        FadeWindDistanceMode.intValue = EditorGUILayout.IntPopup(FadeWindDistanceMode.intValue,
            new string[] { "Off", "Active Fade Out", "Active Fade In" }, new[] { 0, 1, 2 });

        EditorGUILayout.EndHorizontal();
        FadeWindDistanceBias.PropertyField("Fade Bias", "Higher values, fade will happen at a greater distance");
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space();
    }

    private void Callback(object userdata)
    {
        Debug.Log("Test");
    }
    private void ClothEnabledGUI()
    {
        EditorGUILayout.LabelField("Wind Fabric", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        FabricWindEnabled.intValue = EditorGUILayout.IntPopup(FabricWindEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();
        GUIStyle t = new GUIStyle();
        t.fixedWidth = Screen.width / 2;

        EditorGUI.BeginDisabledGroup(!controller.FabricWindEnabled);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Main", GUILayout.Width(Screen.width / 4));
        FabricWindIntensity.SliderField(0, 2, "");
        EditorGUILayout.EndHorizontal();
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void SnowGUI()
    {
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Snow", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        SnowEnabled.intValue = EditorGUILayout.IntPopup(SnowEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.SnowEnabled);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity Top Down", GUILayout.Width(Screen.width / 4));
        SnowIntensityTopDown.SliderField(0, 10, "Intensity Top Down", "");
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity Bottom Up", GUILayout.Width(Screen.width / 4));
        SnowIntensityBottomUp.SliderField(0, 10, "Intensity Bottom Up", "");
        EditorGUILayout.EndHorizontal();

        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void SnowTerrainGUI()
    {
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Snow Terrain", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        SnowTerrainEnabled.intValue = EditorGUILayout.IntPopup(SnowTerrainEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.SnowTerrainEnabled);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity", GUILayout.Width(Screen.width / 4));
        SnowTerrainIntensity.SliderField(0, 10, "Intensity", "");
        EditorGUILayout.EndHorizontal();

        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void RainGUI()
    {
        EditorGUILayout.LabelField("Rain", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        RainEnabled.intValue = EditorGUILayout.IntPopup(RainEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.RainEnabled);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity", GUILayout.Width(Screen.width / 4));
        RainIntensity.SliderField(0, 10, "Intensity", "");
        EditorGUILayout.EndHorizontal();

        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void WetnessGUI()
    {
        EditorGUILayout.LabelField("Wetness", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        WetnessEnabled.intValue = EditorGUILayout.IntPopup(WetnessEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.WetnessEnabled);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity", GUILayout.Width(Screen.width / 4));
        WetnessIntensity.SliderField(0, 1, "Intensity", "");
        EditorGUILayout.EndHorizontal();
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void WetnessTerrainGUI()
    {
        EditorGUILayout.LabelField("Wetness Terrain", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        WetnessTerrainEnabled.intValue = EditorGUILayout.IntPopup(WetnessTerrainEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.WetnessTerrainEnabled);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity", GUILayout.Width(Screen.width / 4));
        WetnessTerrainIntensity.SliderField(0, 1, "Intensity", "");
        EditorGUILayout.EndHorizontal();
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void EmissionGUI()
    {
        EditorGUILayout.LabelField("Emission", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        EmissionEnabled.intValue = EditorGUILayout.IntPopup(EmissionEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });
        EditorGUILayout.EndHorizontal();

        EditorGUI.BeginDisabledGroup(!controller.EmissionEnabled);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Intensity", GUILayout.Width(Screen.width / 4));
        EmissionIntensity.SliderField(0, 2, "Intensity", "");
        EditorGUILayout.EndHorizontal();

        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    private void WaterGUI()
    {
        EditorGUILayout.LabelField("Wind Water", EditorStyles.boldLabel);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Enable", GUILayout.Width(Screen.width / 4));
        WindWaterEnabled.intValue = EditorGUILayout.IntPopup(WindWaterEnabled.intValue,
            new string[] { "Off", "Active" }, new[] { 0, 1 });

        EditorGUI.BeginDisabledGroup(!controller.WindWaterEnabled);
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Main", GUILayout.Width(Screen.width / 4));
        WindWaterIntensity.SliderField(0, 1, "Main", "");
        EditorGUILayout.EndHorizontal();
        EditorGUI.EndDisabledGroup();
        EditorGUILayout.Space();
    }
    #endregion [GUI]

    #region [Menu Itemm]

    [MenuItem("Window/DE Environment/Global Controller/Add Global Controller...", priority = 311)]
    public static void CreateGlobalDEEnviromentWindController()
    {
        GameObject WindController = new GameObject("DE Controller Global");
        var egc = WindController.AddComponent<DEController>();
        var wz = WindController.AddComponent<WindZone>();
        egc.windZone = wz;
        egc.SynchWindZone = true;

        if (SceneView.lastActiveSceneView != null)
        {
            WindController.transform.position = Vector3.zero;
        }
    }
    [MenuItem("GameObject/3D Object/DE Environment/Add Global Controller...", priority = 9999)]
    public static void CreateGlobalDEEnviromentWindControllerGameObject()
    {
        GameObject WindController = new GameObject("DE Controller Global");
        var egc = WindController.AddComponent<DEController>();
        var wz = WindController.AddComponent<WindZone>();
        egc.windZone = wz;
        egc.SynchWindZone = true;

        if (SceneView.lastActiveSceneView != null)
        {
            WindController.transform.position = Vector3.zero;
        }
    }

    #endregion [Menu Itemm]
}

#endif