local outStorage = 1000 -- added local value for easier editing

local function releaseStorage(player)
	player:setStorageValue(outStorage, -1)
end

-- function onLogout(player)
	if player:getStorageValue(outStorage) == 1 then
		releaseStorage(player) -- delay necessary?
	end
	return true
end 