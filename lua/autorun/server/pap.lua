local sounds = {
    ["pre"] = { "pre_upgrade1.ogg", "pre_upgrade2.ogg", "pre_upgrade3.ogg", "pre_upgrade4.ogg", "pre_upgrade5.ogg" },
    ["post"] = { "post_upgrade1.ogg", "post_upgrade2.ogg", "post_upgrade3.ogg", "post_upgrade4.ogg", "post_upgrade5.ogg", "post_upgrade6.ogg", "post_upgrade7.ogg", "post_upgrade8.ogg" }
}

hook.Add( "OnPlayerBought", "PaPBuy", function( ply, price, ent ) 
    if timer.Exists( ply:SteamID().."timer" ) then return end
    if ent:GetPerkID() != "pap" then return end
    if !validmodel( ply ) then return end

    local sound = table.Random(sounds["pre"])
    timer.Create( ply:SteamID().."timer", 1, 1, function()
        ply:EmitSound( "nz/"..ply.character.."/pap/"..sound )
		timer.Simple( 5, function()
			timer.Remove( ply:SteamID().."timer" )
		end )
    end )
end )

hook.Add( "WeaponEquip", "PaPPickup", function( wep )
    timer.Simple( 0, function()
        local ply = wep:GetOwner()
        if !validmodel( ply ) then return end
        --if wep:HasModifier("pap") then
        if wep.pap == true then
            if !timer.Exists( ply:SteamID().."timer" ) then
                local sound = table.Random( sounds["post"] )
                timer.Create( ply:SteamID().."timer", 1, 1, function()
                    ply:EmitSound( "nz/"..ply.character.."/pap/"..sound )
		            timer.Simple( 5, function()
			            timer.Remove( ply:SteamID().."timer" )
		            end )
                end )
            end
        end
    end)
end )