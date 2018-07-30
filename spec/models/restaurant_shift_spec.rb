require 'rails_helper'

RSpec.describe RestaurantShift, type: :model do
  it { should have_many(:reservations) }
  it { should belong_to(:restaurant) }

  it 'is not valid without a shift name' do
    restaurant_shift = RestaurantShift.new(restaurant_id: 1, start_time: Time.now, end_time: Time.now + 4.hours)
    expect(restaurant_shift).to_not be_valid
  end

  it 'is not valid without a shift start time' do
    restaurant_shift = RestaurantShift.new(name: "morning", restaurant_id: 1, end_time: Time.now + 4.hours)
    expect(restaurant_shift).to_not be_valid
  end

  it 'is not valid without a shift end time' do
    restaurant_shift = RestaurantShift.new(restaurant_id: 1, start_time: Time.now, name: "morning")
    expect(restaurant_shift).to_not be_valid
  end

  it 'is not valid without a restaurant_id' do
    restaurant_shift = RestaurantShift.new(start_time: Time.now, end_time: Time.now + 4.hours, name: "morn")
    expect(restaurant_shift).to_not be_valid
  end

  it 'is not valid when shift start time is greater than end time' do
    restaurant_shift = RestaurantShift.new(restaurant_id: 1, start_time: Time.now + 4.hours, end_time: Time.now + 2.hours)
    expect(restaurant_shift).to_not be_valid
  end

end
