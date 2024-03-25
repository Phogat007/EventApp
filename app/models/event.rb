class Event < ApplicationRecord
  belongs_to :user
  has_many :event_photos, dependent: :destroy
  has_many_attached :event_photos

  validate :limit_photos_to_four

  private

  def limit_photos_to_four
    if event_photos.attached? && event_photos.count > 4
      errors.add(:event_photos, "You can only upload up to 4 photos")
    end
  end
end
