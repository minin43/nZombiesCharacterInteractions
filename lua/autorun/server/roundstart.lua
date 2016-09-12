local validplayers = {}

hook.Add( "OnGameBegin", "PlayerCheck", function()
	for k, v in pairs( player.GetAll() ) do
		if ValidModel( v ) then 
			table.insert( validplayers, k, v )
		end
	end
end )

hook.Add( "PlayerSpawn", "PlayerCheck", function( ply )
	if ValidModel( ply ) then
		table.insert( validplayers, ply )
	end
end )

hook.Add( "OnPlayerDropOut", "PlayerCheck", function( ply )
	if validplayers[ply] then
		table.remove( validplayers, table.KeyFromValue( validplayers, ply) )
	end
end )

local sounds = { 
	["power"] = { "nopower1.ogg", "nopower2.ogg", "nopower3.ogg", "nopower4.ogg", "nopower5.ogg" }, 
	["special"] = { "dog_spawned1.ogg", "dog_spawned2.ogg", "dog_spawned3.ogg", "dog_spawned4.ogg", "dog_spawned5.ogg" }
}

hook.Add( "OnGameBegin", "NoPower", function()
	local chosenone = table.Random( validplayers )
	local sound = table.Random( sounds["power"] )
	
	if chosenone then
		chosenone:EmitSound( "nz/"..chosenone.character.."/power/"..sound )
	end
end )

hook.Add( "OnRoundStart", "DogsSpawning", function()
	if !nzRound:IsSpecial() then return end
	local chosenone = table.Random( validplayers )
	local sound = table.Random( sounds["special"] )
	
	if chosenone then
		chosenone:EmitSound( "nz/"..chosenone.character.."/dog/"..sound )
	end
end )