SMODS.Sound {
    key = 'dandy_music',
    path = 'dw_mus_dandy.ogg',
    pitch = 1,
    select_music_track = function() 
        return G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_dandy_dandy' or nil 
    end,
}

SMODS.Gradient {
    key = 'boss_gradient',
    colours = {
        HEX('ff6969'),
        HEX('801414')
    },
    cycle = 10
}

SMODS.Blind {
    key = 'dandy',
    atlas = 'dwBlind',
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,     
    dollars = 0,
    mult = 2,
    boss = {min = 1},
    boss_colour = SMODS.Gradients["dandy_boss_gradient"],
    in_pool = function()
        return false
    end,
    calculate = function(self, blind, context)
        if context.setting_blind then
            blind.discards_sub = G.GAME.current_round.discards_left
            ease_discard(-blind.discards_sub)
            G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
            ease_hands_played(-G.GAME.blind.hands_sub)

            G.hand:change_size(6)
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            G.hand:change_size(-6)
            SMODS.add_card{key = "j_dandy_dandy"}
            check_for_unlock{type = 'dw_dandy'}
        end
    end,
}

SMODS.Joker{
    key = "dandy",
    atlas = 'dwJoker',
    pos = { x = 8, y = 7},
    soul_pos={ x = 8, y = 8},
    rarity = 'dandy_leader',
    cost = 40,
    config = { extra = {chips = 0, chip_mod = 50} },
    blueprint_compat=true,
    eternal_compat=false,
    perishable_compat=false,
    unlocked = true,
    discovered = true,
    in_pool = function()
        return false
    end,
    calculate = function(self, card, context)
        if not context.blueprint then
            if context.reroll_shop or context.buying_card then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        --[[
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'dandy_dandy',
                                edition = 'e_negative',
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral},
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end]]
    end,
    loc_vars = function(self, info_queue, card)
        --info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'dw_dandy' then
            return true 
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        local text
        if G.P_CENTERS.bl_dandy_dandy.discovered then
            text = G.P_CENTERS.bl_dandy_dandy.loc_txt.name
        else
            text = localize('dw_undiscovered')
        end
        return {vars = {text}}
    end
}

local localize_ref = localize
function localize(args, misc_cat)
    if args == "ph_improve_run" then
        if G.GAME.current_round.twistedDandyOdds >= 2 then
            args = "ph_dw_stage3"
        elseif G.GAME.current_round.twistedDandyOdds >= 1 then
            args = "ph_dw_stage2"
        end
    end
    local ret = localize_ref(args, misc_cat)
    return ret
end


-- Resets Dandy's Variables back
function SMODS.current_mod.reset_game_globals(run_start)
    if run_start then
        G.GAME.current_round.twistedDandyOdds = 0
        G.GAME.current_round.twistedDandyChance = 10
    end
end


function SMODS.current_mod.calculate(self, context)
    if context.reroll_shop or context.buying_card then
        G.GAME.current_round.twistedDandyOdds = -1
        if G.GAME.round_resets.blind_choices.Boss.key == 'bl_dandy_dandy' then
            G.FUNCS.reroll_boss()
        end
    end
    if context.ending_shop then
        G.GAME.current_round.twistedDandyOdds = G.GAME.current_round.twistedDandyOdds + 1
    end

    if 
        context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and 
        G.GAME.current_round.twistedDandyOdds >= 3
    then
        check_for_unlock{type = 'dw_astro'}
        local numerator = G.GAME.current_round.twistedDandyOdds + 3
        local denominator = G.GAME.current_round.twistedDandyChance
        if 
            (numerator >= denominator) or (SMODS.pseudorandom_probability(self, 'dw_twisted_dandy', numerator, denominator))
        then
            print("Twisted Dandy Spawned")
            G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = 'bl_dandy_dandy'
            G.FUNCS.reroll_boss()
        end
    end
end

--[[
local use_card_ref = G.FUNCS.use_card
G.FUNCS.use_card = function()
    local result = use_card_ref()
    if card.ability.set == 'Booster' and card.area == G.shop_booster then
        
    end
    return result
end]]