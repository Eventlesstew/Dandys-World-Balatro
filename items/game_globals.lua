-- Mod Icon
SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
}

function SMODS.current_mod.reset_game_globals(run_start)
    -- Resets Dandy's Variables back
    if run_start then
        G.GAME.current_round.dw_shopSkipCount = 0
        G.GAME.current_round.dw_dandy_threshold = 3
        G.GAME.current_round.dw_dandy_denominator = 20
        G.GAME.current_round.dw_dandy_baseNumerator = 2
    end
end

function SMODS.current_mod.calculate(self, context)
    if context.reroll_shop or context.buying_card or context.dw_buying_booster then
        -- This is set to -1 so when you exit the shop, it increments back to 0.
        print('Reset Skip Count')
        G.GAME.current_round.dw_shopSkipCount = -1

        -- If you buy something while Dandy is there, he goes away.
        if G.GAME.round_resets.blind_choices.Boss.key == 'bl_dandy_dandy' then
            G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
            G.FUNCS.reroll_boss()
        end
    end

    if context.ending_shop then
        G.GAME.current_round.dw_shopSkipCount = G.GAME.current_round.dw_shopSkipCount + 1
        print(G.GAME.current_round.dw_shopSkipCount)

        if G.GAME.current_round.dw_shopSkipCount >= G.GAME.current_round.dw_dandy_threshold then
            check_for_unlock{type = 'dw_astro'} -- Unlocks Astro

            if dandysworld.config.dwBlinds then
                local numerator = G.GAME.current_round.dw_shopSkipCount - G.GAME.current_round.dw_dandy_threshold + G.GAME.current_round.dw_dandy_baseNumerator
                local denominator = G.GAME.current_round.dw_dandy_denominator
                if 
                    (numerator >= denominator or 
                    SMODS.pseudorandom_probability(self, 'dw_twisted_dandy', numerator, denominator))
                then
                    print("Twisted Dandy Spawned")
                    G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = 'bl_dandy_dandy'
                    G.FUNCS.reroll_boss()
                end
            end
        end
    end

    -- JOKER UNLOCKS
    if dandysworld.config.dwJokers then
        -- Shrimpo
        if not G.P_CENTERS.j_dandy_shrimpo.unlocked then
            if context.remove_playing_cards then
                check_for_unlock{type = 'dw_shrimpo'}
            end
        end

        -- Toodles
        if not G.P_CENTERS.j_dandy_toodles.unlocked then
            if context.final_scoring_step and mult > 1000 then
                check_for_unlock{type = 'dw_toodles'}
            end
        end

        -- Brightney
        if not G.P_CENTERS.j_dandy_brightney.unlocked then
            if context.press_play then
                local count = 0
                for _,v in ipairs(G.hand.highlighted) do
                    if v.facing == 'back' then
                        count = count + 1
                    end
                end
                
                if count == 5 then
                    check_for_unlock{type = 'dw_brightney'}
                end
            end
        end

        -- Vee
        if not G.P_CENTERS.j_dandy_vee.unlocked then
            if context.skipping_booster and context.booster.key == 'p_spectral_mega_1' then
                check_for_unlock{type = 'dw_vee'}
            end
        end
    end
end

-- This resets the shop skip count when a Booster is bought.
local use_card_ref = G.FUNCS.use_card
G.FUNCS.use_card = function(e, mute, nosave)
    local result = use_card_ref(e, mute, nosave)
    local card = e.config.ref_table
    if card.ability.set == 'Booster' and card.area == G.shop_booster then
        SMODS.calculate_context({
            dw_buying_booster = true,
            card = card
        })
    end
    return result
end

local debuff_card_ref = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
    debuff_card_ref(self, card, from_blind)
    recalc_dw_worthless(card)
    recalc_dw_target(card)
end

function recalc_dw_worthless(card)
    if card then
        local effect = {}
        SMODS.calculate_context(
            {
                dw_worthless_card = card,
            },
            effect
        )

        if effect.worthless then
            card.dw_worthless = true
        else
            card.dw_worthless = nil
        end
    end
end

SMODS.Shader {
    key = 'dw_worthless', 
    path = "worthless.fs"
}

SMODS.DrawStep {
    key = 'worthless',
    order = 71,
    func = function(card, layer)
        if card.dw_worthless and not card.debuff and (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('dw_worthless', nil, card.ARGS.send_to_shader)
        end
    end,
}

-- TODO: Hook recalc_debuff to trigger this function.
function recalc_dw_target(card)
    if card then
        local effect = {}
        SMODS.calculate_context(
            {
                dw_target_card = card,
            },
            effect
        )

        if effect.target then
            card.dw_target = true
        else
            card.dw_target = nil
        end
    end
end

SMODS.Shader {
    key = 'dw_target', 
    path = "target.fs"
}

SMODS.DrawStep {
    key = 'target',
    order = 72,
    func = function(card, layer)
        if card.dw_target and (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('dw_target', nil, card.ARGS.send_to_shader)
        end
    end,
}