class UploadController < ApplicationController
	def get
       @picture = Picture.new
    end
   # def index
   # @picture = Picture.all
 # end
# . . .

     # Never trust parameters from the scary internet, only allow the white
     # list through.
   def picture_params
    params.require(:picture).permit(:comment, :uploaded_picture)
   end

   def save
     @picture = Picture.new(picture_params)
       if @picture.save

     #@musing = Musing.find(params[:musing_id])
     #@picture.musing = @musing 
          redirect_to(controller: 'upload', action: 'show', id: @picture.id)
       else
          render(action: :get)
       end
   end

   def picture
     
     @picture = Picture.find(params[:id])
     send_data(@picture.data,
     filename: @picture.name,
     type: @picture.content_type,
     disposition: "inline")
   end

   def show
     @picture = Picture.find(params[:id])
   end
end
