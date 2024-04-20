# spec/routing/routes_spec.rb

require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  describe "Root route" do
    it "routes to dashboard#dashboard" do
      expect(get: "/").to route_to("dashboard#dashboard")
    end
  end

  describe "Login route" do
    it "routes to dashboard#login" do
      expect(get: "/login").to route_to("dashboard#login")
    end
  end

  describe "Devise routes" do
    it "routes to sessions#create for user sessions" do
      expect(post: "/users/sign_in").to route_to("users/sessions#create")
    end

    it "routes to sessions#destroy for user sessions" do
      expect(delete: "/users/sign_out").to route_to("users/sessions#destroy")
    end
  end

  describe "Health check route" do
    it "routes to rails/health#show" do
      expect(get: "/up").to route_to("rails/health#show")
    end
  end

  describe "Events routes" do
    it "routes to events#index" do
      expect(get: "/events").to route_to("events#index")
    end

    it "routes to events#show" do
      expect(get: "/events/1").to route_to("events#show", id: "1")
    end

    it "routes to events#download" do
      expect(get: "/events/1/download").to route_to("events#download", id: "1")
    end
  end

  describe "Admin routes" do
    it "routes to dashboard#pending_events" do
      expect(get: "/admin/pending-events").to route_to("dashboard#pending_events")
    end
  end

  describe "Other dashboard routes" do
    it "routes to dashboard#history" do
      expect(get: "/history").to route_to("dashboard#history")
    end

    it "routes to dashboard#download" do
      expect(get: "/download").to route_to("dashboard#download")
    end

    it "routes to dashboard#about" do
      expect(get: "/about").to route_to("dashboard#about")
    end

    it "routes to dashboard#contact" do
      expect(get: "/contact").to route_to("dashboard#contact")
    end
  end
end
