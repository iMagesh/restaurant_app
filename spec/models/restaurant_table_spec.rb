require 'rails_helper'

RSpec.describe RestaurantTable, type: :model do
  it { should have_many(:reservations) }
  it { should belong_to(:restaurant) }

  it "is not valid without a name" do
    restaurant_table = RestaurantTable.new(min_guests: 2, max_guests: 10)
    expect(restaurant_table).to_not be_valid
  end

  it "is not valid without min guests count" do
    restaurant_table = RestaurantTable.new(name: 'myname', max_guests: 10)
    expect(restaurant_table).to_not be_valid
  end

  it "is not valid without max guests count" do
    restaurant_table = RestaurantTable.new(name: 'myname', min_guests: 2)
    expect(restaurant_table).to_not be_valid
  end

  it "is not valid when max guests is not a number" do
    restaurant_table = RestaurantTable.new(name: 'myname', max_guests: "a1", min_guests: 2)
    expect(restaurant_table).to_not be_valid
  end

  it "is not valid when min guests is not a number" do
    restaurant_table = RestaurantTable.new(name: 'myname', min_guests: "a1", max_guests: 10)
    expect(restaurant_table).to_not be_valid
  end

  it "is not valid when min_guests count is greater than max_guests count" do
    restaurant_table = RestaurantTable.new(name: 'myname', min_guests: 10, max_guests: 3)
    expect(restaurant_table).to_not be_valid
  end

end
