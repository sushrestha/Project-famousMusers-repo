class MessagesController < ApplicationController
  before_filter :logged_in_muser
  
  def index
    @message = Message.new
    @current_muser = current_muser
    @current_muser_id = current_muser.id
    #convert to string so that we have the same format between this id and current muser in the query
    @receiver_id = params[:receiver_id].to_s
    @receiver_muser = Muser.find(@receiver_id)
    @messages = Message.where("(author_id = '?' AND recipient_id = ?) OR (author_id = ? AND recipient_id = '?')", 
                                @current_muser.id, @receiver_id,
                                @receiver_id, @current_muser.id)
    #flash[:warning] = Message.where("(author_id = '?' AND recipient_id = ?) OR (author_id = ? AND recipient_id = '?')", 
    #                            @current_muser_id, @receiver_id,
    #                            @receiver_id, @current_muser_id).to_sql  
  end

  def postMessage
    @message = Message.new(params.require(:message).permit(:content))
    @message.author = current_muser
    @myreceiverid = params[:message][:post_id]
    @message.recipient = Muser.find(@myreceiverid)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path(:receiver_id => @myreceiverid) }
      else
        format.html  do
          @messages = Message.all
          flash.now[:error] = 'Failed to add post'
          #render action: 'index'
          redirect_to action: 'index', :receiver_id => @myreceiverid
        end
      end
    end
  end
end
