
local sounds = {
	["close"] = { "close1.ogg", "close2.ogg", "close3.ogg", "close4.ogg", "close5.ogg", "close6.ogg", "close7.ogg" },
	["damaged"] = { "damaged1.ogg", "damaged2.ogg", "damaged3.ogg", "damaged4.ogg", "damaged5.ogg" },
	["dog"] = { "dog_killed1.ogg", "dog_killed2.ogg", "dog_killed3.ogg", "dog_killed4.ogg", "dog_killed5.ogg", "dog_killed6.ogg" },
	["explosion"] = { "explosion1.ogg", "explosion2.ogg", "explosion3.ogg", "explosion4.ogg", "explosion5.ogg" },
	["flame"] = { "flame1.ogg", "flame2.ogg", "flame3.ogg", "flame4.ogg", "flame5.ogg" },
	["headshot"] = { "headshot1.ogg", "headshot2.ogg", "headshot3.ogg", "headshot4.ogg", "headshot5.ogg", "headshot6.ogg", "headshot7.ogg", "headshot8.ogg", "headshot9.ogg", "headshot10.ogg" },
	["instakill"] = { "instakill1.ogg", "instakill2.ogg", "instakill3.ogg", "instakill4.ogg", "instakill5.ogg", "instakill6.ogg" },
	["monkey"] = { "monkey_kill1.ogg", "monkey_kill2.ogg", "monkey_kill3.ogg", "monkey_kill4.ogg", "monkey_kill5.ogg" },
	["raygun"] = { "raygun_kill1.ogg", "raygun_kill2.ogg", "raygun_kill3.ogg", "raygun_kill4.ogg", "raygun_kill5.ogg" },
	["streak"] = { "streak1.ogg", "streak2.ogg", "streak3.ogg", "streak4.ogg", "streak5.ogg", "streak6.ogg", "streak7.ogg", 
					"streak8.ogg", "streak9.ogg", "streak10.ogg", "streak11.ogg", "streak12.ogg", "streak13.ogg", "streak14.ogg" },
	["thundergun"] = { "thundergun_kill1.ogg", "thundergun_kill2.ogg", "thundergun_kill3.ogg", "thundergun_kill4.ogg", "thundergun_kill5.ogg" }
}

hook.Add( "OnZombieKilled", "VariousZombieKills", function( zombie, ply, dmginfo, hitgroup )
	if ply:IsPlayer() and !timer.Exists( ply:SteamID().."timer" ) and zombie:IsValidZombie() and validmodel( ply ) then
		local sound
		ply.killstreak = ply.killstreak + 1
		if zombie == "nz_zombie_walker" then
			--if table.HasValue( validplayers, ply ) then
				--Start regular zombie dialogue
				--Low player health first...
				if ply:Health() < ply:GetMaxHealth() then 
					sound = table.Random( sounds["damaged"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if they're close to you...
				if zombie:GetPos():Distance( ply:GetPos() ) < 75 then --nZombie's melee range is 75 units
					sound = table.Random( sounds["close"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you used a monkey-bomb...
				if dmginfo:GetInflictor() == "nz_monkey_bomb" then
					sound = table.Random( sounds["monkey"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you used a grenade (or some type of explosive device)
				if dmginfo:GetDamageType() == DMG_BLAST then --Will fire damage be added in? Will need to look for both the active weapon as the flamethrower AND DamageType being DMG_BURN
					sound = table.Random( sounds["explosion"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're on a killstreak...
				local killstreaks = { 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300 }
				if killstreaks[ply.killstreak] then --Do I need table.HasValue()?
					sound = table.Random( sounds["streak"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//The rest of these are only going to be chance-based (currently 25%), so as to avoid dialogue spamming (despite how much it may or may not add to the game)//
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				local randomnumber = math.random( 1, 4 )
				if randomnumber != 1 then return end
				--Then if it's a headshot...
				if hitgroup == HITGROUP_HEAD then
					sound = table.Random( sounds["headshot"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if instakill is active...
				if nzPowerUps:IsPowerupActive( "insta" ) then
					sound = table.Random( sounds["instakill"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're using the raygun...
				if ply:GetActiveWeapon() == "insert_raygun_class_here" then
					sound = table.Random( sounds["raygun"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're using the thundergun...
				if ply:GetActiveWeapon() == "insert_thundergun_class_here" then
					sound = table.Random( sounds["thundergun"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Here's the template for future weapons...
				if ply:GetActiveWeapon() == "insert_gun_class_here" then
					sound = table.Random( sounds["insertnewtablenamehere"] )
					timer.Create( ply:SteamID().."timer", 0.5, 1, function()
						ply:EmitSound( "nz/"..ply.character.."/zombie/"..sound )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--End regular zombie dialogue
			--end
		elseif zombie == "nz_zombie_special_dog" then
			local randomnumber = math.random( 1, 4 )
			if randomnumber != 1 then return end
			sound = table.Random( sounds["dog"] )
			timer.Create( ply:SteamID().."timer", 0.5, 1, function()
				ply:EmitSound( "nz/"..ply.character.."/dog/"..sound )
				timer.Simple( 5, function()
					timer.Remove( ply:SteamID().."timer" )
				end )
			end )
			return
		end
	end
end )