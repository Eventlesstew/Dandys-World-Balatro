SMODS.Atlas({
    key = 'dandysworld',
    path = "DandyJokers.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = 'coinPurse',
    atlas = 'dandysworld',
    pos = { x = 1, y = 0},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {chips = 30} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.chips}, key = self.key }
    end
}

SMODS.Joker{
    key = "researchMap",
    atlas = 'dandysworld',
    pos = { x = 2, y = 0},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {dollars = 3} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.skip_blind then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Joker{
    key = "machineManual",
    atlas = 'dandysworld',
    pos = { x = 4, y = 0},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {x_mult = 1.5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                x_mult = card.ability.extra.x_mult,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = 'fancyPurse',
    atlas = 'dandysworld',
    pos = { x = 8, y = 2},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {chips = 100} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.chips}, key = self.key }
    end
}

SMODS.Joker{
    key = "brick",
    atlas = 'dandysworld',
    pos = { x = 0, y = 2},
    soul_pos=nil,
    rarity = 1,
    cost = 1,
    config = { extra = {x_mult = 0.5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                x_mult = card.ability.extra.x_mult,
                sound = 'tarot2',
            }
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = "toodles",
    atlas = 'dandysworld',
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
    key = "shrimpo",
    atlas = 'dandysworld',
    pos = { x = 0, y = 6},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
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
                message = localize("dw_shrimpo_ability"),
                colour = G.C.MULT,
                sound = "tarot2",
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = "cosmo",
    atlas = 'dandysworld',
    pos = { x = 9, y = 4},
    soul_pos=nil,
    rarity = 1,
    cost = 1,
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
    atlas = 'dandysworld',
    pos = { x = 4, y = 4},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
    config = { extra = {mult = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
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
    end
}

SMODS.Sound ({
    key = 'pebble',
    path = 'dw_pebble.ogg',
})

SMODS.Joker{
    key = "pebble",
    atlas = 'dandysworld',
    pos = { x = 5, y = 6},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
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

SMODS.Sound ({
    key = 'astro',
    path = 'dw_astro.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "astro",
    atlas = 'dandysworld',
    pos = { x = 6, y = 6},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
    config = { extra = {x_mult = 0.5} },
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
    atlas = 'dandysworld',
    pos = { x = 7, y = 6},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
    config = { extra = {hand_mod = 1, dollars = 20} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.setting_blind then
            local hands = card.ability.extra.hand_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            if hands > 0 then
                ease_hands_played(hands)
                return {
                    message = localize{type = 'variable', key = 'a_hands', vars = {hands} } ,
                    sound = "dandy_sprout",
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local hands = card.ability.extra.hand_mod * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
        return { vars = {hands, card.ability.extra.hand_mod, card.ability.extra.dollars}, key = self.key }
    end
}

SMODS.Sound ({
    key = 'shelly',
    path = 'dw_shelly.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'vee',
    path = 'dw_vee.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'bobette',
    path = 'dw_bobette.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'cocoa',
    path = 'dw_cocoa.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'bassie',
    path = 'dw_bassie.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "ribecca",
    atlas = 'dandysworld',
    pos = { x = 4, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 5,
    config = { extra = {} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    mult = context.other_card.base.nominal
                }
            end
        end
    end,
    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = "soulvester",
    atlas = 'dandysworld',
    pos = { x = 5, y = 9},
    soul_pos=nil,
    rarity = 2,
    cost = 6,
    config = { extra = {hands = 1} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.d_size
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.d_size
    end,
    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.hands}, key = self.key }
    end
}

SMODS.Joker{
    key = "eclipse",
    atlas = 'dandysworld',
    pos = { x = 6, y = 9},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
    config = { extra = {hands = 3} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.setting_blind and context.blind.boss then
            ease_hands_played(card.ability.extra.hands)
            return {
                message = localize{type = 'variable', key = 'a_hands', vars = {hands} } ,
            }
        end
    end,
    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.hands}, key = self.key }
    end,
}

SMODS.Sound ({
    key = 'gourdy_ability',
    path = 'dw_gourdy_ability.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'gourdy',
    path = 'dw_gourdy.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "gourdy",
    atlas = 'dandysworld',
    pos = { x = 7, y = 9},
    soul_pos=nil,
    rarity = 3,
    cost = 10,
    config = { extra = {chips = 50, mult = 10, x_mult = 1.5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.joker_main then
            local effects = {
                {
                    message = localize("dw_gourdy_ability"),
                    sound = "dandy_gourdy_ability",
                    colour = G.C.FILTER
                }
            }

            for _,v in ipairs(G.jokers.cards) do
                if v ~= card then
                    local vEffectType = pseudorandom('dw_gourdy', 1, 3)
                    local vEffect = {
                        message_card = v,
                        sound = "dandy_gourdy",
                        colour = G.C.FILTER,
                    }

                    if vEffectType == 1 then
                        vEffect.x_mult = card.ability.extra.x_mult
                    elseif vEffectType == 2 then
                        vEffect.mult = card.ability.extra.mult
                    elseif vEffectType == 3 then
                        vEffect.chips = card.ability.extra.chips
                    end
                    
                    effects[#effects+1] = vEffect
                end
            end

            return SMODS.merge_effects(effects)
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.x_mult}, key = self.key }
    end
}