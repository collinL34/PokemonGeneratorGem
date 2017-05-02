require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'json'

module PokemonGenerator

  def self.parse
    json_parse = JSON.parse(File.read('lib/pokemonDb.json'))
  end

  def self.name
    PokemonGenerator.parse().sample['name']
  end

  def self.type
    PokemonGenerator.parse().sample['type']
  end

  def self.pokemon(args={})
    if args[:name]
      PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['name'] == args[:name] }
    elsif args[:type]
      PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn if pokmn['type'].include?(args[:type]) }
    else
      PokemonGenerator.parse().sample
    end
  end

  def self.moves(args={})
    if args[:name]
      PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['name'] == args[:name] }
    elsif args[:type]
      PokemonGenerator.parse().shuffle.find { |pokmn| return pokmn['moves'] if pokmn['type'].include?(args[:type]) }
    else 
      PokemonGenerator.parse().sample['moves']
    end
  end

end
