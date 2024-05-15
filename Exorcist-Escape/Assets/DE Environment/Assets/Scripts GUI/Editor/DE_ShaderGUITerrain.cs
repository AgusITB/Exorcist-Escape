// Support:David Olshefski http://deenvironment.net/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class DE_ShaderGUITerrain : ShaderGUI
{
    private bool defaultShaderGUI;
    private bool surfaceOptionsFoldout;
    private bool WetnessFoldout;
    private bool layerGroupFoldout = true;
    private bool[] layerFoldout = {true, true, true, true, true, true, true, true};
    private bool coverMapFoldout;
    private bool basePassFoldout;
    private bool maskDistanceFoldout;
    private bool maskCoverFoldout;
    private bool snowFoldout;
    private bool snowChannelRedFoldout;
    private bool snowChannelGreenFoldout;
    private bool snowChannelBlueFoldout;
    private bool snowChannelAlphaFoldout;
    private bool advancedFoldout;

    private GUIStyle headerFoldout;
    private GUIStyle headerLayerFoldout;
    private GUIStyle boxStyle;

    MaterialProperty globalTerrainNoise;
    MaterialProperty globalBrightness;
    MaterialProperty EnableInstancedPerPixelNormal;

    MaterialProperty WetnessIntensity;
    MaterialProperty WetnessMask;
    MaterialProperty WetnessBiasGlobal;
    MaterialProperty wetnessAffectLayer0;
    MaterialProperty wetnessAffectLayer1;
    MaterialProperty wetnessAffectLayer2;
    MaterialProperty wetnessAffectLayer3;
    MaterialProperty wetnessAffectLayer4;
    MaterialProperty wetnessAffectLayer5;
    MaterialProperty wetnessAffectLayer6;
    MaterialProperty wetnessAffectLayer7;

    MaterialProperty[] splatTint;
    MaterialProperty[] SplatTilingXStochastic;
    MaterialProperty[] SplatTilingYStochastic;
    MaterialProperty[] splatBrightness;
    MaterialProperty[] splatNormalScale;
    MaterialProperty[] splatHeightBlendStrength;
    MaterialProperty[] splatHeightBlendOffset;
    MaterialProperty[] splatMetallic;
    MaterialProperty[] splatOcclusionStrengthAO;
    MaterialProperty[] splatSaturation;
    MaterialProperty[] splatSmoothnessType;
    MaterialProperty[] splatSmoothness;
    MaterialProperty[] splatEnableNoise;
    MaterialProperty[] splatNoiseInvert;
    MaterialProperty[] splatNoiseScale;
    MaterialProperty[] splatNoiseDarken;

    private int layerCount;

    MaterialProperty coverMapTint;
    MaterialProperty coverMapAlbedo;
    MaterialProperty coverMapBrightness;
    MaterialProperty coverMapNormal;
    MaterialProperty coverMapNormalStrength;

    MaterialProperty coverMapAffectLayer0;
    MaterialProperty coverMapRangeLayer0;
    MaterialProperty coverMapFuzzinessLayer0;

    MaterialProperty coverMapAffectLayer1;
    MaterialProperty coverMapRangeLayer1;
    MaterialProperty coverMapFuzzinessLayer1;

    MaterialProperty coverMapAffectLayer2;
    MaterialProperty coverMapRangeLayer2;
    MaterialProperty coverMapFuzzinessLayer2;

    MaterialProperty coverMapAffectLayer3;
    MaterialProperty coverMapRangeLayer3;
    MaterialProperty coverMapFuzzinessLayer3;

    MaterialProperty coverMapAffectLayer4;
    MaterialProperty coverMapRangeLayer4;
    MaterialProperty coverMapFuzzinessLayer4;

    MaterialProperty coverMapAffectLayer5;
    MaterialProperty coverMapRangeLayer5;
    MaterialProperty coverMapFuzzinessLayer5;

    MaterialProperty coverMapAffectLayer6;
    MaterialProperty coverMapRangeLayer6;
    MaterialProperty coverMapFuzzinessLayer6;

    MaterialProperty coverMapAffectLayer7;
    MaterialProperty coverMapRangeLayer7;
    MaterialProperty coverMapFuzzinessLayer7;

    MaterialProperty maskDistanceEnable;
    MaterialProperty maskDistanceTint;
    MaterialProperty maskDistanceBrightness;
    MaterialProperty maskDistanceBaseColorMap;
    MaterialProperty maskDistanceUV;
    MaterialProperty maskDistanceNormalMap;
    MaterialProperty maskDistanceNormalStrength;
    MaterialProperty maskDistanceFadeMode;
    MaterialProperty maskDistanceBlendStrength;
    MaterialProperty maskDistanceFadeDistance;

    MaterialProperty GlobalColorMask;

    MaterialProperty GlobalColorRedEnable;
    MaterialProperty GlobalColorRedInverted;
    MaterialProperty GlobalColorRedColor;
    MaterialProperty GlobalColorRedStrength;
    MaterialProperty GlobalColorRedBlendAmount;
    MaterialProperty GlobalColorRedBlendHardness;
    MaterialProperty GlobalColorRedBlendFalloff;

    MaterialProperty GlobalColorGreenEnable;
    MaterialProperty GlobalColorGreenInverted;
    MaterialProperty GlobalColorGreenColor;
    MaterialProperty GlobalColorGreenStrength;
    MaterialProperty GlobalColorGreenBlendHeight;
    MaterialProperty GlobalColorGreenBlendAmount;
    MaterialProperty GlobalColorGreenBlendHardness;
    MaterialProperty GlobalColorGreenBlendFalloff;

    MaterialProperty GlobalColorBlueEnable;
    MaterialProperty GlobalColorBlueInverted;
    MaterialProperty GlobalColorBlueColor;
    MaterialProperty GlobalColorBlueStrength;
    MaterialProperty GlobalColorBlueBlendHeight;
    MaterialProperty GlobalColorBlueBlendAmount;
    MaterialProperty GlobalColorBlueBlendHardness;
    MaterialProperty GlobalColorBlueBlendFalloff;

    MaterialProperty GlobalColorAlphaEnable;
    MaterialProperty GlobalColorAlphaInverted;
    MaterialProperty GlobalColorAlphaColor;
    MaterialProperty GlobalColorAlphaStrength;
    MaterialProperty GlobalColorAlphaBlendHeight;
    MaterialProperty GlobalColorAlphaBlendAmount;
    MaterialProperty GlobalColorAlphaBlendHardness;
    MaterialProperty GlobalColorAlphaBlendFalloff;

    MaterialProperty enableBasePassCoverMap;
    MaterialProperty basePassBrightness;
    MaterialProperty basePassSmoothness;

    MaterialProperty enableSnow;
    MaterialProperty snowSplatMask;
    MaterialProperty snowAlbedoMap;
    MaterialProperty snowNormalMap;
    MaterialProperty snowNormalCompute;
    MaterialProperty snowTiling;
    MaterialProperty snowOffset;
    MaterialProperty snowGlobalSaturation;
    MaterialProperty snowGlobalWetness;

    MaterialProperty snowSplatRChannel;
    MaterialProperty snowSplatRSplatBias;
    MaterialProperty snowSplatRSnowSparkle;
    MaterialProperty snowSplatRColor;
    MaterialProperty snowSplatRBrightness;
    MaterialProperty snowSplatRNormalStrength;
    MaterialProperty snowSplatRMetallic;
    MaterialProperty snowSplatROcclusion;
    MaterialProperty SnowSplatRSmoothnessStrength;
    MaterialProperty snowSplatRBlendStrength;
    MaterialProperty snowSplatRBlendYMin;
    MaterialProperty snowSplatRBlendYMax;
    MaterialProperty snowSplatRBlendFalloff;
    MaterialProperty snowSplatRBlendFactor;

    MaterialProperty snowSplatGChannel;
    MaterialProperty snowSplatGSplatBias;
    MaterialProperty snowSplatGSnowSparkle;
    MaterialProperty snowSplatGColor;
    MaterialProperty snowSplatGBrightness;
    MaterialProperty snowSplatGNormalStrength;
    MaterialProperty snowSplatGMetallic;
    MaterialProperty snowSplatGOcclusion;
    MaterialProperty snowSplatGSmoothnessStrength;
    MaterialProperty snowSplatGBlendStrength;
    MaterialProperty snowSplatGBlendYMin;
    MaterialProperty snowSplatGBlendYMax;
    MaterialProperty snowSplatGBlendFalloff;
    MaterialProperty snowSplatGBlendFactor;

    MaterialProperty snowSplatBChannel;
    MaterialProperty snowSplatBSplatBias;
    MaterialProperty snowSplatBSnowSparkle;
    MaterialProperty snowSplatBColor;
    MaterialProperty snowSplatBBrightness;
    MaterialProperty snowSplatBNormalStrength;
    MaterialProperty snowSplatBMetallic;
    MaterialProperty snowSplatBOcclusion;
    MaterialProperty snowSplatBSmoothnessStrength;
    MaterialProperty snowSplatBBlendStrength;
    MaterialProperty snowSplatBBlendYMin;
    MaterialProperty snowSplatBBlendYMax;
    MaterialProperty snowSplatBBlendFalloff;
    MaterialProperty snowSplatBBlendFactor;

    MaterialProperty snowSplatAChannel;
    MaterialProperty snowSplatASplatBias;
    MaterialProperty snowSplatASnowSparkle;
    MaterialProperty snowSplatAColor;
    MaterialProperty snowSplatABrightness;
    MaterialProperty snowSplatANormalStrength;
    MaterialProperty snowSplatAMetallic;
    MaterialProperty snowSplatAOcclusion;
    MaterialProperty snowSplatASmoothnessStrength;
    MaterialProperty snowSplatABlendStrength;
    MaterialProperty snowSplatABlendYMin;
    MaterialProperty snowSplatABlendYMax;
    MaterialProperty snowSplatABlendFalloff;
    MaterialProperty snowSplatABlendFactor;

    MaterialProperty snowEnableHeight;
    MaterialProperty snowHeightClipFar;
    MaterialProperty snowHeightDepth;
    MaterialProperty snowSparkleTint;
    MaterialProperty snowSparkleMap;
    MaterialProperty snowSparkleIntensity;
    MaterialProperty snowSparkleFlicker;
    MaterialProperty snowSparkleCutoff;
    MaterialProperty snowSparkleFrequency;
    MaterialProperty sparkleScreenContribution;
    MaterialProperty snowSparkleAnimation;
    MaterialProperty snowSparkleSpeed;

    // URP properties
    MaterialProperty receiveShadows;
    MaterialProperty specularHighLights;
    MaterialProperty environmentReflections;

    // HDRP properties
    MaterialProperty specularOcclusionMode;
    MaterialProperty enableInstancedPerPixelNormal;
    MaterialProperty addPrecomputedVelocity;
    MaterialProperty disableDecals;
    MaterialProperty receivesSSR;
    MaterialProperty enableGeometricSpecularAA;
    MaterialProperty specularAAScreenSpaceVariance;
    MaterialProperty specularAAThreshold;

    private MaterialEditor m_MaterialEditor;
    private TerrainLayer[] terrainLayers;
    private GUIContent[] layerContents;

    private void FindProperties(MaterialProperty[] properties)
    {
        globalTerrainNoise = FindProperty("_GlobalTerrainNoise", properties, false);
        globalBrightness = FindProperty("_Global_Brightness", properties);
        EnableInstancedPerPixelNormal = FindProperty("_EnableInstancedPerPixelNormal", properties, false);

        // URP
        receiveShadows = FindProperty("_RECEIVE_SHADOWS_OFF", properties, false);
        specularHighLights = FindProperty("_SPECULARHIGHLIGHTS_OFF", properties, false);
        environmentReflections = FindProperty("_ENVIRONMENTREFLECTIONS_OFF", properties, false);

        // HDRP
        specularOcclusionMode = FindProperty("_SpecularOcclusionMode", properties, false);
        enableInstancedPerPixelNormal = FindProperty("_EnableInstancedPerPixelNormal", properties, false);
        addPrecomputedVelocity = FindProperty("_AddPrecomputedVelocity", properties, false);
        disableDecals = FindProperty("_DISABLE_DECALS", properties, false);
        receivesSSR = FindProperty("_ReceivesSSR", properties, false);
        enableGeometricSpecularAA = FindProperty("_EnableGeometricSpecularAA", properties, false);
        specularAAScreenSpaceVariance = FindProperty("_SpecularAAScreenSpaceVariance", properties, false);
        specularAAThreshold = FindProperty("_SpecularAAThreshold", properties, false);

        // Wetness
        WetnessIntensity = FindProperty("_TerrainWetnessIntensity", properties, false);
        WetnessMask = FindProperty("_TerrainWetnessMask", properties, false);
        WetnessBiasGlobal = FindProperty("_TerrainWetnessBiasGlobal", properties, false);
        wetnessAffectLayer0 = FindProperty("_TerrainWetnessAffectLayer0", properties, false);
        wetnessAffectLayer1 = FindProperty("_TerrainWetnessAffectLayer1", properties, false);
        wetnessAffectLayer2 = FindProperty("_TerrainWetnessAffectLayer2", properties, false);
        wetnessAffectLayer3 = FindProperty("_TerrainWetnessAffectLayer3", properties, false);
        wetnessAffectLayer4 = FindProperty("_TerrainWetnessAffectLayer4", properties, false);
        wetnessAffectLayer5 = FindProperty("_TerrainWetnessAffectLayer5", properties, false);
        wetnessAffectLayer6 = FindProperty("_TerrainWetnessAffectLayer6", properties, false);
        wetnessAffectLayer7 = FindProperty("_TerrainWetnessAffectLayer7", properties, false);

        for (var i = 0; i < terrainLayers.Length; ++i)
        {
            splatTint[i] = FindProperty("_Splat" + i + "_Color", properties, false);
            SplatTilingXStochastic[i] = FindProperty("_Splat" + i + "_TilingXStochastic", properties, false);
            SplatTilingYStochastic[i] = FindProperty("_Splat" + i + "_TilingYStochastic", properties, false);
            splatBrightness[i] = FindProperty("_Splat" + i + "_Brightness", properties, false);
            splatNormalScale[i] = FindProperty("_Splat" + i + "_NormalScale", properties, false);
            splatHeightBlendStrength[i] = FindProperty("_Splat" + i + "HeightBlendStrength", properties, false);
            splatHeightBlendOffset[i] = FindProperty("_Splat" + i + "HeightBlendOffset", properties, false);
            splatMetallic[i] = FindProperty("_Splat" + i + "_Metallic", properties, false);
            splatOcclusionStrengthAO[i] = FindProperty("_Splat" + i + "_OcclusionStrengthAO", properties, false);
            splatSaturation[i] = FindProperty("_Splat" + i + "_Saturation", properties, false);
            splatSmoothnessType[i] = FindProperty("_Splat" + i + "_SmoothnessType", properties, false);
            splatSmoothness[i] = FindProperty("_Splat" + i + "_Smoothness", properties, false);
            splatEnableNoise[i] = FindProperty("_Splat" + i + "_EnableNoise", properties, false);
            splatNoiseInvert[i] = FindProperty("_Splat" + i + "_NoiseInvert", properties, false);
            splatNoiseScale[i] = FindProperty("_Splat" + i + "_NoiseScale", properties, false);
            splatNoiseDarken[i] = FindProperty("_Splat" + i + "_NoiseDarken", properties, false);
        }

        coverMapTint = FindProperty("_CoverMapTint", properties, false);
        coverMapAlbedo = FindProperty("_CoverMapAlbedo", properties, false);
        coverMapBrightness = FindProperty("_CoverMapBrightness", properties, false);
        coverMapNormal = FindProperty("_CoverMapNormal", properties, false);
        coverMapNormalStrength = FindProperty("_CoverMapNormalStrength", properties, false);

        coverMapAffectLayer0 = FindProperty("_CoverMapAffectL0", properties, false);
        coverMapRangeLayer0 = FindProperty("_CoverMapRangeL0", properties, false);
        coverMapFuzzinessLayer0 = FindProperty("_CoverMapFuzzinessL0", properties, false);

        coverMapAffectLayer1 = FindProperty("_CoverMapAffectL1", properties, false);
        coverMapRangeLayer1 = FindProperty("_CoverMapRangeL1", properties, false);
        coverMapFuzzinessLayer1 = FindProperty("_CoverMapFuzzinessL1", properties, false);

        coverMapAffectLayer2 = FindProperty("_CoverMapAffectL2", properties, false);
        coverMapRangeLayer2 = FindProperty("_CoverMapRangeL2", properties, false);
        coverMapFuzzinessLayer2 = FindProperty("_CoverMapFuzzinessL2", properties, false);

        coverMapAffectLayer3 = FindProperty("_CoverMapAffectL3", properties, false);
        coverMapRangeLayer3 = FindProperty("_CoverMapRangeL3", properties, false);
        coverMapFuzzinessLayer3 = FindProperty("_CoverMapFuzzinessL3", properties, false);

        coverMapAffectLayer4 = FindProperty("_CoverMapAffectL4", properties, false);
        coverMapRangeLayer4 = FindProperty("_CoverMapRangeL4", properties, false);
        coverMapFuzzinessLayer4 = FindProperty("_CoverMapFuzzinessL4", properties, false);

        coverMapAffectLayer5 = FindProperty("_CoverMapAffectL5", properties, false);
        coverMapRangeLayer5 = FindProperty("_CoverMapRangeL5", properties, false);
        coverMapFuzzinessLayer5 = FindProperty("_CoverMapFuzzinessL5", properties, false);

        coverMapAffectLayer6 = FindProperty("_CoverMapAffectL6", properties, false);
        coverMapRangeLayer6 = FindProperty("_CoverMapRangeL6", properties, false);
        coverMapFuzzinessLayer6 = FindProperty("_CoverMapFuzzinessL6", properties, false);

        coverMapAffectLayer7 = FindProperty("_CoverMapAffectL7", properties, false);
        coverMapRangeLayer7 = FindProperty("_CoverMapRangeL7", properties, false);
        coverMapFuzzinessLayer7 = FindProperty("_CoverMapFuzzinessL7", properties, false);

        maskDistanceEnable = FindProperty("_MaskDistanceEnable", properties, false);
        maskDistanceTint = FindProperty("_MaskDistanceTint", properties, false);
        maskDistanceBrightness = FindProperty("_MaskDistanceBrightness", properties, false);
        maskDistanceBaseColorMap = FindProperty("_MaskDistanceBaseColorMap", properties, false);
        maskDistanceUV = FindProperty("_MaskDistanceUV", properties, false);
        maskDistanceNormalMap = FindProperty("_MaskDistanceNormalMap", properties, false);
        maskDistanceNormalStrength = FindProperty("_MaskDistanceNormalStrength", properties, false);
        maskDistanceFadeMode = FindProperty("_MaskDistanceFadeMode", properties, false);
        maskDistanceBlendStrength = FindProperty("_MaskDistanceBlendStrength", properties, false);
        maskDistanceFadeDistance = FindProperty("_MaskDistanceFadeDistance", properties, false);

        GlobalColorMask = FindProperty("_GlobalColorMask", properties, false);
        GlobalColorRedEnable = FindProperty("_GlobalColorRedEnable", properties, false);
        GlobalColorRedInverted = FindProperty("_GlobalColorRedInverted", properties, false);
        GlobalColorRedColor = FindProperty("_GlobalColorRedColor", properties, false);
        GlobalColorRedStrength = FindProperty("_GlobalColorRedStrength", properties, false);
        GlobalColorRedBlendAmount = FindProperty("_GlobalColorRedBlendAmount", properties, false);
        GlobalColorRedBlendHardness = FindProperty("_GlobalColorRedBlendHardness", properties, false);
        GlobalColorRedBlendFalloff = FindProperty("_GlobalColorRedBlendFalloff", properties, false);

        GlobalColorGreenEnable = FindProperty("_GlobalColorGreenEnable", properties, false);
        GlobalColorGreenInverted = FindProperty("_GlobalColorGreenInverted", properties, false);
        GlobalColorGreenColor = FindProperty("_GlobalColorGreenColor", properties, false);
        GlobalColorGreenStrength = FindProperty("_GlobalColorGreenStrength", properties, false);
        GlobalColorGreenBlendHeight = FindProperty("_GlobalColorGreenBlendHeight", properties, false);
        GlobalColorGreenBlendAmount = FindProperty("_GlobalColorGreenBlendAmount", properties, false);
        GlobalColorGreenBlendHardness = FindProperty("_GlobalColorGreenBlendHardness", properties, false);
        GlobalColorGreenBlendFalloff = FindProperty("_GlobalColorGreenBlendFalloff", properties, false);

        GlobalColorBlueEnable = FindProperty("_GlobalColorBlueEnable", properties, false);
        GlobalColorBlueInverted = FindProperty("_GlobalColorBlueInverted", properties, false);
        GlobalColorBlueColor = FindProperty("_GlobalColorBlueColor", properties, false);
        GlobalColorBlueStrength = FindProperty("_GlobalColorBlueStrength", properties, false);
        GlobalColorBlueBlendHeight = FindProperty("_GlobalColorBlueBlendHeight", properties, false);
        GlobalColorBlueBlendAmount = FindProperty("_GlobalColorBlueBlendAmount", properties, false);
        GlobalColorBlueBlendHardness = FindProperty("_GlobalColorBlueBlendHardness", properties, false);
        GlobalColorBlueBlendFalloff = FindProperty("_GlobalColorBlueBlendFalloff", properties, false);

        GlobalColorAlphaEnable = FindProperty("_GlobalColorAlphaEnable", properties, false);
        GlobalColorAlphaInverted = FindProperty("_GlobalColorAlphaInverted", properties, false);
        GlobalColorAlphaColor = FindProperty("_GlobalColorAlphaColor", properties, false);
        GlobalColorAlphaStrength = FindProperty("_GlobalColorAlphaStrength", properties, false);
        GlobalColorAlphaBlendHeight = FindProperty("_GlobalColorAlphaBlendHeight", properties, false);
        GlobalColorAlphaBlendAmount = FindProperty("_GlobalColorAlphaBlendAmount", properties, false);
        GlobalColorAlphaBlendHardness = FindProperty("_GlobalColorAlphaBlendHardness", properties, false);
        GlobalColorAlphaBlendFalloff = FindProperty("_GlobalColorAlphaBlendFalloff", properties, false);

        enableBasePassCoverMap = FindProperty("_EnableBasePassCoverMap", properties, false);
        basePassBrightness = FindProperty("_BasePassBrightness", properties, false);
        basePassSmoothness = FindProperty("_BasePassSmoothness", properties, false);

        enableSnow = FindProperty("_SnowEnable", properties, false);
        snowSplatMask = FindProperty("_SnowMapSplat", properties, false);
        snowAlbedoMap = FindProperty("_SnowMapAlbedo", properties, false);
        snowNormalMap = FindProperty("_SnowMapNormal", properties, false);
        snowNormalCompute = FindProperty("_SnowNormalCompute", properties, false);
        snowTiling = FindProperty("_SnowTiling", properties, false);
        snowOffset = FindProperty("_SnowOffset", properties, false);
        snowGlobalSaturation = FindProperty("_SnowGlobal_Saturation", properties, false);
        snowGlobalWetness = FindProperty("_SnowGlobalWetness", properties, false);

        snowSplatRChannel = FindProperty("_SnowSplatREnableChannel", properties, false);
        snowSplatRSplatBias = FindProperty("_SnowSplatRSplatBias", properties, false);
        snowSplatRSnowSparkle = FindProperty("_SnowSplatREnableSparkle", properties, false);
        snowSplatRColor = FindProperty("_SnowSplatRColor", properties, false);
        snowSplatRBrightness = FindProperty("_SnowSplatRBrightness", properties, false);
        snowSplatRNormalStrength = FindProperty("_SnowSplatRNormalStrength", properties, false);
        snowSplatRMetallic = FindProperty("_SnowSplatRMetallic", properties, false);
        snowSplatROcclusion = FindProperty("_SnowSplatROcclusion", properties, false);
        SnowSplatRSmoothnessStrength = FindProperty("_SnowSplatRSmoothnessStrength", properties, false);
        snowSplatRBlendStrength = FindProperty("_SnowSplatRBlendStrength", properties, false);
        snowSplatRBlendYMin = FindProperty("_SnowSplatRBlendYMin", properties, false);
        snowSplatRBlendYMax = FindProperty("_SnowSplatRBlendYMax", properties, false);
        snowSplatRBlendFalloff = FindProperty("_SnowSplatRBlendFalloff", properties, false);
        snowSplatRBlendFactor = FindProperty("_SnowSplatRBlendFactor", properties, false);

        snowSplatGChannel = FindProperty("_SnowSplatGEnableChannel", properties, false);
        snowSplatGSplatBias = FindProperty("_SnowSplatGSplatBias", properties, false);
        snowSplatGSnowSparkle = FindProperty("_SnowSplatGEnableSparkle", properties, false);
        snowSplatGColor = FindProperty("_SnowSplatGColor", properties, false);
        snowSplatGBrightness = FindProperty("_SnowSplatGBrightness", properties, false);
        snowSplatGNormalStrength = FindProperty("_SnowSplatGNormalStrength", properties, false);
        snowSplatGMetallic = FindProperty("_SnowSplatGMetallic", properties, false);
        snowSplatGOcclusion = FindProperty("_SnowSplatGOcclusion", properties, false);
        snowSplatGSmoothnessStrength = FindProperty("_SnowSplatGSmoothnessStrength", properties, false);
        snowSplatGBlendStrength = FindProperty("_SnowSplatGBlendStrength", properties, false);
        snowSplatGBlendYMin = FindProperty("_SnowSplatGBlendYMin", properties, false);
        snowSplatGBlendYMax = FindProperty("_SnowSplatGBlendYMax", properties, false);
        snowSplatGBlendFalloff = FindProperty("_SnowSplatGBlendFalloff", properties, false);
        snowSplatGBlendFactor = FindProperty("_SnowSplatGBlendFactor", properties, false);

        snowSplatBChannel = FindProperty("_SnowSplatBEnableChannel", properties, false);
        snowSplatBSplatBias = FindProperty("_SnowSplatBSplatBias", properties, false);
        snowSplatBSnowSparkle = FindProperty("_SnowSplatBEnableSparkle", properties, false);
        snowSplatBColor = FindProperty("_SnowSplatBColor", properties, false);
        snowSplatBBrightness = FindProperty("_SnowSplatBBrightness", properties, false);
        snowSplatBNormalStrength = FindProperty("_SnowSplatBNormalStrength", properties, false);
        snowSplatBMetallic = FindProperty("_SnowSplatBMetallic", properties, false);
        snowSplatBOcclusion = FindProperty("_SnowSplatBOcclusion", properties, false);
        snowSplatBSmoothnessStrength = FindProperty("_SnowSplatBSmoothnessStrength", properties, false);
        snowSplatBBlendStrength = FindProperty("_SnowSplatBBlendStrength", properties, false);
        snowSplatBBlendYMin = FindProperty("_SnowSplatBBlendYMin", properties, false);
        snowSplatBBlendYMax = FindProperty("_SnowSplatBBlendYMax", properties, false);
        snowSplatBBlendFalloff = FindProperty("_SnowSplatBBlendFalloff", properties, false);
        snowSplatBBlendFactor = FindProperty("_SnowSplatBBlendFactor", properties, false);

        snowSplatAChannel = FindProperty("_SnowSplatAEnableChannel", properties, false);
        snowSplatASplatBias = FindProperty("_SnowSplatASplatBias", properties, false);
        snowSplatASnowSparkle = FindProperty("_SnowSplatAEnableSparkle", properties, false);
        snowSplatAColor = FindProperty("_SnowSplatAColor", properties, false);
        snowSplatABrightness = FindProperty("_SnowSplatABrightness", properties, false);
        snowSplatANormalStrength = FindProperty("_SnowSplatANormalStrength", properties, false);
        snowSplatAMetallic = FindProperty("_SnowSplatAMetallic", properties, false);
        snowSplatAOcclusion = FindProperty("_SnowSplatAOcclusion", properties, false);
        snowSplatASmoothnessStrength = FindProperty("_SnowSplatASmoothnessStrength", properties, false);
        snowSplatABlendStrength = FindProperty("_SnowSplatABlendStrength", properties, false);
        snowSplatABlendYMin = FindProperty("_SnowSplatABlendYMin", properties, false);
        snowSplatABlendYMax = FindProperty("_SnowSplatABlendYMax", properties, false);
        snowSplatABlendFalloff = FindProperty("_SnowSplatABlendFalloff", properties, false);
        snowSplatABlendFactor = FindProperty("_SnowSplatABlendFactor", properties, false);

        snowEnableHeight = FindProperty("_SnowHeightEnable", properties, false);
        snowHeightClipFar = FindProperty("_SnowHeightClipFar", properties, false);
        snowHeightDepth = FindProperty("_SnowHeightDepth", properties, false);

        snowSparkleTint = FindProperty("_SnowSparkleColor", properties, false);
        snowSparkleMap = FindProperty("_SnowMapSparkle", properties, false);
        snowSparkleIntensity = FindProperty("_Snow_SparkleIntensity", properties, false);
        snowSparkleFlicker = FindProperty("_SnowSparkleFlicker", properties, false);
        snowSparkleCutoff = FindProperty("_SnowSparkleCutoff", properties, false);
        snowSparkleFrequency = FindProperty("_SnowSparkleFrequency", properties, false);
        sparkleScreenContribution = FindProperty("_SparkleScreenContribution", properties, false);
        snowSparkleAnimation = FindProperty("_SnowSparkleAnimation", properties, false);
        snowSparkleSpeed = FindProperty("_SnowSparkleSpeed", properties, false);
    }
    #region [GUI]
    void LoadLayerIcons()
    {
        if (terrainLayers.Length < 1)
            return;

        layerContents = new GUIContent[terrainLayers.Length];
        for (int i = 0; i < layerContents.Length; ++i)
        {
            layerContents[i] = new GUIContent();

            if (terrainLayers[i] != null)
            {
                Texture texture = terrainLayers[i].diffuseTexture;
                if (texture != null)
                {
                    layerContents[i].image = texture;
                    layerContents[i].text = texture.name;
                }
                else
                {
                    layerContents[i].text = "Missing";
                }
            }
            else
            {
                layerContents[i].text = "Missing";
            }
        }
    }

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        m_MaterialEditor = materialEditor;
        var material = materialEditor.target as Material;

        if (headerFoldout == null)
        {
            headerFoldout = new GUIStyle(EditorStyles.foldout);
            headerFoldout.fontStyle = FontStyle.Bold;
        }

        if (headerLayerFoldout == null)
        {
            headerLayerFoldout = new GUIStyle(EditorStyles.foldout);
            headerLayerFoldout.fontStyle = FontStyle.Bold;
            headerLayerFoldout.fixedHeight = 30f;
        }

        if (boxStyle == null)
        {
            boxStyle = new GUIStyle(EditorStyles.helpBox);
            boxStyle.normal.textColor = GUI.skin.label.normal.textColor;
            boxStyle.fontStyle = FontStyle.Bold;
            boxStyle.fontSize = 11;
            boxStyle.alignment = TextAnchor.UpperLeft;
        }

        if (Selection.activeGameObject != null)
        {
            var terrainComponent = Selection.activeGameObject.GetComponent<Terrain>();

            if (terrainComponent != null)
            {
                terrainLayers = terrainComponent.terrainData.terrainLayers;

                if (layerCount != terrainLayers.Length)
                {
                    splatTint = new MaterialProperty[terrainLayers.Length];
                    SplatTilingXStochastic = new MaterialProperty[terrainLayers.Length];
                    SplatTilingYStochastic = new MaterialProperty[terrainLayers.Length];
                    splatBrightness = new MaterialProperty[terrainLayers.Length];
                    splatNormalScale = new MaterialProperty[terrainLayers.Length];
                    splatHeightBlendStrength = new MaterialProperty[terrainLayers.Length];
                    splatHeightBlendOffset = new MaterialProperty[terrainLayers.Length];
                    splatMetallic = new MaterialProperty[terrainLayers.Length];
                    splatOcclusionStrengthAO = new MaterialProperty[terrainLayers.Length];
                    splatSaturation = new MaterialProperty[terrainLayers.Length];
                    splatSmoothnessType = new MaterialProperty[terrainLayers.Length];
                    splatSmoothness = new MaterialProperty[terrainLayers.Length];
                    splatEnableNoise = new MaterialProperty[terrainLayers.Length];
                    splatNoiseInvert = new MaterialProperty[terrainLayers.Length];
                    splatNoiseScale = new MaterialProperty[terrainLayers.Length];
                    splatNoiseDarken = new MaterialProperty[terrainLayers.Length];

                    layerCount = terrainLayers.Length;
                }

                defaultShaderGUI = EditorGUILayout.Toggle("Default Shader GUI", defaultShaderGUI);

                if (!defaultShaderGUI)
                {
                    FindProperties(properties);
                    ShaderPropertiesGUI(material);
                    return;
                }
            }
        }

        DefaultShaderGUI(material, properties);
    }

    private void ShaderPropertiesGUI(Material material)
    {
        LoadLayerIcons();

        GUILayout.BeginVertical(boxStyle);
        surfaceOptionsFoldout = GUILayout.Toggle(surfaceOptionsFoldout, "Surface", headerFoldout);

        if (surfaceOptionsFoldout)
        {
            GUILayout.BeginVertical(boxStyle);

            if (globalTerrainNoise != null)
            {
                m_MaterialEditor.ShaderProperty(globalTerrainNoise, globalTerrainNoise.displayName);
            }

            m_MaterialEditor.ShaderProperty(globalBrightness, globalBrightness.displayName);

            if (EnableInstancedPerPixelNormal != null)
            {
                m_MaterialEditor.ShaderProperty(EnableInstancedPerPixelNormal, EnableInstancedPerPixelNormal.displayName);
            }

            if (receiveShadows != null)
            {
                m_MaterialEditor.ShaderProperty(receiveShadows, receiveShadows.displayName);
            }

            if (specularHighLights != null)
            {
                m_MaterialEditor.ShaderProperty(specularHighLights, specularHighLights.displayName);
            }

            if (environmentReflections != null)
            {
                m_MaterialEditor.ShaderProperty(environmentReflections, environmentReflections.displayName);
            }

            if (specularOcclusionMode != null)
            {
                m_MaterialEditor.ShaderProperty(specularOcclusionMode, specularOcclusionMode.displayName);
            }

            if (enableInstancedPerPixelNormal != null)
            {
                m_MaterialEditor.ShaderProperty(enableInstancedPerPixelNormal,
                    enableInstancedPerPixelNormal.displayName);
            }

            if (addPrecomputedVelocity != null)
            {
                m_MaterialEditor.ShaderProperty(addPrecomputedVelocity, addPrecomputedVelocity.displayName);
            }

            if (disableDecals != null)
            {
                m_MaterialEditor.ShaderProperty(disableDecals, disableDecals.displayName);
            }

            if (receivesSSR != null)
            {
                m_MaterialEditor.ShaderProperty(receivesSSR, receivesSSR.displayName);
            }

            if (enableGeometricSpecularAA != null)
            {
                m_MaterialEditor.ShaderProperty(enableGeometricSpecularAA, enableGeometricSpecularAA.displayName);
            }

            if (specularAAScreenSpaceVariance != null)
            {
                m_MaterialEditor.ShaderProperty(specularAAScreenSpaceVariance,
                    specularAAScreenSpaceVariance.displayName);
            }

            if (specularAAThreshold != null)
            {
                m_MaterialEditor.ShaderProperty(specularAAThreshold, specularAAThreshold.displayName);
            }

            GUILayout.EndVertical();
        }

        GUILayout.EndVertical();
        #endregion [GUI]

        #region [WETNESS]
        if (WetnessIntensity != null)
        {
            GUILayout.BeginVertical(boxStyle);
            WetnessFoldout = GUILayout.Toggle(WetnessFoldout, "Wetness", headerFoldout);

            if (WetnessFoldout)
            {
                GUILayout.BeginVertical(boxStyle);

                m_MaterialEditor.ShaderProperty(WetnessIntensity, WetnessIntensity.displayName);
                m_MaterialEditor.ShaderProperty(WetnessMask, WetnessMask.displayName);
                m_MaterialEditor.ShaderProperty(WetnessBiasGlobal, WetnessBiasGlobal.displayName);
                m_MaterialEditor.ShaderProperty(wetnessAffectLayer0, wetnessAffectLayer0.displayName);
                m_MaterialEditor.ShaderProperty(wetnessAffectLayer1, wetnessAffectLayer1.displayName);
                m_MaterialEditor.ShaderProperty(wetnessAffectLayer2, wetnessAffectLayer2.displayName);
                m_MaterialEditor.ShaderProperty(wetnessAffectLayer3, wetnessAffectLayer3.displayName);

                if (wetnessAffectLayer4 != null)
                {
                    m_MaterialEditor.ShaderProperty(wetnessAffectLayer4, wetnessAffectLayer4.displayName);
                    m_MaterialEditor.ShaderProperty(wetnessAffectLayer5, wetnessAffectLayer5.displayName);
                    m_MaterialEditor.ShaderProperty(wetnessAffectLayer6, wetnessAffectLayer6.displayName);
                    m_MaterialEditor.ShaderProperty(wetnessAffectLayer7, wetnessAffectLayer7.displayName);
                }

                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }
        #endregion [WETNESS]

        #region [LAYERS]
        GUILayout.BeginVertical(boxStyle);
        layerGroupFoldout = GUILayout.Toggle(layerGroupFoldout, "Layers", headerFoldout);

        if (layerGroupFoldout)
        {
            for (var i = 0; i < terrainLayers.Length; ++i)
            {
                if (splatTint[i] == null)
                {
                    continue;
                }

                GUILayout.BeginVertical(boxStyle);
                layerFoldout[i] = GUILayout.Toggle(layerFoldout[i],
                    new GUIContent(" Layer " + i + ": " + layerContents[i].text, layerContents[i].image),
                    headerLayerFoldout);

                if (layerFoldout[i])
                {
                    GUILayout.BeginVertical(boxStyle);

                    m_MaterialEditor.ShaderProperty(splatTint[i], splatTint[i].displayName);

                    if (SplatTilingXStochastic[i] != null)
                    {
                        m_MaterialEditor.ShaderProperty(SplatTilingXStochastic[i], SplatTilingXStochastic[i].displayName);
                    }

                    if (SplatTilingYStochastic[i] != null)
                    {
                        m_MaterialEditor.ShaderProperty(SplatTilingYStochastic[i], SplatTilingYStochastic[i].displayName);
                    }

                    m_MaterialEditor.ShaderProperty(splatBrightness[i], splatBrightness[i].displayName);
                    m_MaterialEditor.ShaderProperty(splatNormalScale[i], splatNormalScale[i].displayName);

                    if (splatHeightBlendStrength[i] != null)
                    {
                        m_MaterialEditor.ShaderProperty(splatHeightBlendStrength[i],
                            splatHeightBlendStrength[i].displayName);
                        m_MaterialEditor.ShaderProperty(splatHeightBlendOffset[i],
                            splatHeightBlendOffset[i].displayName);
                    }

                    m_MaterialEditor.ShaderProperty(splatMetallic[i], splatMetallic[i].displayName);
                    m_MaterialEditor.ShaderProperty(splatOcclusionStrengthAO[i],
                        splatOcclusionStrengthAO[i].displayName);

                    if (splatSaturation[i] != null)
                    {
                        m_MaterialEditor.ShaderProperty(splatSaturation[i], splatSaturation[i].displayName);
                    }

                    m_MaterialEditor.ShaderProperty(splatSmoothnessType[i], splatSmoothnessType[i].displayName);
                    m_MaterialEditor.ShaderProperty(splatSmoothness[i], splatSmoothness[i].displayName);

                    if (splatEnableNoise[i] != null)
                    {
                        m_MaterialEditor.ShaderProperty(splatEnableNoise[i], splatEnableNoise[i].displayName);
                        m_MaterialEditor.ShaderProperty(splatNoiseInvert[i], splatNoiseInvert[i].displayName);
                        m_MaterialEditor.ShaderProperty(splatNoiseScale[i], splatNoiseScale[i].displayName);
                        m_MaterialEditor.ShaderProperty(splatNoiseDarken[i], splatNoiseDarken[i].displayName);
                    }

                    GUILayout.EndVertical();
                }

                GUILayout.EndVertical();
            }
        }

        GUILayout.EndVertical();

        #endregion [LAYERS]

        #region [COVER MAP]
        if (coverMapTint != null)
        {
            GUILayout.BeginVertical(boxStyle);
            coverMapFoldout = GUILayout.Toggle(coverMapFoldout, "Cover Map", headerFoldout);

            if (coverMapFoldout)
            {
                GUILayout.BeginVertical(boxStyle);

                m_MaterialEditor.ShaderProperty(coverMapTint, coverMapTint.displayName);
                m_MaterialEditor.ShaderProperty(coverMapAlbedo, coverMapAlbedo.displayName);
                m_MaterialEditor.ShaderProperty(coverMapBrightness, coverMapBrightness.displayName);
                m_MaterialEditor.ShaderProperty(coverMapNormal, coverMapNormal.displayName);
                m_MaterialEditor.ShaderProperty(coverMapNormalStrength, coverMapNormalStrength.displayName);

                m_MaterialEditor.ShaderProperty(coverMapAffectLayer0, coverMapAffectLayer0.displayName);
                m_MaterialEditor.ShaderProperty(coverMapRangeLayer0, coverMapRangeLayer0.displayName);
                m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer0, coverMapFuzzinessLayer0.displayName);

                m_MaterialEditor.ShaderProperty(coverMapAffectLayer1, coverMapAffectLayer1.displayName);
                m_MaterialEditor.ShaderProperty(coverMapRangeLayer1, coverMapRangeLayer1.displayName);
                m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer1, coverMapFuzzinessLayer1.displayName);

                m_MaterialEditor.ShaderProperty(coverMapAffectLayer2, coverMapAffectLayer2.displayName);
                m_MaterialEditor.ShaderProperty(coverMapRangeLayer2, coverMapRangeLayer2.displayName);
                m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer2, coverMapFuzzinessLayer2.displayName);

                m_MaterialEditor.ShaderProperty(coverMapAffectLayer3, coverMapAffectLayer3.displayName);
                m_MaterialEditor.ShaderProperty(coverMapRangeLayer3, coverMapRangeLayer3.displayName);
                m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer3, coverMapFuzzinessLayer3.displayName);

                if (coverMapAffectLayer4 != null)
                {
                    m_MaterialEditor.ShaderProperty(coverMapAffectLayer4, coverMapAffectLayer4.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapRangeLayer4, coverMapRangeLayer4.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer4, coverMapFuzzinessLayer4.displayName);

                    m_MaterialEditor.ShaderProperty(coverMapAffectLayer5, coverMapAffectLayer5.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapRangeLayer5, coverMapRangeLayer5.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer5, coverMapFuzzinessLayer5.displayName);

                    m_MaterialEditor.ShaderProperty(coverMapAffectLayer6, coverMapAffectLayer6.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapRangeLayer6, coverMapRangeLayer6.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer6, coverMapFuzzinessLayer6.displayName);

                    m_MaterialEditor.ShaderProperty(coverMapAffectLayer7, coverMapAffectLayer7.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapRangeLayer7, coverMapRangeLayer7.displayName);
                    m_MaterialEditor.ShaderProperty(coverMapFuzzinessLayer7, coverMapFuzzinessLayer7.displayName);
                }

                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }

        if (maskDistanceEnable != null)
        {
            GUILayout.BeginVertical(boxStyle);
            maskDistanceFoldout = GUILayout.Toggle(maskDistanceFoldout, "Mask Cover Distance", headerFoldout);

            if (maskDistanceFoldout)
            {
                GUILayout.BeginVertical(boxStyle);

                m_MaterialEditor.ShaderProperty(maskDistanceEnable, maskDistanceEnable.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceTint, maskDistanceTint.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceBrightness, maskDistanceBrightness.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceBaseColorMap, maskDistanceBaseColorMap.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceUV, maskDistanceUV.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceNormalMap, maskDistanceNormalMap.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceNormalStrength, maskDistanceNormalStrength.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceFadeMode, maskDistanceFadeMode.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceBlendStrength, maskDistanceBlendStrength.displayName);
                m_MaterialEditor.ShaderProperty(maskDistanceFadeDistance, maskDistanceFadeDistance.displayName);

                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }

        if (GlobalColorMask != null)
        {
            GUILayout.BeginVertical(boxStyle);
            maskCoverFoldout = GUILayout.Toggle(maskCoverFoldout, "Mask Cover", headerFoldout);

            if (maskCoverFoldout)
            {
                GUILayout.BeginVertical(boxStyle);

                m_MaterialEditor.ShaderProperty(GlobalColorMask, GlobalColorMask.displayName);

                GUILayout.Space(15);

                m_MaterialEditor.ShaderProperty(GlobalColorRedEnable, GlobalColorRedEnable.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedInverted, GlobalColorRedInverted.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedColor, GlobalColorRedColor.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedStrength, GlobalColorRedStrength.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedBlendAmount, GlobalColorRedBlendAmount.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedBlendHardness, GlobalColorRedBlendHardness.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorRedBlendFalloff, GlobalColorRedBlendFalloff.displayName);

                GUILayout.Space(15);

                m_MaterialEditor.ShaderProperty(GlobalColorGreenEnable, GlobalColorGreenEnable.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenInverted, GlobalColorGreenInverted.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenColor, GlobalColorGreenColor.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenStrength, GlobalColorGreenStrength.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenBlendHeight, GlobalColorGreenBlendHeight.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenBlendAmount, GlobalColorGreenBlendAmount.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenBlendHardness, GlobalColorGreenBlendHardness.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorGreenBlendFalloff, GlobalColorGreenBlendFalloff.displayName);

                GUILayout.Space(15);

                m_MaterialEditor.ShaderProperty(GlobalColorBlueEnable, GlobalColorBlueEnable.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueInverted, GlobalColorBlueInverted.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueColor, GlobalColorBlueColor.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueStrength, GlobalColorBlueStrength.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueBlendHeight, GlobalColorBlueBlendHeight.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueBlendAmount, GlobalColorBlueBlendAmount.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueBlendHardness, GlobalColorBlueBlendHardness.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorBlueBlendFalloff, GlobalColorBlueBlendFalloff.displayName);

                GUILayout.Space(15);

                m_MaterialEditor.ShaderProperty(GlobalColorAlphaEnable, GlobalColorAlphaEnable.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaInverted, GlobalColorAlphaInverted.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaColor, GlobalColorAlphaColor.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaStrength, GlobalColorAlphaStrength.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaBlendHeight, GlobalColorAlphaBlendHeight.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaBlendAmount, GlobalColorAlphaBlendAmount.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaBlendHardness, GlobalColorAlphaBlendHardness.displayName);
                m_MaterialEditor.ShaderProperty(GlobalColorAlphaBlendFalloff, GlobalColorAlphaBlendFalloff.displayName);

                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }
        #endregion [COVER MAP]

        #region [BASE PASS]
        if (enableBasePassCoverMap != null)
        {
            GUILayout.BeginVertical(boxStyle);
            basePassFoldout = GUILayout.Toggle(basePassFoldout, "Base Pass", headerFoldout);

            if (basePassFoldout)
            {
                GUILayout.BeginVertical(boxStyle);
                m_MaterialEditor.ShaderProperty(enableBasePassCoverMap, enableBasePassCoverMap.displayName);
                m_MaterialEditor.ShaderProperty(basePassBrightness, basePassBrightness.displayName);
                m_MaterialEditor.ShaderProperty(basePassSmoothness, basePassSmoothness.displayName);
                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }
        #endregion [BASE PASS]

        #region [SNOW]
        if (enableSnow != null)
        {
            GUILayout.BeginVertical(boxStyle);
            snowFoldout = GUILayout.Toggle(snowFoldout, "Snow", headerFoldout);

            if (snowFoldout)
            {
                GUILayout.BeginVertical(boxStyle);

                m_MaterialEditor.ShaderProperty(enableSnow, enableSnow.displayName);
                m_MaterialEditor.ShaderProperty(snowSplatMask, snowSplatMask.displayName);
                m_MaterialEditor.ShaderProperty(snowAlbedoMap, snowAlbedoMap.displayName);
                m_MaterialEditor.ShaderProperty(snowNormalMap, snowNormalMap.displayName);
                m_MaterialEditor.ShaderProperty(snowNormalCompute, snowNormalCompute.displayName);
                m_MaterialEditor.ShaderProperty(snowTiling, snowTiling.displayName);
                m_MaterialEditor.ShaderProperty(snowOffset, snowOffset.displayName);
                m_MaterialEditor.ShaderProperty(snowGlobalSaturation, snowGlobalSaturation.displayName);
                m_MaterialEditor.ShaderProperty(snowGlobalWetness, snowGlobalWetness.displayName);


                GUILayout.BeginVertical("Snow Channels", boxStyle);
                GUILayout.Space(20);

                GUILayout.BeginVertical(boxStyle);
                snowChannelRedFoldout = GUILayout.Toggle(snowChannelRedFoldout, "Red Channel", headerFoldout);

                if (snowChannelRedFoldout)
                {
                    GUILayout.BeginVertical(boxStyle);
                    m_MaterialEditor.ShaderProperty(snowSplatRChannel, snowSplatRChannel.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRSplatBias, snowSplatRSplatBias.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRSnowSparkle, snowSplatRSnowSparkle.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRColor, snowSplatRColor.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBrightness, snowSplatRBrightness.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRNormalStrength, snowSplatRNormalStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRMetallic, snowSplatRMetallic.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatROcclusion, snowSplatROcclusion.displayName);
                    m_MaterialEditor.ShaderProperty(SnowSplatRSmoothnessStrength, SnowSplatRSmoothnessStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBlendStrength, snowSplatRBlendStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBlendYMin, snowSplatRBlendYMin.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBlendYMax, snowSplatRBlendYMax.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBlendFalloff, snowSplatRBlendFalloff.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatRBlendFactor, snowSplatRBlendFactor.displayName);
                    GUILayout.EndVertical();
                }

                GUILayout.EndVertical();

                GUILayout.BeginVertical(boxStyle);
                snowChannelGreenFoldout = GUILayout.Toggle(snowChannelGreenFoldout, "Green Channel", headerFoldout);

                if (snowChannelGreenFoldout)
                {
                    GUILayout.BeginVertical(boxStyle);
                    m_MaterialEditor.ShaderProperty(snowSplatGChannel, snowSplatGChannel.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGSplatBias, snowSplatGSplatBias.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGSnowSparkle, snowSplatGSnowSparkle.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGColor, snowSplatGColor.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBrightness, snowSplatGBrightness.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGNormalStrength, snowSplatGNormalStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGMetallic, snowSplatGMetallic.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGOcclusion, snowSplatGOcclusion.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGSmoothnessStrength, snowSplatGSmoothnessStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBlendStrength, snowSplatGBlendStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBlendYMin, snowSplatGBlendYMin.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBlendYMax, snowSplatGBlendYMax.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBlendFalloff, snowSplatGBlendFalloff.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatGBlendFactor, snowSplatGBlendFactor.displayName);
                    GUILayout.EndVertical();
                }

                GUILayout.EndVertical();

                GUILayout.BeginVertical(boxStyle);
                snowChannelBlueFoldout = GUILayout.Toggle(snowChannelBlueFoldout, "Blue Channel", headerFoldout);

                if (snowChannelBlueFoldout)
                {
                    GUILayout.BeginVertical(boxStyle);
                    m_MaterialEditor.ShaderProperty(snowSplatBChannel, snowSplatBChannel.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBSplatBias, snowSplatBSplatBias.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBSnowSparkle, snowSplatBSnowSparkle.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBColor, snowSplatBColor.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBrightness, snowSplatBBrightness.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBNormalStrength, snowSplatBNormalStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBMetallic, snowSplatBMetallic.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBOcclusion, snowSplatBOcclusion.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBSmoothnessStrength, snowSplatBSmoothnessStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBlendStrength, snowSplatBBlendStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBlendYMin, snowSplatBBlendYMin.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBlendYMax, snowSplatBBlendYMax.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBlendFalloff, snowSplatBBlendFalloff.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatBBlendFactor, snowSplatBBlendFactor.displayName);
                    GUILayout.EndVertical();
                }

                GUILayout.EndVertical();

                GUILayout.BeginVertical(boxStyle);
                snowChannelAlphaFoldout = GUILayout.Toggle(snowChannelAlphaFoldout, "Alpha Channel", headerFoldout);

                if (snowChannelAlphaFoldout)
                {
                    GUILayout.BeginVertical(boxStyle);
                    m_MaterialEditor.ShaderProperty(snowSplatAChannel, snowSplatAChannel.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatASplatBias, snowSplatASplatBias.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatASnowSparkle, snowSplatASnowSparkle.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatAColor, snowSplatAColor.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABrightness, snowSplatABrightness.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatANormalStrength, snowSplatANormalStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatAMetallic, snowSplatAMetallic.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatAOcclusion, snowSplatAOcclusion.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatASmoothnessStrength, snowSplatASmoothnessStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABlendStrength, snowSplatABlendStrength.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABlendYMin, snowSplatABlendYMin.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABlendYMax, snowSplatABlendYMax.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABlendFalloff, snowSplatABlendFalloff.displayName);
                    m_MaterialEditor.ShaderProperty(snowSplatABlendFactor, snowSplatABlendFactor.displayName);
                    GUILayout.EndVertical();
                }

                GUILayout.EndVertical();

                GUILayout.EndVertical();

                m_MaterialEditor.ShaderProperty(snowEnableHeight, snowEnableHeight.displayName);
                m_MaterialEditor.ShaderProperty(snowHeightClipFar, snowHeightClipFar.displayName);
                m_MaterialEditor.ShaderProperty(snowHeightDepth, snowHeightDepth.displayName);

                m_MaterialEditor.ShaderProperty(snowSparkleTint, snowSparkleTint.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleMap, snowSparkleMap.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleIntensity, snowSparkleIntensity.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleFlicker, snowSparkleFlicker.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleCutoff, snowSparkleCutoff.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleFrequency, snowSparkleFrequency.displayName);
                m_MaterialEditor.ShaderProperty(sparkleScreenContribution, sparkleScreenContribution.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleAnimation, snowSparkleAnimation.displayName);
                m_MaterialEditor.ShaderProperty(snowSparkleSpeed, snowSparkleSpeed.displayName);

                GUILayout.EndVertical();
            }

            GUILayout.EndVertical();
        }
        #endregion [SNOW]

        #region [ADVANCED SETTINGS]
        GUILayout.BeginVertical(boxStyle);
        advancedFoldout = GUILayout.Toggle(advancedFoldout, "ADVANCED SETTINGS", headerFoldout);

        if (advancedFoldout)
        {
            GUILayout.BeginVertical(boxStyle);
            GUILayout.Space(15);

            AdvancedSettings(material);

            GUILayout.EndVertical();
        }

        GUILayout.EndVertical();
    }

    private void DefaultShaderGUI(Material material, MaterialProperty[] properties)
    {
        foreach (var prop in properties)
        {
            if (prop.flags == MaterialProperty.PropFlags.HideInInspector ||
                prop.name == "unity_Lightmaps" ||
                prop.name == "unity_LightmapsInd" ||
                prop.name == "unity_ShadowMasks")
                continue;

            m_MaterialEditor.ShaderProperty(prop, prop.displayName);
        }

        AdvancedSettings(material);
    }

    private void AdvancedSettings(Material material)
    {
        GUILayout.Label("ADVANCED", new GUIStyle(EditorStyles.boldLabel));

        if (material.HasProperty("_QueueControl") && material.HasProperty("_QueueOffset"))
        {
            var control = material.GetInt("_QueueControl");
            var offset = material.GetInt("_QueueOffset");

            // Initial fix because it is -1
            if (control < 0)
            {
                control = 0;
            }

            control = EditorGUILayout.Popup("Queue Control", control, new string[] {"Auto", "User Defined"});

            if (control == 0)
            {
                offset = EditorGUILayout.IntSlider("Sorting Priority", offset, -50, 50);

                if (material.GetTag("RenderType", false) == "Transparent")
                {
                    material.renderQueue = (int) UnityEngine.Rendering.RenderQueue.Transparent + offset;
                }
                else
                {
                    material.renderQueue = (int) UnityEngine.Rendering.RenderQueue.AlphaTest + offset;
                }
            }
            else
            {
                m_MaterialEditor.RenderQueueField();
            }

            material.SetInt("_QueueControl", control);
            material.SetInt("_QueueOffset", offset);
        }

        if (!material.HasProperty("_QueueControl") && material.HasProperty("_QueueOffset"))
        {
            var offset = material.GetInt("_QueueOffset");

            offset = EditorGUILayout.IntSlider("Sorting Priority", offset, -50, 50);

            if (material.GetTag("RenderType", false) == "Transparent")
            {
                material.renderQueue = (int) UnityEngine.Rendering.RenderQueue.Transparent + offset;
            }
            else
            {
                material.renderQueue = (int) UnityEngine.Rendering.RenderQueue.AlphaTest + offset;
            }

            material.SetInt("_QueueOffset", offset);
        }

        if (!material.HasProperty("_QueueControl") && !material.HasProperty("_QueueOffset"))
        {
            m_MaterialEditor.RenderQueueField();
        }

        m_MaterialEditor.EnableInstancingField();
        m_MaterialEditor.DoubleSidedGIField();
    }
    #endregion [ADVANCED SETTINGS]
}