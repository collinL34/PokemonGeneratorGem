require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
require 'json'

module PokemonGenerator

  def self.parse
    json_parse = JSON.parse(File.read('./lib/pokemonDb.json'))
  end

  def self.name
    PokemonGenerator.parse().sample['name']
  end

  def self.type
    PokemonGenerator.parse().sample['type']
  end

  def self.pokemon(args={})
    if args[:name]
      'No pokemon found by that name.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['name'] == args[:name].capitalize }.nil?
    elsif args[:type]
      'No pokemon found by that type.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['type'].include?(args[:type].capitalize) }.nil?
    else
      PokemonGenerator.parse().sample
    end
  end

  def self.moves(args={})
    if args[:name]
      'No pokemon found by that name.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['name'].capitalize == args[:name].capitalize }.nil?
    elsif args[:type]
      'No pokemon found by that type.' if PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['type'].include?(args[:type].capitalize) }.nil?
    else
      PokemonGenerator.parse().sample['moves']
    end
  end

end
