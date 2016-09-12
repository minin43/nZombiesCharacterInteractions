local sounds = {
	["maxammo"] = { "ammo1.ogg", "ammo2.ogg", "ammo3.ogg" },
	["carpenter"] = { "carpenter1.ogg", "carpenter2.ogg", "carpenter3.ogg", "carpenter4.ogg", "carpenter5.ogg" },
	--["death"] = { "", },
	["dp"] = { "double_points1.ogg", "double_points2.ogg", "double_points3.ogg" },
	["firesale"] = { "firesale1.ogg", "firesale2.ogg", "firesale3.ogg", "firesale4.ogg", "firesale5.ogg" },
	["insta"] = { "instakill1.ogg", "instakill2.ogg", "instakill3.ogg", },
	["nuke"] = { "nuke1.ogg", "nuke2.ogg", "nuke3.ogg", }
}

hook.Add( "OnPlayerPickupPowerUp", "PlayerPickedUpPowerup", function( ply, id, ent )
	if !validmodel( ply ) then return end
	local sound = table.Random( sounds[id] )
	
	if sound and !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 1, 1, function()
            ply:EmitSound( "nz/"..ply.character.."/powerups/"..sound )
			timer.Simple( 5, function()
				timer.Remove( ply:SteamID().."timer" )
			end )
        end )
	end
end )