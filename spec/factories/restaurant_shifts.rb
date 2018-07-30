FactoryGirl.define do

  sequence :start_time do |n|
    "#{n+6}am"
  end

  sequence :end_time do |n|
    "#{n+1}pm"
  end

  factory :restaurant_shift do
    name { Faker::Name.name }
    start_time
    end_time

    association :restaurant, factory: :restaurant
  end

end
