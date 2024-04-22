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

local combat1 = Combat() -- setting combat settings for each. can definitely be streamlined
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat1:setArea(createCombatArea(array1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat2:setArea(createCombatArea(array2))

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat3:setArea(createCombatArea(array3))

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat4:setArea(createCombatArea(array4))

local function cast1(creature, variant) -- cast functions for addEvent. can definitely be streamlined
    combat1:execute(creature, variant)
    end

local function cast2(creature, variant)
    combat2:execute(creature, variant)
    end

local function cast3(creature, variant)
    combat3:execute(creature, variant)
    end
        
local function cast4(creature, variant)
    combat4:execute(creature, variant)
    end

-- no damage calcs just for proof of concept

function onCastSpell(creature, variant) -- addEvent rotations. can definitely be streamlined
    addEvent(cast2, 250, creature.uid, variant)
    addEvent(cast3, 500, creature.uid, variant)
    addEvent(cast4, 750, creature.uid, variant)
    addEvent(cast1, 1000, creature.uid, variant)
    addEvent(cast2, 1250, creature.uid, variant)
    addEvent(cast3, 1500, creature.uid, variant)
    addEvent(cast4, 1750, creature.uid, variant)
    addEvent(cast1, 2000, creature.uid, variant)
    return combat1:execute(creature, variant)
    end