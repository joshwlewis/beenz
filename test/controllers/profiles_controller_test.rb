require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  def test_create_success
    post :create, name: 'Carl', email: 'carl@gmail.com', password: 'carl', password_confirmation: 'carl'
    json = JSON.parse(@response.body)
    assert_response :success
    assert_equal    'Carl',           json['name']
    assert_equal    'carl@gmail.com', json['email']
    assert_kind_of  String,           json['token']
  end

  def test_create_fail
    post :create, name: 'Carl', email: 'carl@gmail.com', password: 'carl', password_confirmation: 'larc'
    json = JSON.parse(@response.body)
    assert_response 422
    assert_includes json['errors']['password_confirmation'], "doesn't match Password"
  end
end
