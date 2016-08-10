require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { code: @reservation.code, ended_at: @reservation.ended_at, ended_time: @reservation.ended_time, places_id: @reservation.places_id, reservation_types_id: @reservation.reservation_types_id, started_at: @reservation.started_at, started_time: @reservation.started_time, users_id: @reservation.users_id }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    patch :update, id: @reservation, reservation: { code: @reservation.code, ended_at: @reservation.ended_at, ended_time: @reservation.ended_time, places_id: @reservation.places_id, reservation_types_id: @reservation.reservation_types_id, started_at: @reservation.started_at, started_time: @reservation.started_time, users_id: @reservation.users_id }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
