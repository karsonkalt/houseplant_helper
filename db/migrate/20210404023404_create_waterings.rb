class CreateWaterings < ActiveRecord::Migration[6.1]
  def change
    create_table :waterings do |t|
      t.belongs_to :plant, null: false, foreign_key: true
      t.datetime :datetime

      t.timestamps
    end
  end
end
