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
AddEventHandler('tdpd:server:requestPD', function()
    local src = source
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if TDPD.Utils.hasJob(v.PlayerData.job.name) and v.PlayerData.job.onduty then
            local cid = v.PlayerData.citizenid
            TriggerEvent('qb-phone:server:sendNewMailToOffline', cid, {
                sender = "Police Dispatcher",
                subject = "Assistance Required",
                message = "Officer,<br/>There is an individual at the police department desk requesting the assistance of a present officer.",
                button = {}
            })
        end
    end
end)