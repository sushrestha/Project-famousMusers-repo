class MusingsController < ApplicationController
 
before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy]
before_action :correct_muserid,   only: [:edit, :update, :destroy]
before_filter :check_for_cancel, :only => [:create, :update]
before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]


  def index
  	@musings = Musing.all
    @musing_of_the_day = Musing.last(1)
 
  end

  def new 
  	@musing = Musing.new
  end

  def create
    @musing  = current_muser.musings.build(musing_params)
  	if @musing.save
      flash[:success] = "musing was successfully created."
  		redirect_to musings_url()
  	else
      render 'new'
   	end
  end

  def show
  end

   def edit
  end


  def update
    #@musing.competitions_musings.build
    #@musing.competitions_ids.each do |cid|
    #params[:musing][:competition_ids].each do |cid|
      @musing.competitions << Competition.find(params[:musing][:competition_ids])
    #end
    
  	#update the particular musing
  	#@musing = Musing.find(params[:id])
    #@musing1 = current_muser.musings.find(params[:id]) #Finds the musing with id :musing_id and user_id equal to user.id
    #if current_muser.musings.find(params[:id]).any?
    #@musing  = current_muser.musings.build(musing_params)
  	if @musing.update(musing_params)
      flash[:success] = "Musing was successfully updated."
      #flash[:success] = "Musing was successfully updated."+"musing"+@musing1.id.to_s+"by"+@musing1.muser_id.to_s
  		redirect_to musing_url(@musing)
  	else
  	 render 'edit' 	  		
  	end
  end

 def destroy
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



  #DRY up code 
  #define params for musings
  def musing_params
    params.require(:musing).permit(:title, :content, :isPrivate, :competition_ids => [])
  end

  # find the musings by id
  def find_musing
    @musing = Musing.find(params[:id])
  end


  # confirms the correct_user
  def correct_muserid
    @musing = Musing.find(params[:id])
    unless (current_muser.id == @musing.muser_id)
      flash[:danger] = "No Access!!!"
      redirect_to musings_url
    end
  end

  def random_musing
    @musings = Musing.find_by isPrivate: 0
    @min = 0
    @max = @musings.id.size
    @list = Array.new(@max)
    @musings.each do |musing|
      @list.push(musing.id)
    end
    @randnum = Random.rand(@min,@max)
    @id = @list[@randnum]
    @random_musing = Musing.fing_by(@id)
  end
  helper_method :random_musing



end
