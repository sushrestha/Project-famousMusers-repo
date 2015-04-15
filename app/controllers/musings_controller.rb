class MusingsController < ApplicationController
 
before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy]
before_action :correct_muserid,   only: [:edit, :update, :destroy]
before_filter :check_for_cancel, :only => [:create, :update]
before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]


  def index
  	   #@musings = Musing.all
    if logged_in?
      @musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?
                               UNION SELECT * FROM musings WHERE muser_id = ?",
                               0, current_muser]
    else
      @musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?", 0]
      #Musing.where(:isPrivate => 0).all
    end

    #for muse of day
    @musing_all = Musing.all
    @list = Array.new
    @musing_all.each do |l|
     @list.push(l.id)
    end

    @min = 0
   @max = @list.size-1
   @randnum = Random.rand(@min..@max)
    @id = @list[@randnum]
    @musing_of_the_day = Musing.find(@id)
 
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

def popular
   #@musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?", 0]
   @musings = Musing.all
   #@rating = @musings.ratings

   #@sum = sum_ratings(@musings)
end

def top
   @musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?", 0]
   @ratings = Rating.find_by_sql ["SELECT musing_id, sum(stars) AS sumrating FROM ratings GROUP BY musing_id "]


# SELECT A.*, B.sumrating FROM musings A INNER JOIN ( SELECT musing_id, sum(stars) AS sumrating FROM ratings GROUP BY musing_id ) B 
# ON A.id = B.musing_id
# WHERE A.isPrivate = 0
# ORDER BY B.sumrating DESC 
# LIMIT 10

end

  #DRY up code 
  #define params for musings
  def musing_params
    params.require(:musing).permit(:title, :content, :isPrivate)
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





end
