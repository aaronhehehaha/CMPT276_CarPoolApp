module SessionsHelper
  #login to User
  def log_in(user)
    session[:user_id] = user.id
  end

  #return to current User
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #if user already login return true else return false
  def logged_in?
    !current_user.nil?
  end

  #log out current User
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
