module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    current_user.nil? != true
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    # ||= (“or equals”) means
    # if current user is not false
    # then find user by find_by method
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
