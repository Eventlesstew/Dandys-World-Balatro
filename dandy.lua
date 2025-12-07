SampleJimbos = {}

assert(SMODS.load_file("globals.lua"))()

-- Jokers
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/easter.lua"))()
assert(SMODS.load_file("items/halloween.lua"))()
assert(SMODS.load_file("items/christmas.lua"))()
assert(SMODS.load_file("items/lethals.lua"))()