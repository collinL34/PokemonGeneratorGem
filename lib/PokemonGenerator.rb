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

  def self.type_stripper(a_tags)
    types_list = []
    a_tags.each do |link|
      types_list << link.text
    end
    types_list.length == 2 ? types_list[1] : [types_list[1], types_list[2]]
  end

  def self.link_html_stripper(pokmn_name)
    html = PokemonGenerator.nokogiri_obj()
    html.css('tr td .ent-name').find do |pokmn|
      return pokmn.attributes['href'].text if pokmn.text == pokmn_name
    end
  end

  def self.name
    nokogiri = PokemonGenerator.nokogiri_obj()
    pokmn_name = nokogiri.css('tr')[rand(0..909)].css('.ent-name').text
    pokmn_name if pokmn_name != ''
  end

  def self.type
    nokogiri = PokemonGenerator.nokogiri_obj()
    PokemonGenerator.type_stripper(nokogiri.css('tr')[rand(0..909)].css('a'))
  end
  
  def self.moves(pokmn_name)
    moves_list = []
    pokmn_link = PokemonGenerator.link_html_stripper(pokmn_name)
    html = Nokogiri::HTML(open("https://pokemondb.net/#{pokmn_link}"))
    html.css('td').each do |pokmn_txt|
      moves = pokmn_txt.css('.ent-name').text
      moves_list << moves if !moves_list.include?(moves) && moves != ''
    end
    moves_list
  end

  def self.evolve(pokemon_to_evolve)
    evolutions = []
    href = link_html_stripper(pokemon_to_evolve)
    html = Nokogiri::HTML(open("https://pokemondb.net/#{href}"))
    html.css('.infocard-tall').each do |pokmn|
      if pokmn.css('.ent-name').text != ''
        evolutions << pokmn.css('.ent-name').text
      end
    end
    if !evolutions.empty?
      PokemonGenerator.pokemon({ name: evolutions[evolutions.index(pokemon_to_evolve) + 1] })
    else
      "Their is no evolution for that pokemon."
    end
  end

  def self.image(pokmn_name)
    pokmn_link = PokemonGenerator.link_html_stripper(pokmn_name)
    html = Nokogiri::HTML(open("https://pokemondb.net/#{pokmn_link}"))
    html.css('.figure img').attr('src').text == "https://img.pokemondb.net/s.png" ? 
    'Sorry no image found by that name' : html.css('.figure img').attr('src').text
  end

  def self.pokemon_name_specific(pokemon_list, name)
    if pokemon_list != ''
      pokemon_list.find do |pokmn|
        if pokmn.css('.ent-name').text == name.capitalize
          return {
            name: name,
            type: PokemonGenerator.type_stripper(pokmn.css('a')),
            image: PokemonGenerator.image(pokmn.css('.ent-name').text),
            moves: PokemonGenerator.moves(name.capitalize)
          }
        end
      end
    end
    'Sorry no pokemon found by that name.'
  end

  def self.pokemon_type_specific(pokemon_list, type)
    pokemon_list.find do |pokmn|
      if PokemonGenerator.type_stripper(pokmn.css('a')).include?(type)
        return {
          name: pokmn.css('.ent-name').text,
          type: PokemonGenerator.type_stripper(pokmn.css('a')),
          image: PokemonGenerator.image(pokmn.css('.ent-name').text),
          moves: PokemonGenerator.moves(pokmn.css('.ent-name').text)
        }
      end
    end
    'Sorry no pokemon found by that type.'
  end


  def self.pokemon(args={})
    nokogiri = PokemonGenerator.nokogiri_obj()
    pokemon_list = nokogiri.css('tr')
    pokemon_obj = {}
    if args[:name]
      pokemon_obj = PokemonGenerator.pokemon_name_specific(pokemon_list, args[:name])
    elsif args[:type]
      pokemon_obj = PokemonGenerator.pokemon_type_specific(pokemon_list, args[:type])
    else
        pokemon = pokemon_list[rand(0..909)]
        pokemon_obj[:name] = pokemon.css('.ent-name').text
        pokemon_obj[:type] = PokemonGenerator.type_stripper(pokemon.css('a'))
        pokemon_obj[:image] = PokemonGenerator.image(pokemon.css('.ent-name').text)
        pokemon_obj[:moves] = PokemonGenerator.moves(pokemon.css('.ent-name').text)
    end
    pokemon_obj
  end

end

