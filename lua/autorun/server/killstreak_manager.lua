hook.Add( "EntityTakeDamage", "Killstreak Reset", function( ply, dmginfo ) 
    if ply:IsPlayer() then
        if (dmginfo:GetAttacker() == "nz_zombie_walker" or dmginfo:GetAttacker() == "nz_zombie_special_dog"
        or dmginfo:GetAttacker() == "panzer" or dmginfo:GetAttacker() == "special walker" ) 
        ply.killstreak = 0
    end
end )