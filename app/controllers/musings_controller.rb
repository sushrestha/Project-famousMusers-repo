class MusingsController < ApplicationController
 
before_action :logged_in_muser, :only => [:new, :create, :edit, :update, :destroy]
before_action :correct_muserid,   only: [:edit, :destroy]
before_filter :check_for_cancel, :only => [:create, :update]
before_filter :find_musing, :only => [:show, :edit, :update,  :destroy]
before_filter :muse_of_day, :only => [:index, :popular, :top]


  def index
    if logged_in?
      @musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?
                               UNION SELECT * FROM musings WHERE muser_id = ?",
                               0, current_muser]
    else
      @musings = Musing.find_by_sql ["SELECT * FROM musings WHERE isPrivate = ?", 0]
    end
 
  end

  def new 
  	@musing = Musing.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @musing  = current_muser.musings.build(musing_params)    
    @musing.category_id = params[:category_id]
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
   @musing=Musing.find(params[:id])
   @category=@musing.category_id
   @categories = Category.all.map{|c| [ c.name, c.id ] }
  end


  def update
   @musing.category_id = params[:category_id]
     unless params[:musing][:competition_ids].nil? then 
      @musing.competitions << Competition.find(params[:musing][:competition_ids])
    end
    
  	if @musing.update(musing_params)
      flash[:success] = "Musing was successfully updated."
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

def muse_of_day
    #for muse of day
    @musing_all = Musing.all
    @list = Array.new
    @musing_all.each do |l|
      @list.push(l.id)
    end

    @min = 0
    @max = @list.size
    @randnum = Random.rand(@min..@max)
    (@randnum == @list.size) ? (@id = @list.size-1) : (@id = @list[@randnum])
    @musing_of_the_day = Musing.find(@id)
end

def popular
@musings = Musing.find_by_sql ["SELECT A.*  FROM musings A INNER JOIN ( SELECT musing_id, avg(stars) AS avgrating FROM ratings GROUP BY musing_id ) B 
ON A.id = B.musing_id
WHERE A.isPrivate = 0
ORDER BY B.avgrating DESC 
LIMIT 10"]
end

def top
@musings = Musing.find_by_sql ["SELECT A.*  FROM musings A INNER JOIN ( SELECT musing_id, sum(stars) AS sumrating FROM ratings GROUP BY musing_id ) B 
ON A.id = B.musing_id
WHERE A.isPrivate = 0
ORDER BY B.sumrating DESC 
LIMIT 10"]

end

  #DRY up code 
  #define params for musings
  def musing_params
    params.require(:musing).permit(:title, :content, :category_id, :isPrivate, :competition_ids => [])
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
