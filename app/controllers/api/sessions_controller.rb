module Api
  class SessionsController < Api::ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/login
    def create

      binding.pry

      @user = User.find_for_database_authentication(email: params[:email])
      return invalid_login_attempt unless @user

      if @user.valid_password?(params[:password])
        sign_in :user, @user
        render json: @user.as_json(only: [:email, :access_token])
      else
        invalid_login_attempt
      end
    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: {error: 'authorization failed'}, status: :unprocessable_entity
    end

  end
end
