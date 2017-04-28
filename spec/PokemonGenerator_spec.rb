require "spec_helper"

RSpec.describe PokemonGenerator do

  it "has a version number" do
    expect(PokemonGenerator::VERSION).not_to be nil
  end

  it 'returns a random named pokemon' do
    expect(PokemonGenerator.name).to be_a String
  end

  it 'returns a skill for the specific pokemon type' do
    expect(PokemonGenerator.skills).to eq 'something'
  end
  
end
