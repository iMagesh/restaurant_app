require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many(:reservations) }
end
