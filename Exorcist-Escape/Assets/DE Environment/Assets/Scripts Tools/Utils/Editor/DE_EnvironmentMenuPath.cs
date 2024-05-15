/*  
    10/28/2021
    support: David Olshefski - http://deenvironment.net/
*/

#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;
using System.Collections.Generic;

using DEEnvironmentCore.Containers;

public class DE_EnvironmentMenuPath : ScriptableObject
{
    public string password;
    public List<MenuPaths> Paths = new List<MenuPaths>();
    
    public ManagerInfo Info_Slot_0, Info_Slot_1, Info_Slot_2, Info_Slot_3, Info_Slot_4;

    public string icon = "";
    public string
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

    public int Count 
    { 
        get 
        { 
            return Paths.Count; 
        } 
    }
    [MenuItem("Assets/DE Environment/Lock File")]
    public static void LockFile()
    {
        EditorPrefs.DeleteKey("DE_SHADERS_PASSWORD");
    }
}
#endif