class DashboardController < ApplicationController
    before_action :authenticate, only: :dashboard
    before_action :admin_only, only: :pending_events
    def dashboard
        @pending_events = Event.where(approved: false).order(date: :desc)
        @approved_events = Event.where(approved: true).order(date: :desc)
        @p_events_count = Event.where(approved: false).count
    end
    def download
        @events = Event.where(approved: true).order(date: :desc)
    end
    def pending_events
        @p_events = Event.where(approved: false).order(date: :desc)
        render 'pending_tasks'
    end
    def history
        if current_user.is_admin
            @h_events = Event.all.order(date: :desc)
        else
            @h_events = Event.where(user: current_user).order(date: :desc)
        end
        render 'history'
    end
    def login
        @user = User.new
        @user1 = User.new
        if user_signed_in?
            redirect_to root_path
        end
    end
    def about
    end
    def coantact
    end
    private
    def authenticate
        if !user_signed_in?
            flash[:alert] = 'You need to login or register to go to dashboard.'
            redirect_to '/login'
        end
    end
    def admin_only
      if !current_user.is_admin
        flash[:alert] = 'You need to be an admin to see pending tasks'
            redirect_to '/login'
      end
    end
end
