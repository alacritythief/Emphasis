FactoryGirl.define do

  factory :element do
    sequence(:id_name) { |n| "Awesome Element #{n}"}
    image_url "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis"
    user
    page
  end
end
