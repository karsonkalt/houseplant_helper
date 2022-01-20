class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in

  # helper_method makes method available to the view
  helper_method :current_user
  helper_method :logged_in?

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

  def redirect_if_logged_in
    if logged_in?
      redirect_to root_path
    end
  end

  def authorized_to_view?(user)
    user == current_user
  end

  def redirect_if_not_authorized_to_view(user)
    if !authorized_to_view?(user)
      redirect_to root_path
    end
  end
end
