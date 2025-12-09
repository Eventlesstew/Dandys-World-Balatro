SampleJimbos = {}

assert(SMODS.load_file("globals.lua"))()

dandysworld = SMODS.current_mod

-- Config tab
if NFS.read(SMODS.current_mod.path.."config.lua") then
    local file = STR_UNPACK(NFS.read(SMODS.current_mod.path.."config.lua"))
    dandysworld.config_path = SMODS.current_mod.path.."config.lua"
    dandysworld.config_file = file
end

G.FUNCS.restart_game_smods = function(e)
	SMODS.restart_game()
end

dandysworld.config_tab = function()
	return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			r = 0.1,
			align = "tl",
			padding = 0.2,
			colour = G.C.BLACK
		},
		nodes =  {
            create_toggle({
                align = "tl",
                label = "Epic Jokers",
                ref_table = dandysworld.config_file,
                ref_value = "epic",
                callback = function(_set_toggle)
                    dandysworld.config_file.epic = _set_toggle
                    NFS.write(dandysworld.config_path, STR_PACK(dandysworld.config_file))
                end
            }),
			UIBox_button({
                align = "tl",
                label = { "Apply Changes" }, 
                minw = 3.5,
                button = 'restart_game_smods'
			}),
		}
	}
end

-- Jokers
assert(SMODS.load_file("items/atlas.lua"))()

assert(SMODS.load_file("items/trinketJokers.lua"))()
assert(SMODS.load_file("items/toonJokers.lua"))()
assert(SMODS.load_file("items/easter.lua"))()
assert(SMODS.load_file("items/halloween.lua"))()
assert(SMODS.load_file("items/christmas.lua"))()
assert(SMODS.load_file("items/lethals.lua"))()
assert(SMODS.load_file("items/blinds.lua"))()