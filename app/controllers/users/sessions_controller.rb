# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    def new
      super
      User.new
    end

    # POST /resource/sign_in
    def create
      configure_sign_in_params
      @user = User.find_by(configure_sign_in_params)

      return if @user.nil?

      sign_in(@user)
      redirect_to root_path
    end

    # DELETE /resource/sign_out
    def destroy
      sign_out(:user)
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
