FactoryGirl.define do
  
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"

    after(:create) do |user, evaluator|
      create_list(:saved_airport, 3, user: user)
    end
  
  end
end
