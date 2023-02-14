--server spawn for meta racing by sharon (;).

local display = false
local counter = 0
local p0 = true
local ped = GetPlayerPed(player)



Citizen.CreateThread(function()
    Citizen.Wait((1000 * 3)); --waits 21 sec till the player spawns
end)

exports.spawnmanager:spawnPlayer({
    x = -1649.37,
    y = -685.6,
    z = 11.46,
    heading = 210,
    model = 'a_m_m_farmer_01',
    skipFade = true,
})


triggered = false;
AddEventHandler("playerSpawned", function()
    if not triggered then
        triggered = true;
        Citizen.Wait((1000 * 20)); -- Wait 20 seconds
        TriggerServerEvent('meta-spawner:chatMessage');
    end
end)

AddEventHandler("playerSpawned", function(spawn)
    if counter < 1 then
        Citizen.Wait(0)
        SetDisplay(not display)
        counter = counter + 1
    elseif counter > 1 then
        SetDisplay(display)
    end
end)



AddEventHandler("playerSpawned", function(spawn)
    if counter < 1 then
        Citizen.Wait(0)
        DoScreenFadeIn(1000)

     --SetTimecycleModifier('hud_def_blur')
        SetTimecycleModifierStrength(1.0)
        DisplayRadar(false)
        local cam = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', -1659.574, -707.8544, 29.23778, -7.422939, 0.059666, -117.3886, 43.0557, false, 2)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 3000, true, false, false)
        SetCamParams(cam, -1660.919, -710.7487, 28.88381, -7.50235, 0.059666, -111.7328, 43.0557, 9100, 0, 0, 2);
        counter = counter + 1
    elseif counter > 1 then
        Citizen.Wait(0)
     --SetTimecycleModifier('default')
        DisplayRadar(true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
    end
end)

RegisterCommand("nui", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit1", function(data)
    SetDisplay(false)
    Citizen.Wait(0)
     --SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNUICallback("main", function(data)
    chat5(data.text)
    SetDisplay(false)
end)

RegisterNUICallback("exit", function(data)
    chat1("exited")
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
        Citizen.Wait(0)
    end
end)

function chat5(right)
	TriggerServerEvent('meta-spawner:setRoutingBucket', 2)
    exports.spawnmanager:spawnPlayer({
        x = 466.8401,
        y = 197.7201,
        z = 111.5291,
        heading = 291.71,
        model = 'a_m_m_farmer_01',
        skipFade = false,
        counter = counter + 1
    })
    if counter > 1 then
        return
    end
 end

function chat1(status)
	TriggerServerEvent('meta-spawner:setRoutingBucket1', 1)
    TriggerServerEvent('meta-spawner:DisablePlayerFiring', true)
    AddEventHandler('meta-spawner:chatMessage', function()
            TriggerClientEvent('chatMessage', source,
            '^1[^Welcome To The main Lobby^1] ^3 You can access vMenu with "M"')
        TriggerClientEvent('chatMessage', source,
            '^7[^2pvp has been disabled^7] ^3 You can access the racing tablet by typing "/racing" ');
    end)
    exports.spawnmanager:spawnPlayer({
        x = 1070.206,
        y = -711.958,
        z = 58.483,
        heading = 150.71,
        skipFade = false,
        counter = counter + 1
    })
    if counter > 1 then
        return
    end
end