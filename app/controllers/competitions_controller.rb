class CompetitionsController < ApplicationController
  #before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy, :show]
  #before_action :correct_muserid,   only: [:edit, :update, :destroy]
  #before_filter :check_for_cancel, :only => [:create, :update]
  #before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]
  
  def new
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def edit
  end

  def index
  end
  
  def submit
    @musing = Musing.find(params[:id])
    @competitions = Competition.all
  end
  
  def submitPost
    @thecompetition = Competition.find(params[:musing][:competitions])
    @thecompetition.musings << @musing
    if @thecompetition.save
        redirect_to action: "index"
        flash[:success] = "Successfully submitted to competition."
    else
      render 'submit', :id => params[@musing.id], :competitions => @thecompetition
      @thecompetition.errors.full_messages.each do |m|
        flash[:failure] = m
      end
    end
  end
end
