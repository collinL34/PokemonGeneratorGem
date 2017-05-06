require "spec_helper"

RSpec.describe PokemonGenerator do

  pending 'Version' do 
    it "has a version number" do
      expect(PokemonGenerator::VERSION).not_to be nil
    end
  end

  pending 'Pokemon' do 
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

    it 'returns an error when given a incorrect pokemon name' do 
      expect(PokemonGenerator.pokemon({name: 'bulbasuar'})).to eq 'No pokemon found by that name.'
    end

    it 'returns the correct pokemon with non capitalized name' do 
      expect(PokemonGenerator.pokemon({name: 'bulbasaur'})).to be_a Hash
    end

    it 'returns an error when incorrect type given' do 
      expect(PokemonGenerator.pokemon({type: 'Leaf'})).to eq 'No pokemon found by that type.'
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
      expect(PokemonGenerator.type).to be_a String
    end
  end

  pending 'Moves' do 
    it 'returns a random array consisting of the specific pokemon type' do 
      expect(PokemonGenerator.moves({type: 'Fire'})).to be_a Array
    end

    it 'returns a selected list of array of moves for the specific pokemon' do 
      expect(PokemonGenerator.moves({name: 'Venusaur'})).to be_a Array
    end


    it 'returns the moves for the specific pokemon' do 
      squirtle = PokemonGenerator.pokemon( {name: 'Squirtle'} )
      moves = PokemonGenerator.moves( {'name': 'Squirtle'} )
      expect(squirtle['moves']).to eq moves
    end


    it 'returns an error when incorrect type given' do 
      expect(PokemonGenerator.moves({type: 'Leaf'})).to eq 'No pokemon found by that type.'
    end

    it 'returns an error when incorrect name given' do 
      expect(PokemonGenerator.moves({name: 'bulba'})).to eq 'No pokemon found by that name.'
    end
  end

end





