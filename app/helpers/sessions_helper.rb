module SessionsHelper

  # Logs in the given muser.
  def log_in(muser)
    session[:muser_id] = muser.id
  end
  
  # Returns the current logged-in muser (if any).
  def current_muser
    @current_muser ||= Muser.find_by(id: session[:muser_id])
  end

  # Returns true if the given muser is the current muser.
  def current_muser?(muser)
    muser == current_muser
  end

  # Returns true if the muser is logged in, false otherwise.
  def logged_in?
    !current_muser.nil?
  end

  # Logs out the current muser.
  def log_out
    session.delete(:muser_id)
    @current_muser = nil
  end

  #checking moderator user
  def moderator_user
    unless (current_muser.isModerator)
      flash[:danger] = "No Access!!!"
      redirect_to root_path
    end
  end

end
