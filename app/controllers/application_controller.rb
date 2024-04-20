class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
   #   http_basic_authenticate_with name: "EventApp", password: Rails.application.credentials.dig(:email_setup, :password)

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end
end
