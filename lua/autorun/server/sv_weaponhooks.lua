local function typeofweapon( wep )
    local weapontypes = {
        
    }
end

hook.Add( "OnPlayerBuy", "", function( ply, amount, wep, func ) 

end )

hook.Add( "WeaponEquip", "AmmoCheck", function( wep ) 
    timer.Simple( 0.1, function()
        local ply = wep:GetOwner()
    end )

    ply:GetAmmoType( wep
end )