class UsersController < ApplicationController
  skip_before_action :authenticate
  def index
    users = User.all
    render json: users
  end
end
