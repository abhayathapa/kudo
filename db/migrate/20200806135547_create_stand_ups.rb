class CreateStandUps < ActiveRecord::Migration[6.0]
  def change
    create_table :stand_ups do |t|
      t.string :name, index: true, null: false
      t.decimal :hours ,null: false
      t.text :info

      t.references :user, null: false, foreign_key: true
      t.timestamps  

    end
    add_index :stand_ups, :created_at, unique: true
  end
end
