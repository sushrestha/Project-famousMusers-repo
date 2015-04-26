class MessagesController < ApplicationController
  before_filter :logged_in_muser
  respond_to :html, :js
  
  def index
    puts("index test")
    @message = Message.new
    @messages = Message.all
    @current_muser = current_muser
    @current_muser_id = current_muser.id
    #convert to string so that we have the same format between this id and current muser in the query
    @receiver_id = params[:receiver_id].to_s
    @receiver_muser = Muser.find(@receiver_id)
    #@messages = Message.where("(author_id = '?' AND recipient_id = ?) OR (author_id = ? AND recipient_id = '?')", 
    #                            @current_muser.id, @receiver_id,
    #                            @receiver_id, @current_muser.id)
    if @current_muser_id.to_i < @receiver_id.to_i
      @channel_name = @current_muser.name + "_" + @receiver_muser.name
    else
      @channel_name = @receiver_muser.name + "_" + @current_muser.name
    end
  end
  
  def new
    @message = Message.new
    #@messages = Message.all
    @id = params[:id]
  end
  
  def create
    @messages = Message.all
    #@message  = Message.create(message_params)
    @message = Message.new(message_params)
    @message.author = current_muser
    @myreceiverid = params[:message][:post_id]
    @receiver_muser = Muser.find(@myreceiverid)
    @message.recipient = Muser.find(@myreceiverid)
    #respond_to do |format|
      if @message.save
        #format.html { redirect_to messages_path(:receiver_id => @myreceiverid) }
        #@post.message = @message
        WebsocketRails[params[:message][:channel_name]].trigger 'new', @message
      else
          @messages = Message.all
          flash.now[:error] = 'Failed to add post'
          #render action: 'index'
          #redirect_to action: 'index', :receiver_id => @myreceiverid
      end
    #end
  end
  
  

  def postMessage
    @message = Message.new(message_params)
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
  
  private
    def message_params
      params.require(:message).permit(:content)
    end
end
