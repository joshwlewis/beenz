require "test_helper"

class RatingsControllerTest < ActionController::TestCase
  def test_index_unauthenticated
    get :index
    assert_response :unauthorized
  end

  def test_index
    sign_in
    get :index
    assert_response :success
    assert_kind_of Integer, response_json.first['ratee_id']
    assert_kind_of Integer, response_json.first['beenz']
  end

  def test_create
    sign_in
    post :create, ratee_id: User.last.id, beenz: 4
    assert_response :success
    assert_equal 4, response_json['beenz']
  end

  def test_update
    user = User.first
    sign_in user
    rating = user.performed_ratings.first
    put :update, id: rating.id, beenz: 1
    assert_response :success
    assert_equal 1, response_json['beenz']
  end
end
