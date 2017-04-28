require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'

module PokemonGenerator

  # def self.json_parse(fle_nme,json_key)
  #   JSON.parse(File.read(fle_nme)).sample[json_key]
  # end

  def self.name
    html = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    p html.css('.ent-name')[3].text
  end

  # def self.skills
  #   skills = []
  #   4.times do 
  #     skills << [ PokemonGenerator.json_parse('lib/skills.json','ename'), PokemonGenerator.json_parse('lib/skills.json','power'), PokemonGenerator.json_parse('lib/skills.json','pp') ]
  #   end
  #   # skills.flatten
  #   JSON.parse(File.read('lib/skills.json'))[0]
  # end

end
