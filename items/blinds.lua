SMODS.Atlas{
    key = 'dwBlind',
    path = "blinds.png",
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1,
    px = 34,
    py = 34
}

function shakeBlind(self)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            SMODS.juice_up_blind()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('tarot2', 0.76, 0.4)
                    return true
                end
            }))
            play_sound('tarot2', 1, 0.4)
            return true
        end)
    }))
end

SMODS.DrawStep {
    key = 'worthless',
    order = 71,
    func = function(card, layer)
        if card.dw_worthless then

        end
    end,
}

SMODS.Blind {
    key = 'poppy',
    atlas = 'dwBlind',
    pos = {x = 0, y = 7},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("31b1cd"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'boxten',
    atlas = 'dwBlind',
    pos = {x = 0, y = 3},
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("a84dbe"),
    in_pool = function()
        return false
    end,
    calculate = function(self, blind, context)
        if context.debuff_card then
            if context.debuff_card:is_suit('Hearts') or context.debuff_card:is_suit('Diamonds') then
                return {
                    dw_worthless = true
                }
            end
        end
    end,
}

SMODS.Blind {
    key = 'shrimpo',
    atlas = 'dwBlind',
    pos = {x = 0, y = 8},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 2},
    boss_colour = HEX("e48986"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.dw_shrimpo_debuff then
                return {
                    debuff = true
                }
            end
            if context.debuff_hand and not context.check then
                local target_card = pseudorandom_element(context.scoring_hand, 'dw_twisted_shrimpo')
                if target_card then
                    target_card.dw_shrimpo_debuff = true
                    SMODS.recalc_debuff(target_card)
                    shakeBlind()
                end
            end

            if context.hand_drawn or (context.end_of_round and context.game_over == false and context.main_eval) then
                for _, other_card in ipairs(G.playing_cards) do
                    other_card.dw_shrimpo_debuff = nil
                    SMODS.recalc_debuff(other_card)
                end
            end
        end
    end,
}

SMODS.Blind {
    key = 'toodles',
    atlas = 'dwBlind',
    pos = {x = 0, y = 17},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 4},
    boss_colour = HEX("c6e0eb"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.hands_sub = math.max(math.floor(G.GAME.round_resets.hands * 0.5), 1)
                ease_hands_played(-blind.hands_sub)
            end
        end
    end,
    disable = function(self)
        ease_hands_played(G.GAME.blind.hands_sub)
    end,
}

SMODS.Blind {
    key = 'brightney',
    atlas = 'dwBlind',
    pos = {x = 0, y = 11},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX("ad216c"),
    ignore_showdown_check = true,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.after then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        for _,v in ipairs(G.hand.cards) do
                            if v.facing ~= 'back' then
                                v:flip()
                            end
                        end
                        return true
                    end,
                }))
            end
        end
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for _, playing_card in pairs(G.playing_cards) do
            playing_card.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = 'rodger',
    atlas = 'dwBlind',
    pos = {x = 0, y = 15},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX("9792dd"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind or context.after then
                local _poker_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if SMODS.is_poker_hand_visible(handname) and handname ~= blind.hand then
                        _poker_hands[#_poker_hands + 1] = handname
                    end
                end
                blind.hand = pseudorandom_element(_poker_hands, 'dandy_rodgerhand')
            end
            if context.debuff_hand then
                if blind.hand and blind.hand == context.scoring_name then
                    blind.triggered = true
                    return {
                        debuff = true
                    }
                end
            end
        end
    end,
    collection_loc_vars = function(self)
        localize('dw_rodger_attention')
        return {vars = {localize('dw_rodger_attention')}}
    end,
    loc_vars = function(self)
        return {vars = {localize('dw_rodger_attention')}}
    end,
    get_loc_debuff_text = function(self)
        return G.GAME.blind.loc_debuff_text ..
            (G.GAME.blind.hand and ' [' .. localize(G.GAME.blind.hand, 'poker_hands') .. ']' or '')
    end,
}

SMODS.Blind {
    key = 'razzledazzle',
    atlas = 'dwBlind',
    pos = {x = 0, y = 14},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 3},
    boss_colour = HEX("c6e0eb"),
    calculate = function(self, blind, context)
        if context.debuff_card then
            if 
                (blind.mode == 'dazzle' and (context.debuff_card:is_suit('Spades') or context.debuff_card:is_suit('Clubs'))) or
                (blind.mode == 'razzle' and (context.debuff_card:is_suit('Hearts') or context.debuff_card:is_suit('Diamonds')))
            then
                return {
                    debuff = true
                }
            end
        end
        if context.setting_blind then
            blind.mode = 'dazzle'
        end
        if context.after then
            blind.prepped = true
        end
        if context.hand_drawn and blind.prepped then
            if blind.mode == 'dazzle' then
                blind.mode = 'razzle'
            else
                blind.mode = 'dazzle'
            end
            blind.prepped = nil

            for _,v in ipairs(G.playing_cards) do
                SMODS.recalc_debuff(v)
            end
            shakeBlind()
        end
    end,
}

SMODS.Blind {
    key = 'squirm',
    atlas = 'dwBlind',
    pos = {x = 0, y = 41},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'gigi',
    atlas = 'dwBlind',
    pos = {x = 0, y = 20},
    dollars = 5,
    mult = 2,
    boss = {min = 5},
    boss_colour = HEX("abf3fb"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.hand_drawn and (not context.first_hand_drawn) and G.consumeables.cards[1] then
                local _card = pseudorandom_element(G.consumeables.cards, 'dw_twisted_gigi')
                if _card then
                    SMODS.destroy_cards(_card)
                    shakeBlind()
                end
            end
        end
    end
}

SMODS.Blind {
    key = 'goob',
    atlas = 'dwBlind',
    pos = {x = 0, y = 22},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 6},
    boss_colour = HEX("5f80eb"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_hand and not context.check then
                local _card = pseudorandom_element(G.play.cards, 'dw_twisted_goob')
                if _card then
                    SMODS.destroy_cards(_card)
                    shakeBlind()
                end
            end
        end
    end
}

SMODS.Blind {
    key = 'scraps',
    atlas = 'dwBlind',
    pos = {x = 0, y = 23},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 6},
    boss_colour = HEX("cfb595"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_hand and not context.check then
                local _card = pseudorandom_element(G.hand.cards, 'dw_twisted_goob')
                if _card then
                    SMODS.destroy_cards(_card)
                    shakeBlind()
                end
            end
        end
    end
}

SMODS.Sound ({
    key = 'twisted_astro',
    path = 'dw_twisted_astro.ogg',
    pitch = 1,
})

SMODS.Blind {
    key = 'astro',
    atlas = 'dwBlind',
    pos = {x = 0, y = 24},
    
         
    dollars = 5,
    mult = 2,
    boss = {showdown = true},
    boss_colour = HEX("575757"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play and G.hand.cards[1] then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        SMODS.juice_up_blind()
                        play_sound('dandy_twisted_astro', 1, 0.4)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()     
                        local highlighted_limit_ref = G.hand.config.highlighted_limit
                        G.hand.config.highlighted_limit = 999
                        for _,v in ipairs(G.hand.cards) do
                            --v:highlight(true)
                            G.hand:add_to_highlighted(v, true)
                        end
                        G.hand.config.highlighted_limit = highlighted_limit_ref
                        G.FUNCS.discard_cards_from_highlighted(nil, true)
                        return true
                    end
                }))
                blind.triggered = true -- This won't trigger Matador in this context due to a Vanilla bug (a workaround is setting it in context.debuff_hand)
            end
        end
    end
}

SMODS.Sound ({
    key = 'twisted_pebble_1',
    path = 'dw_twisted_pebble_1.ogg',
    pitch = 1,
})

SMODS.Sound ({
    key = 'twisted_pebble_2',
    path = 'dw_twisted_pebble_2.ogg',
    pitch = 1,
})

SMODS.Blind {
    key = 'pebble',
    atlas = 'dwBlind',
    pos = {x = 0, y = 25},
    dollars = 5,
    mult = 2,
    boss = {showdown = true},
    boss_colour = HEX("575757"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.modify_hand then
                blind.triggered = true -- This won't trigger Matador in this context due to a Vanilla bug (a workaround is setting it in context.debuff_hand)
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        SMODS.juice_up_blind()
                        play_sound('dandy_twisted_pebble_1', 1, 0.8)
                        return true
                    end
                }))
                hand_chips = 1
                update_hand_text({modded = true }, {chips = hand_chips})
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        SMODS.juice_up_blind()
                        play_sound('dandy_twisted_pebble_2', 1, 0.8)
                        return true
                    end
                }))
                mult = 1
                update_hand_text({modded = true }, {mult = mult })
            end
        end
    end
}

SMODS.Sound ({
    key = 'twisted_vee',
    path = 'dw_twisted_vee.ogg',
    pitch = 1,
})

SMODS.Blind {
    key = 'vee',
    atlas = 'dwBlind',
    pos = {x = 0, y = 28},
    
         
    dollars = 5,
    mult = 2,
    boss = {showdown = true},
    boss_colour = HEX("575757"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.stay_flipped and context.to_area == G.hand then
                return {
                    stay_flipped = true
                }
            end
            if context.hand_drawn and not context.first_hand_drawn then
                for i=1, 3 do
                    local delay_time = 0.3
                    if i == 1 then
                        delay_time = 0
                    end
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = delay_time * G.SETTINGS.GAMESPEED,
                        func = function()
                            local _cards = {}
                            for _,v in ipairs(G.hand.cards) do
                                if v.facing == 'back' then
                                    _cards[#_cards+1] = v
                                end
                            end

                            local chosen_card = pseudorandom_element(_cards, 'dw_twisted_vee')
                            if chosen_card then
                                chosen_card:flip()
                                play_sound('dandy_twisted_vee', 1, 0.4)
                                SMODS.juice_up_blind()
                            end
                            return true
                        end,
                    }))
                end
            end
        end
    end
}

SMODS.Sound {
    key = 'dandy_music',
    path = 'dw_mus_dandy.ogg',
    pitch = 1,
    select_music_track = function() 
        return G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_dandy_dandy' or nil 
    end,
}

SMODS.Blind {
    key = 'dandy',
    atlas = 'dwBlind',
    pos = {x = 0, y = 0},
    dollars = (dandysworld.config.dwJokers and 0) or 20,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX('801414'),
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
            if dandysworld.config.dwJokers then
                SMODS.add_card{key = "j_dandy_dandy"}
                check_for_unlock{type = 'dw_dandy'}
            end
        end
    end,
    defeat = function(self)
        G.GAME.current_round.dw_shopSkipCount = 0
    end
}

local localize_ref = localize
function localize(args, misc_cat)
    if args == "ph_improve_run" then
        if G.GAME.round_resets.blind_choices.Boss.key == 'bl_dandy_dandy' then
            args = 'ph_dw_stage4'
        elseif G.GAME.current_round.dw_shopSkipCount >= 3 then
            args = "ph_dw_stage3"
        elseif G.GAME.current_round.dw_shopSkipCount == 2 then
            args = "ph_dw_stage2"
        elseif G.GAME.current_round.dw_shopSkipCount == 1 then
            args = "ph_dw_stage1"
        end
    end
    local ret = localize_ref(args, misc_cat)
    return ret
end