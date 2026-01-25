SMODS.Joker{
    key = 'eggradar',
    atlas = 'dwJoker',
    pos = { x = 0, y = 7},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {jokers = {"j_dandy_eggson", "j_dandy_flyte", "j_dandy_cocoa", "j_dandy_bassie"}} },
    blueprint_compat=false,
    eternal_compat=false,
    perishable_compat=false,
    unlocked = true,
    discovered = true,
    
    calculate = function(self,card,context)
        --if context.type == 'store_joker_create' then

        --end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local chosen_joker = pseudorandom_element(card.ability.extra.jokers, "dw_festivelights")
            SMODS.add_card{key = chosen_joker}
            SMODS.destroy_cards(card, nil, nil, true)
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {
            --card.ability.extra.jokers[1],
        }, key = self.key }
    end
}

SMODS.Joker{
    key = 'scrapbook',
    atlas = 'dwJoker',
    pos = { x = 1, y = 7},
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
    key = 'gfb',
    atlas = 'dwJoker',
    pos = { x = 2, y = 7},
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
    key = 'whisperingflower',
    atlas = 'dwJoker',
    pos = { x = 3, y = 7},
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
    key = 'eggson',
    atlas = 'dwJoker',
    pos = { x = 4, y = 7},
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
    key = 'flyte',
    atlas = 'dwJoker',
    pos = { x = 5, y = 7},
    soul_pos=nil,
    rarity = 2,
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
    key = 'cocoa',
    path = 'dw_cocoa.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'cocoa',
    atlas = 'dwJoker',
    pos = { x = 6, y = 7},
    soul_pos=nil,
    rarity = 3,
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
    key = 'bassie',
    path = 'dw_bassie.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'bassie',
    atlas = 'dwJoker',
    pos = { x = 7, y = 7},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config.epic ~= 1)) and 10) or 20,
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

SMODS.Blind {
    key = 'eggson',
    atlas = 'dwBlind',
    pos = {x = 0, y = 33},
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
    key = 'flyte',
    atlas = 'dwBlind',
    pos = {x = 0, y = 34},
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
    key = 'cocoa',
    atlas = 'dwBlind',
    pos = {x = 0, y = 35},
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
    key = 'bassie',
    atlas = 'dwBlind',
    pos = {x = 0, y = 36},
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