SMODS.Joker{
    key = 'coinPurse',
    atlas = 'dwJoker',
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
    atlas = 'dwJoker',
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
    key = 'wrench',
    atlas = 'dwJoker',
    pos = { x = 3, y = 0},
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
    key = "machineManual",
    atlas = 'dwJoker',
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
    key = 'speedyshoes',
    atlas = 'dwJoker',
    pos = { x = 5, y = 0},
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
    key = 'speedometer',
    atlas = 'dwJoker',
    pos = { x = 6, y = 0},
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
    key = 'thinkingcap',
    atlas = 'dwJoker',
    pos = { x = 7, y = 0},
    soul_pos=nil,
    rarity = 2,
    cost = 6,
    config = { extra = {h_size = 3, discards = -2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    grasslanders_edward_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.h_size, card.ability.extra.discards}, key = self.key }
    end
}

SMODS.Joker{
    key = 'alarm',
    atlas = 'dwJoker',
    pos = { x = 8, y = 0},
    soul_pos=nil,
    rarity = 1,
    cost = 2,
    config = { extra = {x_mult = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)
        if context.joker_main and context.cardarea == G.jokers then
            if G.GAME.blind.boss then
                return {
                    x_mult = card.ability.extra.x_mult, 
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = 'thermos',
    atlas = 'dwJoker',
    pos = { x = 9, y = 0},
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
    key = 'pulltoy',
    atlas = 'dwJoker',
    pos = { x = 0, y = 1},
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
    key = 'poppack',
    atlas = 'dwJoker',
    pos = { x = 1, y = 1},
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
    key = 'megaphone',
    atlas = 'dwJoker',
    pos = { x = 2, y = 1},
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
    key = 'cooler',
    atlas = 'dwJoker',
    pos = { x = 3, y = 1},
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
    key = 'cardboardarmor',
    atlas = 'dwJoker',
    pos = { x = 4, y = 1},
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
    end,
    in_pool = function()
        return false
    end,
}

SMODS.Joker{
    key = 'bluebandana',
    atlas = 'dwJoker',
    pos = { x = 5, y = 1},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {chips = 20}},
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * #context.full_hand
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
}

SMODS.Joker{
    key = 'paintbucket',
    atlas = 'dwJoker',
    pos = { x = 6, y = 1},
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
    key = 'sweetcharm',
    atlas = 'dwJoker',
    pos = { x = 7, y = 1},
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
    key = "clownhorn", 
    atlas = 'dwJoker',
    config = { extra = {mult = 20} },
    pos = { x = 8, y = 1 },
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true, 
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.setting_blind and not context.blueprint then
            if (G.GAME.round % 2) ~= 0 then
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            if (G.GAME.round % 2) ~= 0 then
                return {
                    mult = card.ability.extra.mult, 
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local active = ((G.GAME.round % 2) ~= 0 and "k_dandy_active") or "k_dandy_inactive"
        return { vars = {card.ability.extra.mult, localize(active)}, key = self.key }
    end
}

SMODS.Joker{
    key = 'pinkbow',
    atlas = 'dwJoker',
    pos = { x = 9, y = 1},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {mult = 0, mult_mod = 5} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.before then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    colour = G.C.MULT
                }
            end
            if context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.mult = 0
                return {
                    extra = {focus = card, message = localize('k_reset')},
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod}, key = self.key }
    end,
}

SMODS.Joker{
    key = "brick",
    atlas = 'dwJoker',
    pos = { x = 0, y = 2},
    soul_pos=nil,
    rarity = 1,
    cost = 3,
    config = { extra = {x_mult = 0.5, h_plays = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            return {
                x_mult = card.ability.extra.x_mult,
                sound = 'tarot2',
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.x_mult, card.ability.extra.h_plays}, key = self.key }
    end
}

SMODS.Joker{
    key = 'featherduster',
    atlas = 'dwJoker',
    pos = { x = 1, y = 2},
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
    key = 'partypopper',
    atlas = 'dwJoker',
    pos = { x = 2, y = 2},
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
    key = 'sparebulb',
    atlas = 'dwJoker',
    pos = { x = 3, y = 2},
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
    key = 'gsiac',
    atlas = 'dwJoker',
    pos = { x = 4, y = 2},
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
    key = 'fishingrod',
    atlas = 'dwJoker',
    pos = { x = 5, y = 2},
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
    key = "ribbonspool", 
    atlas = 'dwJoker',
    config = { extra = {mult = 20} },
    pos = { x = 6, y = 2 },
    rarity = 1,
    cost = 5,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true, 
    effect=nil,
    soul_pos=nil,

    calculate = function(self,card,context)
        if context.setting_blind and not context.blueprint then
            if (G.GAME.round % 2) == 0 then
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.FILTER
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            if (G.GAME.round % 2) == 0 then
                return {
                    mult = card.ability.extra.mult, 
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local active = ((G.GAME.round % 2) == 0 and "k_dandy_active") or "k_dandy_inactive"
        return { vars = {card.ability.extra.mult, localize(active)}, key = self.key }
    end
}

SMODS.Joker{
    key = 'magnifyingglass',
    atlas = 'dwJoker',
    pos = { x = 7, y = 2},
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
    key = 'fancyPurse',
    atlas = 'dwJoker',
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
    key = 'dogplush',
    atlas = 'dwJoker',
    pos = { x = 9, y = 2},
    soul_pos=nil,
    rarity = 1,
    cost = 5,
    config = { extra = {chips = 50, mult = 6} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)
        if context.joker_main then
            return SMODS.merge_effects({
                {
                    chips = card.ability.extra.chips
                },
                {
                    mult = card.ability.extra.mult
                }
            })
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
    end
}

SMODS.Joker{
    key = 'mimemakeup',
    atlas = 'dwJoker',
    pos = { x = 0, y = 3},
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
    key = 'diary',
    atlas = 'dwJoker',
    pos = { x = 1, y = 3},
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
    key = 'luckycoin',
    atlas = 'dwJoker',
    pos = { x = 2, y = 3},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local consumableTypes = {'Tarot', 'Planet', 'Spectral'}
                    local consumableType = pseudorandom_element(types, 'dw_gigi')
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = type,
                                key_append = 'dandy_gigi' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))

                    local effectmessage
                    local effectcolour
                    if consumableType == 'Planet' then
                        effectmessage = localize('k_plus_planet')
                        effectcolour = G.C.SECONDARY_SET.Planet
                    elseif consumableType == 'Tarot' then
                        effectmessage = localize('k_plus_tarot')
                        effectcolour = G.C.PURPLE
                    elseif consumableType == 'spectral' then
                        effectmessage = localize('k_plus_spectral')
                        effectcolour = G.C.SECONDARY_SET.Spectral
                    end
                    
                    SMODS.calculate_effect({ message = effectmessage, colour = effectcolour },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = 'vanitymirror',
    atlas = 'dwJoker',
    pos = { x = 3, y = 3},
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
    key = 'friendshipbracelet',
    atlas = 'dwJoker',
    pos = { x = 4, y = 3},
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
    key = 'crayonset',
    atlas = 'dwJoker',
    pos = { x = 5, y = 3},
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
    key = 'bone',
    atlas = 'dwJoker',
    pos = { x = 6, y = 3},
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
    key = 'starpillow',
    atlas = 'dwJoker',
    pos = { x = 7, y = 3},
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
    key = 'participationaward',
    atlas = 'dwJoker',
    pos = { x = 8, y = 3},
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
    key = 'savorycharm',
    atlas = 'dwJoker',
    pos = { x = 9, y = 3},
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
    key = 'veeremote',
    atlas = 'dwJoker',
    pos = { x = 0, y = 4},
    soul_pos=nil,
    rarity = 3,
    cost = 7,
    config = { extra = {x_mult = 4} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    calculate = function(self,card,context)              --define calculate functions here
        if context.joker_main and context.cardarea == G.jokers then
            if not G.GAME.blind.boss then
                return {
                    x_mult = card.ability.extra.x_mult, 
                    colour = G.C.MULT
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult}, key = self.key }
    end
}

SMODS.Joker{
    key = 'dandyplush',
    atlas = 'dwJoker',
    pos = { x = 1, y = 4},
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
    key = 'trainwhistle',
    atlas = 'dwJoker',
    pos = { x = 2, y = 4},
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
    key = 'blushybat',
    atlas = 'dwJoker',
    pos = { x = 3, y = 4},
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