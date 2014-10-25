require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def test_create_success
    post :create, email: 'meatwad@email.com', password: 'meatwad'
    assert_response :success
    assert_equal    'Meatwad', response_json['user']['name']
    assert_kind_of  String,    response_json['token']
  end

  def test_create_fail
    post :create, email: 'meatwad@email.com', password: 'dawtaem'
    assert_response 401
    assert_includes response_json['errors']['email'], "Combination invalid"
  end
end
