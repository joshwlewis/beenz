class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: :create

  def show
    render json: current_user
  end

  def update
    current_user.assign_attributes(profile_params)
    if current_user.save
      render json: current_user
    else
      render json: { errors: user.errors }, status: 422
    end
    render_profile(current_user)
  end

  def create
    user = User.new(profile_params)
    if user.save
      token = AuthToken.create(user.id)
      render json: user.as_json.merge(token: token)
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def profile_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
