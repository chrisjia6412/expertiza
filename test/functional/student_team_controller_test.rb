#ENV["RAILS_ENV"] = "test"
require 'test_helper'
require 'student_team_controller'
#require 'auth_controller'

class StudentTeamControllerTest < ActionController::TestCase
 # fixtures :sign_up_topics, :assignments, :signed_up_users, :users, :roles
  #fixtures :users, :roles

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

    #fail('Not implemented')
  end

  def test_login_instructor
    post :login, :login => {:name => users(:instructor1).name, :password => 'instructor1'}
    assert_response :success
    assert_redirected_to :controller => AuthHelper::get_home_controller(session[:user]), :action => AuthHelper::get_home_action(session[:user])
  end

end