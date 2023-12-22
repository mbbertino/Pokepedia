module PokemonsHelper
  def bg_from_type(type)
    {
      normal: "bg-normal",
      fighting: "bg-fighting",
      flying: "bg-flying",
      poison: "bg-poison",
      ground: "bg-ground",
      rock: "bg-rock",
      bug: "bg-bug",
      ghost: "bg-ghost",
      steel: "bg-steel",
      fire: "bg-fire",
      water: "bg-water",
      grass: "bg-grass",
      electric: "bg-electric",
      psychic: "bg-psychic",
      ice: "bg-ice",
      dragon: "bg-dragon",
      dark: "bg-dark",
      fairy: "bg-fairy"
    }[type.identifier.to_sym]
  end

  def abbreviated_stat(pokemon_stat)
    {
      'hp' => 'HP',
      'attack' => 'ATK',
      'defense' => 'DEF',
      'special-attack' => 'SP. ATK',
      'special-defense' => 'SP. DEF',
      'speed' => 'SPD'
    }[pokemon_stat.stat_identifier]
  end

  def stat_percentage(value)
    ((value.to_f / 255) * 100).round
  end
end
