ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("jobann", function(source, args)
    local message = table.concat(args, " ")
    if message ~= "" then
        TriggerServerEvent("announceMessage", message)
    else
        if Config.DefaultNotify then
            Citizen.CreateThread(function()
                Citizen.Wait(0)
                SetNotificationTextEntry("STRING")
                AddTextComponentString(Config.Notify)
                DrawNotification(false, false)
                Citizen.Wait(Config.notifyTimeout)
                ThefeedRemoveItem()
            end)
        end
        if Config.OkokNotify then
            exports['okokNotify']:Alert(Config.OkokTitle, Config.OkokMessage, Config.OkokNotifyTimeout, Config.OkokType)
        end
        if Config.PnotifyNotify then
            TriggerEvent("pNotify:SendNotification", {text = Config.PnotifyMessage,
                layout = Config.PnotifyLayout,
                timeout = Config.PnotifyTimeout,
                type = Config.PnotifyType
			})
        end
        if Config.zvNotify then
            TriggerEvent('zvNotify', "#55555", "Test Titel", "Test Nachricht un so lol")
        end
    end
end, false)
