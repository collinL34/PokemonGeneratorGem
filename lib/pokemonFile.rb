require 'nokogiri'
require 'open-uri'
require 'json'
require 'awesome_print'

def nokogiri_obj
  Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
end

def parse_add_file
  false_pok = ['Mr.Mime', 'Mime Jr.', 'nidoran']
  html = nokogiri_obj()
  File.open('./pok.json', 'w') do |file|
    html.css('tr').each do |pokmn_txt|
      if pokmn_txt.css('.ent-name').text != ''
        pokemon = {

          "name": pokmn_txt.css('.ent-name').text,
          "type": pokmn_txt.css('.type-icon').text,
          "moves": moves(pokmn_txt.css('.ent-name').text)

        }
        file.write(pokemon.to_json)
      end
    end
  end
end

def link_stripper(pokmn_name)
  html = nokogiri_obj()
  html.css('tr td .ent-name').find do |pokmn|
    return pokmn.attributes['href'].text if pokmn.text == pokmn_name
  end
end

def moves(pokmn_name)
  moves_list = []
  pokmn_link = link_stripper(pokmn_name)
  ap pokmn_link
  html = Nokogiri::HTML(open("https://pokemondb.net/#{pokmn_link}"))
  html.css('td').each do |pokmn_txt|
    moves = pokmn_txt.css('.ent-name').text
    if !moves_list.include?(moves) && moves != ''
      moves_list << moves
    end
  end
  moves_list
end

# parse_add_file()

