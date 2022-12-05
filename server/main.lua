local QBCore = exports['qb-core']:GetCoreObject()
local timeOut = false

QBCore.Functions.CreateCallback('cpbea:server:Reward', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)
    local itemType = math.random(#Config.RewardTypes)
end)

if Config.RewardTypes[itemType].type == "item" then
	local item = math.random(1, #Config.CuReward)
	local amount = math.random(Config.CuReward[item]["amount"]["min"], Config.CuReward[item]["amount"]["max"])
		if Player.Functions.AddItem(Config.CuReward[item]["item"], amount) then
		    TriggerClientEvent('inventory:client:ItemBox', src, GBCore.Shared.Items[Config.CuReward[item]["item"]], 'add')
		else
		   TriggerClientEvent('QBCore:Notify', src, 'Inventory is full..', 'error')
		end
        elseif Config.RewardTypes[itemType].type == "money" then
		local worth = math.random(10, 50)
		Player.Functions.AddMoney("cash", worth)
        end
end)

