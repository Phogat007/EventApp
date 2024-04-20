FactoryBot.define do
  factory :event do
    name { "Example Event" }
    date { Time.now + 1.day }
    place { "Example Place" }
    coordinator_name { "Example Coordinator" }
    department { "Example Department" }
    winner_name { "Example Winner" }
    approved { false }
    user
    description { "This is an example event description." }
  end
end
