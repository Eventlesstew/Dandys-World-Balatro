SMODS.Blind {
    key = 'poppy',
    atlas = 'dwBlind',
    pos = {x = 0, y = 7},
    
         
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
    key = 'boxten',
    atlas = 'dwBlind',
    pos = {x = 0, y = 3},
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
    key = 'shrimpo',
    atlas = 'dwBlind',
    pos = {x = 0, y = 8},
    
         
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
    key = 'toodles',
    atlas = 'dwBlind',
    pos = {x = 0, y = 17},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 1},
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
    boss = {min = 1},
    boss_colour = HEX("575757"),
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
    boss = {min = 1},
    boss_colour = HEX("575757"),
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
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'goob',
    atlas = 'dwBlind',
    pos = {x = 0, y = 22},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'scraps',
    atlas = 'dwBlind',
    pos = {x = 0, y = 23},
    
         
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
    key = 'astro',
    atlas = 'dwBlind',
    pos = {x = 0, y = 24},
    
         
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
                hand_chips = 1
                mult = 1
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
            end
        end
    end
}

SMODS.Blind {
    key = 'vee',
    atlas = 'dwBlind',
    pos = {x = 0, y = 28},
    
         
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        return false
    end,
}