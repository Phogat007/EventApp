class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?
     http_basic_authenticate_with name: "EventApp", password: "Phogat@123"

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end
end
