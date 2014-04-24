require 'test_helper'
require 'teams_participants_controller'

class TeamsParticipantsControllerTest < ActionController::TestCase

              fixtures :users, :roles, :teams, :assignments, :nodes, :system_settings, :content_pages, :permissions, :roles_permissions, :controller_actions, :site_controllers, :menu_items, :teams_users
  set_fixture_class :system_settings => 'SystemSettings'
  set_fixture_class :roles_permissions => 'RolesPermission'

  def setup
    @controller = TeamsParticipantsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.session[:user] = User.find(users(:superadmin).id )
    roleid = User.find(users(:superadmin).id).role_id
    Role.rebuild_cache
    Role.find(roleid).cache[:credentials]
    @request.session[:credentials] = Role.find(roleid).cache[:credentials]
    @settings = SystemSettings.find(:first)
    AuthController.set_current_role(roleid,@request.session)
    @testUser = User.find(users(:student1).id)
    @testUser1 = User.find(users(:student11).id)
    @testItem = Team.find(teams(:lottery_team1).id)
    @testAssignment = assignments(:lottery_assignment).id
    @testCourse = courses(:course_object_oriented).id
    @testTeam1 = teams(:lottery_team1).id
    @testTeam2 = teams(:lottery_team2).id
    @testTeam3 = teams(:assignment_team1).id
    @testTeamUser = teams_users(:lottery_teams_users1).id
  end

    test "auto_complete_for_user_name_should_compleite_for_valid_user" do
        sessionVars = session_for(users(:instructor1))
        sessionVars[:team_type] = "Assignment"
        sessionVars[:team_id] = @testTeam1
        get :auto_complete_for_user_name,{'user' => @testUser, 'name' => "student1"},sessionVars
        assert_response :success
    end


    test "list_should_work_for_valid_team" do
	sessionVars = session_for(users(:instructor1))
        sessionVars[:team_type] = "Assignment"
        get :list, {'id' => @testTeam1, 'page' => 1}, sessionVars
        assert_response :success 
    end

end
