function printSmallGuildNames(memberCount)
	local selectGuildQuery = "SELECT name FROM guilds WHERE guild_id IN (SELECT guild_id FROM guild_membership GROUP BY guild_id HAVING COUNT(guild_id) < %d);"
	-- no max_members in database provided; if assumed exists, ignore above change
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount)) -- assuming db called elsewhere, otherwise needs db = require "db.mysql"?
	local guildName = resultId.getString("name") -- fixed variable name, result -> resultID
	print(guildName)
end