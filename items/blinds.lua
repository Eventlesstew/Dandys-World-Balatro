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