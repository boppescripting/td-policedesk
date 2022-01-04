local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
	while true do
		sleep = 5000

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - TDPD.Config.Coords)
        if dist < 15 then
            sleep = 5
            if dist < 1.5 then
                TDPD.Utils.DrawText3Ds(TDPD.Config.Coords, TDPD.Config.PopupText)

                if IsControlJustPressed(0, 38) then
                    QBCore.Functions.TriggerCallback('tdpd:server:getCops', function(cops)
                        if cops >= 1 then
                            TriggerServerEvent('tdpd:server:requestPD')
                            QBCore.Functions.Notify(TDPD.Config.SuccessMessage, 'success')
                        else
                            QBCore.Functions.Notify(TDPD.Config.FailureMessage, 'error')
                        end
                    end)
                end
            end
        end
		Wait(sleep)
	end
end)