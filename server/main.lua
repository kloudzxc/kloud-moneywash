lib.callback.register('kloud-moneywash:server:checkitem', function(source)
    local src = source
    local itemName = Wash.Item
    local markedBillsCount = GetItemCount(src, itemName, {}, false)

    if markedBillsCount > 0 then
        return markedBillsCount
    end

    return markedBillsCount
end)

RegisterNetEvent('kloud-moneywash:server:success', function()
    local src = source
    local itemName = Wash.Item
    local Player = QBCore.Functions.GetPlayer(src)

    local itemWorth = 0
    local itemAmount = 0

    if WashInventory == 'ox_inventory' then
        local playerItems = GetInventoryItems(src)

        for slot, data in pairs(playerItems) do
            if data == nil then return end

            if data.name == itemName then
                if data.metadata.worth and Wash.Metadata then
                    itemAmount = itemAmount + data.count
                    itemWorth = itemWorth + (data.metadata.worth * data.count)
                    if not RemoveItem(src, itemName, itemAmount) then print('Attempted Exploit!') return end
                    
                    Player.Functions.AddMoney('cash', math.floor(itemWorth * Wash.Tax))
                    SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')

                elseif not data.metadata.worth and not Wash.Metadata then
                    itemAmount = itemAmount + data.count
                    itemWorth = itemWorth + (100 * itemAmount)

                    if not RemoveItem(src, itemName, data.count) then print('Attempted Exploit!') return end
                    
                    Player.Functions.AddMoney('cash', math.floor(itemWorth * Wash.Tax))
                    SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')
                else
                    print('Attempted Exploit!')

                end
            end
        end
    else
        for slot, data in pairs(Player.PlayerData.items) do
            if data == nil then return end

            if data.name ~= 'markedbills' then return end

            if data.info.worth and Wash.Metadata then
                itemWorth = itemWorth + (data.info.worth * data.amount)
                itemAmount = itemAmount + data.amount
                if not RemoveItem(src, 'markedbills', data.amount, slot) then print('Attempted Exploit!') return end
                
                Player.Functions.AddMoney('cash', math.floor(itemWorth * Wash.Tax))
                SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')

            elseif not data.info.worth and not Wash.Metadata then
                itemWorth = itemWorth + (data.info.worth * data.amount)
                itemAmount = itemAmount + data.amount

                if not RemoveItem(src, 'markedbills', data.amount, slot) then print('Attempted Exploit!') return end
                
                Player.Functions.AddMoney('cash', math.floor(itemWorth * Wash.Tax))
                SVNotify(src, 'You\'ve successfully washed $'..math.floor(itemWorth * Wash.Tax), 'success')
            else
                print('Attempted Exploit!')

            end
        end
    end
end)


QBCore.Commands.Add('test', "test", {}, false, function(source, args)
    exports.ox_inventory:AddItem(source, "markedbills", args[1], {worth = math.random(400,500)})
end, 'admin')