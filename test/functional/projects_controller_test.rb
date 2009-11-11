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


  context "show action" do
    should "show project" do
      get :show, :id => projects(:simple_project).to_param
      assert_response :success
    end
    should "filter feedbacks by tags" do
      projects(:simple_project).feedbacks.create(:user => users(:second), :text => 'waa', :tag_list => 'funk')
      get :show, :id => projects(:simple_project).to_param, :tag => 'funk'
      assert !assigns(:first_level_feedbacks).empty?      
    end
  end
  
  test "should add visit to project when show" do
    assert_difference "projects(:simple_project).reload.visits_count || 0" do
      get :show, :id => projects(:simple_project).to_param
    end
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
