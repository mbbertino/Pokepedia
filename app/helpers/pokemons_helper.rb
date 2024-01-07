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
end
