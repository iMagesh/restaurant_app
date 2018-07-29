FactoryGirl.define do

  factory :restaurant do
    name "MyRestaurant"
    email "my@restaurant.com"
    phone "123456789231"

    factory :restaurant_with_tables_and_shifts do
      transient do
        table_count 1
      end

      after(:create) do |res, evaluator|
        create_list(:restaurant_table, evaluator.table_count, restaurant: res)
        create(:restaurant_shift, restaurant: res)
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
