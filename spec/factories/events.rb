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

    # Add a transient attribute for the number of event photos
    transient do
      num_photos { 1 } # Default to 1 photo
    end

    # Use an after(:create) callback to attach the specified number of event photos
    after(:create) do |event, evaluator|
      evaluator.num_photos.times do
        event.event_photos.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.jpg')),
          filename: 'test_image.jpg',
          content_type: 'image/jpg'
        )
      end
    end
  end
end
