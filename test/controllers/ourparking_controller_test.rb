require 'test_helper'

class OurparkingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
