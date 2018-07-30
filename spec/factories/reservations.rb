FactoryGirl.define do

  # sequence :guests_count do |n|
  #   n+1
  # end

  sequence :reservation_from do |n|
    "#{n+8}am"
  end

  sequence :reservation_to do |n|
    "#{n+9}am"
  end

  factory :reservation do

    reservation_from
    reservation_to
    guests_count 2

    association :guest, factory: :guest
    association :restaurant_shift, factory: :restaurant_shift
    association :restaurant_table, factory: :restaurant_table
  end

end
