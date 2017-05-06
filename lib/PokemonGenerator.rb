require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'awesome_print'

module PokemonGenerator

  def self.nokogiri_obj
    Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  end

  def self.name
    pokmn_name = PokemonGenerator.nokogiri_obj().css('tr')[rand(0..909)].css('.ent-name').text
    pokmn_name if pokmn_name != ''
  end

  def self.type
    type = PokemonGenerator.nokogiri_obj().css('tr')[rand(0..909)].css('a').each do |link|
    end
  end





































  # def self.pokemon(args={})
  #   if args[:name]
  #     'No pokemon found by that name.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['name'] == args[:name].capitalize }.nil?
  #   elsif args[:type]
  #     'No pokemon found by that type.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['type'].include?(args[:type].capitalize) }.nil?
  #   else
  #     PokemonGenerator.parse().sample
  #   end
  # end

  # def self.moves(args={})
  #   if args[:name]
  #     'No pokemon found by that name.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['name'].capitalize == args[:name].capitalize }.nil?
  #   elsif args[:type]
  #     'No pokemon found by that type.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['type'].include?(args[:type].capitalize) }.nil?
  #   else
  #     PokemonGenerator.parse().sample['moves']
  #   end
  # end

end

