module ScrapeHelper
	class DataScrubber
		def initialize
		end

		def self.state_abbreviations
			{
				"Ala."	=>	"Alabama",
				"Ariz."	=>	"Arizona",
				"Fla."	=>	"Florida",
				"Ga."	=>	"Georgia",
				"Kan."	=>	"Kansas",
				"Ky."	=>	"Kentucky",
				"La."	=>	"Louisiana",
				"Md."	=>	"Maryland",
				"Mich." =>	"Michigan",
				"Miss."	=>	"Mississippi",
				"Nev."	=>	"Nevada",
				"N.C."	=>	"North Carolina",
				"Pa."	=>	"Pennsylvania",
				"R.I."	=>	"Rhode Island",
				"S.C."	=>	"South Carolina",
				"Va."	=>	"Virginia",
				"Wyo."	=>	"Wyoming"
			}
		end

		def origin_handler(combo)
			combo.split(' / ')
		end

		def check_for_state(incomplete_hometown)
			if incomplete_hometown.include?(',')
				split_city_state(incomplete_hometown)
			else
				incomplete_hometown + ", Florida"
			end
		end

		def split_city_state(hometown)
			full_location = hometown.split(', ')
			city = full_location[0]
			state = full_location[1]
			full_state_name = is_abbreviated(state)
			city + ", " + full_state_name
		end

		def is_abbreviated(state)
			if state[state.length - 1] == '.'
				swap_out_abbreviation(state)
			else
				state
			end
		end

		def swap_out_abbreviation(state)
			DataScrubber.state_abbreviations[state]
		end
	end
end