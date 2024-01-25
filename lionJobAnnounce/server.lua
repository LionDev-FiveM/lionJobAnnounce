local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent("announceMessage")
AddEventHandler("announceMessage", function(message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Config.JobOneJob and xPlayer.job.grade > Config.JobOneGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobOneLabel, Config.JobOneText, message, Config.JobOneIcon, 0)
    end
    if xPlayer.job.name == Config.JobTwoJob and xPlayer.job.grade > Config.JobTwoGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobTwoLabel, Config.JobTwoText, message, Config.JobTwoIcon, 0)
    end
    if xPlayer.job.name == Config.JobThreeJob and xPlayer.job.grade > Config.JobThreeGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobThreeLabel, Config.JobThreeText, message, Config.JobThreeIcon, 0)
    end
    if xPlayer.job.name == Config.JobFourJob and xPlayer.job.grade > Config.JobFourGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobFourLabel, Config.JobFourText, message, Config.JobFourIcon, 0)
    end
    if xPlayer.job.name == Config.JobFiveJob and xPlayer.job.grade > Config.JobFiveGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobFiveLabel, Config.JobFiveText, message, Config.JobFiveIcon, 0)
    end
    if xPlayer.job.name == Config.JobSixJob and xPlayer.job.grade > Config.JobSixGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobSixLabel, Config.JobSixText, message, Config.JobSixIcon, 0)
    end
    if xPlayer.job.name == Config.JobSevenJob and xPlayer.job.grade > Config.JobSevenGrade then
        TriggerClientEvent('esx:showAdvancedNotification', source, Config.JobSevenLabel, Config.JobSevenText, message, Config.JobSevenIcon, 0)
    end
end)



Citizen.CreateThread(function()
    local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
    if vRaw and Config.VersionCheck then
        local v = json.decode(vRaw)
        local url = 'https://raw.githubusercontent.com/LionDev-FiveM/lionJobAnnounce/main/lionJobAnnounce/version.json'
        PerformHttpRequest(url, function(code, res)
            if code == 200 then
                local rv = json.decode(res)
                if rv.version ~= v.version then
                    print(([[
 _      _               _____                 _                                  _   
| |    (_)             |  __ \               | |                                | |  
| |     _  ___  _ __   | |  | | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
| |    | |/ _ \| '_ \  | |  | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
| |____| | (_) | | | | | |__| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
|______|_|\___/|_| |_| |_____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
                                                    | |                             
                                                    |_|                             
Script: lionJobAnnounce
UPDATE: %s AVAILABLE
CHANGELOG: %s
Download: https://github.com/LionDev-FiveM/lionJobAnnounce
If you need help, join our Discord: https://dsc.gg/lion-dev
]]):format(rv.version, rv.changelog))
                end
            else
                print('Error in versioncheck')
            end
        end, 'GET')
    end
end)