require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @update = {
      :name       => "Xiao Qiang Wu",
      :email      => "xiaoqiangwu2011@gmail.com",
      :password   => "password",
      :image_url  => "/images/xqw.jpg",
      :description => "I'm cool."
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    # verify that the layout is correct
    assert_select "#header #nav_bar", 1
    assert_select "#header #nav_bar li a", :minimum => 3
    assert_select "#header h1", "Group"
    assert_select "#header input", 1
    
    # verify against the test data in the fixture
    assert_select "#main table tr", 3
    assert_select "#main table tr td dt", "Xiao Qiang Wu"
    assert_select "#main table tr td.list_actions a", 9
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => @update
    end

    assert_redirected_to user_path(assigns(:user))
  end
  
  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    post :create, :user => @update
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
