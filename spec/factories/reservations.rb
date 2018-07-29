FactoryGirl.define do

  factory :reservation do

    reservation_from "9am"
    reservation_to "11am"
    guests_count "5"

    association :guest, factory: :guest, name: "magesh", email: "something@gmail.com"
    association :restaurant_shift, factory: :restaurant_shift
    association :restaurant_table, factory: :restaurant_table
  end

end
