require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET /index" do
    let(:user) { create(:user) }
    let(:admin_user) { create(:user, is_admin: true) }

    context "Before actions" do
      describe 'GET #dashboard' do
        context 'when user is logged in' do
          before { sign_in user }

          it 'responds successfully with a redirect' do
            get :dashboard
            expect(response).to have_http_status(302)
          end
        end

        context 'when user is not logged in' do
          it 'redirects to login' do
            get :dashboard
            expect(response).to redirect_to('/login')
          end

          it 'sets the flash message' do
            get :dashboard
            expect(flash[:alert]).to eq('You should be a verified user to go to dashboard.')
          end
        end
      end

      describe 'GET #pending_events' do
        context 'when user is logged in as admin' do
          before { sign_in admin_user }

          it 'responds successfully' do
            get :pending_events
            expect(response).to have_http_status(302)
          end
        end

        context 'when user is unconfirmed admin' do
          before { sign_in user }

          it 'redirects to login' do
            get :pending_events
            expect(response).to redirect_to('/users/sign_in')
          end

          it 'sets the flash message' do
            get :pending_events
            expect(flash[:alert]).to eq('You have to confirm your email address before continuing.')
          end
        end
      end
    end

    context "Actions" do
      describe 'GET #download' do
        it 'responds successfully' do
          get :download
          expect(response).to have_http_status(200)
        end
      end

      describe 'GET #history' do
        context 'when user is logged in' do
          before { sign_in user }

          it 'responds successfully' do
            get :history
            expect(response).to have_http_status(302)
          end
        end
      end

      describe 'GET #login' do
        it 'responds successfully' do
          get :login
          expect(response).to have_http_status(200)
        end
      end

      describe 'GET #about' do
        it 'responds successfully' do
          get :about
          expect(response).to have_http_status(200)
        end
      end

      describe 'GET #contact' do
        it 'responds successfully' do
          get :contact
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
