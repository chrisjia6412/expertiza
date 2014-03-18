require 'test_helper'
require 'student_team_controller'

class StudentTeamControllerTest < ActionController::TestCase
  fixtures :sign_up_topics, :assignments, :signed_up_users, :users, :roles, :due_dates
  fixtures :site_controllers, :content_pages, :roles_permissions, :participants
  fixtures :controller_actions, :permissions, :system_settings, :menu_items, :deadline_types

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @controller = StudentTeamController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.session[:user] = users(:admin)
    Role.rebuild_cache
    AuthController.set_current_role(users(:admin).role_id,@request.session)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

    fail('Not implemented')
  end

  def test_true

    assert true
  end
end