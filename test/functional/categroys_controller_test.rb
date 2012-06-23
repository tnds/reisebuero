require 'test_helper'

class CategroysControllerTest < ActionController::TestCase
  setup do
    @categroy = categroys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categroys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categroy" do
    assert_difference('Categroy.count') do
      post :create, categroy: { description: @categroy.description, name: @categroy.name }
    end

    assert_redirected_to categroy_path(assigns(:categroy))
  end

  test "should show categroy" do
    get :show, id: @categroy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categroy
    assert_response :success
  end

  test "should update categroy" do
    put :update, id: @categroy, categroy: { description: @categroy.description, name: @categroy.name }
    assert_redirected_to categroy_path(assigns(:categroy))
  end

  test "should destroy categroy" do
    assert_difference('Categroy.count', -1) do
      delete :destroy, id: @categroy
    end

    assert_redirected_to categroys_path
  end
end
