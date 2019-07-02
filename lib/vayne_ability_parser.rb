require 'nokogiri'
require 'open-uri'
require 'rubocop-performance'
require 'byebug'
require 'pry'
require 'httparty'
require 'json'

def ability_parser
  champ_name = 'Vayne'
  fname = "./data/#{champ_name}.json"
  level = 18
  spell_rank = 3
  bonus_attack_damage = 100

  json = JSON.load(File.open(fname))
  attackdamage = json['data'][champ_name]['stats']['attackdamage']
  attackdamageperlevel = json['data'][champ_name]['stats']['attackdamageperlevel']

  # json.each do |ranking|
  #   puts 'entry:'
  #   puts ranking
  # end

  json['data'][champ_name]['spells'][0].each do |ranking|
    puts 'entry:'
    puts ranking
  end


  # q = json['data'][champ_name]['spells'][0]
  # w = json['data'][champ_name]['spells'][1]
  # e = json['data'][champ_name]['spells'][2]
  # debugger
  # puts q
  #
  # # q_id = json['data']["#{champ_name}"]['spells'][0]['id']
  # # e1 = json['data']["#{champ_name}"]['spells'][0]['effect'][1]
  # # f1 = json['data']["#{champ_name}"]['spells'][0]['vars'][0]['key']
  # #  f1_coeff_1 = json['data']["#{champ_name}"]['spells'][0]['vars'][0]['coeff'].reverse
  # #  f1_coeff_1 = f1_coeff_1[4]

  #
  # e_id = json['data']["#{champ_name}"]['spells'][2]['id']
  # e1 = json['data']["#{champ_name}"]['spells'][2]['effect'][1]
  # f1 = json['data']["#{champ_name}"]['spells'][2]['vars'][2]['key']
  # f1_coeff_1 = json['data']["#{champ_name}"]['spells'][2]['vars'][0]['coeff'][spell_rank]
  debugger
end
ability_parser

