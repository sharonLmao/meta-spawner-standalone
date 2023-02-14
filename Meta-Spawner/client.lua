--client spawn for meta racing.

local spawnPos = vector3(686.245, 577.950, 130.461)
local model = 'a_m_m_skater_01'



AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = model
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { '' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)