FactoryBot.define do
  factory :user do
    email { "user#{n}@example.com" }
    encrypted_password { "password" }
    reset_password_token { SecureRandom.hex }
    reset_password_sent_at { Time.now }
    remember_created_at { Time.now }
    is_admin { false }
    name { "User Name" }
    confirmation_token { SecureRandom.hex }
    confirmed_at { Time.now }
    confirmation_sent_at { Time.now }
    unconfirmed_email { nil }
  end
end
