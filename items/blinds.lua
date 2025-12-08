SMODS.Blind {
    key = 'blotjr',
    --atlas = 'tesloid',
    unlocked = true,
    discovered = true,     
    pos = {x = 0, y = 0},
    dollars = 5,
    mult = 2,
    boss = {min = 1},
    boss_colour = HEX("615852"),
    ignore_showdown_check = true,
    in_pool = function()
        if SMODS.find_card("j_dandy_blot") then
            return true
        else
            return false
        end
    end
}