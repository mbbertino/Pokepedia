class CreatePokemons < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :order
      t.bigint :species_id
      t.text :description

      t.timestamps
    end
  end
end
