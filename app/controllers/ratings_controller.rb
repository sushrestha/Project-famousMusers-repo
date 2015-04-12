class RatingsController < ApplicationController


before_action :logged_in_muser, :only => [:new, :create]
before_filter :check_for_cancel

#before_action :other_user, :only => [:new, :create]


  def index
  end

  def new
    @rating = Rating.new
    @rating.musing = Musing.find(params[:id])
 
  end

  def create
		@rating = Rating.new(rating_params)
    @rating.musing = Musing.find(params[:rating][:id])
    @rating.muser = current_muser
  	if @rating.save
      flash[:success] = "Musing succesfully rated"
  		redirect_to musings_url()
  	else
      @rating.errors.full_messages.each do |m|
        flash[:failure] = m
    end
    redirect_to new_rating_path
    end
  end

  def rating_params
    params.require(:rating).permit(:stars)
  end

    #check_for_cancel
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to musings_url
    end      
  end


   # checks other user
  # def other_user
  #   @musing = Musing.find(params[:id]) 
  #   unless (current_muser.id != @musing.muser_id)
  #     flash[:danger] = "No Access!!!"
  #     redirect_to musings_url
  #   end
  # end


end
