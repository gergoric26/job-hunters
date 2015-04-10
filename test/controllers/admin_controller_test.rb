require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get all_users" do
    get :all_users
    assert_response :success
  end

end
