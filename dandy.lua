-- Config Tab
dandysworld = SMODS.current_mod

if NFS.read(SMODS.current_mod.path.."config.lua") then
    local file = STR_UNPACK(NFS.read(SMODS.current_mod.path.."config.lua"))
    dandysworld.config_path = SMODS.current_mod.path.."config.lua"
    dandysworld.config_file = file
end

G.FUNCS.restart_game_smods = function(e)
	SMODS.restart_game()
end

G.FUNCS.epic_joker_config = function(option_node)
    print(option_node.cycle_config.current_option)
    local value = option_node.cycle_config.current_option
    dandysworld.config_file.epic = value
    NFS.write(dandysworld.config_path, STR_PACK(dandysworld.config_file))
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
            create_option_cycle({
                align = "tl",
                ref_table = dandysworld.config_file,
                ref_value = "epic",
                current_option = dandysworld.config_file.epic,

                w = 4,
                label = localize('dw_options_epicjokersTitle'),
                options = {
                    localize('dw_options_epicjokers0'),
                    localize('dw_options_epicjokers1'),
                    localize('dw_options_epicjokers2'),
                },

                opt_callback = 'epic_joker_config'
            }),
            simple_text_container('dw_options_seasonal', {
                align = "tl",
            }),
            create_toggle({
                align = "tl",
                label = localize('dw_options_easter'),
                ref_table = dandysworld.config_file,
                ref_value = "easter",
                callback = function(_set_toggle)
                    dandysworld.config_file.easter = _set_toggle
                    dandysworld.config.easter = _set_toggle
                    NFS.write(dandysworld.config_path, STR_PACK(dandysworld.config_file))
                end
            }),
            create_toggle({
                align = "tl",
                label = localize('dw_options_halloween'),
                ref_table = dandysworld.config_file,
                ref_value = "halloween",
                callback = function(_set_toggle)
                    dandysworld.config_file.halloween = _set_toggle
                    dandysworld.config.halloween = _set_toggle
                    NFS.write(dandysworld.config_path, STR_PACK(dandysworld.config_file))
                end
            }),
            create_toggle({
                align = "tl",
                label = localize('dw_options_christmas'),
                ref_table = dandysworld.config_file,
                ref_value = "christmas",
                callback = function(_set_toggle)
                    dandysworld.config_file.christmas = _set_toggle
                    dandysworld.config.christmas = _set_toggle
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
assert(SMODS.load_file("items/blinds.lua"))()

if dandysworld.config_file.epic == 3 and (not next(SMODS.find_mod('Cryptid'))) then
    assert(SMODS.load_file("items/epic_extras.lua"))()
end

if dandysworld.config_file.easter then
    assert(SMODS.load_file("items/easter.lua"))()
end
if dandysworld.config_file.halloween then
    assert(SMODS.load_file("items/halloween.lua"))()
end
if dandysworld.config_file.christmas then
    assert(SMODS.load_file("items/christmas.lua"))()
end

assert(SMODS.load_file("items/lethals.lua"))()