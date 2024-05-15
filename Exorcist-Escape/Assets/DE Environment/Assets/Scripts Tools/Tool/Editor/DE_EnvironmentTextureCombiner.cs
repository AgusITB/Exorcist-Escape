/*  
    01/19/2023
    support: David Olshefski - http://deenvironment.com/
*/

#if UNITY_EDITOR
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;

#region Enum
    /// <summary>
    /// TextureSize
    /// </summary>
    public enum TextureSize
    {
        _128, _256, _512, _1024, _2048, _4096
    }
    /// <summary>
    /// In texture Channels
    /// </summary>
    public enum IN_TextureChannels
    {
        R, G, B, A, RGB, RGBA
    }
    /// <summary>
    /// Out Texture Channels
    /// </summary>
    public enum OUT_TextureChannels
    {
        R, G, B, A
    }
    public enum ShaderInUse
    {
        DEMask,
        TVEMask,
        UnityTerrainMask,
        UnityHDRPFabricMask,
        UnityHDRPFabricThread,
        UnityMODSMaskMap,
        UnityHDRPDetailMap

}
#endregion
    /// <summary>
    /// Texture Combiner
    /// </summary>
    public struct DE_EnvironmentTextureCombinerPreset
    {
        public string name;
        public string TEXNAME_0, TEXNAME_1, TEXNAME_2, ALPHA_NAME;
    }

/// <summary>
/// Texture Combiner
/// </summary>
public class DE_EnvironmentTextureCombiner : EditorWindow
{
    private string DETC_Version
    {
        get { return DEEnvironmentCore.SchematicVersionControl.VERSION; }
    }

    #region InTextureChannels

    public TextureSize TexSize = TextureSize._2048;
    public ShaderInUse ShaderInuse = ShaderInUse.DEMask;
    public IN_TextureChannels IN_TEX0 = IN_TextureChannels.RGBA;
    public IN_TextureChannels IN_TEX1 = IN_TextureChannels.RGBA;
    public IN_TextureChannels IN_TEX2 = IN_TextureChannels.RGBA;
    public IN_TextureChannels IN_ALPHA = IN_TextureChannels.RGBA;

    #endregion

    #region OutTextureChannels

    public OUT_TextureChannels OUT_TEX0 = OUT_TextureChannels.R;
    public OUT_TextureChannels OUT_TEX1 = OUT_TextureChannels.G;
    public OUT_TextureChannels OUT_TEX2 = OUT_TextureChannels.B;
    public OUT_TextureChannels OUT_ALPHA = OUT_TextureChannels.A;

    #endregion

    #region PublicVariables

    public DE_EnvironmentTextureCombinerPreset TCP, DEMask, TVEMask, UnityTerrainMask, UnityHDRPFabricMask, UnityHDRPFabricThread, UnityMODSMaskMap, UnityHDRPDetailMap;
    public Texture2D TEX0, TEX1, TEX2, ALPHA;
    public Texture2D OUT_TEX;

    #endregion

    #region PrivateVariables

    private GUIStyle TCPStyle;
    private GUIStyle SaveButton;
    private GUIStyle EnumChannel;
    private Texture2D PREVIEW_TEX;
    private int size;
    private float ratio = 1;
    private string SaveFilePath;
    private GUIStyle subtitle;

    #endregion

    #region Texture Combiner

    [MenuItem("Window/DE Environment/Tools/Open Texture Combiner...", priority = 1)]
    public static void init()
    {
        var window = EditorWindow.GetWindow(typeof(DE_EnvironmentTextureCombiner), false, "Texture Combiner");
        window.Show();
    }

    /// <summary>
    /// On Enable
    /// </summary>
    private void OnEnable()
    {
        TexturePresets();
        TCP = DEMask;
        CreateTexture(true);
    }

    /// <summary>
    /// On GUI
    /// </summary>
    void OnGUI()
    {
        EditorGUI.BeginChangeCheck();
        Styling();
        EditorGUILayout.Space();
        PreviewProperties();
        EditorGUILayout.Space();
        TextureProperties();
        EditorGUILayout.Space();
        if (EditorGUI.EndChangeCheck())
        {
            CreateTexture(true);
        }
    }

    /// <summary>
    /// Texture Presets
    /// </summary>
    void TexturePresets()
    {
        DEMask = new DE_EnvironmentTextureCombinerPreset
        {
            name = "DE Mask",
            TEXNAME_0 = "(R) Ambient Occlusion",
            TEXNAME_1 = "(G) Smoothness",
            TEXNAME_2 = "(B) Metallic / Gloss",
            ALPHA_NAME = "(A) Blank Not Used"
        };
        TVEMask = new DE_EnvironmentTextureCombinerPreset
        {
            name = "TVE Mask",
            TEXNAME_0 = "(R) Metallic",
            TEXNAME_1 = "(G) Ambient Occlusion",
            TEXNAME_2 = "(B) Translucency",
            ALPHA_NAME = "(A) Smoothness"
        };
        UnityTerrainMask = new DE_EnvironmentTextureCombinerPreset
        {
            name = "Unity Terrain Mask",
            TEXNAME_0 = "(R) Metallic",
            TEXNAME_1 = "(G) Ambient Occlusion",
            TEXNAME_2 = "(B) Height",
            ALPHA_NAME = "(A) Smoothness / Roughness"
        };
        UnityHDRPFabricMask = new DE_EnvironmentTextureCombinerPreset
        {
            name = "Unity HDRP Fabric Mask",
            TEXNAME_0 = "(R) Blank Not Used",
            TEXNAME_1 = "(G) Ambient Occlusion",
            TEXNAME_2 = "(B) Blank Not Used",
            ALPHA_NAME = "(A) Smoothness / Roughness"
        };
        UnityHDRPFabricThread = new DE_EnvironmentTextureCombinerPreset
        {
            name = "Unity HDRP Fabric Thread",
            TEXNAME_0 = "(R) Ambient Occlusion",
            TEXNAME_1 = "(G) Height (used for normal mapping)",
            TEXNAME_2 = "(B) Smoothness / Roughness",
            ALPHA_NAME = "(A) Blank Not Used"
        };
        UnityMODSMaskMap = new DE_EnvironmentTextureCombinerPreset
        {
            name = "Unity MODS Mask Map",
            TEXNAME_0 = "(R) Metallic",
            TEXNAME_1 = "(G) Ambient Occlusion",
            TEXNAME_2 = "(B) Detail Mask",
            ALPHA_NAME = "(A) Smoothness"
        };
        UnityHDRPDetailMap = new DE_EnvironmentTextureCombinerPreset
        {
            name = "Unity HDRP Detail Map",
            TEXNAME_0 = "(R) Desaturated Albedo",
            TEXNAME_1 = "(G) Normal Y",
            TEXNAME_2 = "(B) Smoothness",
            ALPHA_NAME = "(A) Normal X"
        };
    }

    #endregion

    #region [Draw OnGUI Properties]

    /// <summary>
    /// Texture Properties
    /// </summary>
    void TextureProperties()
    {
        GenerateObjectFieldStyle();

        EditorGUILayout.BeginHorizontal(GUILayout.Width(385));
        TextureField(TCP.TEXNAME_0, ref TEX0);
        EditorGUILayout.BeginVertical();
        GUILayout.Space(20);
        EditorGUILayout.BeginHorizontal();
        IN_TEX0 = (IN_TextureChannels) EditorGUILayout.EnumPopup(IN_TEX0, EnumChannel);
        InputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        OUT_TEX0 = (OUT_TextureChannels) EditorGUILayout.EnumPopup(OUT_TEX0, EnumChannel);
        OutputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal(GUILayout.Width(385));
        TextureField(TCP.TEXNAME_1, ref TEX1);
        EditorGUILayout.BeginVertical();
        GUILayout.Space(20);
        EditorGUILayout.BeginHorizontal();
        IN_TEX1 = (IN_TextureChannels) EditorGUILayout.EnumPopup(IN_TEX1, EnumChannel);
        InputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        OUT_TEX1 = (OUT_TextureChannels) EditorGUILayout.EnumPopup(OUT_TEX1, EnumChannel);
        OutputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal(GUILayout.Width(385));
        TextureField(TCP.TEXNAME_2, ref TEX2);
        EditorGUILayout.BeginVertical();
        GUILayout.Space(20);
        EditorGUILayout.BeginHorizontal();
        IN_TEX2 = (IN_TextureChannels) EditorGUILayout.EnumPopup(IN_TEX2, EnumChannel);
        InputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        OUT_TEX2 = (OUT_TextureChannels) EditorGUILayout.EnumPopup(OUT_TEX2, EnumChannel);
        OutputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal(GUILayout.Width(385));
        TextureField(TCP.ALPHA_NAME, ref ALPHA);
        EditorGUILayout.BeginVertical();
        GUILayout.Space(20);
        EditorGUILayout.BeginHorizontal();
        IN_ALPHA = (IN_TextureChannels) EditorGUILayout.EnumPopup(IN_ALPHA, EnumChannel);
        InputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        OUT_ALPHA = (OUT_TextureChannels) EditorGUILayout.EnumPopup(OUT_ALPHA, EnumChannel);
        OutputChannel();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();

        var gs = new GUIStyle(GUI.skin.label);
        gs.richText = true;
        if (!CheckOutput())
        {
            EditorGUILayout.LabelField("<b><color=red>RGBA Output Channels can only be used once!</color></b>", gs);
        }
    }

    /// <summary>
    /// Generate Object Field Styles
    /// </summary>
    public void GenerateObjectFieldStyle()
    {
        EnumChannel = new GUIStyle(EditorStyles.popup);
        EnumChannel.fixedWidth = 80;
        EnumChannel.fixedHeight = 20;
        EnumChannel.clipping = TextClipping.Overflow;
        TCPStyle = new GUIStyle(GUI.skin.label);
        TCPStyle.alignment = TextAnchor.UpperLeft;
        TCPStyle.clipping = TextClipping.Overflow;
        TCPStyle.fontStyle = FontStyle.Bold;
        TCPStyle.fixedWidth = 10;
    }

    /// <summary>
    /// Texture Field
    /// </summary>
    /// <param name="name"></param>
    /// <param name="texture"></param>
    /// <returns></returns>
    private void TextureField(string name, ref Texture2D texture)
    {
        GUILayout.Space(15);
        GUILayout.BeginVertical();
        GUILayout.Label(name, TCPStyle);
        texture = (Texture2D) EditorGUILayout.ObjectField(texture, typeof(Texture2D), false, GUILayout.Width(70),
            GUILayout.Height(70));
        GUILayout.EndVertical();
        //  return result;
    }

    /// <summary>
    /// Object Field Content
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public GUIContent ObjectFieldContent(string name)
    {
        return new GUIContent("", "Put a " + name + " texture in here!");
    }

    /// <summary>
    /// Input Channel
    /// </summary>
    public void InputChannel()
    {
        EditorGUILayout.LabelField(new GUIContent("Input Channel"), subtitle);
    }

    /// <summary>
    /// Output Channel
    /// </summary>
    public void OutputChannel()
    {
        EditorGUILayout.LabelField(
            new GUIContent("Output Channel",
                "The output channels can only be asigned once => rgba. For example rrba is not a valid output choice!"),
            subtitle);
    }

    /// <summary>
    /// Displaying Block of Name, Texture In and Output of the Textures!
    /// </summary>
    /// <param name="TCPName">Name of the property.</param>
    /// <param name="tex">Texture Input.</param>
    /// <param name="inChannel">In channel.</param>
    /// <param name="outChannel">Out channel.</param>
    /// <param name="includeTitles">If set to <c>true</c> include Main Titles (Only used on the first block).</param>
    void GUIProperty(string TCPName, Texture2D tex, IN_TextureChannels inChannel, OUT_TextureChannels outChannel,
        bool includeTitles = false)
    {


        if (includeTitles)
        {

        }


    }

    /// <summary>
    /// Preview Properties
    /// </summary>
    void PreviewProperties()
    {
        EditorGUILayout.BeginHorizontal(GUILayout.Width(30));
        GUILayout.Space(15);
        EditorGUILayout.BeginVertical();
        GUILayout.Label(new GUIContent("Preview Texture", "Preview of the Output Texture (scaled to 2048 pixels)"),
            subtitle);
        GUILayout.Label(new GUIContent(PREVIEW_TEX), GUILayout.Width(120), GUILayout.Height(120));
        EditorGUILayout.EndVertical();
        EditorGUILayout.BeginVertical();
        GUILayout.Label(
            new GUIContent("Texture Output Size",
                "Size of the new generated texture, this tool will scale the texture if necessary to the new propotions!"),
            subtitle);
        TexSize = (TextureSize) EditorGUILayout.EnumPopup(TexSize, GUILayout.Width(140));
        GUILayout.Label(new GUIContent("Type", "The Type of Shader in use"), subtitle);
        EditorGUI.BeginChangeCheck();
        ShaderInuse = (ShaderInUse) EditorGUILayout.EnumPopup(ShaderInuse, GUILayout.Width(140));
        if (EditorGUI.EndChangeCheck())
        {
            switch (ShaderInuse)
            {
                case ShaderInUse.DEMask:
                    TCP = DEMask;
                    break;
                case  ShaderInUse.TVEMask:
                    TCP = TVEMask;
                    break;
                case ShaderInUse.UnityTerrainMask:
                    TCP = UnityTerrainMask;
                    break;
                case ShaderInUse.UnityHDRPFabricMask:
                    TCP = UnityHDRPFabricMask;
                    break;
                case ShaderInUse.UnityHDRPFabricThread:
                    TCP = UnityHDRPFabricThread;
                    break;
                case ShaderInUse.UnityMODSMaskMap:
                    TCP = UnityMODSMaskMap;
                    break;
                case ShaderInUse.UnityHDRPDetailMap:
                    TCP = UnityHDRPDetailMap;
                    break;   
            }
        }
        EditorGUILayout.Space();
        SaveButton = new GUIStyle(GUI.skin.button);
        SaveButton.fixedWidth = 140;

        EditorGUI.BeginDisabledGroup(!CheckOutput());
        if (GUILayout.Button(new GUIContent("Save",
            "Press the button <Save> and choose a location for storing your Masked Texture Map!")))
        {
            OUT_TEX = new Texture2D(1, 1);
            OUT_TEX.name = TCP.name;
            SaveFilePath =
                EditorUtility.SaveFilePanelInProject("Save Texture as PNG", OUT_TEX.name + "_MaskMap.png", "png", "");
            if (SaveFilePath.Length > 0)
            {
                EditorUtility.DisplayProgressBar("Saving Texture", "Progress", 0.5f);
                CreateTexture(false);
                SaveTexture();
                EditorUtility.ClearProgressBar();
            }
        }

        EditorGUI.EndDisabledGroup();

        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
    }

    #endregion

    #region [Functions]

    /// <summary>
    /// Save Texture
    /// </summary>
    /// <returns></returns>
    string SaveTexture()
    {
        if (SaveFilePath.Length != 0)
        {
            byte[] bytes = OUT_TEX.EncodeToPNG();
            File.WriteAllBytes(SaveFilePath, bytes);
            AssetDatabase.Refresh();
        }

        return SaveFilePath;
    }

    /// <summary>
    /// Create Texture
    /// </summary>
    /// <param name="preview"></param>
    void CreateTexture(bool preview)
    {

        switch (TexSize)
        {
            case TextureSize._128:
                size = 128;
                break;
            case TextureSize._256:
                size = 256;
                break;
            case TextureSize._512:
                size = 512;
                break;
            case TextureSize._1024:
                size = 1024;
                break;
            case TextureSize._2048:
                size = 2048;
                break;
            case TextureSize._4096:
                size = 4096;
                break;

        }

        if (preview)
            size = 2048;

        Texture2D ao = TEX0;
        Texture2D rgh = TEX1;
        Texture2D met = TEX2;
        Texture2D alp = ALPHA;
        if (TEX0 != null)
            ao = TextureImporterSetup(TEX0);

        if (TEX1 != null)
            rgh = TextureImporterSetup(TEX1);

        if (TEX2 != null)
            met = TextureImporterSetup(TEX2);

        if (ALPHA != null)
            alp = TextureImporterSetup(ALPHA);

        OUT_TEX = new Texture2D(Mathf.RoundToInt(size * ratio), size);

        for (int y = 0; y < OUT_TEX.height; y++)
        {
            for (int x = 0; x < OUT_TEX.width; x++)
            {
                var col = OUT_CHANNEL(IN_CHANNEL(x, y, ao, IN_TEX0), IN_CHANNEL(x, y, rgh, IN_TEX1),
                    IN_CHANNEL(x, y, met, IN_TEX2), IN_CHANNEL(x, y, alp, IN_ALPHA));
                OUT_TEX.SetPixel(x, y, col);
            }
        }

        OUT_TEX.Apply();
        if (preview)
        {
            PREVIEW_TEX = new Texture2D(Mathf.RoundToInt(size * ratio), size);
            PREVIEW_TEX = OUT_TEX;
        }
    }

    /// <summary>
    /// Texture Importer Setup
    /// </summary>
    /// <param name="texture"></param>
    /// <returns></returns>
    Texture2D TextureImporterSetup(Texture2D texture)
    {
        var SaveFilePath = AssetDatabase.GetAssetPath(texture);
        TextureImporter importer = (TextureImporter) TextureImporter.GetAtPath(SaveFilePath);
        if (!importer.isReadable)
        {
            importer.isReadable = true;
            importer.maxTextureSize = size;
            AssetDatabase.ImportAsset(SaveFilePath, ImportAssetOptions.ForceUpdate);
        }

        ratio = (float) texture.width / (float) texture.height;
        return Scaled(texture, Mathf.RoundToInt(size * ratio), size, FilterMode.Trilinear);

    }

    /// <summary>
    /// In Channel
    /// </summary>
    /// <param name="x"></param>
    /// <param name="y"></param>
    /// <param name="tex"></param>
    /// <param name="tc"></param>
    /// <returns></returns>
    float IN_CHANNEL(int x, int y, Texture2D tex, IN_TextureChannels tc)
    {
        var channel = new float();
        if (tex != null)
        {
            switch (tc)
            {
                case IN_TextureChannels.R:
                    channel = tex.GetPixel(x, y).r;
                    break;
                case IN_TextureChannels.G:
                    channel = tex.GetPixel(x, y).g;
                    break;
                case IN_TextureChannels.B:
                    channel = tex.GetPixel(x, y).b;
                    break;
                case IN_TextureChannels.A:
                    channel = tex.GetPixel(x, y).a;
                    break;
                case IN_TextureChannels.RGB:
                    var c = tex.GetPixel(x, y);
                    channel = new Color(c.r, c.g, c.b, 1).grayscale;
                    break;
                case IN_TextureChannels.RGBA:
                    channel = tex.GetPixel(x, y).grayscale;
                    break;
            }
        }
        else
        {
            channel = 1;
        }

        return channel;
    }

    /// <summary>
    /// Out Channel
    /// </summary>
    /// <param name="a"></param>
    /// <param name="b"></param>
    /// <param name="c"></param>
    /// <param name="d"></param>
    /// <returns></returns>
    Color OUT_CHANNEL(float a, float b, float c, float d)
    {
        var col = new Color();
        switch (OUT_TEX0)
        {
            case OUT_TextureChannels.R:
                col.r = a;
                break;
            case OUT_TextureChannels.G:
                col.g = b;
                break;
            case OUT_TextureChannels.B:
                col.b = c;
                break;
            case OUT_TextureChannels.A:
                col.a = d;
                break;

        }

        switch (OUT_TEX1)
        {
            case OUT_TextureChannels.R:
                col.r = a;
                break;
            case OUT_TextureChannels.G:
                col.g = b;
                break;
            case OUT_TextureChannels.B:
                col.b = c;
                break;
            case OUT_TextureChannels.A:
                col.a = d;
                break;

        }

        switch (OUT_TEX2)
        {
            case OUT_TextureChannels.R:
                col.r = a;
                break;
            case OUT_TextureChannels.G:
                col.g = b;
                break;
            case OUT_TextureChannels.B:
                col.b = c;
                break;
            case OUT_TextureChannels.A:
                col.a = d;
                break;

        }

        switch (OUT_ALPHA)
        {
            case OUT_TextureChannels.R:
                col.r = a;
                break;
            case OUT_TextureChannels.G:
                col.g = b;
                break;
            case OUT_TextureChannels.B:
                col.b = c;
                break;
            case OUT_TextureChannels.A:
                col.a = d;
                break;

        }

        return col;
    }

    #endregion

    #region [Helper Functions]

    bool CheckOutput()
    {
        List<OUT_TextureChannels> t = new List<OUT_TextureChannels>();
        t.Add(OUT_TEX0);
        t.Add(OUT_TEX1);
        t.Add(OUT_TEX2);
        t.Add(OUT_ALPHA);
        var dupe = t.GroupBy(s => s).SelectMany(grp => grp.Skip(1));
        return dupe.Count() == 0;
    }

    /// <summary>
    /// Styling
    /// </summary>
    void Styling()
    {
        var header = new GUIStyle(GUI.skin.label);
        header.fontStyle = FontStyle.Bold;
        header.fontSize = 14;
        subtitle = new GUIStyle(GUI.skin.label);
        subtitle.fixedWidth = 0;
        subtitle.clipping = TextClipping.Clip;
        subtitle.fontStyle = FontStyle.Bold;
        EditorGUILayout.LabelField("DE Environment Texture Combiner " + DETC_Version, header);
    }

    #endregion

    #region [Texture Scalar]

    /// <summary>
    /// Scaled
    /// </summary>
    /// <param name="src"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>
    /// <param name="mode"></param>
    /// <returns></returns>
    public static Texture2D Scaled(Texture2D src, int width, int height, FilterMode mode = FilterMode.Trilinear)
    {
        Rect texR = new Rect(0, 0, width, height);
        GPUScale(src, width, height, mode);

        //Get rendered data back to a new texture
        Texture2D result = new Texture2D(width, height, TextureFormat.ARGB32, true);
        result.Reinitialize(width, height);
        result.ReadPixels(texR, 0, 0, true);
        return result;
    }

    /// <summary>
    /// Scales the texture data of the given texture.
    /// </summary>
    /// <param name="tex">Texure to scale</param>
    /// <param name="width">New width</param>
    /// <param name="height">New height</param>
    /// <param name="mode">Filtering mode</param>
    public static void Scale(Texture2D tex, int width, int height, FilterMode mode = FilterMode.Trilinear)
    {
        Rect texR = new Rect(0, 0, width, height);
        GPUScale(tex, width, height, mode);
        // Update new texture
        tex.Reinitialize(width, height);
        tex.ReadPixels(texR, 0, 0, true);
        tex.Apply(true); //Remove this if you hate us applying textures for you :)
    }

    /// <summary>
    ///  Internal unility that renders the source texture into the RTT - the scaling method itself.
    /// </summary>
    /// <param name="src"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>
    /// <param name="fmode"></param>
    static void GPUScale(Texture2D src, int width, int height, FilterMode fmode)
    {
        //We need the source texture in VRAM because we render with it
        src.filterMode = fmode;
        src.Apply(true);
        //Using RTT for best quality and performance. Thanks, Unity 5
        RenderTexture rtt = new RenderTexture(width, height, 32);
        //Set the RTT in order to render to it
        Graphics.SetRenderTarget(rtt);
        //Setup 2D matrix in range 0..1, so nobody needs to care about sized
        GL.LoadPixelMatrix(0, 1, 1, 0);
        //Then clear & draw the texture to fill the entire RTT.
        GL.Clear(true, true, new Color(0, 0, 0, 0));
        Graphics.DrawTexture(new Rect(0, 0, 1, 1), src);
    }

    #endregion
}
#endif
