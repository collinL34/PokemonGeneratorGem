require "spec_helper"

RSpec.describe PokemonGenerator do

  describe 'Version' do 
    it "has a version number" do
      expect(PokemonGenerator::VERSION).not_to be nil
    end
  end

  describe 'Pokemon' do 
    it 'returns a randomized hash specifiying a pokemon name and type' do 
      expect(PokemonGenerator.pokemon()).to be_a Hash
    end

    it 'returns the correct pokemon with the specific type' do 
      expect(PokemonGenerator.pokemon({type: 'Fire'})).to be_a Hash
    end
    
    it 'returns an array and not an object for moves list' do 
      moves = PokemonGenerator.moves({type: 'Water'})
      pokmn = PokemonGenerator.pokemon({type: 'Water'})
      expect(moves).not_to eq(pokmn)
    end

    it 'returns the correct pokemon with non capitalized name' do 
      expect(PokemonGenerator.pokemon({name: 'bulbasaur'})).to be_a Hash
    end
  end
  
  describe 'Name' do 
    it 'returns a random named pokemon' do
      # 100.times { expect(PokemonGenerator.name).to be_a String }
      expect(PokemonGenerator.name).to be_a String
    end
  end

  describe 'Type' do
    it 'returns a randomized pokemon type' do
      # 100.times { expect(PokemonGenerator.type[0]).to be_a String }
      expect(PokemonGenerator.type[0]).to be_a String
    end
  end

  describe 'Moves' do 

    it 'returns a selected list of array of moves for the specific pokemon' do 
      expect(PokemonGenerator.moves({name: 'Venusaur'})).to be_a Array
    end

    it 'returns the moves for the specific pokemon' do 
      squirtle = PokemonGenerator.pokemon( {name: 'Squirtle'} )
      moves = PokemonGenerator.moves('Squirtle')
      expect(squirtle[:moves]).to eq moves
    end
  end

end





