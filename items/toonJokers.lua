

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
    key = 'looey',
    atlas = 'dwJoker',
    pos = { x = 5, y = 5},
    soul_pos=nil,
    rarity = 2,
    cost = 6,
    config = { extra = {x_mult = 1, hand_size = 8} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.joker_main then
            local x_mult_mod
            if card.ability.extra.hand_size - G.hand.config.card_limit + 1 > 1 then
                x_mult_mod = card.ability.extra.hand_size - G.hand.config.card_limit + 1
            else
                x_mult_mod = 1
            end
            
            return {
                x_mult = card.ability.extra.x_mult * x_mult_mod
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local x_mult_mod
        if G.hand and (card.ability.extra.hand_size - G.hand.config.card_limit + 1 > 1) then
            x_mult_mod = card.ability.extra.hand_size - G.hand.config.card_limit + 1
        else
            x_mult_mod = 1
        end
        
        return { vars = {card.ability.extra.x_mult, x_mult_mod, card.ability.extra.hand_size}, key = self.key }
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
    cost = 5,
    config = { extra = {chips = 40} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,

    calculate = function(self,card,context)
         if context.joker_main then
            local effects = {
                {
                    message = localize("k_clean_ex"),
                    colour = G.C.CHIPS
                }
            }
            for _,v in ipairs(G.jokers.cards) do
                if v ~= card then
                    effects[#effects + 1] = {
                        chips = card.ability.extra.chips,
                        message_card = v
                    }
                end
            end
            return SMODS.merge_effects(effects)
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips}, key = self.key }
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
    key = 'sprout',
    path = 'dw_sprout.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "sprout",
    atlas = 'dwJoker',
    pos = { x = 7, y = 6},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config.epic ~= 1)) and 10) or 20,
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
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or ((dandysworld.config.epic ~= 1) and 'dandy_epic') or 3,
    cost = ((next(SMODS.find_mod('Cryptid')) or (dandysworld.config.epic ~= 1)) and 10) or 20,
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