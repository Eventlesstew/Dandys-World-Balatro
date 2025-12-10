SMODS.Joker{
    key = 'festivelights',
    atlas = 'dwJoker',
    pos = { x = 0, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'pepperminticing',
    atlas = 'dwJoker',
    pos = { x = 1, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = "coalTrinket",
    atlas = 'dwJoker',
    pos = { x = 2, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 1,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            G.GAME.blind.chips = G.GAME.blind.chips * 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            return {
                message = localize("dw_naughty_ex"),
                colour = G.C.RED,
                sound = "tarot2",
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'toykit',
    atlas = 'dwJoker',
    pos = { x = 3, y = 8},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'rudie',
    atlas = 'dwJoker',
    pos = { x = 4, y = 8},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'ginger',
    atlas = 'dwJoker',
    pos = { x = 5, y = 8},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'coal',
    atlas = 'dwJoker',
    pos = { x = 6, y = 8},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'bobette',
    path = 'dw_bobette.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'bobette',
    atlas = 'dwJoker',
    pos = { x = 7, y = 8},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Blind {
    key = 'rudie',
    atlas = 'dwBlind',
    pos = {x = 0, y = 29},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'ginger',
    atlas = 'dwBlind',
    pos = {x = 0, y = 30},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'coal',
    atlas = 'dwBlind',
    pos = {x = 0, y = 31},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'bobette',
    atlas = 'dwBlind',
    pos = {x = 0, y = 32},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}
