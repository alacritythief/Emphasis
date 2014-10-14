FactoryGirl.define do
  factory :page do
    sequence(:chapter) { |n| n }
    sequence(:number) { |n| n }
    sequence(:name) { |n| "Awesome Thing #{n}"}
    comic
    user
  end
end
