require 'rubygems'
require 'nokogiri'
require 'open-uri'

begin
url = "http://floridagators.com/roster.aspx?roster=241&path=football"
doc = Nokogiri::HTML(open(url, 
		"User-Agent" => "chicken",
		"From" => "chicken",
		"Referer" => "http://www.ruby-lang.org/"
	))

puts doc

rescue => e
	puts "I failed: #{e}"
end