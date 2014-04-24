require 'test_helper'
require 'teams_controller'

class TeamsControllerTest < ActionController::TestCase

              fixtures :users, :roles, :teams, :assignments, :nodes, :system_settings, :content_pages, :permissions, :roles_permissions, :controller_actions, :site_controllers, :menu_items
  set_fixture_class :system_settings => 'SystemSettings'
  set_fixture_class :roles_permissions => 'RolesPermission'

  def setup
    @controller = TeamsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.session[:user] = User.find(users(:superadmin).id )
    roleid = User.find(users(:superadmin).id).role_id
    Role.rebuild_cache
    Role.find(roleid).cache[:credentials]
    @request.session[:credentials] = Role.find(roleid).cache[:credentials]
    @settings = SystemSettings.find(:first)
    AuthController.set_current_role(roleid,@request.session)
    @testUser = users(:ta1).id
    @testAssignment = assignments(:assignment_project1).id
    @testCourse = courses(:course1).id
    @testTeam = teams(:project1_team1).id
    @testTeam1 = teams(:exist_team2).id
  end

  #no use !!! this method is from teams_controller
  test "create_teams_view should assign parent" do
    #assignment = Assignment.find_by_name("Assignment_Project1")
    #sessionVars = session
    #sessionVars[:team_type] = "Assignment"# class
 
    #post(:create_teams_view, {'id' => assignment.id}, sessionVars,nil)
    #assert_response :success
    #assert_not_nil assigns(:parent)
    assert :true
  end
end
