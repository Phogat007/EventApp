class Event < ApplicationRecord
  belongs_to :user
  has_many :event_photos, dependent: :destroy
  has_many_attached :event_photos
end
