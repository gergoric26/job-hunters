require 'test_helper'

class JobControllerTest < ActionController::TestCase
  test "should get hunters" do
    get :hunters
    assert_response :success
  end

end
