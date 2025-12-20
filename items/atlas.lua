SMODS.Rarity{
	key = "epic",
	loc_txt = {},
	badge_colour = HEX("ef0098"),
	default_weight = 0.003,
	pools = { ["Joker"] = true },
	get_weight = function()
        if SMODS.find_mod("Cryptid") or (not dandysworld.config.epic) then
            return 0
        else
            return 0.003
        end
    end,
}

SMODS.Rarity {
    key = 'leader',
    badge_colour = HEX("E44F4F"),
    default_weight = 0
}

SMODS.Atlas({
    key = 'dwTag',
    path = 'tags.png',
    px = 34,
    py = 34,
})

SMODS.Atlas({
    key = 'dwConsumable',
    path = 'consumables.png',
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = 'dwJoker',
    path = "DandyJokers.png",
    px = 71,
    py = 95
})

SMODS.Atlas{
    key = 'dwBlind',
    path = "blinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1,
    px = 34,
    py = 34
}

local set_cost_ref = Card.set_cost
function Card:set_cost()
    set_cost_ref(self)
    if self.cost_mod then
        self.cost = self.cost * self.cost_mod
    end
end