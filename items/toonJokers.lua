SMODS.Joker{
    key = 'poppy',
    atlas = 'dwJoker',
    pos = { x = 6, y = 5},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {chips = 0, chip_mod = 50} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.before then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    colour = G.C.CHIPS
                }
            end
            if context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.chips = 0
                return {
                    extra = {focus = card, message = localize('k_reset')},
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod}, key = self.key }
    end
}

SMODS.Joker{
    key = 'boxten',
    atlas = 'dwJoker',
    pos = { x = 5, y = 4},
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
    key = "shrimpo",
    atlas = 'dwJoker',
    pos = { x = 0, y = 6},
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
        if context.before then
            local scored_card = pseudorandom_element(context.scoring_hand, "dw_shrimpo")
            G.E_MANAGER:add_event(Event({
                func = function()
                    scored_card:juice_up()
                    scored_card:set_debuff(true)
                    return true
                end
            }))
            return {
                message = localize('k_debuffed'),
                colour = G.C.RED,
                sound = "tarot2",
            }
        end
    end,
}

SMODS.Joker{
    key = "toodles",
    atlas = 'dwJoker',
    pos = {x = 3, y = 6},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {chips = 50, mult = 10, x_mult = 1.5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.joker_main then
            local effectType = pseudorandom('dw_toodles', 1, 3)
            local effect = {}
            if effectType == 1 then
                effect.x_mult = card.ability.extra.x_mult
            elseif effectType == 2 then
                effect.mult = card.ability.extra.mult
            elseif effectType == 3 then
                effect.chips = card.ability.extra.chips
            end

            return effect
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = 'brightney',
    atlas = 'dwJoker',
    pos = { x = 6, y = 4},
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
    key = 'rodger',
    atlas = 'dwJoker',
    pos = { x = 8, y = 5},
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
    key = "razzledazzle", 
    atlas = 'dwJoker',
    config = { extra = {x_mult = 2, mult = 20} },
    pos = { x = 7, y = 5 },
    soul_pos=nil,
    rarity = 2,
    cost = 6,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true, 
    effect=nil,

    calculate = function(self,card,context)
        if context.setting_blind and not context.blueprint then
            if (G.GAME.round % 2) == 0 then
                return {
                    message = localize('k_dandy_misery_ex'),
                    colour = G.C.MULT
                }
            else
                return {
                    message = localize('k_dandy_joy_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            if (G.GAME.round % 2) == 0 then
                return {
                    x_mult = card.ability.extra.x_mult, 
                    colour = G.C.MULT
                }
            else
                return {
                    mult = card.ability.extra.mult, 
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        local evenRound = (G.GAME.round % 2) == 0

        local currentVal = (evenRound and card.ability.extra.x_mult) or card.ability.extra.mult
        local currentType = (evenRound and "X") or "+"
        local currentCol = (evenRound and G.C.WHITE) or G.C.MULT
        local currentBg = (evenRound and G.C.MULT) or G.C.WHITE

        return { vars = {card.ability.extra.x_mult, card.ability.extra.mult, currentVal, currentType, colours = {currentCol, currentBg}}, key = self.key }
    end
}

SMODS.Joker{
    key = 'brusha',
    atlas = 'dwJoker',
    pos = { x = 7, y = 4},
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
    key = 'connie',
    atlas = 'dwJoker',
    pos = { x = 8, y = 4},
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
    key = 'finn',
    atlas = 'dwJoker',
    pos = { x = 0, y = 5},
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
    key = 'flutter',
    atlas = 'dwJoker',
    pos = { x = 1, y = 5},
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
    key = 'gigi',
    atlas = 'dwJoker',
    pos = { x = 2, y = 5},
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
    key = 'glisten',
    atlas = 'dwJoker',
    pos = { x = 3, y = 5},
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
    key = 'goob',
    atlas = 'dwJoker',
    pos = { x = 4, y = 5},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
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
    key = 'looey',
    atlas = 'dwJoker',
    pos = { x = 5, y = 5},
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
    key = 'scraps',
    atlas = 'dwJoker',
    pos = { x = 9, y = 5},
    soul_pos=nil,
    rarity = 3,
    cost = 7,
    config = { extra = {dollars = 7} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = {card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Joker{
    key = 'teagan',
    atlas = 'dwJoker',
    pos = { x = 1, y = 6},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
    config = { extra = {discard_mod = 1, dollars = 20} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            local discards_gained = card.ability.extra.discard_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            
            if to_big(discards_gained) > to_big(0) then
                ease_discard(discards_gained)
                return {
                    message = localize{type = 'variable', key = 'a_hands', vars = {discards_gained} } ,
                    sound = "dandy_sprout",
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local discards_gained = card.ability.extra.discard_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
        return { vars = {discards_gained, card.ability.extra.discard_mod, card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Joker{
    key = 'tisha',
    atlas = 'dwJoker',
    pos = { x = 2, y = 6},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {chips = 30} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
         if context.joker_main then
            return {
                chips = card.ability.extra.chips * #G.jokers.cards
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chips * (G.jokers and #G.jokers.cards or 0)}, key = self.key }
    end
}

SMODS.Joker{
    key = 'yatta',
    atlas = 'dwJoker',
    pos = { x = 4, y = 6},
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
    key = "cosmo",
    atlas = 'dwJoker',
    pos = { x = 9, y = 4},
    soul_pos=nil,
    rarity = 1,
    cost = 5,
    config = { extra = {x_mult = 0.5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                x_mult = 1 + (card.ability.extra.x_mult * (G.GAME.current_round.hands_left + 1)),
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        local x_mult = 1 + (card.ability.extra.x_mult * G.GAME.current_round.hands_left)
        return { vars = {card.ability.extra.x_mult, x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = "blot",
    atlas = 'dwJoker',
    pos = { x = 4, y = 4},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    --[[calculate = function(self,card,context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult}, key = self.key }
    end]]
}

SMODS.Sound ({
    key = 'pebble',
    path = 'dw_pebble.ogg',
})

SMODS.Joker{
    key = "pebble",
    atlas = 'dwJoker',
    pos = { x = 5, y = 6},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config_file.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config_file.epic ~= 1)) and 10) or 20,
    config = { extra = {chips = 0, chip_mod = 20} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.using_consumeable then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
            }
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'astro',
    path = 'dw_astro.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "astro",
    atlas = 'dwJoker',
    pos = { x = 6, y = 6},
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
        if context.first_hand_drawn then
            G.GAME.blind.chips = G.GAME.blind.chips / 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            return {
                message = localize("dw_astro_ability"),
                sound = "dandy_astro",
                colour = G.C.CHIPS
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'sprout',
    path = 'dw_sprout.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "sprout",
    atlas = 'dwJoker',
    pos = { x = 7, y = 6},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config_file.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config_file.epic ~= 1)) and 10) or 20,
    config = { extra = {hand_mod = 1, dollars = 20} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.setting_blind then
            local hands_gained = card.ability.extra.hand_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            
            if to_big(hands_gained) > to_big(0) then
                ease_hands_played(hands_gained)
                return {
                    message = localize{type = 'variable', key = 'a_hands', vars = {hands_gained} } ,
                    sound = "dandy_sprout",
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local hands_gained = card.ability.extra.hand_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
        return { vars = {hands_gained, card.ability.extra.hand_mod, card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'shelly',
    path = 'dw_shelly.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'shelly',
    atlas = 'dwJoker',
    pos = { x = 8, y = 6},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config_file.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config_file.epic ~= 1)) and 10) or 20,
    config = { extra = {x_mult = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'vee',
    path = 'dw_vee.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'vee',
    atlas = 'dwJoker',
    pos = { x = 9, y = 6},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config_file.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config_file.epic ~= 1)) and 10) or 20,
    config = { extra = {choice_mod = 1, size_mod = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    add_to_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.booster_choice_mod then
            G.GAME.modifiers.booster_choice_mod = 0
        end
        G.GAME.modifiers.booster_choice_mod = G.GAME.modifiers.booster_choice_mod + card.ability.extra.choice_mod

        if not G.GAME.modifiers.booster_size_mod then
            G.GAME.modifiers.booster_size_mod = 0
        end
        G.GAME.modifiers.booster_size_mod = G.GAME.modifiers.booster_size_mod + card.ability.extra.size_mod
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.booster_choice_mod then
            G.GAME.modifiers.booster_choice_mod = 0
        else
            G.GAME.modifiers.booster_choice_mod = G.GAME.modifiers.booster_choice_mod - card.ability.extra.choice_mod
        end

        if not G.GAME.modifiers.booster_size_mod then
            G.GAME.modifiers.booster_size_mod = 0
        else
            G.GAME.modifiers.booster_size_mod = G.GAME.modifiers.booster_size_mod - card.ability.extra.size_mod
        end
    end,
    calculate = function(self,card,context)
        if context.open_booster then
            return {
                message = localize('dw_vee_ability'),
                colour = G.C.GREEN,
                sound = 'dandy_vee'
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.choice_mod, card.ability.extra.size_mod}, key = self.key }
    end
}