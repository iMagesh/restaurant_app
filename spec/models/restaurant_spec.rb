require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many(:restaurant_tables) }
  it { should have_many(:reservations) }
end
