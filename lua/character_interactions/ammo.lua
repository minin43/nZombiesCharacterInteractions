local blacklistweps = {
    ["nz_perk_bottle"] = true,
    ["nz_quickknife_crowbar"] = true,
    ["nz_bowie_knife"] = true,
    ["nz_death_machine"] = true,
    ["nz_grenade"] = true,
    ["nz_monkey_bomb"] = true,
    ["nz_one_inch_punch"] = true,
    ["nz_packapunch_arms"] = true,
    ["nz_revive_morphine"] = true,
    ["nz_zombieshield"] = true
}
hook.Add( "KeyPress", "HookThink", function( ply, key ) --IN_RELOAD
    if not key == IN_RELOAD then return end
    local wep = ply:GetActiveWeapon()
    if blacklistweps[wep] then return end
    local clipsize = wep:GetMaxClip1()
    local currentammo = wep:Ammo1()
    
    hook.Call( "ReloadCall", nil, ply, wep, clipsize, currentammo )
    if !wep:CanPrimaryAttack() and ( wep:Ammo1() == 0 ) then
        hook.Call( "NoAmmoCall", nil, ply, wep )
    end
end )

local sounds = {
    ["low"] = { "ammo_low1.ogg", "ammo_low2.ogg", "ammo_low3.ogg", "ammo_low4.ogg", "ammo_low5.ogg" },
    ["no"] = { "ammo_out1.ogg", "ammo_out2.ogg", "ammo_out3.ogg", "ammo_out4.ogg", "ammo_out5.ogg", "ammo_out6.ogg" }
}

hook.Add( "ReloadCall", "LowAmmoCheck", function( ply, wep, clipsize, ammo )
    if !validmodel( ply ) then return end
    local sound = table.Random( sounds["low"] )
    if ammo <= ( clipsize - ammo ) then
        if !timer.Exists( ply:SteamID().."timer" ) then
            timer.Create( ply:SteamID().."timer", 15, 1, function() 
                timer.Remove( ply:SteamID().."timer" )
            end )
            timer.Simple( 0.2, function()
                ply:EmitSound( "nz/"..ply.character.."/"..sound )
			end )
        end
    end
end )

hook.Add( "NoAmmoCall", "NoAmmoCheck", function( ply, wep )
    if !validmodel( ply ) then return end
    local sound = table.Random( sounds["no"] )
    if !timer.Exists( ply:SteamID().."timer" ) then
        timer.Create( ply:SteamID().."timer", 15, 1, function() 
            timer.Remove( ply:SteamID().."timer" )
        end )
        timer.Simple( 0.2, function()
            ply:EmitSound( "nz/"..ply.character.."/"..sound )
		end )
    end
end )