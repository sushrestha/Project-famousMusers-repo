class FlaggedMusingsController < ApplicationController


	before_action :logged_in_muser
	before_action :moderator_user, :only => [:index, :show]	
	before_filter :check_for_cancel

  def index
  	@flagged_musings = FlaggedMusing.all

  	@musings = Musing.find_by_sql ["SELECT * FROM musings WHERE id IN (SELECT DISTINCT musing_id FROM flagged_musings)"]
  end

  def show
  	@musing = Musing.find(params[:id])
 	@flags = FlaggedMusing.where("musing_id = ?",@musing.id) 
  end

  def new
    @flag = FlaggedMusing.new
    @flag.musing = Musing.find(params[:id])
 
  end

  def create
	@flag = FlaggedMusing.new(flag_params)
    @flag.musing = Musing.find(params[:flagged_musing][:id])
    @flag.muser = current_muser
  	if @flag.save
      flash[:success] = "Musing succesfully flagged"
  		redirect_to musings_url()
  	else
      @rating.errors.full_messages.each do |m|
        flash[:failure] = m
    end
    redirect_to new_flag_path
    end
  end

  def flag_params
    params.require(:flagged_musing).permit(:description)
  end

    #check_for_cancel
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to musings_url
    end      
  end



end
