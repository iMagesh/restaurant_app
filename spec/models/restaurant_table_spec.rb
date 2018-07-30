require 'rails_helper'

RSpec.describe RestaurantTable, type: :model do
  it { should have_many(:reservations) }
  it { should belong_to(:restaurant) }
end
