function kickMemberFromParty(playerId, targetMember) -- function name improved, parameter changed to improve clarity; targetMember is kicked if in playerId's party.
    local player = Player(playerId) -- changed to local variable
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(targetMember) then
            party:removeMember(Player(targetMember))
        end
    end
end