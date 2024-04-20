require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    context "when user is logged in" do
      before { sign_in user }

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #edit" do
    context "when user is logged in" do
      before { sign_in user }

      it "returns http success" do
        get :edit, params: { id: event.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before {
        user.confirm
        sign_in user
    }

      it "creates a new event" do
        expect {
          post :create, params: { event: attributes_for(:event) }
        }.to change(Event, :count).by(1)
      end

      it "redirects to root_path" do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      before {
        user.confirm
        sign_in user
    }

      it "updates the requested event" do
        patch :update, params: { id: event.id, event: { name: "Updated Name" } }
        event.reload
        expect(event.name).to eq("Updated Name")
      end

      it "redirects to the event" do
        patch :update, params: { id: event.id, event: { name: "Updated Name" } }
        expect(response).to redirect_to(event)
      end
    end
  end

  describe "DELETE #destroy" do
    before {
        user.confirm
        sign_in user
}

    it "destroys the requested event" do
      event # create the event
      expect {
        delete :destroy, params: { id: event.id }
      }.to change(Event, :count).by(-1)
    end

    it "redirects to root_path" do
      delete :destroy, params: { id: event.id }
      expect(response).to redirect_to('/')
    end
  end
end
