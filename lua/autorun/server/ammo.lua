function SWEP:Reload()
    local ply = self:GetOwner()
    local clipsize = self:GetMaxClip1()
    local currentammo = self:Ammo1()
    hook.Call( "ReloadCall", nil, ply, self, clipsize, currentammo )
end

function SWEP:PrimaryAttack()
    local ply = self:GetOwner()
    if !self:CanPrimaryAttack() and ( self:Ammo1() == 0 ) then
        hook.Call( "NoAmmoCall", nil, ply, self )
    end
end

local sounds = {
    ["low"] = { "ammo_low1.ogg", "ammo_low2.ogg", "ammo_low3.ogg", "ammo_low4.ogg", "ammo_low5.ogg" },
    ["no"] = { "ammo_out1.ogg", "ammo_out2.ogg", "ammo_out3.ogg", "ammo_out4.ogg", "ammo_out5.ogg", "ammo_out6.ogg" }
}

hook.Add( "ReloadCall", "LowAmmoCheck", function( ply, wep, clipsize, ammo )
    if !validmodel( ply ) then return end
    local sound = table.Random( sounds["low"] )
    if ammo <= ( clipsize - ammo ) then
        if !timer.Exists( ply:SteamID().."timer" ) then
            timer.Create( ply:SteamID().."timer", 0.2, 1, function()
                ply:EmitSound( "nz/"..ply.character.."/ammolow/"..sound )
			    timer.Simple( 5, function()
				    timer.Remove( ply:SteamID().."timer" )
			    end )
            end )
        end
    end
end )

hook.Add( "NoAmmoCall", "NoAmmoCheck", function( ply, wep )
    if !validmodel( ply ) then return end
    local sound = table.Random( sounds["no"] )
    if !timer.Exists( ply:SteamID().."timer" ) then
        timer.Create( ply:SteamID().."timer", 0.2, 1, function()
            ply:EmitSound( "nz/"..ply.character.."/ammoout/"..sound )
			timer.Simple( 5, function()
				timer.Remove( ply:SteamID().."timer" )
			end )
        end )
    end
end )