Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local pz = {}
Tunnel.bindInterface("puzzle_onservice",pz)
local cfg = module(GetCurrentResourceName(),"config")

function pz.getGroupTitle(group)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.getGroupTitle(group)
end

function pz.turnServiceIn(group, blipType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		local matchedPerm = {}
		local secondaryPerm = {}

		local permissions = cfg.permissions[blipType]
		for k,v in pairs(permissions) do
			if group == v.outServiceGroup then
				table.insert(matchedPerm, v.outServiceGroup)
				table.insert(secondaryPerm,v.inServiceGroup)
			end
		end

		if (#matchedPerm > 0 ) then
			vRP.removeUserGroup(user_id,group) -- Não é necessário, mas coloquei, pois, se configurarem errado, isso já resolve
			vRP.addUserGroup(user_id,secondaryPerm[1])
			TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		else
			TriggerClientEvent("Notify",source,"negado","Você já está em serviço.")
		end

	end
end

function pz.turnServiceOut(group, blipType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		local matchedPerm = {}
		local secondaryPerm = {}

		local permissions = cfg.permissions[blipType]
		for k,v in pairs(permissions) do
			if group == v.inServiceGroup then
				table.insert(matchedPerm, v.inServiceGroup)
				table.insert(secondaryPerm,v.outServiceGroup)
			end
		end

		if (#matchedPerm > 0 ) then
			vRP.removeUserGroup(user_id,group) -- Não é necessário, mas coloquei, pois, se configurarem errado, isso já resolve
			vRP.addUserGroup(user_id,secondaryPerm[1])
			TriggerClientEvent("Notify",source,"sucesso","Você saiu de serviço.")
		else
			TriggerClientEvent("Notify",source,"negado","Você já saiu de serviço.")
		end

	end
end

function pz.checkGroup(group)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasGroup(user_id,group)
end