Started = function (name)
    local started = false
    if GetResourceState(name) == 'started' then
        started = true
    else
        started = false
    end
   return started
end

Notify = function (msg, type)
    if Wash.Notify == "ox" then
        if not Started('ox_lib') then print("You need ox_lib running for the notifications to work") return end 
        if type == "error" then
            lib.notify({
                id = 'error_moneywash',
                title = 'Error',
                description = msg,
                icon = 'ban',
                iconColor = '#C53030'
            })
        elseif type == "success" then
            lib.notify({
                id = 'success_moneywash',
                title = 'Success',
                description = msg,
                icon = 'check',
                iconColor = '#30c56a'
            })
        end
    elseif Wash.Notify == "qb" then
        TriggerEvent('QBCore:Notify', msg, type)
    end
end

SVNotify = function (source, msg, type)
    if Wash.Notify == "ox" then
        if type == "error" then
            TriggerClientEvent('ox_lib:notify', source, {
                id = 'error_moneywash',
                title = 'Error',
                description = msg,
                icon = 'ban',
                iconColor = '#C53030'
            })
        elseif type == "success" then
            TriggerClientEvent('ox_lib:notify', source, {
                id = 'success_moneywash',
                title = 'Success',
                description = msg,
                icon = 'check',
                iconColor = '#30c56a'
            })
        end
    elseif Wash.Notify == "qb" then
        TriggerClientEvent('QBCore:Notify', msg, type)
    end
end

DrawText = function (msg)
    if Wash.DrawText == 'ox' then
        lib.showTextUI(msg)
    elseif Wash.DrawText == 'qb' then
        exports['qb-core']:DrawText(msg, Wash.QBDrawAlignment)
    end
end

HideText = function ()
    if Wash.DrawText == 'ox' then
        lib.hideTextUI()
    elseif Wash.DrawText == 'qb' then
        exports['qb-core']:HideText()
    end
end

AddTarget = function (name, coords, radius, infos, options, distance)
    if Wash.Target == 'qb' then
        Target = exports['qb-target']
        Target:AddCircleZone(name, coords, radius, infos, {
            options = options,
            distance = distance or 1.5
        })
    elseif Wash.Target == 'ox' then
        Target = exports.ox_target
        Target:addSphereZone({
            coords = coords,
            radius = radius,
            debug = Wash.Debug,
            drawSprite = true,
            options = options
        })
    end
end