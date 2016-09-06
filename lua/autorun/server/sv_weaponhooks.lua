local function typeofweapon( wep )
    local weapontypes = {
        
    }
end

util.AddNetworkString( "PurchaseSuccess" )
hook.Add( "OnPlayerBought", "PurchaseSuccess", function( ply, price, ent ) 

end )

util.AddNetworkString( "PurchaseFailure" )
hook.Add( "OnPlayerBuy", "PurchaseFailure", function( ply, price, ent, func ) 
    if ply:CanAfford( price ) then
        return
    else
        if !timer.Exists( ply:SteamID().."timer" ) then
		    timer.Create( ply:SteamID().."timer", 0.1, 1, function() --All dialogue delays are done client-side
			    net.Start( "PurchaseFailure" )
				    net.WriteInt( math.random( 1, 3 ), 3 ) --There are 3 quotes from each character
			    net.Send( ply )
		    end )
	    end 
    end
end )

hook.Add( "WeaponEquip", "AmmoCheck", function( wep ) 
    timer.Simple( 0.1, function()
        local ply = wep:GetOwner()
    end )

    ply:GetAmmoType( wep
end )