class CreateRestaurantShifts < ActiveRecord::Migration
  def change
    create_table :restaurant_shifts do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
