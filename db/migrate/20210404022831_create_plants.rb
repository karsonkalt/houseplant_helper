class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.belongs_to :species, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :nickname
      t.string :water_frequency

      t.timestamps
    end
  end
end
