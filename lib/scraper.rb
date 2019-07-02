require 'nokogiri'
require 'open-uri'
require 'rubocop-performance'
require 'byebug'
require 'pry'
require 'httparty'
require 'json'

def scraper
  # Line = Struct.new(:first_value, :last_value, :msg)
  container = {}
  championList = %w(Jarvan_IV Tristana Janna Teemo Nami Nocturne Lux Annie).sort
  # championList = %w(Nami)
  championList.each do |champion|
  url = 'https://leagueoflegends.fandom.com/wiki/' + "#{champion}" + '/Abilities'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  content = parsed_page.at('div.skill.skill_innate')
  parsed_content = content.text.gsub(/\n/, "")
  parsed_content = "#{parsed_content[4..-1]}"
  container[champion] = parsed_content
  end

  File.open("data/temp.json","w") do |f|
    debugger
    f.write(JSON.pretty_generate(container))
  end

end

scraper
