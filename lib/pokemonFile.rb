require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'json'

def parse_add_file
  html = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  File.open('./pokemon.json', 'wb') do |file|
    html.css('tr').each do |txt|
      pokemon = {

        "name": txt.css('.ent-name').text,
        "type": txt.css('.type-icon').text

      }
      file.write(pokemon.to_json)  
    end
  end
end

parse_add_file()