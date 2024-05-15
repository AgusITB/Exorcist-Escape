/*  
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch 
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

#if UNITY_EDITOR
using System;
using UnityEngine;
using UnityEditor;

using DEEnvironmentCore.Utils;
using DEEnvironmentCore.Containers;
using DEEnvironmentCore.GraphicalUserInterface;

public class DE_EnvironmentMeshTool : EditorWindow
{
    private static string Version
    {
        get 
        { 
            return DEEnvironmentCore.SchematicVersionControl.VERSION;
        }
    }
    // Editor Window
    private static readonly Vector2 EditorWindowSize = new Vector2(512, 768);
    private static int mainToolbar = 0;
    // GUI

    private Vector2 scrollPos = Vector2.zero;

    // General Properties    
    public GameObject[] selectionObjects = new GameObject[0];

    [SerializeField] private SubmeshOption[] submeshOptions = new SubmeshOption[0];
    [SerializeField] private MeshFilter[] filters = new MeshFilter[0];


    // Mesh Setup
    private int meshProcessingSelection = 0;

    private string[] previewType = new string[] { "Default", "Vertex Color", "Vertex Normal", "Vertex Tangents", "Ambient Occlusion" };
    private int previewTypeSelection = 0;

    private int DebugNormalMode = 0;
    private float DebugStrengthAO = 0.5f;
    

    // Mesh Optimization

    private float smoothingAngle = 60;

    // Wind Vertex Color
    
    private Vector3 colorModifier = Vector3.one;
    private DE_EnvironmentMenuPath paths;

    // Ambient Occlusion
    private int AO_Target = 0;
    private string[] AO_TargetOptions = new string[]
    {
        "Vertex Color", "Vertex TexCoord", "The Vegetation Engine",
    };

    private int AO_TargetColor = 3;
    private string[] AO_TargetColorOptions = new string[]
    {
        "Vertex Color R", "Vertex Color G", "Vertex Color B", "Vertex Color A",
    };

    private int AO_TargetChannel = 0;
    private string[] AO_TargetChannelOptions = new string[]
    {
        "UV2 X", "UV2 Y", "UV3 X", "UV3 Y", "UV4 X", "UV4 Y"
    };


    private int AO_samples = 4;
    private float AO_minRange = 0.0000000001f;
    private float AO_maxRange = 1.5f;
    private float AO_intensity = 1.3f;

    private DEEnvironmentGUI.AboutGUI aboutGUI;
    private DEEnvironmentGUI.MainGUI mainGUI;

    [MenuItem("Window/DE Environment/Tools/Open Mesh Tool...", priority = 0)]
    public static void Init()
    {
        var window = GetWindow(typeof(DE_EnvironmentMeshTool),true, "DE Environment Mesh Tool " + Version);
        
        window.minSize = EditorWindowSize;
        window.maxSize = EditorWindowSize;
        window.Show();
    }

    #region [Unity Actions]
    public void OnEnable()
    {
        OnSelectionChange();
        var path = System.IO.Path.Combine("Assets", "DE Environment", "Assets", "Scripts Tools", "DE Shaders Path.asset");
        if (!paths)
            paths = (DE_EnvironmentMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_EnvironmentMenuPath));
    }
    public void OnDisable()
    {
        if (selectionObjects.Length > 0)
            SetDefaultShaders(true);
    }
    public void OnGUI()
    {
        if (aboutGUI == null)
            aboutGUI = new DEEnvironmentGUI.AboutGUI(
            "Mesh Tool",
            "DE Wizard",
            Version,
            new string[] { "Daniel Wipf", "David Olshefski" },
            new string[] { "Daniel Wipf" },
            new string[] { "VRFX Realtime Studio GmbH", "Grimselweg 5", "6005 Luzern", "Switzerland" },
            "https://www.vrfxrealtimestudio.com/",
            "daniel@vrfx.ch"
            );
        if (mainGUI == null)
            mainGUI = new DEEnvironmentGUI.MainGUI(
                mainToolbar: ref mainToolbar,
                toolbarNames: new string[] { "Info", "Mesh Optimization", "Wind Vertex Color", "Ambient Occlusion", "DE Wizard", "About" },
                actions: new System.Action[] { InfoGUI, MeshGUI, WindVertexColorGUI, AmbientOcclusionGUI, DEShadersGUI, aboutGUI.OnGUI },
                name: "Mesh Tool",
                version: Version,
                editorWindowSize: EditorWindowSize,
                IconfileName: paths.icon,
                publisherLink: "https://assetstore.unity.com/packages/vfx/shaders/de-environment-183775",
                discordLink: "https://discord.gg/W7VThzw",
                websiteLink: "http://deenvironment.com/",
                mailLink: "contact@deenvironment.com",
                publisher: "DE Environment"
                );
        mainGUI.OnGUI();
    }
    #endregion
    #region [Custom GUI]
    void InfoGUI()
    {
        var LabelStyle = new GUIStyle(GUI.skin.label);
        LabelStyle.alignment = TextAnchor.UpperLeft;
        LabelStyle.fontSize = 11;

        EditorGUILayout.LabelField("Welcome to DE Environments Mesh Tool!", EditorStyles.boldLabel);
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Mesh Optimization: ", EditorStyles.miniBoldLabel);
        EditorGUILayout.LabelField("Repair game objects/prefabs with damaged or missing vertex \n" +
            "tangents and vertex normal. \n\n" +
            "You can even repair all Scene Objects with one click! ", LabelStyle, GUILayout.Height(60));
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Wind Vertex Color: ", EditorStyles.miniBoldLabel);
        EditorGUILayout.LabelField("Baking or repair vertex colors into game objects/prefabs for wind \n" +
            "animation making most 3rd party vegetation work with wind \n" +
            "scripts that did not have baked vertex color before.", LabelStyle, GUILayout.Height(45));
        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Ambient Occlusion: ", EditorStyles.miniBoldLabel);
        EditorGUILayout.LabelField("Baking AO ambient occlusion into game objects/prefabs \n" +
            "improving performance and quality ", LabelStyle, GUILayout.Height(30));
        EditorGUILayout.Space();
        
    }

    void MeshGUI()
    {
        var LabelWidth = GUILayout.Width(100);
        var maxWidth =  GUILayout.Width(EditorWindowSize.x - 145);

        scrollPos = GUILayout.BeginScrollView(scrollPos, GUIStyle.none, GUIStyle.none);

        EditorGUILayout.LabelField("Mesh Setup", EditorStyles.boldLabel);

        EditorGUILayout.Space();

        MeshProcessingGUI(false);

        EditorGUILayout.Space();

        // Mesh Setup Start
        // Mesh Setup End
        
        
        EditorGUILayout.LabelField("Operations", EditorStyles.boldLabel);

        // Operatîons Start
        EditorGUILayout.BeginVertical("tooltip",maxWidth);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Normals Smoothing Angle");
        smoothingAngle = EditorGUILayout.FloatField(smoothingAngle);
        EditorGUILayout.EndHorizontal();
        EditorGUI.BeginDisabledGroup(selectionObjects.Length == 0);
        
        EditorGUILayout.LabelField("Repair Selection: ", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();

        //Normals Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Normals");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Normals");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateNormals(selectionObjects, smoothingAngle);
        }

        //Tangents Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Tangents");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Tangents");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateTangents(selectionObjects);
        }
       
        // Both Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Normals & Tangents");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Mesh");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateTangentsAndNormals(selectionObjects, smoothingAngle);
        }


        EditorGUILayout.EndHorizontal();
        EditorGUILayout.LabelField("Repair Complete Scene: ", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        var sceneSelection = GameObject.FindObjectsOfType<GameObject>();
        //Normals Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Normals");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Normals");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateNormals(sceneSelection, smoothingAngle);
        }

        //Tangents Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Tangents");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Tangents");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateTangents(sceneSelection);
        }

        // Both Recalculation
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Normals & Tangents");
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Recalculate Mesh");
            EditorUtility.SetDirty(this);
            DE_MeshUtils.RecalculateTangentsAndNormals(sceneSelection, smoothingAngle);
        }
        EditorGUILayout.EndHorizontal();

        EditorGUI.EndDisabledGroup();
        
        EditorGUILayout.EndVertical();
        // Operations End

        GUILayout.EndScrollView();

    }
    void WindVertexColorGUI()
    {
        var maxWidth = GUILayout.Width(EditorWindowSize.x - 145);
        
        EditorGUILayout.LabelField("Mesh Setup", EditorStyles.boldLabel);

        EditorGUILayout.Space();
        MeshProcessingGUI(true);
        EditorGUILayout.Space();

        SubmeshOptionGUI();
        


        EditorGUILayout.Space();

        EditorGUILayout.LabelField("Settings", EditorStyles.boldLabel);

        // Wind Vertex Color Operations Start
        EditorGUI.BeginDisabledGroup(selectionObjects.Length != 1);
        EditorGUILayout.BeginVertical("tooltip", maxWidth);
        colorModifier.x = EditorGUILayout.Slider("Main Bending Strength",colorModifier.x, 0, 5);
        colorModifier.y = EditorGUILayout.Slider("Cutout Random Strength", colorModifier.y, 0, 5);
        colorModifier.z = EditorGUILayout.Slider("Cutout Tumbling Strength", colorModifier.z, 0, 5);

        EditorGUILayout.EndVertical();
        EditorGUI.EndDisabledGroup();

        EditorGUILayout.LabelField("Operations", EditorStyles.boldLabel);

        // Wind Vertex Color Operations Start
        EditorGUI.BeginDisabledGroup(selectionObjects.Length != 1);
        EditorGUILayout.BeginHorizontal("tooltip", maxWidth);
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Bake Vertex Color");

        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Bake Vertex Colors");
            EditorUtility.SetDirty(this);
            DE_VertexColor.Recalculate(selectionObjects, submeshOptions, colorModifier);
        }
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Reset Vertex Color");

        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Reset Vertex Colors");
            EditorUtility.SetDirty(this);
            DE_VertexColor.Reset(selectionObjects);
        }
        EditorGUILayout.EndHorizontal();
        EditorGUI.EndDisabledGroup();
        this.Repaint();
    }
    void AmbientOcclusionGUI()
    {
        var maxWidth = GUILayout.Width(EditorWindowSize.x - 145);

        EditorGUILayout.LabelField("Mesh Setup", EditorStyles.boldLabel);

        EditorGUILayout.Space();
        MeshProcessingGUI(false);
        EditorGUILayout.Space();

        // Mesh Setup Start
        EditorGUILayout.BeginVertical("tooltip", maxWidth);
       
        // Mesh Setup End


        EditorGUILayout.Space();

        EditorGUILayout.LabelField("Settings", EditorStyles.boldLabel);

        // Settings Start
        EditorGUI.BeginDisabledGroup(selectionObjects.Length == 0);
        EditorGUILayout.BeginVertical("tooltip", maxWidth);
        AO_samples = EditorGUILayout.Popup("Samples: ",AO_samples, new string[] { "64", "128", "256", "512", "1024", "2048" });
        AO_minRange = EditorGUILayout.Slider("Minimum Range: ", AO_minRange, 0.0000000001f, 20);
        AO_maxRange = EditorGUILayout.Slider("Maximum Range: ", AO_maxRange, 0.0000000001f, 20);
        AO_intensity = EditorGUILayout.Slider("Intensity: ", AO_intensity, 0, 10);

        EditorGUILayout.EndVertical();
        EditorGUI.EndDisabledGroup();
        // Settings End
        
        // Target Start
        EditorGUILayout.LabelField("Target", EditorStyles.boldLabel);
        EditorGUI.BeginDisabledGroup(selectionObjects.Length == 0);
        EditorGUILayout.BeginVertical("tooltip", maxWidth);
        AO_Target = EditorGUILayout.Popup(new GUIContent("AO Target:","UV 1 is not supported, due to high chance of breaking the model."), AO_Target, AO_TargetOptions);

        if (AO_Target == 0)
        {
            AO_TargetColor = EditorGUILayout.Popup(new GUIContent("Vertex Color", ""), AO_TargetColor, AO_TargetColorOptions);
        }
        else if (AO_Target == 1)
        {
            AO_TargetChannel = EditorGUILayout.Popup(new GUIContent("Vertex TexCoord", ""), AO_TargetChannel, AO_TargetChannelOptions);
        }

        EditorGUILayout.EndVertical();
        EditorGUI.EndDisabledGroup();
        // Target End

        // Operations Start
        EditorGUILayout.LabelField("Operations", EditorStyles.boldLabel);
        EditorGUI.BeginDisabledGroup(selectionObjects.Length == 0);
        EditorGUILayout.BeginHorizontal("tooltip", maxWidth);
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Recalcualte Ambient Occlusion");

        if (EditorGUI.EndChangeCheck())
        {
            
            Undo.RecordObject(this, "Recalculate Ambient Occlusion");
            EditorUtility.SetDirty(this);
            for(int i = 0; i < selectionObjects.Length; i++)
            {
                var originalPos = selectionObjects[i].transform.position;
                selectionObjects[i].transform.position = Vector3.zero;
                SceneView.RepaintAll();
                var samples = 64;
                switch (AO_samples)
                {
                    case 0:
                        samples = 64;
                        break;
                    case 1:
                        samples = 128;
                        break;
                    case 2:
                        samples = 256;
                        break;
                    case 3:
                        samples = 512;
                        break;
                    case 4:
                        samples = 1024;
                        break;
                    case 5:
                        samples = 2048;
                        break;
                }

                var AO_TargetBaker = 0;

                if (AO_Target == 0)
                {
                    AO_TargetBaker = AO_TargetColor;
                }
                else if (AO_Target == 1)
                {
                    AO_TargetBaker = 10 + AO_TargetChannel;
                }
                else if (AO_Target == 2)
                {
                    AO_TargetBaker = 1;
                }

                DE_AmbientOcclusion.Recalculate(obj:selectionObjects[i], samples:samples, minRange:AO_minRange, maxRange:AO_maxRange, intensity:AO_intensity, target:AO_TargetBaker);
                selectionObjects[i].transform.position = originalPos;
            }
            
            SceneView.RepaintAll();
        }
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Reset Ambient Occlusion");

        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(this, "Reset Ambient Occlusion");
            EditorUtility.SetDirty(this);
            for(int i = 0; i < selectionObjects.Length; i++)
                DE_AmbientOcclusion.Reset(selectionObjects[i], AO_Target);
        }
        EditorGUILayout.EndHorizontal();
        // Operations End
        EditorGUI.EndDisabledGroup();
    }
    void DEShadersGUI()
    {
        EditorGUILayout.LabelField("DE Environment Wizard", EditorStyles.boldLabel);
        if(GUILayout.Button("Open DE Environment Wizard"))
        {
            var window = GetWindow(typeof(DE_EnvironmentMenu), true, "Environment Wizard ");
            window.minSize = new Vector2(512,512);
            window.maxSize = new Vector2(512, 512);
            window.Show();
        }
    }

    void SubmeshOptionGUI()
    {
       
        EditorGUILayout.LabelField("Submesh Options", EditorStyles.boldLabel);
        if (Selection.activeGameObject == null)
            return;
        scrollPos = GUILayout.BeginScrollView(scrollPos, GUIStyle.none);

        int c = 0;
        foreach (var f in filters)
        {
            EditorGUILayout.LabelField(f.gameObject.name, EditorStyles.miniBoldLabel);
            for (int i = 0; i < f.sharedMesh.subMeshCount; i++)
            {
                var materialName = new GUIContent( ("SM_" + c + ": "+ f.GetComponent<DE_EnvironmentPreviewWizard>().materials[i].name).Replace(f.gameObject.name,""));
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField(materialName, EditorStyles.miniLabel);
                submeshOptions[c] = (SubmeshOption)EditorGUILayout.EnumPopup(submeshOptions[c],GUILayout.Width(80));
                if (GUILayout.Button(new GUIContent("B", $"Bake {materialName.text} Vertex Color"),GUILayout.Width(20)))
                {
                    Undo.RecordObject(this, "Bake Vertex Colors");
                    EditorUtility.SetDirty(this);
                    DE_VertexColor.Recalculate(selectionObjects, submeshOptions, colorModifier, c);
                }

                if (GUILayout.Button(new GUIContent("R", $"Reset {materialName.text} Vertex Color"), GUILayout.Width(20)))
                {
                    Undo.RecordObject(this, "Reset Vertex Colors");
                    EditorUtility.SetDirty(this);
                    DE_VertexColor.Reset(selectionObjects, c);
                }
                EditorGUILayout.EndHorizontal();
                c++;
            }
        }
        GUILayout.EndScrollView();
    }
    #endregion
    #region [Preview Actions]
    void MeshProcessingGUI(bool singleObjectOnly)
    {
        var maxWidth = GUILayout.Width(EditorWindowSize.x - 145);
        EditorGUILayout.LabelField("Processing object selection", EditorStyles.boldLabel);
        EditorGUILayout.BeginVertical("tooltip", maxWidth);
        if(singleObjectOnly)
            meshProcessingSelection = GUILayout.Toolbar(meshProcessingSelection, new string[] { "Active GameObject"});
        if(!singleObjectOnly)
            meshProcessingSelection = GUILayout.Toolbar(meshProcessingSelection, new string[] { "Active GameObject", "Active Selection"});
        EditorGUILayout.EndVertical();

        EditorGUILayout.LabelField("Preview GameObjects", EditorStyles.boldLabel);
        EditorGUILayout.BeginVertical("tooltip", maxWidth);

        EditorGUI.BeginChangeCheck();
        previewTypeSelection = EditorGUILayout.Popup("Preview Type", previewTypeSelection, previewType);
        if(previewTypeSelection == 2)
            DebugNormalMode = EditorGUILayout.Popup("Normal Mode", DebugNormalMode, new string[] { "Default", "Filp", "Mirror" });
        if (previewTypeSelection == 4)
        {
            AO_Target = EditorGUILayout.Popup(
                new GUIContent("AO Target","UV 1 is not supported, due to high chance of breaking the model."),
                AO_Target,
                AO_TargetOptions);
            DebugStrengthAO = EditorGUILayout.Slider("AO Stength", DebugStrengthAO, 0, 1);
        }

        if (EditorGUI.EndChangeCheck())
        {
            ApplyShaders();
        }

        EditorGUILayout.Space();
        EditorGUI.BeginChangeCheck();
        GUILayout.Button("Load Default Shaders");   
        if (EditorGUI.EndChangeCheck())
        {
            if (selectionObjects.Length > 0)
                SetDefaultShaders(false);
            previewTypeSelection = 0;
        }
        EditorGUILayout.EndVertical();
    }
    private void OnSelectionChange()
    {
        if (Selection.gameObjects.Length == 0 || Selection.activeGameObject == null)
            return;
        SetDefaultShaders(false);
        if (meshProcessingSelection == 0)
            selectionObjects = Selection.gameObjects;
        if(meshProcessingSelection == 1 || meshProcessingSelection == 2)
            selectionObjects = new GameObject[1] { Selection.activeGameObject };


        GetDefaultShaders();
        ApplyShaders();
        GetSubmeshOptions();
    }
    
    void GetSubmeshOptions()
    {
        if (meshProcessingSelection == 1)
            return;
        filters = selectionObjects[0].GetComponentsInChildren<MeshFilter>();
        submeshOptions = DE_MeshUtils.RecalculateSubmeshOption(selectionObjects[0], submeshOptions);
    }
    
    void ApplyShaders()
    {
        if (selectionObjects.Length == 0)
            return;
        if (previewTypeSelection == 0)
            SetDefaultShaders(false);
        else
        {
            for(int x = 0; x< selectionObjects.Length; x++)
            {
                var r = selectionObjects[x].GetComponentsInChildren<MeshRenderer>();
                for(int y = 0; y < r.Length; y++)
                {
                    if (r[y])
                    {
                        var materials = new Material[r[y].sharedMaterials.Length];
                        for (int z = 0; z < r[y].sharedMaterials.Length; z++)
                            materials[z] = CreateDebugMaterial();
                        r[y].sharedMaterials = materials;
                    }
                }
                
            }
        }
    }

    void GetDefaultShaders()
    {
        if (selectionObjects.Length == 0)
            return;
        for (int x = 0; x < selectionObjects.Length; x++)
        {
            var r = selectionObjects[x].GetComponentsInChildren<MeshRenderer>();
            for (int y = 0; y < r.Length; y++)
            {
                var preview = r[y].GetComponent<DE_EnvironmentPreviewWizard>();
                if (!preview)
                    preview = r[y].gameObject.AddComponent<DE_EnvironmentPreviewWizard>();
                preview.materials = r[y].sharedMaterials;
            }
        }
    }
    void SetDefaultShaders(bool destroy)
    {
        if (selectionObjects.Length == 0)
            return;

        for(int x  = 0; x < selectionObjects.Length; x++)
        {
            var r = selectionObjects[x].GetComponentsInChildren<MeshRenderer>();
            for(int y = 0; y < r.Length; y++)
            {
                var preview = r[y].GetComponent<DE_EnvironmentPreviewWizard>();
                if(preview)
                {
                    preview.LoadDefaultShaders();
                    if (destroy)
                        DestroyImmediate(r[y].GetComponent<DE_EnvironmentPreviewWizard>());
                }
            }
        }
    }
    Material CreateDebugMaterial()
    {
        var mat = Instantiate(new Material(Shader.Find("Hidden/DEStudio/Utility/Debug")));
        mat.name = "DE Utility Debug Material";
        switch (previewTypeSelection)
        {
            case 1:
                mat.SetFloat("_MCoreDebugMode", 0);
                break;
            case 2:
                mat.SetFloat("_MCoreDebugMode", 2);
                break;
            case 3:
                mat.SetFloat("_MCoreDebugMode", 1);
                break;
            case 4:
                mat.SetFloat("_MCoreDebugMode", 3);
                break;

        }
        mat.SetFloat("_MCoreDebugStrengthAO", DebugStrengthAO);
        mat.SetFloat("_MCoreAOTarget", AO_Target);
        mat.SetFloat("_MCoreAOTargetColor", AO_TargetColor);
        mat.SetFloat("_MCoreAOTargetTexCoord", AO_TargetChannel);
        mat.SetFloat("_MCoreDebugNormalMode", DebugNormalMode);
        mat.SetInt("_CullMode", 0);

        mat.SetInt("_WindModeCutoutShader", 0);
        return mat;
    }
    #endregion
    
}
#endif

