local items = { "oldbuckle", "oldwatch", "goldring", "goldtooth", "oldcoin" }

TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:robbingkit")
AddEventHandler("RegisterUsableItem:robbingkit", function(source)
    TriggerClientEvent('GraveRobbing:TriggerRobbery', source)
end)

RegisterNetEvent("GraveRobbing:Complete")
AddEventHandler("GraveRobbing:Complete", function()
	local _source = source
    local r = math.random(1, 100)

    if r <= 25 then
        TriggerEvent('redemrp:getPlayerFromId', source, function(user)
			local r = math.random(1,5)

			data.addItem(_source, items[r], 1)
        end)

        TriggerClientEvent("redemrp_notification:start", _source, "You've found something!", 2)
    else

        TriggerClientEvent("redemrp_notification:start", _source, "Nice try, partner.", 2)
    end
end)
