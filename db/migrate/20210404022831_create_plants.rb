class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.belongs_to :species, null: false, foreign_key: true
      t.string :nickname
      t.string :water_frequency
      t.integer :creator_id, null: false

      t.timestamps
    end
    add_foreign_key :plants, :users, column: :creator_id
  end
end
