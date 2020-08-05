class CreateStandUps < ActiveRecord::Migration[6.0]
  def change
    create_table :stand_ups do |t|
      t.string :name ,null: false
      t.string :hours ,null: false
      t.text :info

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
