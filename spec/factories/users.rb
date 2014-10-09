# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com"}
    sequence(:username) { |n| "fake#{n}"}
    password "12345678"
  end
end
