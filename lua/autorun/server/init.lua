if engine.ActiveGamemode() != "nzombies" then return end

AddCSLuaFile( "cl_init.lua" ) -- Test comment
AddCSLuaFile( "cl_roundhooks.lua" )
AddCSLuaFile( "cl_revivehooks.lua" )
AddCSLuaFile( "" )

include( "sv_roundhooks.lua" )
include( "sv_revivehooks.lua" )
include( "sv_player_maanager.lua" )
include( "" )