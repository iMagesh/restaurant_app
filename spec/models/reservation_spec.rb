require 'rails_helper'

RSpec.describe Reservation, type: :model do

  it { should belong_to(:guest) }
  it { should belong_to(:restaurant_table) }
  it { should belong_to(:restaurant_shift)}

  it 'is not valid without a guest' do
    reservation = Reservation.new(
      restaurant_table_id: 1,
      reservation_from: Time.now,
      reservation_to: Time.now + 4.hours,
      restaurant_shift_id: 1,
      guests_count: 3
    )
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a table' do
    reservation = Reservation.new(
      guest_id: 1,
      reservation_from: Time.now,
      reservation_to: Time.now + 4.hours,
      restaurant_shift_id: 1,
      guests_count: 3
    )
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a reservation start time' do
    reservation = Reservation.new(
      guest_id: 1,
      restaurant_table_id: 1,
      reservation_to: Time.now + 4.hours,
      restaurant_shift_id: 1,
      guests_count: 3
    )
    expect(reservation).to_not be_valid
  end

  it 'is not valid when reservation time is out of restaurant shift time' do
    restaurant = FactoryGirl.create(:restaurant_with_tables_and_shifts)
    reservation = Reservation.create(
      guest: FactoryGirl.create(:guest),
      restaurant_table: restaurant.restaurant_tables.last,
      reservation_from: Time.now,
      reservation_to: Time.now + 4.hours,
      restaurant_shift: restaurant.restaurant_shifts.last,
      guests_count: 3
    )
    expect(reservation.errors).to_not be_empty
    expect(reservation.errors.full_messages).to include("Reservation time slot is out of restaurant shift")
  end

end
