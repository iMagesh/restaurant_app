FactoryGirl.define do
#   factory :restaurant_shift do
#     name "MyString"
# start_time "2018-07-29 17:43:04"
# end_time "2018-07-29 17:43:04"
# restaurant nil
#   end

  factory :restaurant_shift do

    name "Morning"
    start_time "9am"
    end_time "1pm"

    association :restaurant, factory: :restaurant
  end

end
