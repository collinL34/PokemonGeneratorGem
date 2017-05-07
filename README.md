# PokemonGeneratorGem

## Install

Add this line of code into your gemfile
```ruby
  gem 'PokemonGenerator', '~>0.1.9'
```
Then type this in your terminal
```ruby
  $ gem install bundler
  $ bundle
```
## Usage

To get the name of a pokemon you call this method anywhere in your code.
```ruby
  PokemonGenerator.name() => "Staravia"
```

To get a type of pokemon you call this method which will either return a string or an array containing strings of the different type that pokemon has.
```ruby 
  PokemonGenerator.type() => "Water"
  PokemonGenerator.type() => ["Water", "Fighter"]
```

If you want a whole pokemon object.
```ruby
  PokemonGenerator.pokemon() => {
     "name" => "Diggersby",
     "type" => [
        [0] "Normal",
        [1] "Ground"
    ],
    "image" =>"https://img.pokemondb.net/artwork/diggersby.jpg",
    "moves" => [
        [ 0] "Agility",
        [ 1] "Bulldoze",
        [ 2] "Hammer Arm",
        [ 3] "Leer",
        [ 4] "Rototiller",
        . . .
    ]
  }
```

To choose a specific pokemon by its name.

```ruby 
  PokemonGenerator.pokemon({ name: "Squirtle" }) => {
     "name" => "Squirtle",
     "type" => "Water",
     "image" =>"https://img.pokemondb.net/artwork/squirtle.jpg",
    "moves" => [
        [ 0] "Tackle",
        [ 1] "Tail Whip",
        [ 2] "Water Gun",
        [ 3] "Withdraw",
        [ 4] "Bubble",
        . . .
    ]
  }
```

To choose a specific pokemon by its type.

```ruby 
  PokemonGenerator.pokemon({ type: "Fire" }) => {
     "name" => "Rotom",
     "type" => [
        [0] "Electric",
        [1] "Fire"
    ],
    "moves" => [
        [ 0] "Astonish",
        [ 1] "Charge",
        [ 2] "Confuse Ray",
        [ 3] "Discharge",
        [ 4] "Thunder Shock",
        . . .
    ]
  }
```

To choose a specific set of moves for a perticular pokemon.

```ruby 
  PokemonGenerator.moves({ name: "Squirtle" }) => [
    [ 0] "Tackle",
    [ 1] "Tail Whip",
    [ 2] "Water Gun",
    [ 3] "Withdraw",
    [ 4] "Bubble",
    . . .
]
```

## New functionality for new version 0.1.9

Now you can get the link to an image for a specific pokemon

```ruby
PokemonGenerator.image('Squirtle')
=> "https://img.pokemondb.net/artwork/squirtle.jpg"
```

You can also now evolve your pokemon!!!

```ruby
PokemonGenerator.evolve('Squirtle')
=> {
      :name=>"Wartortle",
      :type=>"Water", 
      :image=>"https://img.pokemondb.net/artwork/wartortle.jpg", 
      :moves=>["Tackle", "Tail Whip", "Water Gun", "Withdraw", . . .
      ]
    }
```

## Contribution
  Any Bug reports and or pull requests are more than welcome at https://github.com/collinL34/PokemonGeneratorGem.
  
## License

  This code is free to use under the terms of the MIT license. [MIT License](http://opensource.org/licenses/MIT).

