class CreateOwnerships < ActiveRecord::Migration[6.1]
  def change
    create_table :ownerships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :plant, null: false, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
