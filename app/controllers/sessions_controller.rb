class SessionsController < ApplicationController

  def new
  end

  def create
    muser = Muser.find_by(email: params[:session][:email].downcase)
    if muser && muser.authenticate(params[:session][:password])
      log_in muser
      redirect_to muser
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
