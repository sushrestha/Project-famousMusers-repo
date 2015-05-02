class ChatController < WebsocketRails::BaseController
  before_filter do
    puts "event happened###########################"
  end
  #def create
  #  message = Message.create mymessage
  #  if message.save
  #    trigger_success message
  #  else
  #    trigger_failure message
  #end
end