class CreateSavedAirports < ActiveRecord::Migration
  def change
    create_table :saved_airports do |t|
      t.integer :user_id
      t.string :airportcode

      t.timestamps null: false
    end
  end
end
