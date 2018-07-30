require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many(:restaurant_tables) }
  it { should have_many(:reservations) }

  it "is not valid without a name" do
    restaurant = Restaurant.new(email: 'nl@example.com', phone: '19484874784')
    expect(restaurant).to_not be_valid
  end

  it "is not valid without a email" do
    restaurant = Restaurant.new(name: 'myname', phone: '19484874784')
    expect(restaurant).to_not be_valid
  end

  it "is not valid without a correct email" do
    restaurant = Restaurant.new(name: 'myname', email: 'myname.com', phone: '19484874784')
    expect(restaurant).to_not be_valid
  end

  it "is not valid without a phone" do
    restaurant = Restaurant.new(name: 'myname', email: 'myname.com')
    expect(restaurant).to_not be_valid
  end

  it "is not valid without a correct phone" do
    restaurant = Restaurant.new(name: 'myname', email: 'myname.com', phone: 'A19484874784A')
    expect(restaurant).to_not be_valid
  end
end
