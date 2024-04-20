FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    is_admin { false }
    name { Faker::Name.name }
  end
end
