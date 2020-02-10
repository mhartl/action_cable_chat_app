module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    cookies.signed[:user_id] = user.id
  end

  def log_out
    cookies.delete(:user_id)
    @current_user = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
