# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PokemonGenerator/version'

Gem::Specification.new do |spec|
  spec.name          = "PokemonGenerator"
  spec.version       = PokemonGenerator::VERSION
  spec.authors       = ["collinl34"]
  spec.email         = ["collinlshelby@gmail.com"]

  spec.summary       = "Pokemon generator to quickely generate real pokemon and their specific moves."
  spec.description   = "This gem is a Pokemon wrapper for engineers can call simple functions 
                        to create new pokemon with a name or type from the Pokemon 
                        Series from any of the 8 generations. You can call 
                        PokemonGenerator.pokemon() to get a random pokemon hash for you
                        to use in you application along with being able to get 
                        the moves for that specific pokemon by its name a easy to work with array. 
                        If you wish to learn more on how to PokemonGenerator Gem please visit
                        my Homepage."
                        
  spec.homepage      = "https://github.com/collinL34/PokemonGeneratorGem"
  spec.license       = "MIT"

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.files         = `git ls-files`.split($/)

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
