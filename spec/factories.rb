FactoryGirl.define do
  factory :user do
    name     "Branislav Bilsky"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end