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

using System.IO;
using System.Collections.Generic;
using System.Linq;
using DEEnvironmentCore.GraphicalUserInterface;
using DEEnvironmentCore.Containers;
using DEEnvironmentCore.Lights;
using DEEnvironmentCore.Utils;
using UnityEditor.Rendering;
using UnityEngine.Rendering;

public class DE_EnvironmentMenu : EditorWindow
{
    public static string Version
    {
        get
        {
            return DEEnvironmentCore.SchematicVersionControl.VERSION;
        }
    }
    
    // Editor Window
    public static readonly Vector2 EditorWindowSize = new Vector2(512, 512);
    private static int mainToolbar = 0;

    // GUI
    private Vector2 scrollPos = Vector2.zero;
    
    private MenuPathsRenderPipeline pipeline;
    private DEPackages package;
    
    private static bool foldoutPackages = true, foldoutScene, foldoutLighting, foldoutRendering;

    private DEEnvironmentGUI.AboutGUI aboutGUI;
    private DEEnvironmentGUI.MainGUI mainGUI;

    // Lighting Settings
    private DE_RenderingPath renderingPath;
    private DE_ColorSpace colorSpace;

    // Editor
    private DE_EnvironmentMenuPath paths;

    private List<string> toolbarNames;
    private List<System.Action> toolbarActions;

    private List<DEPackages> existingPackages;
    string Path => System.IO.Path.Combine("Assets", "DE Environment", "Assets", "Scripts Tools", "DE Shaders Path.asset");
    
    [MenuItem("Window/DE Environment/DE Environment Wizard...", priority = -111)]
    public static void Init()
    {
        var window = GetWindow(typeof(DE_EnvironmentMenu), true, "Install Wizard" + Version);

        window.minSize = EditorWindowSize;
        window.maxSize = EditorWindowSize;
        window.Show();
    }

    private void OnEnable()
    {
        //renderingPath = DE_Lights.GetRenderingPath();
        //colorSpace = DE_Lights.GetColorSpace();
        existingPackages = new List<DEPackages>();
        
        var path = System.IO.Path.Combine("Assets", "DE Environment", "Assets", "Scripts Tools", "DE Shaders Path.asset");
        if (!paths)
            paths = (DE_EnvironmentMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_EnvironmentMenuPath));

        foreach (var p in paths.Paths)
        {
            foreach (var pp in p.packagePaths)
            {
                if (File.Exists(System.IO.Path.Combine(Application.dataPath.Remove(Application.dataPath.Length-7,7), pp)))
                {
                    switch (p.DEPackage)
                    {
                        case DEPackages.DEEnvironment:
                            if (!existingPackages.Contains(DEPackages.DEEnvironment))
                                existingPackages.Add(DEPackages.DEEnvironment);
                            break;
                        case DEPackages.DEStudio:
                            if(!existingPackages.Contains(DEPackages.DEStudio))
                                existingPackages.Add(DEPackages.DEStudio);
                            break;
                        case DEPackages.DEBicubic:
                            if(!existingPackages.Contains(DEPackages.DEBicubic))
                                existingPackages.Add(DEPackages.DEBicubic);
                            break;
                        case DEPackages.DEAutomotive:
                            if (!existingPackages.Contains(DEPackages.DEAutomotive))
                                existingPackages.Add(DEPackages.DEAutomotive);
                            break;
                        case DEPackages.DEToon:
                            if(!existingPackages.Contains(DEPackages.DEToon))
                                existingPackages.Add(DEPackages.DEToon);
                            break;
                        case DEPackages.DEDecal:
                            if(!existingPackages.Contains(DEPackages.DEDecal))
                                existingPackages.Add(DEPackages.DEDecal);
                            break;
                        case DEPackages.DEDigital:
                            if(!existingPackages.Contains(DEPackages.DEDigital))
                                existingPackages.Add(DEPackages.DEDigital);
                            break;
                        case DEPackages.DEDissolve:
                            if(!existingPackages.Contains(DEPackages.DEDissolve))
                                existingPackages.Add(DEPackages.DEDissolve);
                            break;
                        case DEPackages.DEFabric:
                            if(!existingPackages.Contains(DEPackages.DEFabric))
                                existingPackages.Add(DEPackages.DEFabric);
                            break;
                        case DEPackages.DEGlass:
                            if(!existingPackages.Contains(DEPackages.DEGlass))
                                existingPackages.Add(DEPackages.DEGlass);
                            break;
                        case DEPackages.DEHologram:
                            if(!existingPackages.Contains(DEPackages.DEHologram))
                                existingPackages.Add(DEPackages.DEHologram);
                            break;
                        case DEPackages.DEIce:
                            if(!existingPackages.Contains(DEPackages.DEIce))
                                existingPackages.Add(DEPackages.DEIce);
                            break;
                        case DEPackages.DEMobile:
                            if(!existingPackages.Contains(DEPackages.DEMobile))
                                existingPackages.Add(DEPackages.DEMobile);
                            break;
                        case DEPackages.DEParallax:
                            if(!existingPackages.Contains(DEPackages.DEParallax))
                                existingPackages.Add(DEPackages.DEParallax);
                            break;
                        case DEPackages.DEPolybrush:
                            if(!existingPackages.Contains(DEPackages.DEPolybrush))
                                existingPackages.Add(DEPackages.DEPolybrush);
                            break;
                        case DEPackages.DERain:
                            if(!existingPackages.Contains(DEPackages.DERain))
                                existingPackages.Add(DEPackages.DERain);
                            break;
                        case DEPackages.DEStochastic:
                            if(!existingPackages.Contains(DEPackages.DEStochastic))
                                existingPackages.Add(DEPackages.DEStochastic);
                            break;
                        case DEPackages.DETerrain:
                            if(!existingPackages.Contains(DEPackages.DETerrain))
                                existingPackages.Add(DEPackages.DETerrain);
                            break;
                        case DEPackages.DETriplanar:
                            if(!existingPackages.Contains(DEPackages.DETriplanar))
                                existingPackages.Add(DEPackages.DETriplanar);
                            break;
                        case DEPackages.DETwoSided:
                            if(!existingPackages.Contains(DEPackages.DETwoSided))
                                existingPackages.Add(DEPackages.DETwoSided);
                            break;
                        case DEPackages.DEUVReveal:
                            if(!existingPackages.Contains(DEPackages.DEUVReveal))
                                existingPackages.Add(DEPackages.DEUVReveal);
                            break;
                            case DEPackages.DEVectorDisplacement:
                            if(!existingPackages.Contains(DEPackages.DEVectorDisplacement))
                                existingPackages.Add(DEPackages.DEVectorDisplacement);
                            break;
                        case DEPackages.DEVegetation:
                            if(!existingPackages.Contains(DEPackages.DEVegetation))
                                existingPackages.Add(DEPackages.DEVegetation);
                            break;
                        case DEPackages.DEWater:
                            if(!existingPackages.Contains(DEPackages.DEWater))
                                existingPackages.Add(DEPackages.DEWater);
                            break;
                        case DEPackages.DEPortal:
                            if (!existingPackages.Contains(DEPackages.DEPortal))
                                existingPackages.Add(DEPackages.DEPortal);
                            break;
                            //default:
                            //throw new ArgumentOutOfRangeException();
                    }
                }
            }
        }
    }
    public void OnGUI()
    {


        if (mainGUI == null)
        {
            aboutGUI = new DEEnvironmentGUI.AboutGUI(
            "Install Wizard",
            "DE Environment Shaders",
            Version,
            new string[] { "Daniel Wipf", "David Olshefski" },
            new string[] { "Daniel Wipf" },
            new string[] { "VRFX Realtime Studio GmbH", "Grimselweg 5", "6005 Luzern", "Switzerland" },
            "https://www.vrfxrealtimestudio.com/",
            "daniel@vrfx.ch"
            );

            SetupMainGUI();

            mainGUI = new DEEnvironmentGUI.MainGUI(
                mainToolbar: ref mainToolbar,
                toolbarNames: toolbarNames.ToArray(),
                actions: toolbarActions.ToArray(),
                name: "Install Wizard",
                version: Version,
                editorWindowSize: EditorWindowSize,
                IconfileName: paths.icon,
                publisherLink: "https://assetstore.unity.com/publishers/50363",
                discordLink: "https://discord.gg/W7VThzw",
                websiteLink: "http://deenvironment.net",
                mailLink: "Support@DEenvironment.net",
                publisher: "DE Environment"
                );
        }
        if (mainGUI != null)
            mainGUI.OnGUI();
    }
    private void SetupMainGUI()
    {
        var path = System.IO.Path.Combine("Assets", "DE Environment", "Assets", "Scripts Tools", "DE Shaders Path.asset");
        if (!paths)
            paths = (DE_EnvironmentMenuPath)AssetDatabase.LoadAssetAtPath(path, typeof(DE_EnvironmentMenuPath));
        toolbarNames = new List<string>();
        toolbarActions = new List<System.Action>();

        if (paths.Info_Slot_0.enabled)
        {
            toolbarNames.Add(paths.Info_Slot_0.tabName);
            toolbarActions.Add(paths.Info_Slot_0.OnGUI);
        }
        toolbarNames.Add("Setup");
        toolbarActions.Add(delegate { SetupGUI("DE Shaders Path.asset"); });
        if (paths.Info_Slot_1.enabled)
        {
            toolbarNames.Add(paths.Info_Slot_1.tabName);
            toolbarActions.Add(paths.Info_Slot_1.OnGUI);
        }
        if (paths.Info_Slot_2.enabled)
        {
            toolbarNames.Add(paths.Info_Slot_2.tabName);
            toolbarActions.Add(paths.Info_Slot_2.OnGUI);
        }
        if (paths.Info_Slot_3.enabled)
        {
            toolbarNames.Add(paths.Info_Slot_3.tabName);
            toolbarActions.Add(paths.Info_Slot_3.OnGUI);
        }
        if (paths.Info_Slot_4.enabled)
        {
            toolbarNames.Add(paths.Info_Slot_4.tabName);
            toolbarActions.Add(paths.Info_Slot_4.OnGUI);
        }

        toolbarNames.Add("About");
        toolbarActions.Add(aboutGUI.OnGUI);
     
    }
    
    void SetupGUI(string pathPackageName)
    {
        int width = 80;
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUIStyle.none, GUIStyle.none);
        if (!paths)
        {
            paths = (DE_EnvironmentMenuPath)AssetDatabase.LoadAssetAtPath(Path, typeof(DE_EnvironmentMenuPath));
        }
        if (!paths)
        {
            EditorGUILayout.LabelField($"{pathPackageName} does not exist!", EditorStyles.boldLabel);
            EditorGUILayout.LabelField("Please create or move it to:", EditorStyles.miniBoldLabel);
            EditorGUILayout.LabelField(Path, EditorStyles.miniBoldLabel);
        }
        else
        {
            foldoutPackages = EditorGUILayout.Foldout(foldoutPackages, new GUIContent("Setup Import Packages"));
            
            if (foldoutPackages)
            {
                if (paths.Paths.Count > 0)
                {
                    EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));

                    var GSP = GUI.skin.button;
                    GSP.richText = true;
                    pipeline =  (MenuPathsRenderPipeline) EditorGUILayout.EnumPopup(new GUIContent("Render Pipeline"), pipeline);
                    package = (DEPackages) EditorGUILayout.EnumPopup(new GUIContent("Asset"), package);
                    var bHeight = 375/4;
                    switch (package)
                    {
                        case DEPackages.DEEnvironment:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEEnvironment.GetTexture2D()), GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEStudio:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEStudio.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEBicubic:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEBicubic.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEAutomotive:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEAutomotive.GetTexture2D()), GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEToon:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEToon.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEDecal:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEDecal.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEDigital:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEDigital.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEDissolve:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEDissolve.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEFabric:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEFabric.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEGlass:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEGlass.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEHologram:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEHologram.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEIce:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEIce.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEMobile:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEMobile.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEParallax:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEParallax.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEPolybrush:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEPolybrush.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DERain:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDERain.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEStochastic:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEStochastic.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DETerrain:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDETerrain.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DETriplanar:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDETriplanar.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DETwoSided:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDETwoSided.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEUVReveal:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEUVReveal.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEVectorDisplacement:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEVectorDisplacement.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEVegetation:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEVegetation.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEWater:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEWater.GetTexture2D()),GUILayout.Height(bHeight));
                            break;
                        case DEPackages.DEPortal:
                            EditorGUILayout.LabelField(new GUIContent(paths.BannerDEPortal.GetTexture2D()), GUILayout.Height(bHeight));
                            break;

                    }

                    EditorGUILayout.BeginHorizontal();
                    
                    EditorGUILayout.LabelField("Setup - Import Packages");
                    if(existingPackages.Contains(package))
                    {
                        if (GUILayout.Button("<color=red>Import</color>"))
                        {
                            LoadPackages(paths.Paths);
                        }
                    }
                    else
                    {
                        if (GUILayout.Button("<color=orange>Buy</color>"))
                        {
                            Application.OpenURL(mainGUI.publisherLink);
                        }
                    }
                    EditorGUILayout.EndHorizontal();
                    EditorGUILayout.EndVertical();
                }
            }

            foldoutScene = EditorGUILayout.Foldout(foldoutScene, new GUIContent("Load Demo Scenes"));
            if (foldoutScene)
            {
                if (paths.Paths.Count > 0)
                {
                    EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));
                    LoadScenesGUI(width);
                    EditorGUILayout.EndVertical();
                }
            }
            foldoutLighting = EditorGUILayout.Foldout(foldoutLighting, new GUIContent("Setup Lighting"));
            if (foldoutLighting)
            {
                LightSetupGUI();
            }
        }
        
        EditorGUILayout.EndScrollView();
    }

    private void LoadScenesGUI(int width)
    {
        pipeline =  (MenuPathsRenderPipeline) EditorGUILayout.EnumPopup(new GUIContent("Render Pipeline"), pipeline);
        package = (DEPackages) EditorGUILayout.EnumPopup(new GUIContent("Asset"), package);
        EditorGUILayout.Space();
        foreach (var path in from path in paths.Paths where path.DEPackage == package && path.renderPipeline == pipeline select path)
        {
            foreach (var cycle in path.unityCycle)
            {
                Load(cycle, path.names2019, path.scenePaths2019);
            }

            void Load(MenuPathsCycles cycle ,List<string> names, List<string> scenes)
            {
                if(cycle == GetCycle())
                {
                    for (int j = 0; j < scenes.Count; j++)
                    {
                        EditorGUILayout.BeginHorizontal();
                        EditorGUILayout.LabelField(names[j], DEEnvironmentStyles.LabelStyle(false, 10));
                        if (GUILayout.Button("Load",
                            DEEnvironmentStyles.ButtonStyle(false, 9, alignment: TextAnchor.MiddleCenter),
                            GUILayout.Width(width)))
                        {
                            if (scenes[j] != "")
                                scenes[j].LoadScene();
                        }
                        EditorGUILayout.EndHorizontal();
                    }
                }
            }
        }
    }
    private void LoadPackages(List<MenuPaths> paths)
    {
        AssetDatabase.StartAssetEditing();
        foreach (var path in from path in paths where path.DEPackage == package && path.renderPipeline == pipeline select path)
        {
            foreach (var pack in from pack in path.packagePaths where pack != "" select pack)
            {
                foreach (var cycle in from cycle in path.unityCycle where cycle == GetCycle() select pack)
                {
                    {
                        AssetDatabase.ImportPackage(pack, false);
                    }
                }               
            }
        }
        AssetDatabase.StopAssetEditing();
        AssetDatabase.Refresh();
    }
    private void LightSetupGUI()
    {
        var popupWidth = 120;
        EditorGUILayout.BeginVertical("tooltip", GUILayout.Width(375));

        EditorGUILayout.LabelField("Global Light Settings", EditorStyles.boldLabel);
        DE_Lights.UseLinearIntensity();
        DE_Lights.UseColorTemperature();
        DE_Lights.BakeLight(popupWidth);
            
        EditorGUILayout.Space();
        EditorGUILayout.EndVertical();
    }
#region [Startup]

    private MenuPathsCycles GetCycle()
    {
        var cycle = MenuPathsCycles.Cycle2019_1;
#if UNITY_2019_1
        cycle = MenuPathsCycles.Cycle2019_1;
#elif UNITY_2019_2
        cycle = MenuPathsCycles.Cycle2019_2;
#elif UNITY_2019_3
        cycle = MenuPathsCycles.Cycle2019_3;
#elif UNITY_2019_4
        cycle = MenuPathsCycles.Cycle2019_4;
#elif UNITY_2020_1
        cycle = MenuPathsCycles.Cycle2020_1;
#elif UNITY_2020_2
        cycle = MenuPathsCycles.Cycle2020_2;
#elif UNITY_2020_3
        cycle = MenuPathsCycles.Cycle2020_3;
#elif UNITY_2021_1
        cycle = MenuPathsCycles.Cycle2021_1;
#elif UNITY_2021_2
        cycle = MenuPathsCycles.Cycle2021_2;
#elif UNITY_2021_3
        cycle = MenuPathsCycles.Cycle2021_3;
#elif UNITY_2022_1
        cycle = MenuPathsCycles.Cycle2022_1;
#elif UNITY_2022_2
        cycle = MenuPathsCycles.Cycle2022_2;
#elif UNITY_2022_3
        cycle = MenuPathsCycles.Cycle2022_3;
#elif UNITY_2023_1
        cycle = MenuPathsCycles.Cycle2023_1;
#elif UNITY_2023_2
        cycle = MenuPathsCycles.Cycle2023_2;
#elif UNITY_6000_0
        cycle = MenuPathsCycles.Cycle6000_0;
#endif
        return cycle;
    }
}
#endregion
#endif