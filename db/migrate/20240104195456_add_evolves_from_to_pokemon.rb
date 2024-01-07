class AddEvolvesFromToPokemon < ActiveRecord::Migration[7.2]
  def change
    add_reference :pokemons, :evolves_from, foreign_key: { to_table: :pokemons }
  end
end
