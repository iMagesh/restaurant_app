class CreateRestaurantTables < ActiveRecord::Migration
  def change
    create_table :restaurant_tables do |t|
      t.string :name
      t.integer :min_guests
      t.integer :max_guests
      t.integer :available_seats
      t.boolean :available
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
