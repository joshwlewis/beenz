class UsersControllerTest < ActionController::TestCase
  def test_index_success
    get :index
    assert_response :success
    assert_kind_of Array, response_json
    assert_kind_of String, response_json.first['name']
  end
end
