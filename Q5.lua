local array1 = { -- settings area arrays to make a rotating pattern. not to exact replication but approximation
    {0, 0, 0, 0, 0, 0, 0},
	{1, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 0, 0, 0, 0},
	{1, 1, 1, 2, 0, 1, 1},
	{1, 1, 1, 0, 0, 0, 0},
	{1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0}
}
local array2 = {
    {0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 2, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0}
}
local array3 = {
    {0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1},
	{0, 0, 0, 0, 1, 1, 1},
	{1, 1, 0, 2, 1, 1, 1},
	{0, 0, 0, 0, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 1},
	{0, 0, 0, 0, 0, 0, 0}
}
local array4 = {
    {0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 2, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

local arrays = {array1, array2, array3, array4} -- put the spell arrays into an array in order to get count for variables.
local numAreas = #arrays -- used in iteration through all areas for scalability
local castDelay = 250 -- determines delay between each area wave during the spell's cast
local loops = 3 -- number of loops through spell cast

local combat1 = Combat() -- creating combat vars 
local combat2 = Combat()
local combat3 = Combat()
local combat4 = Combat()

local combats = {combat1, combat2, combat3, combat4} -- sets common parameters across all combats + area based on array position
for i, combat in ipairs(combats) do
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
	combat:setArea(createCombatArea(arrays[i]))
end

local function cast(creature, variant, index) -- check index for which area to execute. could probably use index with the combats array in some way but it was returning errors.
	if index == 1 then
		combat1:execute(creature, variant)
	elseif index == 2 then
		combat2:execute(creature, variant)
	elseif index == 3 then
		combat3:execute(creature, variant)
	elseif index == 4 then
		combat4:execute(creature, variant)
	end
end

-- no damage calcs just for proof of concept

function onCastSpell(creature, variant)
	for h=1,loops do -- spell loops through all areas based on loop variable
		for i=1,numAreas do -- spell loops through every area
    		addEvent(cast, i*castDelay+(castDelay*numAreas*(h-1)), creature.uid, variant, i) -- calculates delay for each iteration and wave of the spell.
    	end
	end
	return combat4:execute(creature, variant) -- instant cast is returned
end