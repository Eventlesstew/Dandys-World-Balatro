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
            G.FORCE_BOSS = nil
        end
    end,
}

SMODS.Atlas {
    key = 'dwVoucher_timesup',
    path = 'timesup.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 42,
    fps = 10,
    px = 71,
    py = 95,
}

SMODS.Voucher {
    key = 'timesup',
    atlas = 'dwVoucher_timesup',
    pos = { x = 0, y = 0 },
    config = { extra = {blind = 'bl_dandy_dyle'} },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.FORCE_BOSS = card.ability.extra.blind
                G.FUNCS.reroll_boss()
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
}

--[[
SMODS.Tag {
    key = "timesup",
    pos = { x = 0, y = 0 },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.GREEN, function()
                G.from_boss_tag = true
                G.FORCE_BOSS = 'bl_dandy_dyle'
                G.FUNCS.reroll_boss()

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
    ]]

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