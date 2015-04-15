class SubscribesController < ApplicationController
  before_action :logged_in_muser

  def create
    @muser = Muser.find(params[:followed_id])
    current_muser.follow(@muser)
    respond_to do |format|
      format.html { redirect_to @muser }
      format.js
    end
  end

  def destroy
    @muser = Subscribe.find(params[:id]).followed
    current_muser.unfollow(@muser)
    respond_to do |format|
      format.html { redirect_to @muser }
      format.js
  end
  end
end
