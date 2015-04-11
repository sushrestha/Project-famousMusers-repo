class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @messages = Message.all
    @message = Message.new(params.require(:message).permit(:content))
    unless @message.save!
      flash[:warning] = "Failed to post"
    end
     
    render 'new'
  end
end
