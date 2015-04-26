module MessagesHelper
  def updateMessages
    @messages = Message.all
    puts("update messages called")
  end
end
