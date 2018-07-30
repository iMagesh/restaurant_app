FactoryGirl.define do

  sequence :name do |n|
    "magesh-#{n}"
  end

  sequence :email do |n|
    "test-#{n}@umail.com"
  end

  factory :guest do
    name
    email
  end

end
