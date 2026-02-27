-- Main Rarity Gradient
SMODS.Gradient {
    key = 'main_gradient',
    colours = {
        HEX('fd5f55'),
        HEX('fda200'),
        HEX('ffd61d'),
        HEX('91e461'),
        HEX('009cfd'),
        HEX('8a71e1'),
    },
    cycle = 15
}

-- Main Rarity
SMODS.Rarity{
	key = "epic",
	loc_txt = {},
	badge_colour = SMODS.Gradients["dandy_main_gradient"],
	default_weight = 0.003,
	pools = { ["Joker"] = true },
}

-- Lethal Rarity Gradient
SMODS.Gradient {
    key = 'lethal_gradient',
    colours = {
        HEX('F46464'),
        HEX('C01F1F')
    },
    cycle = 6
}

-- Lethal Rarity
SMODS.Rarity {
    key = 'leader',
    badge_colour = SMODS.Gradients["dandy_lethal_gradient"],
    default_weight = 0
}

SMODS.Atlas({
    key = 'dwJoker',
    path = "DandyJokers.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = 'poppy',
    atlas = 'dwJoker',
    pos = { x = 6, y = 5},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {chips = 0, chip_mod = 25} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.before then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    colour = G.C.CHIPS
                }
            end
            if context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.chips = 0
                return {
                    extra = {focus = card, message = localize('k_reset')},
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'round_win' and G.GAME.current_round.hands_left == 0
    end,
}

SMODS.Joker{
    key = 'boxten',
    atlas = 'dwJoker',
    pos = { x = 5, y = 4},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {mult = 3} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * #context.full_hand
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'hand_contents' then
            local tally = 0
            for j = 1, #args.cards do
                if args.cards[j]:is_face() then
                    tally = tally + 1
                    if tally == 5 then
                        return true
                    end
                end
            end
        end
        return false
    end,
    --[[
    check_for_unlock = function(self, args)
        if args.type == 'modify_jokers' and G.jokers then
            return #G.jokers.cards > 5
        end
    end,]]
    locked_loc_vars = function(self, info_queue, card)
        return {vars = {5}}
    end
    --[[
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars * #G.jokers.cards
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.dollars, card.ability.extra.dollars * (G.jokers and #G.jokers.cards or 0)}, key = self.key }
    end]]
}

SMODS.Joker{
    key = "shrimpo",
    atlas = 'dwJoker',
    pos = { x = 0, y = 6},
    soul_pos=nil,
    rarity = 1,
    cost = 4,
    config = { extra = {odds = 2} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            if SMODS.pseudorandom_probability(card, 'dw_shrimpo', 1, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind.chips = G.GAME.blind.chips * 2
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        return true
                    end
                }))
                return {
                    message = localize('dw_shrimpo_punch_ex'),
                    colour = G.C.FILTER
                }
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.5
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        return true
                    end
                }))
                return {
                    message = localize('dw_shrimpo_hate'),
                    colour = G.C.FILTER
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'dw_shrimpo')
        return { vars = {numerator, denominator}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_shrimpo'
    end,
}

SMODS.Joker{
    key = "toodles",
    atlas = 'dwJoker',
    pos = {x = 3, y = 6},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {chips = 50, mult = 10, x_mult = 1.5, h_size = 1, h_size_mod = 0} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.joker_main then
            local effectTable = {
                {
                    x_mult = card.ability.extra.x_mult
                },
                {
                    mult = card.ability.extra.mult
                },
                {
                    chips = card.ability.extra.chips
                },
            }
            if not context.blueprint then
                effectTable[#effectTable + 1] = {
                    func = function()
                        G.hand:change_size(card.ability.extra.h_size)
                        card.ability.extra.h_size_mod = card.ability.extra.h_size_mod + 1
                    end,
                    message = localize{type = 'variable',key = 'a_handsize',vars = {card.ability.extra.h_size}},
                    colour = G.C.FILTER,
                }
            end
            local effect = pseudorandom_element(effectTable, 'dw_toodles')

            return effect
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            G.hand:change_size(-card.ability.extra.h_size_mod)
            card.ability.extra.h_size_mod = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size_mod)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.x_mult, card.ability.extra.h_size}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_toodles'
    end,
    locked_loc_vars = function(self, info_queue, card)
        return {vars = {1000}}
    end,
}

SMODS.Joker{
    key = 'brightney',
    atlas = 'dwJoker',
    pos = { x = 6, y = 4},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {mult = 0, mult_mod = 3, target_cards = {}} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=false,
    unlocked = false,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.press_play then
                card.ability.extra.target_cards = {}
                for _,v in ipairs(G.hand.cards) do
                    if v.facing == 'back' then
                        card.ability.extra.target_cards[#card.ability.extra.target_cards+1] = v
                    end
                end
            end
            if context.individual and context.cardarea == G.play and not context.end_of_round then -- Not sure if this would work
                local valid = false
                for _,v in ipairs(card.ability.extra.target_cards) do
                    if context.other_card == v then
                        valid = true
                        break
                    end
                end
                
                if valid then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                    }
                end
            end
            if context.after then
                card.ability.extra.target_cards = {}
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_mod, card.ability.extra.mult}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_brightney'
    end,
    locked_loc_vars = function(self, info_queue, card)
        return {vars = {5}}
    end,
}

SMODS.Joker{
    key = 'rodger',
    atlas = 'dwJoker',
    pos = { x = 8, y = 5},
    soul_pos=nil,
    rarity = 2,
    cost = 5,
    config = { extra = {poker_hand = 'High Card'} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end

        if not context.blueprint then
            if context.end_of_round and context.game_over == false and context.main_eval then
                local _poker_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                        _poker_hands[#_poker_hands + 1] = handname
                    end
                end
                card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'dw_rodger')
                return {
                    message = localize('k_reset')
                }
            end
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'dw_rodger')
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.poker_hand, 'poker_hands')}, key = self.key }
    end,
    locked_loc_vars = function(self, info_queue, card)
        local threshold = 0
        for k, v in pairs(G.P_BLINDS) do
            threshold = threshold + 1
        end
        if threshold > 50 then
            threshold = 50
        end
        return { vars = {threshold} }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'blind_discoveries' then
            local discovered_blinds = 0
            local threshold = 0
            for k, v in pairs(G.P_BLINDS) do
                threshold = threshold + 1
                if v.discovered then
                    discovered_blinds = discovered_blinds + 1
                end
            end
            if threshold > 50 then
                threshold = 50
            end
            return discovered_blinds >= threshold
        end
        return false
    end
}

SMODS.Joker{
    key = "razzledazzle", 
    atlas = 'dwJoker',
    config = { extra = {mult = 7} },
    pos = { x = 7, y = 5 },
    soul_pos=nil,
    rarity = 2,
    cost = 7,
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,

    calculate = function(self,card,context)
        if context.setting_blind and not context.blueprint then
            local evenRound = (G.GAME.round % 2) == 0
            if evenRound then
                return {
                    message = localize('k_dandy_misery_ex'),
                    colour = G.C.CHIPS
                }
            else
                return {
                    message = localize('k_dandy_joy_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            local score = false
            if (G.GAME.round % 2) == 0 then
                if (context.other_card:is_suit('Spades') or context.other_card:is_suit('Clubs')) then
                    score = true
                end
            else
                if (context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds')) then
                    score = true
                end
            end

            if score then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
        local evenRound = (G.GAME.round % 2) == 0
        
        local suit_t1
        local suit_t2
        local con_t

        local suit_f1
        local suit_f2
        local con_f

        if evenRound then
            suit_t1 = 'Spades'
            suit_t2 = 'Clubs'
            suit_f1 = 'Hearts'
            suit_f2 = 'Diamonds'
            con_t = 'dw_rnd_even'
            con_f = 'dw_rnd_odd'
        else
            suit_f1 = 'Spades'
            suit_f2 = 'Clubs'
            suit_t1 = 'Hearts'
            suit_t2 = 'Diamonds'
            con_t = 'dw_rnd_odd'
            con_f = 'dw_rnd_even'
        end

        return { vars = {
                localize(suit_t1, 'suits_singular'), 
                localize(suit_t2, 'suits_singular'),
                localize(suit_f1, 'suits_singular'),
                localize(suit_f2, 'suits_singular'),
                localize(con_t),
                localize(con_f),
                card.ability.extra.mult,  
                colours = {
                    G.C.SUITS[suit_t1], 
                    G.C.SUITS[suit_t2],
                    G.C.SUITS[suit_f1], 
                    G.C.SUITS[suit_f2],
                }
            }, 
            key = self.key
        }
    end,

    check_for_unlock = function(self, args)
        if args.type == 'hand_contents' and #args.cards == 5 then
            local oddvalid = true
            local evenvalid = true
            for j = 1, #args.cards do
                local rank = args.cards[j]:get_id()
                local oddresult = false
                local evenresult = false
                if rank <= 10 and rank >= 0 then
                    if rank % 2 == 1 then
                        oddresult = true
                    else
                        evenresult = true
                    end
                elseif rank == 14 then
                    oddresult = true
                end

                if oddvalid then
                    oddvalid = oddresult
                end
                if evenvalid then
                    evenvalid = evenresult
                end
            end

            return oddvalid or evenvalid
        end
        return false
    end,
}

SMODS.Joker{
    key = 'squirm',
    atlas = 'dwJoker',
    pos = { x = 9, y = 8},
    soul_pos=nil,
    rarity = 2,
    cost = 8,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,

    in_pool = function()
        return false
    end,
    calculate = function(self,card,context)
    end,
    check_for_unlock = function(self, args) -- equivalent to `unlock_condition = { type = 'discover_amount', spectral_count = 18 }`
        return false
    end,
}

SMODS.Joker{
    key = 'gigi',
    atlas = 'dwJoker',
    pos = { x = 2, y = 5},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
    config = { extra = {
        tags = {
            'tag_charm',
            'tag_buffoon',
            'tag_meteor',
            'tag_ethereal',
            'tag_standard'
        }
    } },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,

    calculate = function(self,card,context)
        if context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local tag = pseudorandom_element(card.ability.extra.tags, 'dw_gigi')
                    if tag then
                        add_tag(Tag(tag))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                end)
            }))
            return {
                message = localize('dw_gigi')    
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_standard', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_charm', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_meteor', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_buffoon', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_ethereal', set = 'Tag' }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' then
            local threshold = 0
            local count = 0
            for _,v in pairs(G.P_TAGS) do
                threshold = threshold + 1
                if v.discovered then
                    count = count + 1
                end
            end
            return count >= threshold
        end
        return false
    end,
}

-- TODO - Test what happens if multiple Goobs are present
SMODS.Joker{
    key = 'goob',
    atlas = 'dwJoker',
    pos = { x = 4, y = 5},
    soul_pos=nil,
    rarity = 3,
    cost = 8,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.pack_cards and G.pack_cards.cards[1] then
                        local consumeables = {}
                        for k, v in pairs(G.pack_cards.cards) do
                            if v.ability.consumeable then table.insert(consumeables, v) end
                        end
                        if next(consumeables) then
                            local consumeable = pseudorandom_element(consumeables, 'dw_goob')
                            SMODS.add_card({key = consumeable.config.center.key})
                            SMODS.destroy_cards(consumeable)
                        end
                    end
                    return true
                end
            }))
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'hand_contents' then
            local tally = 0
            for j = 1, #args.cards do
                if SMODS.has_enhancement(args.cards[j], 'm_mult') then
                    tally = tally + 1
                    if tally == 5 then
                        return true
                    end
                end
            end
        end
        return false
    end,
    locked_loc_vars = function(self, info_queue, card)
        return {vars = {5}}
    end
}

SMODS.Joker{
    key = 'scraps',
    atlas = 'dwJoker',
    pos = { x = 9, y = 5},
    soul_pos=nil,
    rarity = 3,
    cost = 7,
    config = { extra = {dollars = 15} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_gold'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = {card.ability.extra.dollars}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'hand_contents' then
            local tally = 0
            for j = 1, #args.cards do
                if SMODS.has_enhancement(args.cards[j], 'm_lucky') then
                    tally = tally + 1
                    if tally == 5 then
                        return true
                    end
                end
            end
        end
        return false
    end,
    locked_loc_vars = function(self, info_queue, card)
        return {vars = {5}}
    end
}

SMODS.Sound ({
    key = 'pebble',
    path = 'dw_pebble.ogg',
})

SMODS.Joker{
    key = "pebble",
    atlas = 'dwJoker',
    pos = { x = 5, y = 6},
    soul_pos=nil,
    rarity = 'dandy_epic',
    cost = 20,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            local quotes = {
                "dw_pebble_quote1",
                "dw_pebble_quote2",
                "dw_pebble_quote3",
                "dw_pebble_quote4",
                "dw_pebble_quote5",
                "dw_pebble_quote6",
                "dw_pebble_quote7",
            }
            local quote = pseudorandom_element(quotes, 'dw_pebble_quote')

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips * 0.5
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    return true
                end
            }))
            return {
                message = localize(quote),
                sound = "dandy_pebble",
                colour = G.C.UI.TEXT_DARK,
            }
        end
        --[[
        if context.using_consumeable then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
            }
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
        ]]
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_pebble'
    end,
}

SMODS.Sound ({
    key = 'astro',
    path = 'dw_astro.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = "astro",
    atlas = 'dwJoker',
    pos = { x = 6, y = 6},
    soul_pos=nil,
    rarity = 'dandy_epic',
    cost = 20,
    config = { extra = {repetitions = 2} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.repetitions}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_astro'
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = {3}}
    end,
}

local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
    local g = use_consumeable_ref(self, area, copier)
    local rep = 'j_dandy_astro'
    if next(SMODS.find_card(rep)) and (self.ability.set == 'Planet') then
        for k, v in pairs(SMODS.find_card(rep)) do
            for i = 1, (v.ability.extra.repetitions or 2) do
                SMODS.calculate_effect({
                    message = localize('k_again_ex'), 
                    message_card = v,
                    sound = "dandy_astro",
                    colour = G.C.CHIPS,
                }, self)
                use_consumeable_ref(self, area, copier)
            end
        end
    end
    return g
end

SMODS.Sound ({
    key = 'vee',
    path = 'dw_vee.ogg',
    pitch = 1,
})

SMODS.Joker{
    key = 'vee',
    atlas = 'dwJoker',
    pos = { x = 9, y = 6},
    soul_pos=nil,
    rarity = 'dandy_epic',
    cost = 20,
    config = { extra = {choice_mod = 1, size_mod = 2} },
    blueprint_compat=false,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = false,
    add_to_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.booster_choice_mod then
            G.GAME.modifiers.booster_choice_mod = 0
        end
        G.GAME.modifiers.booster_choice_mod = G.GAME.modifiers.booster_choice_mod + card.ability.extra.choice_mod

        if not G.GAME.modifiers.booster_size_mod then
            G.GAME.modifiers.booster_size_mod = 0
        end
        G.GAME.modifiers.booster_size_mod = G.GAME.modifiers.booster_size_mod + card.ability.extra.size_mod
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.booster_choice_mod then
            G.GAME.modifiers.booster_choice_mod = 0
        else
            G.GAME.modifiers.booster_choice_mod = G.GAME.modifiers.booster_choice_mod - card.ability.extra.choice_mod
        end

        if not G.GAME.modifiers.booster_size_mod then
            G.GAME.modifiers.booster_size_mod = 0
        else
            G.GAME.modifiers.booster_size_mod = G.GAME.modifiers.booster_size_mod - card.ability.extra.size_mod
        end
    end,
    calculate = function(self,card,context)
        if context.open_booster then
            return {
                message = localize('dw_vee_ability'),
                colour = G.C.GREEN,
                sound = 'dandy_vee'
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.choice_mod, card.ability.extra.size_mod}, key = self.key }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'dw_vee'
    end,
}

SMODS.Joker{
    key = "dandy",
    atlas = 'dwJoker',
    pos = { x = 8, y = 7},
    soul_pos={ x = 8, y = 8},
    rarity = (dandysworld.config.dwBlinds and 'dandy_leader') or 4,
    cost = 40,
    config = { extra = {chips = 0, chip_mod = 50} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=false,
    unlocked = false,
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
        return args.type == 'dw_dandy'
    end,
    locked_loc_vars = function(self, info_queue, card)
        if dandysworld.config.dwBlinds then
            if G.P_BLINDS.bl_dandy_dandy.discovered then
                return {key = 'j_dandy_dandy_discovered'}
            else
                return {key = 'j_dandy_dandy_undiscovered'}
            end
        end
    end
}