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

SMODS.Blind {
    key = 'dandy',
    --atlas = 'tesloid',
    unlocked = true,
    discovered = true,     
    pos = {x = 0, y = 0},
    dollars = 10,
    mult = 6,
    boss = {min = 1},
    boss_colour = HEX("615852"),
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
    atlas = 'dandysworld',
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
    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}

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
    --atlas = 'tesloid',
    unlocked = true,
    discovered = true,     
    pos = {x = 0, y = 1},
    dollars = 10,
    mult = 25,
    boss = {min = 1},
    boss_colour = HEX("615852"),
    calculate = function(self, blind, context)
        if context.modify_hand then
            if context.end_of_round and context.game_over == false and context.main_eval then
                SMODS.add_card{key = "j_dandy_dyle"}
            end
        end
    end,
}

SMODS.Joker{
    key = "dyle",
    atlas = 'dandysworld',
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
    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}