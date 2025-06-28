local isHairUp = false
local originalHair = {
    drawable = nil,
    texture = nil,
}

function IsFemalePed(ped)
    local model = GetEntityModel(ped)
    return model == GetHashKey("mp_f_freemode_01")
end

RegisterNetEvent('qb-scrunchy:useScrunchy', function()
    local ped = PlayerPedId()
    local isFemale = IsFemalePed(ped)
    local genderKey = isFemale and "female" or "male"
    local styleConfig = Config.HairStyles[genderKey].up

    -- Load and play animation
    RequestAnimDict(Config.Animation.dict)
    while not HasAnimDictLoaded(Config.Animation.dict) do Wait(50) end
    TaskPlayAnim(ped, Config.Animation.dict, Config.Animation.anim, 8.0, -8.0, Config.Animation.duration, 49, 0, false, false, false)
    Wait(Config.Animation.duration)
    ClearPedTasks(ped)

    if not isHairUp then
        -- Save original hair
        originalHair.drawable = GetPedDrawableVariation(ped, 2)
        originalHair.texture = GetPedTextureVariation(ped, 2)

        -- Apply hair-up style based on gender
        SetPedComponentVariation(ped, 2, styleConfig.drawable, styleConfig.texture, 2)
        TriggerEvent('QBCore:Notify', "You tied your hair up with the scrunchy.", "success")
        isHairUp = true
    else
        -- Restore original hair
        if originalHair.drawable then
            SetPedComponentVariation(ped, 2, originalHair.drawable, originalHair.texture, 2)
            TriggerEvent('QBCore:Notify', "You let your hair down.", "success")
        else
            TriggerEvent('QBCore:Notify', "Original hair style not found.", "error")
        end
        isHairUp = false
    end
end)
