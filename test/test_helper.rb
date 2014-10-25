ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all
end

class ActionController::TestCase
  def sign_in(user = User.first)
    token = AuthToken.create(user.id)
    @request.env['HTTP_AUTHORIZATION'] = "Bearer #{token}"
  end

  def response_json
    JSON.parse(@response.body)
  end
end
