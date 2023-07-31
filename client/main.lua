local inZone = false
local isBusy = false

Targets = function ()
    for _,v in pairs(Wash.Locations) do
        AddTarget('kloud-moneywash', v, 0.55, {
            name = 'kloud-moneywash',
            debugPoly = Wash.Debug,
        }, {
            {
                event = 'kloud-moneywash:client:openwash',
                label = "Wash Money",
                name = "kloud-moneywash",
                icon = "fas fa-jug-detergent",
                distance = 1,
            }
        }, 1)
    end
end

Zones = function ()
    for k,v in pairs(Wash.Zones) do
        lib.zones.poly({
            points = v,
            debug = Wash.Debug,
            onEnter = function ()
                inZone = true
                DrawText('[E] Wash Money')
            end,
            onExit = function ()
                inZone = false
                HideText()
            end,
            inside = function ()
                if IsControlJustPressed(0, 38) and not isBusy then
                    OpenWash()
                end

                if isBusy then
                    HideText()
                end
            end
        })
    end
end

OpenWash = function ()
    local markedBills = lib.callback.await('kloud-moneywash:server:checkitem', false)

    if markedBills < 1 then Notify('You don\'t have marked bills.', 'error') return end

    isBusy = true
    SetEntityHeading(cache.ped, 99.66)
    exports["rpemotes"]:EmoteCommandStart('mechanic2')

    if not SkillCheck({'medium', 'medium', 'medium', 'easy'}) then
        isBusy = false 
        Notify('Failed', 'error')
        exports["rpemotes"]:EmoteCancel(true)
        if inZone then
            DrawText('[E] Wash Money')
        end

        return 
    end
    exports["rpemotes"]:EmoteCancel(true)
    HideText()

    local duration = 0
    if Wash.PerItemDuration then
        duration = markedBills * Wash.Duration * 1000
    else
        duration = Wash.Duration * 1000
    end

    if Progress(duration, "Washing Money", Wash.Animation.dict, Wash.Animation.clip) then
        isBusy = false
        TriggerServerEvent('kloud-moneywash:server:success')
        if inZone then
            DrawText('[E] Wash Money')
        end
    else
        isBusy = false
        Notify('Wash Cancelled', 'error')
        if inZone then
            DrawText('[E] Wash Money')
        end
    end
end

RegisterNetEvent('kloud-moneywash:client:openwash', OpenWash)

if Wash.Type == 'target' then
    CreateThread(Targets)
else
    CreateThread(Zones)
end
