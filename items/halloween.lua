SMODS.Joker{
    key = "BNAT",
    atlas = 'dwJoker',
    pos = { x = 0, y = 8},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local jokers = {"j_dandy_ribecca", "j_dandy_soulvester", "j_dandy_eclipse", "j_dandy_gourdy"}
            local chosen_joker = pseudorandom_element(jokers, "boneneedleandthread")
            SMODS.add_card{key = chosen_joker}
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

SMODS.Joker{
    key = "ribecca",
    atlas = 'dwJoker',
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
    atlas = 'dwJoker',
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
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    end,
    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        return { vars = {card.ability.extra.hands}, key = self.key }
    end
}

SMODS.Joker{
    key = "eclipse",
    atlas = 'dwJoker',
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
    atlas = 'dwJoker',
    pos = { x = 7, y = 9},
    soul_pos=nil,
    rarity = (next(SMODS.find_mod('Cryptid')) and 'cry_epic') or (dandysworld.config.epic and 'dandy_epic') or 3,
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
                    local vEffect = {}

                    if vEffectType == 1 then
                        vEffect = {
                            x_mult = card.ability.extra.x_mult,
                            sound = "dandy_gourdy",
                            colour = G.C.FILTER,
                            message_card = v
                        }
                    elseif vEffectType == 2 then
                        vEffect = {
                            mult = card.ability.extra.mult,
                            sound = "dandy_gourdy",
                            colour = G.C.FILTER,
                            message_card = v
                        }
                    elseif vEffectType == 3 then
                        vEffect = {
                            chips = card.ability.extra.chips,
                            sound = "dandy_gourdy",
                            colour = G.C.FILTER,
                            message_card = v
                        }
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