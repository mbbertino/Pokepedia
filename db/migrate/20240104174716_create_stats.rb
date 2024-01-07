class CreateStats < ActiveRecord::Migration[7.2]
  def change
    create_table :stats do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
