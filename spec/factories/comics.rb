FactoryGirl.define do
  factory :comic do
    sequence(:name) { |n| "My Awesome Comic #{n}"}
    sequence(:description) { |n| "This is my awesome comic number #{n}"}
    sequence(:creators) { |n| "Bob #{n}"}
    cover_img_url "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis"
    user
  end
end
