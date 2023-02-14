function sendMessage(source, message)
    TriggerClientEvent('chat:addMessage', source, {
       args = { message, },
    })
 end

RegisterCommand('GetPlayerRoutingBucket', function (source, args)
    local targetId = args[1] or source
    local routingBucket = GetPlayerRoutingBucket(targetId) or 0
	print(('Player [%s] %s is on bucket %s'):format(targetId, GetPlayerName(targetId), routingBucket))
 end)

RegisterServerEvent('meta-spawner:setRoutingBucket')
AddEventHandler('meta-spawner:setRoutingBucket', function(bucketId)
	local pSrc = source
	if not bucketId then return end
	SetPlayerRoutingBucket(pSrc, bucketId)

    sendMessage(pSrc, ('Player %s has been moved to routing Bucket %s.'):format(pSrc, bucketId))
end)

RegisterServerEvent('meta-spawner:setRoutingBucket1')
AddEventHandler('meta-spawner:setRoutingBucket1', function(bucketId)
	local pSrc = source
	if not bucketId then return end
	SetPlayerRoutingBucket(pSrc, bucketId)
    sendMessage(pSrc, ('Player %s has been moved to routing Bucket %s.'):format(pSrc, bucketId))
end)

RegisterServerEvent('meta-spawner:DisablePlayerFiring')
AddEventHandler('meta-spawner:DisablePlayerFiring', function(bool)
	local pSrc = source
    sendMessage(pSrc, ('Player has been disabled pvp'))
end)