class ApplicationController < ActionController::API
  include ActionController::Serialization
  attr_reader :current_user

  before_action :authenticate

  def authenticate
    begin
      token = request.headers['Authorization'].match(/\ABearer\ (.+)\Z/)[1]
      user_id = AuthToken.read(token)
      @current_user = User.find(user_id)
    rescue
      render json: { errors: { authorization: 'You are not authorized.'} }, status: :unauthorized
    end
  end
end
