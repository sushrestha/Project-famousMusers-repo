class MusingsController < ApplicationController
 
before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy]
before_action :correct_muserid,   only: [:edit, :update, :destroy]
before_filter :check_for_cancel, :only => [:create, :update]

  def index
  		@musings = Musing.all
  end


   def new
  	#show new form for 
  	@musing = Musing.new
    #@musing.muser_id = Muser.find(params[:id])
  end

  def create

  	  	#create a new musing 
  	#@musing = Musing.new(params.require(:musing).permit(:title, :content, :isPrivate))
    @musing  = current_muser.musings.build(musing_params)

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
    #@musing1 = current_muser.musings.find(params[:id]) #Finds the musing with id :musing_id and user_id equal to user.id


    #if current_muser.musings.find(params[:id]).any?
    #@musing  = current_muser.musings.build(musing_params)
      	if @musing.update(musing_params)
          flash[:success] = "Musing was successfully updated."
          #flash[:success] = "Musing was successfully updated."+"musing"+@musing1.id.to_s+"by"+@musing1.muser_id.to_s
      		redirect_to musing_url(@musing)
      	else
            @musing.errors.full_messages.each do |m|
              flash[:failure] = m #+@musing1.muser_id.to_s
            end
      	  	redirect_to edit_musing_path(@musing)  	  		
      	end
    #end
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

  #define params for musings
  def musing_params
    params.require(:musing).permit(:title, :content, :isPrivate)
  end

  # def rate
  # 	@musing = Musing.find(params[:id]) 

  # end
  # confirms the correct_user
  def correct_muserid
    @musing = Musing.find(params[:id])
    #@muser = @musing.muser_id
    unless (current_muser.id == @musing.muser_id)
       flash[:danger] = "No Access!!!"
        redirect_to musings_url
    end

  end


end
