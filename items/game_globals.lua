function SMODS.current_mod.reset_game_globals(run_start)
    -- Resets Dandy's Variables back
    if run_start then
        G.GAME.current_round.dw_shopSkipCount = 0
        G.GAME.current_round.dw_dandy_threshold = 3
        G.GAME.current_round.dw_dandy_denominator = 20
        G.GAME.current_round.dw_dandy_baseNumerator = 2
    end
end

-- TODO: Move this to a game global function.
function SMODS.current_mod.calculate(self, context)
    if context.reroll_shop or context.buying_card or context.dw_buying_booster then
        -- This is set to -1 so when you exit the shop, it increments back to 0.
        print('Reset Skip Count')
        G.GAME.current_round.dw_shopSkipCount = -1

        -- If you buy something while Dandy is there, he goes away.
        if G.GAME.round_resets.blind_choices.Boss.key == 'bl_dandy_dandy' then
            G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = nil
            G.FUNCS.reroll_boss()
        end
    end

    if context.ending_shop then
        G.GAME.current_round.dw_shopSkipCount = G.GAME.current_round.dw_shopSkipCount + 1
        print(G.GAME.current_round.dw_shopSkipCount)

        -- Unlocks Astro
        if 
            G.GAME.current_round.dw_shopSkipCount >= G.GAME.current_round.dw_dandy_threshold
        then
            check_for_unlock{type = 'dw_astro'} -- Unlocks Astro

            local numerator = G.GAME.current_round.dw_shopSkipCount - G.GAME.current_round.dw_dandy_threshold + G.GAME.current_round.dw_dandy_baseNumerator
            local denominator = G.GAME.current_round.dw_dandy_denominator
            if 
                (numerator >= denominator or 
                SMODS.pseudorandom_probability(self, 'dw_twisted_dandy', numerator, denominator))
            then
                print("Twisted Dandy Spawned")
                G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = 'bl_dandy_dandy'
                G.FUNCS.reroll_boss()
            end
        end
    end
    
    -- Unlocks Shrimpo
    if context.remove_playing_cards then
        check_for_unlock{type = 'dw_shrimpo'}
    end

    -- Unlocks Toodles
    if context.final_scoring_step then
        if mult > 1000 then
            check_for_unlock{type = 'dw_toodles'}
        end
    end

    -- Unlocks Vee
    if context.skipping_booster and context.booster.key == 'spectral_mega_1' then
        check_for_unlock{type = 'dw_vee'}
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