local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    RegisterCommand(Config.Menu.button, function()
        OpenJobMenu()
    end, false)

    RegisterNUICallback('selectJob', function(data, cb)
        TriggerServerEvent('policeJobSystem:selectJob', data.job)
        cb('ok')
    end)
end)

function OpenJobMenu()
    local elements = {
        {label = Config.PoliceJob.label, value = Config.PoliceJob.name}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'job_menu', {
        title    = Config.Menu.title,
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
        TriggerServerEvent('policeJobSystem:selectJob', data.current.value)
    end, function(data, menu)
        menu.close()
    end)
end