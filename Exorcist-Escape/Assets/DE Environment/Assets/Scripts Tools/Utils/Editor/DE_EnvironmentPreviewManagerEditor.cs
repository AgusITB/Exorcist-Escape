/*
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
*/

#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;

using System.IO;
using System.Collections;
using System.Collections.Generic;
using DEEnvironmentCore.Utils;

[CustomEditor(typeof(DE_EnvironmentPreviewWizard), editorForChildClasses: (false), isFallback = false)]
[CanEditMultipleObjects]
public class DE_EnvironmentPreviewWizardEditor: Editor
{
    public override void OnInspectorGUI()
    {
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.BeginVertical();
        EditorGUILayout.LabelField("Do not destroy this component!", EditorStyles.boldLabel);
        EditorGUILayout.LabelField("This component belongs to\n DE Mesh Tools and will be\n removed automatically!",GUILayout.Height(60));
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
    }
}

#endif