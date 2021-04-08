class CreateWaterings < ActiveRecord::Migration[6.1]
  def change
    create_table :waterings do |t|
      t.belongs_to :plant, null: false, foreign_key: {on_delete: :cascade}
      t.datetime :datetime
      t.text :notes

      t.timestamps
    end
  end
end
