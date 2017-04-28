require "PokemonGenerator/version"
require 'json'
require 'awesome_print'

module PokemonGenerator

  def self.json_parse(json_key)
    JSON.parse(File.read('lib/skills.json')).sample[json_key]
  end

  def self.name
    PokemonGenerator.json_parse('ename')
  end

  def self.skills
    skills = []
    4.times do 
      skills << [ PokemonGenerator.json_parse('ename'), PokemonGenerator.json_parse('power'), PokemonGenerator.json_parse('pp') ]
    end
    skills.flatten
  end

end
