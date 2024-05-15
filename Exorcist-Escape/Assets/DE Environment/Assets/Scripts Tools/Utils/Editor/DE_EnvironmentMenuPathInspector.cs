/*  
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
    support: Daniel Wipf - daniel@twigly.ch 
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/

#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;

using DEEnvironmentCore.Utils;
using DEEnvironmentCore.Containers;
using System.Linq;

[CustomEditor(typeof(DE_EnvironmentMenuPath))]
public class DE_EnvironmentMenuPathInspector : Editor
{
    private string Version
    {
        get
        {
            return DEEnvironmentCore.SchematicVersionControl.VERSION;
        }
    }
    private DE_EnvironmentMenuPath menuPath;
    Vector2 scrollView = Vector2.zero;
    private Texture2D icon,
    BannerDEEnvironment,
    BannerDEStudio, 
    BannerDEBicubic, 
    BannerDEAutomotive, 
    BannerDEToon, 
    BannerDEDecal, 
    BannerDEDigital, 
    BannerDEDissolve, 
    BannerDEFabric, 
    BannerDEGlass, 
    BannerDEHologram, 
    BannerDEIce, 
    BannerDEMobile, 
    BannerDEParallax, 
    BannerDEPolybrush, 
    BannerDERain, 
    BannerDEStochastic, 
    BannerDETerrain, 
    BannerDETriplanar, 
    BannerDETwoSided, 
    BannerDEUVReveal, 
    BannerDEVectorDisplacement, 
    BannerDEVegetation, 
    BannerDEWater, 
    BannerDEPortal;

    private SerializedProperty paths;
    private SerializedProperty password;

    private SerializedProperty WizardInfo;
    private int dataTab = 0;

    private GUILayoutOption ButtonWidth, ButtonHeight, LabelWidth;
    private readonly int size = 20;
    private void OnEnable()
    {
        ButtonWidth = GUILayout.Width(size);
        ButtonHeight = GUILayout.Height(size);
        LabelWidth = GUILayout.Width(size * 7);

        serializedObject.Update();
        paths = serializedObject.FindProperty("Paths");
        password = serializedObject.FindProperty("password");
        WizardInfo = serializedObject.FindProperty("Info");

        
        menuPath = (DE_EnvironmentMenuPath)target;
        
        icon = serializedObject.FindProperty("icon").stringValue.GetTexture2D();
        BannerDEEnvironment = serializedObject.FindProperty("BannerDEEnvironment").stringValue.GetTexture2D();
        BannerDEStudio = serializedObject.FindProperty("BannerDEStudio").stringValue.GetTexture2D();
        BannerDEBicubic = serializedObject.FindProperty("BannerDEBicubic").stringValue.GetTexture2D();
        BannerDEAutomotive = serializedObject.FindProperty("BannerDEAutomotive").stringValue.GetTexture2D();
        BannerDEToon = serializedObject.FindProperty("BannerDEToon").stringValue.GetTexture2D();
        BannerDEDecal = serializedObject.FindProperty("BannerDEDecal").stringValue.GetTexture2D();
        BannerDEDigital = serializedObject.FindProperty("BannerDEDigital").stringValue.GetTexture2D();
        BannerDEDissolve = serializedObject.FindProperty("BannerDEDissolve").stringValue.GetTexture2D();
        BannerDEFabric = serializedObject.FindProperty("BannerDEFabric").stringValue.GetTexture2D();
        BannerDEGlass = serializedObject.FindProperty("BannerDEGlass").stringValue.GetTexture2D();
        BannerDEHologram = serializedObject.FindProperty("BannerDEHologram").stringValue.GetTexture2D();
        BannerDEIce = serializedObject.FindProperty("BannerDEIce").stringValue.GetTexture2D();
        BannerDEMobile = serializedObject.FindProperty("BannerDEMobile").stringValue.GetTexture2D();
        BannerDEParallax = serializedObject.FindProperty("BannerDEParallax").stringValue.GetTexture2D();
        BannerDEPolybrush = serializedObject.FindProperty("BannerDEPolybrush").stringValue.GetTexture2D();
        BannerDERain = serializedObject.FindProperty("BannerDERain").stringValue.GetTexture2D();
        BannerDEStochastic = serializedObject.FindProperty("BannerDEStochastic").stringValue.GetTexture2D();
        BannerDETerrain = serializedObject.FindProperty("BannerDETerrain").stringValue.GetTexture2D();
        BannerDETriplanar = serializedObject.FindProperty("BannerDETriplanar").stringValue.GetTexture2D();
        BannerDETwoSided = serializedObject.FindProperty("BannerDETwoSided").stringValue.GetTexture2D();
        BannerDEUVReveal = serializedObject.FindProperty("BannerDEUVReveal").stringValue.GetTexture2D();
        BannerDEVectorDisplacement = serializedObject.FindProperty("BannerDEVectorDisplacement").stringValue.GetTexture2D();
        BannerDEVegetation = serializedObject.FindProperty("BannerDEVegetation").stringValue.GetTexture2D();
        BannerDEWater = serializedObject.FindProperty("BannerDEWater").stringValue.GetTexture2D();
        BannerDEPortal = serializedObject.FindProperty("BannerDEPortal").stringValue.GetTexture2D();

        if (!EditorPrefs.HasKey("DE_SHADERS_PASSWORD"))
        {
            password.stringValue = "";
            serializedObject.ApplyModifiedProperties();
        }
    }
    public override void OnInspectorGUI()
    {
        GeneralGUI();
        if (!EditorPrefs.HasKey("DE_SHADERS_PASSWORD"))
        {
            password.stringValue = EditorGUILayout.PasswordField("Password:", password.stringValue);
            serializedObject.ApplyModifiedProperties();
            
            if(password.stringValue == "DE_SHADERS")
            {
                EditorPrefs.SetString("DE_SHADERS_PASSWORD", password.stringValue);
            }
            
        }
        EditorGUI.BeginDisabledGroup(!EditorPrefs.HasKey("DE_SHADERS_PASSWORD"));
        try
        {
            dataTab = GUILayout.Toolbar(dataTab, new string[] { "Paths", "Information" });
            switch (dataTab)
            {
                case 0:
                    PackageSettingsGUI();
                    SetupGUI();
                    break;
                case 1:
                    ManagerInfoGUI();
                    break;
            }
           
            
        }
        catch
        { 

        }
        EditorGUI.EndDisabledGroup();
    }
    [MenuItem("Assets/Create/DE Environment/Create Menu Path File")]
    public static void CreateDEEnvironmentShadersMenuPath()
    {
        if (!EditorPrefs.HasKey("DE_SHADERS_PASSWORD"))
        {
            var path = Path.Combine("Assets", "DE Environment", "Assets", "Scripts Tools", "DE Shaders Path.asset");
            var obj = ScriptableObject.CreateInstance(typeof(DE_EnvironmentMenuPath));
            AssetDatabase.CreateAsset(obj, path); ; ;
            AssetDatabase.Refresh();
            EditorGUIUtility.PingObject(obj);
        }
        else
        {
            Debug.Log("Allready Created!");
        }
    }
    private void GeneralGUI()
    {
        var size = 100;
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField(new GUIContent(icon), GUILayout.Width(size), GUILayout.Height(size));
        EditorGUILayout.LabelField(("DE Shaders Menu Path " + Version), EditorStyles.boldLabel);
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.Space();
        
    }
    
    private void PackageSettingsGUI()
    {
        EditorGUILayout.LabelField("Package Installer", EditorStyles.miniBoldLabel);
        if(GUILayout.Button("Add new Package"))
        {
            menuPath.Paths.Add(new MenuPaths());
            if (Event.current == null)
                GUIUtility.ExitGUI();
        }
    }
    private void ManagerInfoGUI()
    {
        EditorGUILayout.LabelField("Wizard Icon", EditorStyles.miniBoldLabel);
        var iconName = serializedObject.FindProperty("icon");
        var bs6 = serializedObject.FindProperty("BannerDEEnvironment");
        var bs = serializedObject.FindProperty("BannerDEStudio");
        var bv = serializedObject.FindProperty("BannerDEBicubic");
        var bm5 = serializedObject.FindProperty("BannerDEAutomotive");
        var bt = serializedObject.FindProperty("BannerDEToon");
        var bm = serializedObject.FindProperty("BannerDEDecal");
        var bs1 = serializedObject.FindProperty("BannerDEDigital");
        var bv1 = serializedObject.FindProperty("BannerDEDissolve");
        var bt1 = serializedObject.FindProperty("BannerDEFabric");
        var bm1 = serializedObject.FindProperty("BannerDEGlass");
        var bs2 = serializedObject.FindProperty("BannerDEHologram");
        var bv2 = serializedObject.FindProperty("BannerDEIce");
        var bt2 = serializedObject.FindProperty("BannerDEMobile");
        var bm2 = serializedObject.FindProperty("BannerDEParallax");
        var bv3 = serializedObject.FindProperty("BannerDEPolybrush");
        var bt3 = serializedObject.FindProperty("BannerDERain");
        var bm3 = serializedObject.FindProperty("BannerDEStochastic");
        var bs4 = serializedObject.FindProperty("BannerDETerrain");
        var bv4 = serializedObject.FindProperty("BannerDETriplanar");
        var bt4 = serializedObject.FindProperty("BannerDETwoSided");
        var bm4 = serializedObject.FindProperty("BannerDEUVReveal");
        var bs5 = serializedObject.FindProperty("BannerDEVectorDisplacement");
        var bv5 = serializedObject.FindProperty("BannerDEVegetation");
        var bt5 = serializedObject.FindProperty("BannerDEWater");
        var bt6 = serializedObject.FindProperty("BannerDEPortal");

        EditorGUI.BeginChangeCheck();
        EditorGUILayout.PropertyField(iconName,new GUIContent("DE Logo", icon));
        EditorGUILayout.LabelField("Asset Banners", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(bs6, new GUIContent("DE Environment ", BannerDEEnvironment));
        EditorGUILayout.PropertyField(bs,new GUIContent("DE Studio ",BannerDEStudio));
        EditorGUILayout.PropertyField(bv,new GUIContent("DE Bicubic ",BannerDEBicubic));
        EditorGUILayout.PropertyField(bm5, new GUIContent("DE Automotive ", BannerDEAutomotive));
        EditorGUILayout.PropertyField(bt,new GUIContent("DE Toon ", BannerDEToon));
        EditorGUILayout.PropertyField(bm,new GUIContent("DE Decal ", BannerDEDecal));
        EditorGUILayout.PropertyField(bs1,new GUIContent("DE Digital ",BannerDEDigital));
        EditorGUILayout.PropertyField(bv1,new GUIContent("DE Dissolve ",BannerDEDissolve));
        EditorGUILayout.PropertyField(bt1,new GUIContent("DE Fabric ", BannerDEFabric));
        EditorGUILayout.PropertyField(bm1,new GUIContent("DE Glass ", BannerDEGlass));
        EditorGUILayout.PropertyField(bs2,new GUIContent("DE Hologram ",BannerDEHologram));
        EditorGUILayout.PropertyField(bv2,new GUIContent("DE Ice ",BannerDEIce));
        EditorGUILayout.PropertyField(bt2,new GUIContent("DE Mobile ", BannerDEMobile));
        EditorGUILayout.PropertyField(bm2,new GUIContent("DE Parallax ", BannerDEParallax));
        EditorGUILayout.PropertyField(bv3,new GUIContent("DE Polybrush ",BannerDEPolybrush));
        EditorGUILayout.PropertyField(bt3,new GUIContent("DE Rain ", BannerDERain));
        EditorGUILayout.PropertyField(bm3,new GUIContent("DE Stochastic ", BannerDEStochastic));
        EditorGUILayout.PropertyField(bs4,new GUIContent("DE Terrain ",BannerDETerrain));
        EditorGUILayout.PropertyField(bv4,new GUIContent("DE Triplanar ",BannerDETriplanar));
        EditorGUILayout.PropertyField(bt4,new GUIContent("DE TwoSided ", BannerDETwoSided));
        EditorGUILayout.PropertyField(bm4,new GUIContent("DE UVReveal ", BannerDEUVReveal));
        EditorGUILayout.PropertyField(bs5,new GUIContent("DE VectorDisplacement ",BannerDEVectorDisplacement));
        EditorGUILayout.PropertyField(bv5,new GUIContent("DE Vegetation ",BannerDEVegetation));
        EditorGUILayout.PropertyField(bt5,new GUIContent("DE Water ", BannerDEWater));
        EditorGUILayout.PropertyField(bt6, new GUIContent("DE Portal ", BannerDEPortal));

        if (EditorGUI.EndChangeCheck())
        {
            icon = iconName.stringValue.GetTexture2D();
            BannerDEEnvironment = bs6.stringValue.GetTexture2D();
            BannerDEStudio = bs.stringValue.GetTexture2D();
            BannerDEBicubic = bv.stringValue.GetTexture2D();
            BannerDEAutomotive = bm5.stringValue.GetTexture2D();
            BannerDEToon = bt.stringValue.GetTexture2D();
            BannerDEDecal = bm.stringValue.GetTexture2D();
            BannerDEDigital = bs1.stringValue.GetTexture2D();
            BannerDEDissolve = bv1.stringValue.GetTexture2D();
            BannerDEFabric = bt1.stringValue.GetTexture2D();
            BannerDEGlass = bm1.stringValue.GetTexture2D();
            BannerDEHologram = bs2.stringValue.GetTexture2D();
            BannerDEIce = bv2.stringValue.GetTexture2D();
            BannerDEMobile = bt2.stringValue.GetTexture2D();
            BannerDEParallax = bm2.stringValue.GetTexture2D();
            BannerDEPolybrush = bv3.stringValue.GetTexture2D();
            BannerDERain = bt3.stringValue.GetTexture2D();
            BannerDEStochastic = bm3.stringValue.GetTexture2D();
            BannerDETerrain = bs4.stringValue.GetTexture2D();
            BannerDETriplanar = bv4.stringValue.GetTexture2D();
            BannerDETwoSided = bt4.stringValue.GetTexture2D();
            BannerDEUVReveal = bm4.stringValue.GetTexture2D();
            BannerDEVectorDisplacement = bs5.stringValue.GetTexture2D();
            BannerDEVegetation = bv5.stringValue.GetTexture2D();
            BannerDEWater = bt5.stringValue.GetTexture2D();
            BannerDEPortal = bt6.stringValue.GetTexture2D();
        }
        
        
        EditorGUILayout.Space();

        var info_0 = serializedObject.FindProperty("Info_Slot_0");
        var tabname_0 = info_0.FindPropertyRelative("tabName");
        var strings_0 = info_0.FindPropertyRelative("strings");
        var enabled_0 = info_0.FindPropertyRelative("enabled");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Info Tab 0", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(enabled_0, GUIContent.none);
        EditorGUILayout.EndHorizontal();
        if (enabled_0.boolValue)
        {
            EditorGUILayout.Space();


            EditorGUILayout.BeginVertical("box");

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tab Name", EditorStyles.miniLabel);
            EditorGUILayout.PropertyField(tabname_0, GUIContent.none);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tabname_0.stringValue + " Tab", EditorStyles.boldLabel);
            if (GUILayout.Button("Add new Line"))
            {
                menuPath.Info_Slot_0.Add();
            }
            EditorGUILayout.EndHorizontal();

            for (int j = 0; j < strings_0.arraySize; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.PropertyField(strings_0.GetArrayElementAtIndex(j), GUIContent.none);
                if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                {
                    menuPath.Info_Slot_0.Remove(j);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        var info_1 = serializedObject.FindProperty("Info_Slot_1");
        var tabname_1 = info_1.FindPropertyRelative("tabName");
        var strings_1 = info_1.FindPropertyRelative("strings");
        var enabled_1 = info_1.FindPropertyRelative("enabled");

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Info Tab 1", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(enabled_1, GUIContent.none);
        EditorGUILayout.EndHorizontal();
        if (enabled_1.boolValue)
        {
            EditorGUILayout.Space();


            EditorGUILayout.BeginVertical("box");

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tab Name", EditorStyles.miniLabel);
            EditorGUILayout.PropertyField(tabname_1, GUIContent.none);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tabname_1.stringValue + " Tab", EditorStyles.boldLabel);
            if (GUILayout.Button("Add new Line"))
            {
                menuPath.Info_Slot_1.Add();
            }
            EditorGUILayout.EndHorizontal();

            for (int j = 0; j < strings_1.arraySize; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.PropertyField(strings_1.GetArrayElementAtIndex(j), GUIContent.none);
                if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                {
                    menuPath.Info_Slot_1.Remove(j);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        var info_2 = serializedObject.FindProperty("Info_Slot_2");
        var tabname_2 = info_2.FindPropertyRelative("tabName");
        var strings_2 = info_2.FindPropertyRelative("strings");
        var enabled_2 = info_2.FindPropertyRelative("enabled");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Info Tab 2", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(enabled_2, GUIContent.none);
        EditorGUILayout.EndHorizontal();
        if (enabled_2.boolValue)
        {
            EditorGUILayout.Space();


            EditorGUILayout.BeginVertical("box");

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tab Name", EditorStyles.miniLabel);
            EditorGUILayout.PropertyField(tabname_2, GUIContent.none);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tabname_2.stringValue + " Tab", EditorStyles.boldLabel);
            if (GUILayout.Button("Add new Line"))
            {
                menuPath.Info_Slot_2.Add();
            }
            EditorGUILayout.EndHorizontal();

            for (int j = 0; j < strings_2.arraySize; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.PropertyField(strings_2.GetArrayElementAtIndex(j), GUIContent.none);
                if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                {
                    menuPath.Info_Slot_2.Remove(j);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        var info_3 = serializedObject.FindProperty("Info_Slot_3");
        var tabname_3 = info_3.FindPropertyRelative("tabName");
        var strings_3 = info_3.FindPropertyRelative("strings");
        var enabled_3 = info_3.FindPropertyRelative("enabled");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Info Tab 3", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(enabled_3, GUIContent.none);
        EditorGUILayout.EndHorizontal();
        if (enabled_3.boolValue)
        {
            EditorGUILayout.Space();


            EditorGUILayout.BeginVertical("box");

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tab Name", EditorStyles.miniLabel);
            EditorGUILayout.PropertyField(tabname_3, GUIContent.none);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tabname_3.stringValue + " Tab", EditorStyles.boldLabel);
            if (GUILayout.Button("Add new Line"))
            {
                menuPath.Info_Slot_3.Add();
            }
            EditorGUILayout.EndHorizontal();

            for (int j = 0; j < strings_3.arraySize; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.PropertyField(strings_3.GetArrayElementAtIndex(j), GUIContent.none);
                if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                {
                    menuPath.Info_Slot_3.Remove(j);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        var info_4 = serializedObject.FindProperty("Info_Slot_4");
        var tabname_4 = info_4.FindPropertyRelative("tabName");
        var strings_4 = info_4.FindPropertyRelative("strings");
        var enabled_4 = info_4.FindPropertyRelative("enabled");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Info Tab 4", EditorStyles.miniBoldLabel);
        EditorGUILayout.PropertyField(enabled_4, GUIContent.none);
        EditorGUILayout.EndHorizontal();
        if (enabled_4.boolValue)
        {
            EditorGUILayout.Space();


            EditorGUILayout.BeginVertical("box");

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("Tab Name", EditorStyles.miniLabel);
            EditorGUILayout.PropertyField(tabname_4, GUIContent.none);
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(tabname_4.stringValue + " Tab", EditorStyles.boldLabel);
            if (GUILayout.Button("Add new Line"))
            {
                menuPath.Info_Slot_4.Add();
            }
            EditorGUILayout.EndHorizontal();

            for (int j = 0; j < strings_4.arraySize; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.PropertyField(strings_4.GetArrayElementAtIndex(j), GUIContent.none);
                if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                {
                    menuPath.Info_Slot_4.Remove(j);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        serializedObject.ApplyModifiedProperties();
        serializedObject.Update();
    }
    private void SetupGUI()
    {
        
        scrollView = EditorGUILayout.BeginScrollView(scrollView, GUIStyle.none, GUIStyle.none);

        for (int i = 0; i < paths.arraySize; i++)
        {
            var path = paths.GetArrayElementAtIndex(i);
            var pname = path.FindPropertyRelative("name");
            var pipeline = path.FindPropertyRelative("renderPipeline");
            var pcycle = path.FindPropertyRelative("unityCycle");
            var ppackage = path.FindPropertyRelative("DEPackage");
            var package = path.FindPropertyRelative("packagePaths");
            var scenes2019 = path.FindPropertyRelative("scenePaths2019");
            var names2019 = path.FindPropertyRelative("names2019");
        
            var p = menuPath.Paths[i];
        
            EditorGUILayout.BeginVertical("box");
        
            PackageGUI(i, pname, pipeline, pcycle, ppackage, package, p);
            Unity2019ScenesGUI(scenes2019, names2019, package, p);
            
            EditorGUILayout.EndVertical();
        
            EditorGUILayout.Space();
        }
        serializedObject.ApplyModifiedProperties();
        serializedObject.Update();
        menuPath.Paths = menuPath.Paths.OrderBy(x => x.renderPipeline).ToList();

        EditorGUILayout.EndScrollView();
    }
    /// <summary>
    /// Package and Package Paths GUI
    /// </summary>
    /// <param name="i">Current path</param>
    /// <param name="PackageName">Package Name</param>
    /// <param name="SRPType">Type of SRP</param>
    /// <param name="Package">All Packages</param>
    /// <param name="currentMenu">Current Menu Path</param>
    public void PackageGUI(int i, SerializedProperty PackageName, SerializedProperty SRPType, SerializedProperty Cycle, SerializedProperty DEPackage, SerializedProperty Package, MenuPaths currentMenu)
    {
        EditorGUILayout.BeginHorizontal();
        
        if (GUILayout.Button(new GUIContent("-", "Remove package"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
        {
            paths.DeleteArrayElementAtIndex(i);
            return;
        }
        
        if (i > 0)
            if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                menuPath.Paths.Move(i, Mathf.Clamp(i - 1, 0, paths.arraySize));
        if (i < paths.arraySize - 1)
            if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                menuPath.Paths.Move(i, Mathf.Clamp(i + 1, 0, paths.arraySize));
        
        EditorGUILayout.BeginVertical();
        
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.PropertyField(PackageName, new GUIContent("Package Name"));
        EditorGUILayout.PropertyField(SRPType, GUIContent.none, GUILayout.Width(80));
        EditorGUILayout.EndHorizontal();
        
        EditorGUILayout.PropertyField(DEPackage, new GUIContent("Asset"));
        
        EditorGUILayout.EndVertical();
        
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField("Supported Unity Versions", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
            currentMenu.unityCycle.Add(MenuPathsCycles.Cycle2019_1);

        EditorGUILayout.EndHorizontal();
        
        for (int j = 0; j < Cycle.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();
            
            EditorGUILayout.PropertyField(Cycle.GetArrayElementAtIndex(j), GUIContent.none, GUILayout.Width(100));
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                currentMenu.unityCycle.Remove(currentMenu.unityCycle[j]);
            
            EditorGUILayout.EndHorizontal();
        }

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField("Unity Package Paths", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
            currentMenu.packagePaths.Add("");

        EditorGUILayout.EndHorizontal();

        for (int j = 0; j < Package.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.LabelField(new GUIContent("Package Path " + j + ":", Package.GetArrayElementAtIndex(j).stringValue), EditorStyles.miniLabel, LabelWidth);
            EditorGUILayout.PropertyField(Package.GetArrayElementAtIndex(j), GUIContent.none);
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                currentMenu.packagePaths.Remove(currentMenu.packagePaths[j]);
            if (j > 0)
                if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                    currentMenu.packagePaths.Move(j, Mathf.Clamp(j - 1, 0, Package.arraySize));
            if (j < Package.arraySize - 1)
                if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                    currentMenu.packagePaths.Move(j, Mathf.Clamp(j + 1, 0, Package.arraySize));

            EditorGUILayout.EndHorizontal();
        }

    }
   
    /// <summary>
    /// All 2019+ Scenes
    /// </summary>
    /// <param name="Scenes2019">2019+ Scenes</param>
    /// <param name="SceneNames2019">2019+ Scene Names</param>
    /// <param name="Package">All Packagrs</param>
    /// <param name="currentMenu">curent Menu Path</param>
    public void Unity2019ScenesGUI(SerializedProperty Scenes2019, SerializedProperty SceneNames2019, SerializedProperty Package, MenuPaths currentMenu)
    {
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("Unity 2019 and newer Scenes", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
        {
            currentMenu.scenePaths2019.Add("");
            currentMenu.names2019.Add("");
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField(new GUIContent("Scene Name"), EditorStyles.miniLabel, LabelWidth);
        EditorGUILayout.LabelField(new GUIContent("Scene Path"), EditorStyles.miniLabel, LabelWidth);
        GUILayout.Space(size);

        EditorGUILayout.EndHorizontal();

        for (int j = 0; j < Scenes2019.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.PropertyField(SceneNames2019.GetArrayElementAtIndex(j), GUIContent.none, LabelWidth);
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(Scenes2019.GetArrayElementAtIndex(j), new GUIContent("", Scenes2019.GetArrayElementAtIndex(j).stringValue));
            if (EditorGUI.EndChangeCheck())
            {
                SceneNames2019.GetArrayElementAtIndex(j).stringValue = Path.GetFileNameWithoutExtension(Scenes2019.GetArrayElementAtIndex(j).stringValue).AddSpacesToSentence();
            }
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
            {
                currentMenu.scenePaths2019.Remove(currentMenu.scenePaths2019[j]);
                currentMenu.names2019.Remove(currentMenu.names2019[j]);
            }
            if (j > 0)
                if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2019.Move(j, Mathf.Clamp(j - 1, 0, Scenes2019.arraySize));
                    currentMenu.names2019.Move(j, Mathf.Clamp(j - 1, 0, Scenes2019.arraySize));
                }
            if (j < Package.arraySize - 1)
                if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2019.Move(j, Mathf.Clamp(j + 1, 0, Scenes2019.arraySize));
                    currentMenu.names2019.Move(j, Mathf.Clamp(j + 1, 0, Scenes2019.arraySize));
                }

            EditorGUILayout.EndHorizontal();
        }
    }
        
    private GUIStyle ButtonRemoveGUI()
    {
        var gs = new GUIStyle(GUI.skin.button);
        gs.alignment = TextAnchor.MiddleCenter;
        gs.fontStyle = FontStyle.Bold;
        gs.normal.textColor = Color.red;
        gs.fontSize = 16;
        return gs;
    }
    private GUIStyle ButtonAddGUI()
    {
        var gs = new GUIStyle(GUI.skin.button);
        gs.alignment = TextAnchor.MiddleCenter;
        gs.fontStyle = FontStyle.Bold;
        gs.normal.textColor = Color.green;
        gs.fontSize = 16;
        return gs;
    }
}
#endif