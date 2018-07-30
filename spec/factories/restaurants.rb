FactoryGirl.define do

  sequence :phone do |n|
    "#{n}2345678923#{n}"
  end

  factory :restaurant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone

    # association :restaurant_tables, factory: :restaurant_table
    # association :restaurant_shifts, factory: :restaurant_shift

    factory :restaurant_with_tables_and_shifts do
      transient do
        table_count 1
      end

      after(:create) do |res, evaluator|
        create_list(:restaurant_table, evaluator.table_count, restaurant: res)
        create(:restaurant_shift, restaurant: res)
      end
    end

    factory :restaurant_with_reservations do

      after(:create) do |res, evaluator|
        create_list(:restaurant_table, 1, restaurant: res)
        create(:restaurant_shift, restaurant: res)
        create_list(:reservation, 2, restaurant: res)
      end
    end

    # factory :restaurant_with_shifts do
    #   transient do
    #     shifts_count 1
    #   end

    #   after(:create) do |res, evaluator|
    #     create_list(:restaurant_shift, evaluator.shifts_count, restaurant: res)
    #   end
    # end

  end

end
