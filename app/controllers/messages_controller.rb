class MessagesController < ApplicationController
  before_filter :logged_in_muser
  
  def index
    @messages = Message.all
    @message = Message.new
  end

  def postMessage
    @message = Message.new(params.require(:message).permit(:content))
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path }
      else
        format.html  do
          @messages = Message.all
          flash.now[:error] = 'Failed to add post'
          render action: 'index'
        end
      end
    end
  end
end
