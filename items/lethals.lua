--[[SMODS.Atlas({
    key = 'tesloid',
    path = "clackerblinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
})]]

SMODS.Rarity {
    key = 'leader',
    badge_colour = HEX("E44F4F"),
    default_weight = 0
}

SMODS.Sound {
    key = 'dandy_music',
    path = 'dw_mus_dandy.ogg',
    pitch = 1,
    select_music_track = function() 
        return G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_dandy_dandy' or nil 
    end,
}

SMODS.Atlas{
    key = 'dwBlindLethal',
    path = "lethalBlinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 16,
    px = 34 * 2,
    py = 34 * 2
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
    boss_colour = HEX("615852"),
    in_pool = function()
        if G.GAME.current_round.twistedDandyCheck and G.GAME.current_round.twistedDandyCheck >= 3 then
            return true
        else
            return false
        end
    end,
    calculate = function(self, blind, context)
        if context.setting_blind then
            blind.discards_sub = G.GAME.current_round.discards_left
            ease_discard(-blind.discards_sub)
            G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
            ease_hands_played(-G.GAME.blind.hands_sub)
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            SMODS.add_card{key = "j_dandy_dandy"}
        end
    end,
}

SMODS.Joker{
    key = "dandy",
    atlas = 'dwJoker',
    pos = { x = 8, y = 7},
    soul_pos=nil,
    rarity = 'dandy_leader',
    cost = 40,
    config = { extra = {} },
    blueprint_compat=false,
    eternal_compat=false,
    perishable_compat=false,
    unlocked = true,
    discovered = true,
    calculate = function(self, card, context)
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
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        return { vars = {}, key = self.key }
    end
}

function SMODS.current_mod.reset_game_globals(run_start)
    if run_start then
        G.GAME.current_round.twistedDandyCheck = 0
    end
end

function SMODS.current_mod.calculate(self, context)
    if context.skip_blind then
        G.GAME.current_round.twistedDandyCheck = 0
    end
    if context.reroll_shop or context.buying_card or context.open_booster then
        G.GAME.current_round.twistedDandyCheck = -1
    end
    if context.ending_shop then
        G.GAME.current_round.twistedDandyCheck = G.GAME.current_round.twistedDandyCheck + 1
    end
end

SMODS.Sound ({
    key = 'dyle_music',
    path = 'dw_mus_dyle.ogg',
    pitch = 1,
    select_music_track = function() 
        return G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_dandy_dyle' or nil 
    end,
})

SMODS.Blind {
    key = 'dyle',
    atlas = 'dwBlind',
    pos = {x = 0, y = 1},
    unlocked = true,
    discovered = true,     
    dollars = 0,
    mult = 25,
    boss = {min = 1},
    boss_colour = HEX("d4ac76"),
    in_pool = function()
        return false
    end,
    calculate = function(self, blind, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            SMODS.add_card{key = "j_dandy_dyle"}
        end
    end,
}

SMODS.Tag {
    key = "timesup",
    pos = { x = 0, y = 2 },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.GREEN, function()
                G.from_boss_tag = true
                G.FORCE_BOSS('bl_dandy_dyle')
                --G.FUNCS.reroll_boss()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.CONTROLLER.locks[lock] = nil
                                return true
                            end
                        }))
                        return true
                    end
                }))

                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Joker{
    key = "dyle",
    atlas = 'dwJoker',
    pos = { x = 9, y = 7},
    soul_pos=nil,
    rarity = 'dandy_leader',
    cost = 40,
    config = { extra = {} },
    blueprint_compat=false,
    eternal_compat=false,
    perishable_compat=false,
    unlocked = true,
    discovered = true,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 then
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card:get_edition() then
                    local edition = poll_edition('dandy_dyle', nil, true, true,
                        {'e_polychrome', 'e_holo', 'e_foil'})
                    scored_card:set_edition(edition, true)
                    card:juice_up(0.3, 0.5)
                end
            end
            return {
                message = localize('k_gold'),
                colour = G.C.PURPLE
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
        info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return { vars = {}, key = self.key }
    end,
}