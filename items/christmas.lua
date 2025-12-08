SMODS.Joker{
    key = "coalTrinket",
    atlas = 'dwJoker',
    pos = { x = 2, y = 9},
    soul_pos=nil,
    rarity = 1,
    cost = 1,
    config = { extra = {} },
    blueprint_compat=true,
    eternal_compat=true,
    perishable_compat=true,
    unlocked = true,
    discovered = true,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            G.GAME.blind.chips = G.GAME.blind.chips * 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            return {
                message = localize("dw_naughty_ex"),
                colour = G.C.RED,
                sound = "tarot2",
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {}, key = self.key }
    end
}
SMODS.Sound ({
    key = 'bobette',
    path = 'dw_bobette.ogg',
    pitch = 1,
})