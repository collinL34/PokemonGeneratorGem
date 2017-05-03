# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PokemonGenerator/version'

Gem::Specification.new do |spec|
  spec.name          = "PokemonGenerator"
  spec.version       = PokemonGenerator::VERSION
  spec.authors       = ["collinl34"]
  spec.email         = ["collinlshelby@gmail.com"]

  spec.summary       = "Pokemon generator to quickly generate real Pokemon and 
                        their specific type and moves."
  spec.description   = "This gem is a Pokemon module dealing with a JSON file 
                        for engineers can call simple functions 
                        to create new Pokemon with a name or type from the Pokemon 
                        Series. If you wish to learn more on how to 
                        PokemonGenerator Gem please visit my Homepage."
  spec.homepage      = "https://github.com/collinL34/PokemonGeneratorGem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
