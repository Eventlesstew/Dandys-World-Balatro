SMODS.Blind {
    key = 'boxten',
    atlas = 'dwBlind',
    pos = {x = 0, y = 3},
    unlocked = true,
    discovered = true,     
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
    key = 'brusha',
    atlas = 'dwBlind',
    pos = {x = 0, y = 4},
    unlocked = true,
    discovered = true,     
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
    key = 'cosmo',
    atlas = 'dwBlind',
    pos = {x = 0, y = 5},
    unlocked = true,
    discovered = true,     
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
    key = 'looey',
    atlas = 'dwBlind',
    pos = {x = 0, y = 6},
    unlocked = true,
    discovered = true,     
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
    key = 'poppy',
    atlas = 'dwBlind',
    pos = {x = 0, y = 7},
    unlocked = true,
    discovered = true,     
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
    unlocked = true,
    discovered = true,     
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
    key = 'tisha',
    atlas = 'dwBlind',
    pos = {x = 0, y = 9},
    unlocked = true,
    discovered = true,     
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
    key = 'yatta',
    atlas = 'dwBlind',
    pos = {x = 0, y = 10},
    unlocked = true,
    discovered = true,     
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
    key = 'brightney',
    atlas = 'dwBlind',
    pos = {x = 0, y = 11},
    unlocked = true,
    discovered = true,     
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
    key = 'finn',
    atlas = 'dwBlind',
    pos = {x = 0, y = 13},
    unlocked = true,
    discovered = true,     
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
    key = 'razzledazzle',
    atlas = 'dwBlind',
    pos = {x = 0, y = 14},
    unlocked = true,
    discovered = true,     
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
    key = 'rodger',
    atlas = 'dwBlind',
    pos = {x = 0, y = 15},
    unlocked = true,
    discovered = true,     
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
    key = 'teagan',
    atlas = 'dwBlind',
    pos = {x = 0, y = 16},
    unlocked = true,
    discovered = true,     
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
    unlocked = true,
    discovered = true,     
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
    key = 'blot',
    atlas = 'dwBlind',
    pos = {x = 0, y = 18},
    unlocked = true,
    discovered = true,     
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
    key = 'flutter',
    atlas = 'dwBlind',
    pos = {x = 0, y = 19},
    unlocked = true,
    discovered = true,     
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
    key = 'gigi',
    atlas = 'dwBlind',
    pos = {x = 0, y = 20},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'glisten',
    atlas = 'dwBlind',
    pos = {x = 0, y = 21},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'goob',
    atlas = 'dwBlind',
    pos = {x = 0, y = 22},
    unlocked = true,
    discovered = true,     
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
    unlocked = true,
    discovered = true,     
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
    unlocked = true,
    discovered = true,     
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
    unlocked = true,
    discovered = true,     
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
    key = 'shelly',
    atlas = 'dwBlind',
    pos = {x = 0, y = 26},
    unlocked = true,
    discovered = true,     
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
    key = 'sprout',
    atlas = 'dwBlind',
    pos = {x = 0, y = 27},
    unlocked = true,
    discovered = true,     
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
    key = 'vee',
    atlas = 'dwBlind',
    pos = {x = 0, y = 28},
    unlocked = true,
    discovered = true,     
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
    key = 'connie',
    atlas = 'dwBlind',
    pos = {x = 0, y = 12},
    unlocked = true,
    discovered = true,     
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    in_pool = function()
        return false
    end,
}

SMODS.Blind {
    key = 'blotjr',
    atlas = 'dwBlind',
    unlocked = true,
    discovered = true,     
    pos = {x = 0, y = 2},
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("575757"),
    ignore_showdown_check = true,
    in_pool = function()
        if next(SMODS.find_card("j_dandy_blot")) then
            return true
        else
            return false
        end
    end
}