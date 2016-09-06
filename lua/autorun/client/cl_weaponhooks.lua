--To be used for wallbuys and mystery box
net.Receive( "", function()

end )

net.Receive( "PurchaseFailure", function()
    local number = net.ReadInt()
	whatsmyname()
	timer.Simple( 0.9, function()
		sound.Play( "nz/"..charactername.."/Money/no_money"..number..".ogg", self:GetPos(), 75, 100, 1 )
	end )
end )