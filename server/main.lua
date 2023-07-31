Ban = function (src, reason)
    if Wash.Ban then
        -- Change this to your ban event
    else
        print(reason)
    end
end

lib.callback.register('kloud-moneywash:server:checkitem', function(source)
    local src = source
    local itemName = Wash.Item
    local markedBillsCount = GetItemCount(src, itemName, {}, false)
    
    if markedBillsCount > 0 then
        return markedBillsCount
    end
    
    return markedBillsCount
end)