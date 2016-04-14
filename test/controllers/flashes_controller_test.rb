require 'test_helper'

class FlashesControllerTest < ActionController::TestCase
  setup do
    @flash = flashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flash" do
    assert_difference('Flash.count') do
      post :create, flash: { game: @flash.game }
    end

    assert_redirected_to flash_path(assigns(:flash))
  end

  test "should show flash" do
    get :show, id: @flash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flash
    assert_response :success
  end

  test "should update flash" do
    patch :update, id: @flash, flash: { game: @flash.game }
    assert_redirected_to flash_path(assigns(:flash))
  end

  test "should destroy flash" do
    assert_difference('Flash.count', -1) do
      delete :destroy, id: @flash
    end

    assert_redirected_to flashes_path
  end
end
