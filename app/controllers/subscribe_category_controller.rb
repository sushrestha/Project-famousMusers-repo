class SubscribeCategoryController < ApplicationController
	def create
    @muser = Muser.find(params[:muser_id])
    current_muser.follow(@category)
    respond_to do |format|
      format.html { redirect_to @muser }
      format.js
    end
  end
end
