return {
    descriptions = {

        Blind = {
            bl_dandy_dandy = {
                name = "Dandy",
                text = {
                    "1 Hand, 0 Discards,",
                },
            },
            bl_dandy_dyle = {
                name = "Dyle",
                text = {
                    "Extremely Large Blind",
                },
            },
            bl_dandy_blotjr = {
                name = "Blot Jr",
                text = {
                },
            },
        },
        Tag = {
            tag_dandy_timesup = {
                name = "TIME'S UP",
                text = {
                    "Boss Blind becomes {C:red}Lethal",
                    "Creates a powerful {C:attention}Joker{}",
                    "when defeated",
                },
            },
        },
        Joker = {
            j_dandy_coinPurse = {
                name = "Coin Purse",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_dandy_researchMap = {
                name = "Research Map",
                text = {
                    "Earn {C:money}$#1#{} when",
                    "{C:attention}Blind is skipped"
                },
            },
            j_dandy_machineManual = {
                name = "Machine Manual",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                },
            },
            j_dandy_fancyPurse = {
                name = "Fancy Purse",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_dandy_brick = {
                name = "Brick",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:inactive,s:0.8}It's a brick, what",
                    "{C:inactive,s:0.8}did you expect?"
                },
            },
            j_dandy_clownhorn = {
                name = "Clown Horn",
                text = {
                    "{C:mult}+#1#{} Mult on {C:attention}odd",
                    "numbered rounds",
                    "{C:inactive}#2#"
                },
            },
            j_dandy_ribbonspool = {
                name = "Ribbon Spool",
                text = {
                    "{X:mult,C:white}X#1#{} Mult on {C:attention}even",
                    "numbered rounds",
                    "{C:inactive}#2#"
                },
            },

            j_dandy_toodles = {
                name = "Toodles",
                text = {
                    "Grants either {C:chips}+#1#{} Chips,",
                    "{C:mult}+#2#{} Mult or {X:mult,C:white}X#3#{} Mult",
                }
            },

            j_dandy_shrimpo = {
                name = "Shrimpo",
                text = {
                    "{C:attention}Debuffs{} 1 random",
                    "card in played hand",
                }
            },
            j_dandy_cosmo = {
                name = "Cosmo",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "hand remaining",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                },
            },

            j_dandy_blot = {
                name = "tolB",
                text = {
                    "Allows the Blot Jr",
                    "{C:attention}Boss Blind {}to appear"
                    --[["Each card held in",
                    "hand scores {C:mult}+#1#{} Mult",]]
                },
                
            },
            j_dandy_razzledazzle = {
                name = "Razzle & Dazzle",
                text = {
                    "{C:mult}+#2#{} Mult on {C:attention}odd",
                    "{}numbered rounds",
                    "{X:mult,C:white}X#1#{} Mult on {C:attention}even",
                    "numbered rounds",
                    "{C:inactive}(Currently {B:2,V:1}#4##3#{C:inactive} Mult)"
                },
            },
            j_dandy_pebble = {
                name = "Pebble",
                text = {
                    "BARK! BARK!"
                },
            },
            j_dandy_astro = {
                name = "Astro",
                text = {
                    "Havles {C:attention}Blind{}",
                    "score",
                },
            },
            j_dandy_sprout = {
                name = "Sprout",
                text = {
                    "{C:chips}+#2#{} Hand for",
                    "each {C:money}$#3#{} owned",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Hands)"
                },
            },
            j_dandy_shelly = {
                name = "Shelly",
                text = {
                    
                },
            },
            j_dandy_vee = {
                name = "Vee",
                text = {
                    
                },
            },
            j_dandy_BNAT = {
                name = "Bone Needle & Thread",
                text = {
                    "Becomes {C:attention}Ribecca{}, {C:attention}Soulvester{},",
                    "{C:attention}Eclipse{} or {C:attention}Gourdy{} when",
                    "{C:attention}Blind{} is defeated"
                },
            },
            j_dandy_ribecca = {
                name = "Ribecca",
                text = {
                    "Adds the rank of all",
                    "{C:attention}Debuffed{} cards held in",
                    "hand to Mult"
                },
            },
            j_dandy_soulvester = {
                name = "Soulvester",
                text = {
                    "{C:chips}+#1#{} Hand"
                },
            },
            j_dandy_eclipse = {
                name = "Eclipse",
                text = {
                    "Incomplete"
                },
            },
            j_dandy_gourdy = {
                name = "Gourdy",
                text = {
                    "Each Joker gives {C:chips}+#1#{} Chips,",
                    "{C:mult}+#2#{} Mult or {X:mult,C:white}X#3#{} Mult"
                },
            },

            j_dandy_coalTrinket = {
                name = "Coal",
                text = {
                    "Doubles {C:attention}Blind{}",
                    "score",
                }
            },

            j_dandy_dandy = {
                name = "Dandy",
                text = {
                    "Create a {C:dark_edition}Negative{}",
                    "{C:spectral}Spectral{} card when",
                    "{C:attention}Blind{} is selected",
                },
            },
            j_dandy_dyle = {
                name = "Dyle",
                text = {
                    "Add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
                    "or {C:dark_edition}Polychrome{} edition to",
                    "all cards in first",
                    "hand played"
                },
            },
        }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",

            k_chips_ex = 'Chips!',
            k_mult_ex = 'Mult!',
            k_chips = 'Chips',
            k_plus = '+',
            k_x = 'X',
            k_dollar = '$',

            k_clean_ex = 'Clean!',

            k_heat_ex="Heat!",
            k_cool_ex="Cool!",

            dw_naughty_ex = "Naughty!",
            dw_shrimpo_ability = "I HATE YOU!",

            dw_pebble_quote1 = "ARF!",
            dw_pebble_quote2 = "ARF ARF!",
            dw_pebble_quote3 = "WOOF!",
            dw_pebble_quote4 = "WOOF WOOF!",
            dw_pebble_quote5 = "BARK!",
            dw_pebble_quote6 = "BARK BARK!",
            dw_pebble_quote7 = "BARK BARK! GRR!",

            dw_astro_ability = "Nap Time!",

            dw_sprout_ability = "Enjoy!",

            dw_shelly_quote1 = "I'm here for you!",
            dw_shelly_quote2 = "Let's do this!",
            dw_shelly_quote3 = "Teamwork make the dream work!",
            dw_shelly_quote4 = "You can do this!",

            dw_vee_quote1 = "Ahem... is it working?",
            dw_vee_quote2 = "Is this thing on?",
            dw_vee_quote3 = "Testing... Testing!",
            dw_vee_quote4 = "Testing 1 2 3...",

            dw_bobette_quote1 = "Nicely wrapped up for the Holidays!",
            dw_bobette_quote2 = "Packaged with care!",
            dw_bobette_quote3 = "Taking cover!",

            dw_cocoa_quote1 = "A Bonbon from a Bunbun! Hehehe!",
            dw_cocoa_quote1fool = "Beginner's Luck! Hehehe!",
            dw_cocoa_quote2 = "Ive got so, so, so many of these!",
            dw_cocoa_quote3 = "I'll just set this here for a moment!",

            dw_gourdy_ability = "Boo!",

            k_dandy_inactive = "Inactive!",
            k_dandy_active = "Active!",

            k_dandy_joy_ex = "Joy!",
            k_dandy_misery_ex = "Misery!",

            k_dandy_leader = "Leader",
            k_dandy_epic = "Epic"
        },
        labels = {
            dandy_leader = "Leader",
            dandy_epic = "Epic",
        },
    }
}