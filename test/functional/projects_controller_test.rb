require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    login_user(:simple_user)
    get :new
    assert_response :success
  end

  test "should create project" do
    login_user(:simple_user)
    assert_difference('Project.count') do
      post :create, :project => Factory.attributes_for(:project)
    end
    
    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, :id => projects(:simple_project).to_param
    assert_response :success
  end

  test "should get edit" do
    login_user(:simple_user)
    get :edit, :id => projects(:simple_project).to_param
    assert_response :success
  end

  test "should update project" do
    login_user(:simple_user)
    put :update, :id => projects(:simple_project).to_param, :project => Factory.attributes_for(:project)
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    login_user(:simple_user)
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:simple_project).to_param
    end

    assert_redirected_to projects_path
  end
end
