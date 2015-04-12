class MusersController < ApplicationController

  before_action :logged_in_muser, only: [:show]
  before_action :correct_muser,   only: [:show]

  def show
    @muser = Muser.find(params[:id])
    @musings = @muser.musings # aded to show muser's musings on his page too.
  end

  def new
    @muser = Muser.new
  end

  def create
    @muser = Muser.new(muser_params)
    #by default users aren't moderators
    @muser.isModerator = false
    if @muser.save
      log_in @muser
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @muser
    else
      render 'new'
    end
  end

  private

  def muser_params
    params.require(:muser).permit(:name, 
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  # Before filters

  # Confirms a logged-in muser.
  def logged_in_muser
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct muser.
  def correct_muser
    @muser = Muser.find(params[:id])
    redirect_to(root_url) unless current_muser?(@muser)
  end

end
