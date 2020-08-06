class CreateAbsents < ActiveRecord::Migration[6.0]
  def change
    create_table :absents do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
