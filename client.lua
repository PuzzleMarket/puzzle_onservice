local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

pz = Tunnel.getInterface("puzzle_onservice")

local cfg = module("puzzle_onservice","config")

local opened = false

-------------------------------------------------
-- Novos 
-------------------------------------------------
local locations = cfg.locs
local perms = cfg.permissions
local currentGroup = ""
-------------------------------------------------
CreateThread(function()
	while true do
		local ped = PlayerPedId()
		Citizen.Wait(0)
		sleep = true
		for k,v in pairs(locations) do
			local distance = #(GetEntityCoords(ped) - v.coord)
			if distance <= 7 and not opened then
				sleep = false
			 	DrawMarker(21, v.coord,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				for key,value in pairs(perms[v.type]) do
					if distance <= 1.5 and
						IsControlJustPressed(0,38) and
						( pz.checkGroup(value.inServiceGroup) or pz.checkGroup(value.outServiceGroup) ) 
					then
						opened = true
						SetNuiFocus(true, true)
						TransitionToBlurred(true)

						if pz.checkGroup(value.inServiceGroup) then
							currentGroup = value.inServiceGroup
						else
							currentGroup = value.outServiceGroup
						end

						SendNUIMessage({
							action = 'open',
							type = v.type,
							currentGroup = currentGroup,
							currentGroupTitle = pz.getGroupTitle(currentGroup)
						})

					end
				end
			end
		end
		if sleep then Citizen.Wait(1000) end 
	end
end)

RegisterNUICallback("close",function(data,cb)
	opened = false
	SetNuiFocus(false, false)
	TransitionFromBlurred(1000)
end)

RegisterNUICallback("InService",function(data)
	local playerGroup = data.group
	local blipType = data.type
	pz.turnServiceIn(playerGroup, blipType)
end)

RegisterNUICallback("OutService",function(data)
	local playerGroup = data.group
	local blipType = data.type
	pz.turnServiceOut(playerGroup, blipType)
end)
