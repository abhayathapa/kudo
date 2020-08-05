class CreateStandUps < ActiveRecord::Migration[6.0]
  def change
    create_table :stand_ups do |t|

      t.timestamps
    end
  end
end
