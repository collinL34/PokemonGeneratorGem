require "spec_helper"

RSpec.describe PokemonGenerator do

  it "has a version number" do
    expect(PokemonGenerator::VERSION).not_to be nil
  end

  it 'returns a random named pokemon' do
    expect(PokemonGenerator.name).to be_a String
  end

  it 'returns a randomized pokemon type' do
    expect(PokemonGenerator.type[0]).to be_a String
  end

  it 'returns a randomized hash specifiying a pokemon name and type' do 
    expect(PokemonGenerator.pokemon()).to be_a Hash
  end

  it 'returns the correct pokemon with the specific type' do 
    expect(PokemonGenerator.pokemon({type: 'Fire'})).to be_a Hash
  end

  it 'returns a random array consisting of the specific pokemon type' do 
    expect(PokemonGenerator.moves({type: 'Fire'})).to be_a Array
  end

  it 'returns a selected list of array of moves for the specific pokemon' do 
    expect(PokemonGenerator.moves({name: 'Venusaur'})).to be_a Array
  end

  it 'returns an array and not an object for moves list' do 
    moves = PokemonGenerator.moves({type: 'Water'})
    pokmn = PokemonGenerator.pokemon({type: 'Water'})
    expect(moves).not_to eq(pokmn)
  end

  it 'returns the moves for the specific pokemon' do 
    squirtle = PokemonGenerator.pokemon( {name: 'Squirtle'} )
    moves = PokemonGenerator.moves( {'name': 'Squirtle'} )
    expect(squirtle['moves']).to eq moves
  end

  pending 'returns an error for when given incorrect name for specific type' do 
    expect(PokemonGenerator.moves( {type: 'Grass', name: 'Charizard'} )).to eq 'Wrong name or type please try again'
  end
  
end
