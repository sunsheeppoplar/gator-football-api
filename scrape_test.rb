require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://floridagators.com/roster.aspx?roster=241&path=football"
doc = Nokogiri::HTML(open(url, 
		"User-Agent" => "chicken",
		"From" => "chicken",
		"Referer" => "http://www.ruby-lang.org/"
	))

# pos = doc.css(".roster_dgrd_rp_position_short").text
# name = doc.css(".roster_dgrd_full_name").text
# height = doc.css(".roster_dgrd_height").text
# year = doc.css(".roster_dgrd_academic_year").text
# weight = doc.css(".roster_dgrd_weight").text
# hs = doc.css(".roster_dgrd_hometownhighschool").text

doc.css('.roster_dgrd_item').each do |tr|
	jersey = tr.at_css(".roster_dgrd_no").text
	name = tr.at_css(".roster_dgrd_rp_position_short").text
	pos = tr.at_css(".roster_dgrd_full_name").text
	height = tr.at_css(".roster_dgrd_height").text
	year = tr.at_css(".roster_dgrd_academic_year").text
	weight = tr.at_css(".roster_dgrd_rp_weight").text
	hs = tr.at_css(".roster_dgrd_hometownhighschool").text
	puts "list 1: #{jersey} - #{name} - #{pos} - #{height} - #{weight} - #{year} - #{hs}"
end

doc.css('.roster_dgrd_alt').each do |tr|
	jersey = tr.at_css(".roster_dgrd_no").text
	name = tr.at_css(".roster_dgrd_rp_position_short").text
	pos = tr.at_css(".roster_dgrd_full_name").text
	height = tr.at_css(".roster_dgrd_height").text
	year = tr.at_css(".roster_dgrd_academic_year").text
	weight = tr.at_css(".roster_dgrd_rp_weight").text
	hs = tr.at_css(".roster_dgrd_hometownhighschool").text

	puts "list 2: #{jersey} - #{name} - #{pos} - #{height} - #{weight} - #{year} - #{hs}"
end