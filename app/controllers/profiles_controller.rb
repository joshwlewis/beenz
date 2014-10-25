class ProfilesController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.new(user_params)
    if user.save
      token = AuthToken.create(user.id)
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
