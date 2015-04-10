class RatingsController < ApplicationController


before_action :logged_in_muser
before_filter :check_for_cancel


  def index
  	#@ratings = Rating.all
  end

  def new
    #@musing = Musing.find(params[:id])
    @rating = Rating.new
    @rating.musing = Musing.find(params[:id])
  end

  def create
  		@rating = Rating.new(params.require(:rating).permit(:stars))
      @rating.musing = Musing.find(params[:rating][:id])
    	if @rating.save
        flash[:success] = "rating was successfully created."

    		redirect_to musings_url()
    	else
        @rating.errors.full_messages.each do |m|
          flash[:failure] = m
        end

        redirect_to new_rating_path
     
    	end
  end



    #check_for_cancel
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to musings_url
    end
      
  end


end
