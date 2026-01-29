SMODS.Gradient {
    key = 'main_gradient',
    colours = {
        HEX('fd5f55'),
        HEX('fda200'),
        HEX('ffd61d'),
        HEX('91e461'),
        HEX('009cfd'),
        HEX('8a71e1'),
    },
    cycle = 15
}

SMODS.Rarity{
	key = "epic",
	loc_txt = {},
	badge_colour = SMODS.Gradients["dandy_main_gradient"],
	default_weight = 0.003,
	pools = { ["Joker"] = true },
}

SMODS.Gradient {
    key = 'lethal_gradient',
    colours = {
        HEX('F46464'),
        HEX('C01F1F')
    },
    cycle = 6
}

SMODS.Rarity {
    key = 'leader',
    badge_colour = SMODS.Gradients["dandy_lethal_gradient"],
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