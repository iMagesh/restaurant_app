require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:guest) }
  it { should belong_to(:restaurant_table) }
  it { should belong_to(:restaurant_shift)}
end
