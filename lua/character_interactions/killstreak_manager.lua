local zombies = {
    [ "nz_zombie_walker" ] = true,
    [ "nz_zombie_special_dog" ] = true,
    [ "nz_zombie_boss_panzer" ] = true,
    [ "nz_zombie_special_burning" ] = true
    --[ "" ] = true,
}

hook.Add( "EntityTakeDamage", "Killstreak Reset", function( ply, dmginfo ) 
    if ply:IsPlayer() then
        if zombies[ dmginfo:GetAttacker():GetClass() ] then
            ply.killstreak = 0
        end
    end
end )