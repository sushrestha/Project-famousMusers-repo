class SubscribeCategoryController < ApplicationController


def index
    #@subscribe_category = SubscribeCategory.where("muser_id = ?", current_muser.id)
    @categories = Category.find_by_sql ["SELECT * FROM categories WHERE id IN 
    	(SELECT category_id FROM subscribe_categories WHERE muser_id = ?)",current_muser.id]
end



def show
	@subscribe_category = Category.find(params[:id])
	@musings = Musing.where("category_id = ?", @subscribe_category.id)
end

def new	
	@subscribe_category = SubscribeCategory.new
	@category = Category.find(params[:id])
	@musings = Musing.where("category_id = ?", @category.id)	
	@subscribe_category.category = @category

end


def create
	@subscribe_category = SubscribeCategory.new()
	@subscribe_category.category = Category.find(params[:subscribe_category][:id])
  @subscribe_category.muser = current_muser
  	if @subscribe_category.save
      flash[:success] = "category succesfully subscribed"
  		redirect_to subscribe_categories_path
  	else
      @subscribe_category.errors.full_messages.each do |m|
        flash[:failure] = m
    end
    redirect_to new
    end
end

def destroy
	@subscribe_category = SubscribeCategory.find(params[:id])
	# @subscribe_category = SubscribeCategory.where("category_id = ? and muser_id = ?", @category.id,current_muser.id)
	@subscribe_category.destroy
    flash[:success] = " Category unsubsrcibed"
    redirect_to musings_url
end

end
