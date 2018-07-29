class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :restaurant_table, index: true, foreign_key: true
      t.datetime :reservation_from
      t.datetime :reservation_to
      t.references :guest, index: true, foreign_key: true
      t.integer :guests_count

      t.timestamps null: false
    end
  end
end
