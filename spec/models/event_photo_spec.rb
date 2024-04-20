require 'rails_helper'

RSpec.describe EventPhoto, type: :model do
  context "Associations" do
    it { should belong_to(:event) }
  end
end
