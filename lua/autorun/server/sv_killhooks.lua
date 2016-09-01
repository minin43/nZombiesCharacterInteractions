
util.AddNetworkString( "DamagedKill" )
util.AddNetworkString( "CloseKill" )
util.AddNetworkString( "Headshot" )
util.AddNetworkString( "MonkeyKill" )
util.AddNetworkString( "ExplosiveKill" )
util.AddNetworkString( "Insta" )
util.AddNetworkString( "Raygun" )
util.AddNetworkString( "Thundergun" )
util.AddNetworkString( "Killstreak" )

hook.Add( "", "VariousZombieKills", function( zombie, ply, dmginfo, hitgroup )
	if ply:IsPlayer() and !timer.Exists( ply:SteamID().."timer" ) then
		ply.killstreak = ply.killstreak + 1
		if zombie == "nz_zombie_walker" then
			if table.HasValue( validplayers, ply ) then
				--Start regular zombie dialogue
				--Low player health first...
				if ply:Health() < ply:GetMaxHealth() then 
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "DamagedKill" )
							net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if they're close to you...
				if zombie:GetPos():Distance( ply:GetPos() ) < 75 then --nZombie's melee range is 75 units
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "CloseKill" )
							net.WriteInt( math.random( 1, 7 ), 4 ) --There are 7 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you used a monkey-bomb...
				if dmginfo:GetInflictor() == "insert_monkey_bomb_ent_here" then
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "MonkeyKill" )
							net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you used a grenade (or some type of explosive device)
				if dmginfo:GetDamageType() == DMG_BLAST then --Will fire damage be added in? Will need to look for both the active weapon as the flamethrower AND DamageType being DMG_BURN
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "ExplosiveKill" )
							net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're on a killstreak...
				local killstreaks = { 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300 }
				if killstreaks[ply.killstreak] then --Do I need table.HasValue()?
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "Killsreak" )
							net.WriteInt( math.random( 1, 14 ), 5 ) --There are 14 quotes from each character
						net.Send( ply )
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
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "Headshot" )
							net.WriteInt( math.random( 1, 10 ), 4 ) --There are 10 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if instakill is active...
				if nzPowerUps:IsPowerupActive( "insta" ) then
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "Insta" )
							net.WriteInt( math.random( 1, 6 ), 4 ) --There are 6 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're using the raygun...
				if ply:GetActiveWeapon() == "insert_raygun_class_here" then
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "Raygun" )
							net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Then if you're using the thundergun...
				if ply:GetActiveWeapon() == "insert_thundergun_class_here" then
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "Thundergun" )
							net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--Here's the template for future weapons...
				if ply:GetActiveWeapon() == "insert_gun_class_here" then
					timer.Create( ply:SteamID().."timer", 0.1, 1, function()
						net.Start( "insert_networkstring_name_here" )
							net.WriteInt( math.random( 1, _ ), _ ) --There are _ quotes from each character
						net.Send( ply )
						timer.Simple( 5, function()
							timer.Remove( ply:SteamID().."timer" )
						end )
					end )
					return
				end
				--End regular zombie dialogue
			end
		elseif zombie == "nz_zombie_special_dog" then
			
		end
	end
end )