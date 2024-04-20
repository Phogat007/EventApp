require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { should have_many(:events).dependent(:destroy) }
  end
  context "Devise Modules" do
    let(:user) { build(:user) }

    it "should include database_authenticatable module" do
       expect(user.devise_modules).to include(:database_authenticatable)
    end

    it "should include registerable module" do
       expect(user.devise_modules).to include(:registerable)
    end

    it "should include recoverable module" do
       expect(user.devise_modules).to include(:recoverable)
    end

    it "should include rememberable module" do
       expect(user.devise_modules).to include(:rememberable)
    end

    it "should include validatable module" do
       expect(user.devise_modules).to include(:validatable)
    end

    it "should include confirmable module" do
       expect(user.devise_modules).to include(:confirmable)
    end
   end

  context "Default attribute values" do
    let(:user) { build(:user) }

    it "should have a default value of false for is_admin" do
      expect(user.is_admin).to eq(false)
    end
  end
  context "Validations" do
    it "validates presence of name" do
      should validate_presence_of(:name)
    end
    it "validates presence of email" do
      should validate_presence_of(:email)
    end

    it "validates presence of password" do
      should validate_presence_of(:password)
    end

    it "validates length of password" do
      should validate_length_of(:password).is_at_least(6).is_at_most(128)
    end
  end
end
