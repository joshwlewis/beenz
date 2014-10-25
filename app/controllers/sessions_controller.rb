class SessionsController < ApplicationController
  skip_before_action :authenticate
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = AuthToken.create({ user_id: user.id })
      render json: { user: user, token: token }
    else
      render json: { errors: { email: "Combination invalid", password: "Combination invalid" }}, status: :unauthorized
    end
  end
end
