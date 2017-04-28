# require "PokemonGenerator/version"
require 'json'
require 'nokogiri'
require 'open-uri'
# require 'awesome_print'
require 'csv'

def parse_add_file
  html = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  CSV.open('lib/pokemon.csv', 'wb') do |file|
    html.css('.ent-name').each do |item|
      file << [item.text]
    end
  end
end

def name
end

parse_add_file()