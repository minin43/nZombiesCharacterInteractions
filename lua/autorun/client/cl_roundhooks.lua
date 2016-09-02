--Game start dialogue
net.Receive( "SayNoPower", function()
	local number = net.ReadInt()
	whatsmyname()
	sound.Play( "nz/"..charactername.."sound/path"..number..".ogg", self:GetPos(), 75, 100, 1 )
end )

local currentround
--Special-Round checking, there's no need to check if the second round won't be a dog round because IF the first one is, the second one MUST be
net.Receive( "nz_hellhoundround", function()
	if net.ReadBool() then
		currentround = "dogs"
	end
end )

--Hellhound round dialogue
net.Receive( "SayDogSpawn", function()
	local number = net.ReadInt()
	whatsmyname()
	if currentround == "dogs" then
		timer.Simple( 3, function()
			sound.Play( "nz/"..charactername.."sound/path"..number..".ogg", self:GetPos(), 75, 100, 1 )
		end )
	end
end )

