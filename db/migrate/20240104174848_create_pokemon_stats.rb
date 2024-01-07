class CreatePokemonStats < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemon_stats do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :stat, null: false, foreign_key: true
      t.integer :base_stat

      t.timestamps
    end
  end
end
