SMODS.Joker{
    key = 'festivelights',
    atlas = 'dwJoker',
    pos = { x = 0, y = 9},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {jokers = {"j_dandy_rudie", "j_dandy_ginger", "j_dandy_coal", "j_dandy_bobette"}} },
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
    key = 'pepperminticing',
    atlas = 'dwJoker',
    pos = { x = 1, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {mult = 5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult}, key = self.key }
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
    rarity = 2,
    cost = 7,
    config = { extra = {hand_mod = 3, dollars = 30} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.setting_blind then
            if ((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) >= card.ability.extra.dollars then
                ease_hands_played(card.ability.extra.hand_mod)
                return {
                    message = localize{type = 'variable', key = 'a_hands', vars = {hands} } ,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.hand_mod, card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Joker{
    key = 'coal',
    atlas = 'dwJoker',
    pos = { x = 6, y = 8},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
    config = { extra = {odds = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') and SMODS.pseudorandom_probability(card, 'dw_coal', 1, card.ability.extra.odds) then
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = card,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = 'dw_coal'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'dw_coal')
        return { vars = {numerator, denominator}, key = self.key }
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
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config_file.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config_file.epic ~= 1)) and 10) or 20,
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
