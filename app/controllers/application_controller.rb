class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # Confirms a logged-in muser.
  def logged_in_muser
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  # Returns the current logged-in muser (if any).
  def current_muser
    @current_muser ||= Muser.find_by(id: session[:muser_id])
  end
end
