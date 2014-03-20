module AuthHelper
  def login(user)
    post login_path, login: user.login, password: user.password
  end
end