local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('policeJobSystem:getPlayerJob', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.job.name, xPlayer.job.grade)
end)

RegisterServerEvent('policeJobSystem:selectJob')
AddEventHandler('policeJobSystem:selectJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if job == Config.PoliceJob.name then
        xPlayer.setJob(Config.PoliceJob.name, Config.PoliceJob.grade)
        TriggerClientEvent('esx:showNotification', source, 'You have been hired as a ' .. Config.PoliceJob.label)
        TriggerClientEvent('policeJobSystem:teleportToStation', source, Config.PoliceJob.spawn)
    end
end)

RegisterServerEvent('policeJobSystem:teleportToStation')
AddEventHandler('policeJobSystem:teleportToStation', function(spawn)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setCoords(spawn.x, spawn.y, spawn.z)
end)