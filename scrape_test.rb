require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'scrape_helper'
require 'pry'

url = "http://floridagators.com/roster.aspx?roster=400&path=football"
doc = Nokogiri::HTML(open(url,
	"User-Agent" => "chicken",
	"From" => "chicken",
	"Referer" => "http://www.ruby-lang.org/"
	))

ds = ScrapeHelper::DataScrubber.new

player_rows = doc.css('table')[0].css('tr')

player_rows.each_with_index do |row, index|
	# skip the description row
	if index == 0
		next
	end

	jersey = row.at_css(".roster_dgrd_no").text
	name = row.at_css(".roster_dgrd_rp_position_short").text
	pos = row.at_css(".roster_dgrd_full_name").text
	height = row.at_css(".roster_dgrd_height").text
	year = row.at_css(".roster_dgrd_academic_year").text
	weight = row.at_css(".roster_dgrd_rp_weight").text
	hometown_and_highschool = ds.origin_handler(row.at_css(".roster_dgrd_hometownhighschool").text)
	incomplete_hometown = hometown_and_highschool[0]
	complete_hometown = ds.check_for_state(incomplete_hometown)
	puts "#{index}. - #{jersey} - #{name} - #{pos} - #{height} - #{weight} - #{year} - #{complete_hometown} "
end