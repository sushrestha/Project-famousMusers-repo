class FlaggedMusingsController < ApplicationController

	before_action :logged_in_muser
	before_action :moderator_user, :only => [:index, :show]	
	before_filter :check_for_cancel

  def index
  	#@musings = Musing.find_by_sql ["SELECT * FROM musings WHERE id IN (SELECT DISTINCT musing_id FROM flagged_musings)"]
    @musings = Musing.find_by_sql [ "SELECT * FROM musings  INNER JOIN  
      ( SELECT musing_id, count(musing_id) AS flags FROM flagged_musings GROUP BY musing_id)  
      ON id = musing_id ORDER BY flags desc"]
  end

  def show
    @musing = Musing.find(params[:id])
   	@flags = FlaggedMusing.where("musing_id = ?",@musing.id) 
  end

  def new
    @musing = Musing.find(params[:id])
    @flagged = FlaggedMusing.where("muser_id = ? and musing_id = ?", current_muser.id, @musing.id)
    if !@flagged.any?
      @flag = FlaggedMusing.new
      @flag.musing = Musing.find(params[:id])
    else
      flash[:danger] = "Musing already flagged!!!"
      redirect_to root_path
    end
  end

  def create
	  @flag = FlaggedMusing.new(flag_params)
    @flag.musing = Musing.find(params[:flagged_musing][:id])
    @flag.muser = current_muser
  	if @flag.save
      flash[:success] = "Musing succesfully flagged"
  		redirect_to musings_url()
  	else
      @flag.errors.full_messages.each do |m|
        flash[:failure] = m
    end
    redirect_to new_flag_path(@flag.musing_id)
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
