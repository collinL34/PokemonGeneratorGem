require "spec_helper"

RSpec.describe PokemonGenerator do

  it "has a version number" do
    expect(PokemonGenerator::VERSION).not_to be nil
  end

  it 'returns a random named pokemon' do
    expect(PokemonGenerator.name).to be_a String
  end

  it 'returns a randomized pokemon type' do
    expect(PokemonGenerator.type).to be_a String
  end

  it 'returns a randomized hash specifiying a pokemon name and type' do 
    expect(PokemonGenerator.pokemon).to be_a Hash
  end

  it 'returns the correct pokemon with the specific type' do 
    expect(PokemonGenerator.pokemon('Water')).to be_a Hash
  end
  
end
