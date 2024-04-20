FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "password" }
    reset_password_token { SecureRandom.hex }
    reset_password_sent_at { Time.now }
    remember_created_at { Time.now }
    is_admin { false }
    name { Faker::Name.name }
    confirmation_token { SecureRandom.hex }
    confirmed_at { Time.now }
    confirmation_sent_at { Time.now }
    unconfirmed_email { nil }
  end
end
