this = Space.Host.ExecutingObject

windDirectionZ = this.Forward.Z
windDirectionX = this.Forward.X
windPower = windPower or 0.5
globalWindPower = globalWindPower or 0.5
affectDEEnvironment = affectDEEnvironment or true
affectMicrosplat = affectMicrosplat or true
globalOverlay = globalOverlay or 0
globalWetness = globalWetness or 0

function MathEnable(value)
    if value > 0 then
        return 1
    else
        return 0
    end
end

function MathRemap(value,low1,high1,low2,high2)
    return low2 + (value - low1) * (high2 - low2) / (high1 - low1)
end

--Global params for DEEnvironment
if affectDEEnvironment then
    deWindDirection = ((Space.Math.Atan2(windDirectionX, windDirectionZ) / Space.Math.Pi) * 0.5 + 0.5) * 360
    deSnowEnabled = MathEnable(globalOverlay)
    deRainEnabled = MathEnable(globalWetness)
    deRainIntensity = MathRemap(globalWetness, 0, 1, 0, 0.2)

    Space.RenderSettings.SetGlobalShaderFloat('_Global_Wind_Main_Direction' , deWindDirection) 

--Space.RenderSettings.SetGlobalShaderVector('_Global_Snow_Enabled' , deSnowEnabled) 
    Space.RenderSettings.SetGlobalShaderFloat('_Global_Snow_Intensity_TopDown' , globalOverlay) 
    Space.RenderSettings.SetGlobalShaderFloat('_Global_Snow_Intensity_BottomUp' , globalOverlay)

-- Space.RenderSettings.SetGlobalShaderVector('_Global_Rain_Enabled' , deRainEnabled)
    Space.RenderSettings.SetGlobalShaderFloat('_Global_Rain_Intensity' , deRainIntensity)
    Space.RenderSettings.SetGlobalShaderFloat('_Global_Rain_Wetness' , globalWetness)
end

--Global params for Microsplat
if affectMicrosplat then 
    Space.RenderSettings.SetGlobalShaderFloat('_Global_WindParticulateStrength' , globalWindPower)
    Space.RenderSettings.SetGlobalShaderFloat('_Global_SnowLevel' , globalOverlay)
    --Space.RenderSettings.SetGlobalShaderFloat('_Global_WetnessParams' , Vector.New(globalWetness, globalWetness,0))
    -- the line above cannot be done in sinespace lua because We don't have an equivalent of System.Single in Lua.
    --Space.RenderSettings.SetGlobalShaderFloat('_Global_PuddleParams' , globalWetness)
end



Space.Log('DE Controller started')
