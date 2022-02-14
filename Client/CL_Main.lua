local QBCore = exports['qb-core']:GetCoreObject()
local cooldown = 0
local usingThirdEye = TDPD.Config.ThirdEye

RegisterNetEvent('td-policedesk:client:requestAssistance')
AddEventHandler('td-policedesk:client:requestAssistance', function()
    QBCore.Functions.TriggerCallback('tdpd:server:getCops', function(cops)
        if cops >= 1 then
            if cooldown ~= 0 then
                QBCore.Functions.Notify(TDPD.Config.PleaseWait, 'error')
            else
                TriggerServerEvent('tdpd:server:requestPD', '')
                QBCore.Functions.Notify(TDPD.Config.SuccessMessage, 'success')
                cooldown = TDPD.Config.RequestCooldown * 1000
                Citizen.SetTimeout(TDPD.Config.RequestCooldown * 1000, function()
                    cooldown = 0
                end)
            end
        else
            QBCore.Functions.Notify(TDPD.Config.FailureMessage, 'error')
        end
    end)
end)

CreateThread(function()
    setupTargetExport()

	while true do
        if not usingThirdEye then
            for key, value in pairs(TDPD.Config.Locations) do
                for name, coords in pairs (TDPD.Config.Locations[key]) do
                    local blipName = TDPD.Config.Locations[key].name
                    local blipCoords = TDPD.Config.Locations[key].coords

                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local dist = #(pos - blipCoords)
                    if dist < 15 then
                        if dist < 1.5 then
                            if cooldown == 0 then
                                TDPD.Utils.DrawText3Ds(blipCoords, TDPD.Config.PopupText)
                                if IsControlJustPressed(0, 38) then
                                    QBCore.Functions.TriggerCallback('tdpd:server:getCops', function(cops)
                                        if cops >= 1 then
                                            TriggerServerEvent('tdpd:server:requestPD', blipName)
                                            QBCore.Functions.Notify(TDPD.Config.SuccessMessage, 'success')
                                            cooldown = TDPD.Config.RequestCooldown * 1000
                                            Citizen.SetTimeout(TDPD.Config.RequestCooldown * 1000, function()
                                                cooldown = 0
                                            end)
                                        else
                                            QBCore.Functions.Notify(TDPD.Config.FailureMessage, 'error')
                                        end
                                    end)
                                end
                            else
                                TDPD.Utils.DrawText3Ds(blipCoords, TDPD.Config.PleaseWait)
                            end
                        end
                    end
                end
            end
        end

		Wait(0)
	end
end)

function setupTargetExport()
    if usingThirdEye then
        exports['qb-target']:AddBoxZone("MissionRowDutyClipboard", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
            name = "MissionRowDutyClipboard",
            heading = 11.0,
            debugPoly = false,
            minZ = 30.77834,
            maxZ = 30.87834,
            }, {
                options = {
                    {
                        type = "client",
                        event = "td-policedesk:client:requestAssistance",
                        icon = "fas fa-clipboard",
                        label = "Request an officer",
                    },
                },
                distance = 2.5
            }
        )
    end
end
