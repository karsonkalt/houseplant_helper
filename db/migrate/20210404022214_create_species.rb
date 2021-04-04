class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :common_name
      t.integer :water_frequency
      t.string :image_path
      t.text :notes

      t.timestamps
    end
  end
end
