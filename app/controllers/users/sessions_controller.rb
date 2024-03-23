# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super do |resource|
      flash[:alert] = 'Invalid email or password.'
      redirect_to '/login' and return
    end
  end

  # POST /resource/sign_in
  def create
     super do |resource|
       if resource.persisted?
         redirect_to root_path and return
       end
      end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, name: [:name])
  # end
end
