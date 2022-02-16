local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('tdpd:server:getCops', function(source, cb)
	amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if TDPD.Utils.hasJob(v.PlayerData.job.name) and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

RegisterServerEvent('tdpd:server:requestPD')
AddEventHandler('tdpd:server:requestPD', function(blipName)
    local src = source

    if TDPD.Config.UsingMDT then
        local playerData = QBCore.Functions.GetPlayer(src).PlayerData
        local callerData = playerData.charinfo.firstname .. ' ' .. playerData.charinfo.lastname
        data = {dispatchCode = 'officerAssistance', caller = callerData, coords = GetEntityCoords(GetPlayerPed(src)), netId = NetworkGetNetworkIdFromEntity(GetPlayerPed(src)), length = 6000}
        TriggerEvent('wf-alerts:svNotify', data)
    else
        for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
            if TDPD.Utils.hasJob(v.PlayerData.job.name) and v.PlayerData.job.onduty then
                local cid = v.PlayerData.citizenid
                TriggerEvent('qb-phone:server:sendNewMailToOffline', cid, {
                    sender = TDPD.Config.EmailSender,
                    subject = TDPD.Config.EmailSubject,
                    message = TDPD.Config.EmailMessage .. blipName .. '.',
                    button = {}
                })
            end
        end
    end
end)