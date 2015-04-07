class MusingsController < ApplicationController
 

before_filter :check_for_cancel, :only => [:create, :update]

  def index
  		@musings = Musing.all
  end


   def new
  	#show new form for 
  	@musing = Musing.new
  end

  def create

  	  	#create a new musing 
  	@musing = Musing.new(params.require(:musing).permit(:title, :content, :isPrivate))

    	if @musing.save
        flash[:success] = "musing was successfully created."

    		redirect_to musings_url()
    	else
        @musing.errors.full_messages.each do |m|
          flash[:failure] = m
        end

        redirect_to new_musing_path
     
    	end
    #end

  end

  def show
  	@musing = Musing.find(params[:id])
  end

   def edit
  	@musing = Musing.find(params[:id])
  end


    def update
  	#update the particular musing
  	@musing = Musing.find(params[:id])
  	if @musing.update(params.require(:musing).permit(:title, :content, :isPrivate))
      flash[:success] = "Musing was successfully updated."
  		redirect_to musing_url(@musing)
  	else
        @musing.errors.full_messages.each do |m|
          flash[:failure] = m
        end
  	  	redirect_to edit_musing_path(@musing)  	  		
  	end
  end

 def destroy
  	#delete the particular musing
  	@musing  = Musing.find(params[:id])
  	@musing.destroy
  	flash[:success] = " Musing '"+@musing.title+"' deleted"
  	redirect_to musings_url
  end

    #check_for_cancel
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to musings_url
    end
      
  end

  def rate
  	@musing = Musing.find(params[:id]) 

  end



end
