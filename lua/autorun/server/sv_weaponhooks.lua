
local sounds = { 
    ["bowie"] = { "bowie1.ogg", "bowie2.ogg", "bowie3.ogg", "bowie4.ogg", "bowie5.ogg" },
    ["pistol"] = { "crappy1.ogg", "crappy2.ogg", "crappy3.ogg", "crappy4.ogg", "crappy5.ogg", "crappy6.ogg" }, --crappy
    ["dual"] = { "dual1.ogg", "dual2.ogg", "dual3.ogg", "dual4.ogg", "dual5.ogg" },
    ["fire"] = { "fire1.ogg", "fire2.ogg", "fire3.ogg", "fire4.ogg", "fire5.ogg", "fire6.ogg" },
    ["launcher"] = { "launcher1.ogg", "launcher2.ogg", "launcher3.ogg" },
    ["machine"] = { "mg1.ogg", "mg2.ogg", "mg3.ogg", "mg4.ogg", "mg5.ogg", "mg6.ogg", "mg7.ogg", "mg8.ogg", "mg9.ogg" }, --Use this for both ARs and HMGs
    ["monkey"] = { "monkey1.ogg", "monkey2.ogg", "monkey3.ogg", "monkey4.ogg", "monkey5.ogg" },
    ["raygun"] = { "raygun1.ogg", "raygun2.ogg", "raygun3.ogg", "raygun4.ogg", "raygun5.ogg", "raygun6.ogg" },
    ["shotgun"] = { "shotgun1.ogg", "shotgun2.ogg", "shotgun3.ogg", "shotgun4.ogg", "shotgun5.ogg", "shotgun6.ogg", "shotgun7.ogg" },
    ["smg"] = { "smg1.ogg", "smg2.ogg", "smg3.ogg", "smg4.ogg", "smg5.ogg" },
    ["ar2"] = { "sniper1.ogg", "sniper2.ogg", "sniper3.ogg", "sniper4.ogg", "sniper5.ogg", "sniper6.ogg" }, --sniper
    --["tesla"] = { "", }, --Currently no Tesla Cannons work, so leaving this as-is
    ["thunder"] = { "thundergun1.ogg", "thundergun2.ogg", "thundergun3.ogg", "thundergun4.ogg", "thundergun5.ogg", }
}

local weptypes = {
	--CW2.0 Base
    ["cw_ak74"] 		= { "machine" },
	["cw_ar15"] 		= { "machine" },
	["cw_deagle"] 		= { "pistol" },
	["cw_g3a3"] 		= { "machine" },
	["cw_l115"] 		= { "ar2" },
	["cw_mp5"] 			= { "smg" },
	["cw_mr96"] 		= { "pistol" },
	--Extra CW2.0 guns
	["cw_fiveseven"] 	= { "pistol" },
	["cw_g36c"] 		= { "machine" },
	["cw_l85a2"] 		= { "machine" },
	["cw_m3super90"] 	= { "shotgun" },
	["cw_m14"] 			= { "ar2" },
	["cw_m249_official"]= { "machine" },
	["cw_m1911"] 		= { "pistol" },
	["cw_mac11"] 		= { "smg" },
	["cw_makarov"] 		= { "pistol" },
	["cw_p99"] 			= { "pistol" },
	["cw_scarh"] 		= { "machine" },
	["cw_shorty"] 		= { "shotgun" },
	["cw_ump45"] 		= { "smg" },
	["cw_vss"] 			= { "pistol" },
	--Khris' packs
	["khr_hmg"] 		= { "machine" },
	["khr_m60"] 		= { "machine" },
	["khr_pkm"] 		= { "machine" },
	["khr_m82a3"] 		= { "ar2" },
	["khr_m95"] 		= { "ar2" },
	["khr_mosin"] 		= { "ar2" },
	["khr_sr338"] 		= { "ar2" },
	["khr_svt40"] 		= { "ar2" },
	["khr_t5000"] 		= { "ar2" },
	["khr_aek971"] 		= { "machine" },
	["khr_ak103"] 		= { "machine" },
	["khr_cz858"] 		= { "machine" },
	["khr_delisle"] 	= { "machine" },
	["khr_fnfal"] 		= { "machine" },
	["khr_m1carbine"] 	= { "ar2" },
	["khr_simsks"] 		= { "ar2" },
	["khr_sks"] 		= { "ar2" },
	["khr_m620"] 		= { "shotgun" },
	["khr_mp153"] 		= { "shotgun" },
	["khr_ns2000"] 		= { "shotgun" },
	["khr_toz194"] 		= { "shotgun" },
	["khr_fmg9"] 		= { "smg" },
	["khr_l2a3"] 		= { "smg" },
	["khr_mp5a4"] 		= { "smg" },
	["khr_mp5a5"] 		= { "smg" },
	["khr_mp40"] 		= { "smg" },
	["khr_p90"] 		= { "smg" },
	["khr_vector"] 		= { "smg" },
	["khr_veresk"] 		= { "smg" },
	--nZombie Weapons
	["nz_bowie_knife"]	= { "bowie" },
	["nz_monkey_bomb"] 	= { "monkey" }
	--[""] = { "" },
}

hook.Add( "OnPlayerBought", "PurchaseSuccess", function( ply, price, ent ) --Do I want this? This might get annoying for wallbuys
    if timer.Exists( ply:SteamID().."timer" ) then return end
    if ent != "wall_buys" then return end
    local weptype = weptypes[ent:GetWepClass()] or ent:GetWepClass():GetHoldType()
    local sounds = sounds[weptype]

    if sounds then
        local sound = table.Random(sounds)
        timer.Create( ply:SteamID().."timer", 1, 1, function()
            ply:EmitSound( "nz/"..ply.character.."/weapons/"..sound )
        end )
    end
end )

hook.Add( "nzPlayerBoughtBox", "BoxPurchaseSuccess", function( ply, wep )
	if timer.Exists( ply:SteamID().."timer" ) then return end
	local weptype = weptypes[ent:GetWepClass()] or ent:GetWepClass():GetHoldType()
    local sounds = sounds[weptype]

    if sounds then
        local sound = table.Random(sounds)
        timer.Create( ply:SteamID().."timer", 1, 1, function()
            ply:EmitSound( "nz/"..ply.character.."/weapons/"..sound )
        end )
    end
end )
--[[
util.AddNetworkString( "PurchaseSuccess" ) --only for wallbuys, mysterybox will have to be handled differently
hook.Add( "OnPlayerBought", "PurchaseSuccess", function( ply, price, ent ) 
    elseif allother.ent:GetWepClass() then
        timer.Create( ply:SteamID().."timer", 0.1, 1, function() --All dialogue delays are done client-side
		    net.Start( "PurchaseSuccess" )
		    	net.WriteInt( math.random( 1, 6 ), 4 ) --There are 5 quotes from each character
                net.WriteString( ent:GetWepClass() )
		    net.Send( ply )
	    end )
    elseif machineguns.ent:GetWepClass() then --Monkey bombs
            timer.Create( ply:SteamID().."timer", 0.1, 1, function() --All dialogue delays are done client-side
			    net.Start( "PurchaseSuccess" )
			    	net.WriteInt( math.random( 1,  ), 4 ) --There are 5 quotes from each character
                    net.WriteString( "" )
			    net.Send( ply )
		    end )

        elseif 
        --ent:GetWepClass()
    end
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
end )]]