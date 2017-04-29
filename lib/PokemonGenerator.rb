require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'json'

module PokemonGenerator

  def self.parse
    json_parse = JSON.parse(File.read('lib/pokemon.json'))
  end

  def self.name
    PokemonGenerator.parse().sample['name']
  end

  def self.type
    pok_type = PokemonGenerator.parse().sample['type']
    pok_type.length <= 2 ? pok_type.join(', ') : pok_type
  end

  def self.pokemon(type=nil)
    if type.nil?
      PokemonGenerator.parse().sample
    else
      PokemonGenerator.parse().shuffle.find { |pokmn| pokmn if pokmn['type'].include?(type) }
    end
  end

end
