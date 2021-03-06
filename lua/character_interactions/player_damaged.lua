local sounds = { "ohshit1.ogg", "ohshit2.ogg", "ohshit3.ogg", "ohshit4.ogg", "ohshit5.ogg", "ohshit6.ogg", "ohshit7.ogg", "ohshit8.ogg", 
                "ohshit9.ogg", "ohshit10.ogg", "ohshit11.ogg", "ohshit12.ogg", "ohshit13.ogg", "ohshit14.ogg", "ohshit15.ogg", "ohshit16.ogg" }

hook.Add( "EntityTakeDamage", "OH SHIT", function( ply, dmginfo )
    if not ply:IsPlayer() or dmginfo:GetAttacker():IsPlayer() or dmginfo:IsFallDamage() or not validmodel( ply ) then return end
    local sound = table.Random( sounds )
    
    if !timer.Exists( ply:SteamID().."damaged" ) then
        timer.Create( ply:SteamID().."damaged", 5, 1, function()
            timer.Remove( ply:SteamID().."damaged" )
        end )
    elseif timer.Exists( ply:SteamID().."damaged" ) then
        if !timer.Exists( ply:SteamID().."timer" ) then
            timer.Create( ply:SteamID().."timer", 15, 1, function()
                timer.Remove( ply:SteamID().."timer" )
            end )
            timer.Simple( 0.5, function()
                ply:EmitSound( "nz/"..ply.character.."/"..sound )
			end )
            timer.Remove( ply:SteamID().."damaged" )
        end
    end
end )