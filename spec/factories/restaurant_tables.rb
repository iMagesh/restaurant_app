FactoryGirl.define do

  # sequence :min_guests do |n|
  #   n
  # end

  # sequence :max_guests do |n|
  #   n+4
  # end

  factory :restaurant_table do

    name { Faker::Name.name }
    min_guests 1
    max_guests 10

    association :restaurant, factory: :restaurant
  end

end
