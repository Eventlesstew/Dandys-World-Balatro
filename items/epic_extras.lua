SMODS.Tag {
    key = "epic",
    atlas = "dwTag",
    pos = { x = 0, y = 0 },
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' then
            local card = SMODS.create_card {
                set = "Joker",
                rarity = "dandy_epic",
                area = context.area,
                key_append = "dw_epic"
            }
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.GREEN, function()
                card:start_materialize()
                --card.cost_mod = 0.5
                card:set_cost()
                return true
            end)
            tag.triggered = true
            return card
        end
    end
}

--[[
SMODS.Consumable {
    set = "Spectral",
	key = "summoning",
    atlas = 'dwConsumable',
    pos = { x = 0, y = 0 },
    cost = 4,
    can_use = function(self, card)
        if #G.jokers.cards <= G.jokers.config.card_limit then
            local eternal_count = 0
            for i = 1, #G.jokers.cards do
                if SMODS.is_eternal(G.jokers.cards[i], card) then
                    eternal_count = eternal_count + 1
                end
            end

            if eternal_count < G.jokers.config.card_limit then
                return true
            end
        end
        return false
    end,
    use = function(self, card, area, copier)
		local used_consumable = copier or card
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not SMODS.is_eternal(v) then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local chosen_joker = pseudorandom_element(G.jokers.cards, "dandy_summoning")
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					if v == chosen_joker then
						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end
				end
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, 'dandy_epic', nil, nil, nil, "dandy_summoning")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
	end,
	demicoloncompat = true,
	force_use = function(self, card, area)
		self:use(card, area)
	end,
}]]