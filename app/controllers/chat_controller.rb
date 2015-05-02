class ChatController < WebsocketRails::BaseController
  def create
    message = Message.create mymessage
    if message.save
      trigger_success message
    else
      trigger_failure message
    end
end
end