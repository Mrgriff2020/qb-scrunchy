local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('scrunchy', function(source, item)
    TriggerClientEvent('qb-scrunchy:useScrunchy', source)
end)
