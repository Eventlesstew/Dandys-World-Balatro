-- Config Tab
dandysworld = SMODS.current_mod
local config = dandysworld.config

function dandysworld.save_config(self)
    SMODS.save_mod_config(self)
end

G.FUNCS.restart_game_smods = function(e)
	SMODS.restart_game()
end

-- TODO: Fix this not working
G.FUNCS.epic_joker_config = function(option_node)
    dandysworld.config.epic = option_node.cycle_config.current_option
    dandysworld:save_config()
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
            {n = G.UIT.C, config = { align = "cl", minw = G.ROOM.T.w*0, padding = 0.04 }, nodes = {
                create_option_cycle({ref_table = dandysworld.config, ref_value = "epic", opt_callback = 'epic_joker_config', w = 4,
                    
                    current_option = dandysworld.config.epic,
                    label = localize('dw_options_epicjokersTitle'),
                    options = {
                        localize('dw_options_epicjokers0'),
                        localize('dw_options_epicjokers1'),
                        localize('dw_options_epicjokers2'),
                    },
                }),
                UIBox_button({label = {localize('dw_options_apply')}, minw = 3.5, button = 'restart_game_smods'}),
            }},
		}
	}
end

dandysworld.extra_tabs = function()
--local vertical_tabs = {}
	return {
        {label = localize('dw_options_experimentalTitle'), tab_definition_function = function()
            return {n=G.UIT.ROOT, config = {padding = 0.0, colour = G.C.BLACK}, nodes = {
                {n = G.UIT.C, config = { align = "cl", minw = G.ROOM.T.w*0, padding = 0.04 }, nodes = {
                    create_toggle({label = localize('dw_options_easter'), ref_table = dandysworld.config, ref_value = "easter", callback = function() dandysworld:save_config() end}),
                    create_toggle({label = localize('dw_options_halloween'), ref_table = dandysworld.config, ref_value = "halloween", callback = function() dandysworld:save_config() end}),
                    create_toggle({label = localize('dw_options_christmas'), ref_table = dandysworld.config, ref_value = "christmas", callback = function() dandysworld:save_config() end}),
                    UIBox_button({label = {localize('dw_options_apply')}, minw = 3.5, button = 'restart_game_smods'}),
                }},
            }}
        end},
    }
end

-- Jokers
assert(SMODS.load_file("items/atlas.lua"))()
assert(SMODS.load_file("items/wave1/jokers.lua"))()
assert(SMODS.load_file("items/wave1/blinds.lua"))()

if config.epic == 3 and (not next(SMODS.find_mod('Cryptid'))) then
    assert(SMODS.load_file("items/epic_extras.lua"))()
end

if config.easter == true then
    assert(SMODS.load_file("items/easter/jokers.lua"))()
end
if config.halloween == true then
    assert(SMODS.load_file("items/halloween/jokers.lua"))()
end
if config.christmas == true then
    assert(SMODS.load_file("items/christmas/jokers.lua"))()
end

assert(SMODS.load_file("items/wave1/dandy.lua"))()

--[[
    nodes={
        {
            n=G.UIT.C,
            config={align = "cm", r = 0.1, colour = G.C.BLACK}, 
            nodes={
                {
                    n=G.UIT.C, 
                    config={
                        align = "cm", 
                        r = 0.1, 
                        padding = 0.03, 
                        minw = 0.4, minh = 0.4, 
                        outline_colour = G.C.WHITE, outline = 1.2, 
                        line_emboss = 0.5, 
                        ref_table = dandysworld.config_file,
                        ref_value = 'easter',
                        colour = G.C.BLACK,
                        button = 'easter_config', 
                        button_dist = 0.2, 
                        hover = true, 
                        toggle_callback = 'easter_config', 
                        func = 'toggle', 
                        focus_args = {funnel_to = true}
                    }, 
                    nodes={
                        {n=G.UIT.O, config={object = check}},
                    }
                },
            }
        }
    }
    ]]