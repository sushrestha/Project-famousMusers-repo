class MusersController < ApplicationController
  before_action :logged_in_muser, only: [:show, :following, :followers, :other_musers]
  #before_action :correct_muser, only: [:show]
  
  def following
    @title = "Following"
    @muser  = Muser.find(params[:id])
    @musers = @muser.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @muser  = Muser.find(params[:id])
    @musers = @muser.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def other_musers
    @muser = Muser.find(params[:id])
  end


  def index
    @musers = Muser.all 
    @other_musers = Muser.find_by_sql ["SELECT * FROM musers WHERE id != ? AND id NOT IN (SELECT followed_id FROM subscribes WHERE follower_id = ?)  ", current_muser, current_muser.id]
  
  end

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
      flash[:success] = "Signed up successfully!"
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

  # Confirms the correct muser.
  def correct_muser
    @muser = Muser.find(params[:id])
    redirect_to(root_url) unless current_muser?(@muser)
  end

end
