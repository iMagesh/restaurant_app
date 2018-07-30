require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many(:reservations) }

  it "is not valid without a name" do
    guest = Guest.new(email: 'nl@example.com')
    expect(guest).to_not be_valid
  end

  it "is not valid without a email" do
    guest = Guest.new(name: 'myname')
    expect(guest).to_not be_valid
  end

  it "is not valid without a correct email" do
    guest = Guest.new(name: 'myname', email: 'myname.com')
    expect(guest).to_not be_valid
  end

end
