class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.belongs_to :species, null: false, index:true, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, null: false, index:true, foreign_key: {on_delete: :cascade}
      t.string :nickname, default: null
      t.integer :water_frequency

      t.timestamps
    end
  end
end
