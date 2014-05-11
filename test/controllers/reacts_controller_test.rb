require 'test_helper'

class ReactsControllerTest < ActionController::TestCase
  setup do
    @react = reacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create react" do
    assert_difference('React.count') do
      post :create, react: { name: @react.name }
    end

    assert_redirected_to react_path(assigns(:react))
  end

  test "should show react" do
    get :show, id: @react
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @react
    assert_response :success
  end

  test "should update react" do
    patch :update, id: @react, react: { name: @react.name }
    assert_redirected_to react_path(assigns(:react))
  end

  test "should destroy react" do
    assert_difference('React.count', -1) do
      delete :destroy, id: @react
    end

    assert_redirected_to reacts_path
  end
end
