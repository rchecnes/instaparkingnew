require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: { address: @place.address, description: @place.description, districts_id: @place.districts_id, ended_at: @place.ended_at, ended_time: @place.ended_time, price: @place.price, reservation_types_id: @place.reservation_types_id, started_at: @place.started_at, started_time: @place.started_time, state: @place.state, url_image: @place.url_image, users_id: @place.users_id }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    patch :update, id: @place, place: { address: @place.address, description: @place.description, districts_id: @place.districts_id, ended_at: @place.ended_at, ended_time: @place.ended_time, price: @place.price, reservation_types_id: @place.reservation_types_id, started_at: @place.started_at, started_time: @place.started_time, state: @place.state, url_image: @place.url_image, users_id: @place.users_id }
    assert_redirected_to place_path(assigns(:place))
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end
