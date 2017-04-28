# require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'csv'

module PokemonGenerator

  def self.name 
    html = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    CSV.open('pokemon.csv', 'wb') do |file|
      html.css('.ent-name').each do |item| 
        file << item
      end
    end
  end

end
