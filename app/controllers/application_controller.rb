class ApplicationController < ActionController::API
  attr_reader :current_user

  before_action :authenticate

  def authenticate
    begin
      token = request.headers['Authorization'].match(/\ABearer\ (.+)\Z/)[1]
      user_id = AuthToken.read(token)
      @current_user = User.find(user_id)
    rescue
      render json: { error: 'Authorization header not valid'}, status: :unauthorized
    end
  end

end
