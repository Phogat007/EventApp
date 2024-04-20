require 'rails_helper'

RSpec.describe Event, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:event_photos).dependent(:destroy) }
    it "has many attached event_photos" do
      event = create(:event)
      event.reload
      expect(event.event_photos.attached?).to be true
      expect(event.event_photos.first.filename).to eq('test_image.jpg')
    end
  end
  context "Validations" do
    it "validates the maximum number of event photos" do
      event = create(:event, num_photos: 4)
      expect(event).to be_valid
      expect(event.event_photos.attached?).to be true
      expect(event.event_photos.count).to eq(4)
   end

   it "does not allow more than the maximum number of event photos" do
    event = create(:event, num_photos: 5)
    expect(event).not_to be_valid
    expect(event.errors[:event_photos]).to include("is too long (maximum is 4 characters)")
   end
  end
end
