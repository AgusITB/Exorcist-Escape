/*  
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch 
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System;
using System.Reflection;

using DEEnvironmentCore.Lights;
using DEEnvironmentCore.GraphicalUserInterface;

[CustomEditor(typeof(Light))]
public class DE_EnvironmentGlobalLightExtentions : Editor
{
    private Editor defaultEditor;
    //private DE_RenderingPath renderingPath;
    //private DE_ColorSpace colorSpace;
    private bool expandEditor = false;
    private readonly string expandEditorKey = "DESHADERS_LIGHT_EXPANDEDITOR";

#region [UNITY ACTIONS]
    void OnEnable()
    {
        defaultEditor = Editor.CreateEditor(targets, Type.GetType("UnityEditor.LightEditor, UnityEditor"));
        //renderingPath = DE_Lights.GetRenderingPath();
        //colorSpace = DE_Lights.GetColorSpace();
        expandEditor = GetEditorPrefsBool(expandEditorKey);
    }
    void OnDisable()
    {
        MethodInfo disableMethod = defaultEditor.GetType().GetMethod("OnDisable", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
        if (disableMethod != null)
            disableMethod.Invoke(defaultEditor, null);
        DestroyImmediate(defaultEditor);
    }
    public override void OnInspectorGUI()
    {
        defaultEditor.OnInspectorGUI();
        EditorGUI.BeginChangeCheck();
        expandEditor = expandEditor.FoldoutField(new GUIContent("Global Settings - <i><size=10>by DE Environment</size></i>", "Expand this to show Global Settings"), DEEnvironmentStyles.LabelStyle(richText:true), isLastInRow:true);
        if (EditorGUI.EndChangeCheck())
            SetEditorPrefsBool(expandEditorKey, expandEditor);
        if(expandEditor)
            GlobalLightGUI();
    }
    public void OnSceneGUI()
    {
        MethodInfo sceneGUIMethod = defaultEditor.GetType().GetMethod("OnSceneGUI", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
        if (sceneGUIMethod != null)
            sceneGUIMethod.Invoke(defaultEditor, null);
    }
#endregion
#region [GUI]
    private void GlobalLightGUI()
    {
        LightingSettings();
    }
    private void LightingSettings()
    {
        var rect = GUILayoutUtility.GetLastRect();

        Handles.BeginGUI();
        Handles.color = Color.black;
        Handles.DrawLine(
            new Vector3(0, rect.y + rect.height),
            new Vector3(Screen.width, rect.y + rect.height));
        Handles.EndGUI();

        EditorGUILayout.LabelField("Global Light Settings", EditorStyles.boldLabel);

        DE_Lights.UseLinearIntensity();
        DE_Lights.UseColorTemperature();
        DE_Lights.BakeLight(80);
        EditorGUILayout.Space();

    }
    
#endregion
#region [EditorPrefs]
    public bool GetEditorPrefsBool(string key)
    {
        if(EditorPrefs.HasKey(key))
            return EditorPrefs.GetBool(key);
        else
        {
            EditorPrefs.SetBool(key, false);
            return false;
        }
    }
    public void SetEditorPrefsBool(string key, bool value)
    {
        EditorPrefs.SetBool(key, value);
    }
#endregion
}
#endif