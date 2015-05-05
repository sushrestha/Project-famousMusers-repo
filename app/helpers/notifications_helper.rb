module NotificationsHelper
  def notifications
    @notifications = Notification.where("muser_id = '?' AND unread='t'", @current_muser.id)
  end
  
  
  
  def notifications_map(notifications)
    @map = Hash.new(0)
    notifications.each do |notification|
      if notification.linktype == 'message'
        @message_sender = Muser.find(notification.linkid)
        #link_to "New message from " + @message_sender.name, messages_path(:receiver_id => @message_sender.id)
      else
        #other types not yet implemented
      end
      #add up the message notifications from each user
      @map[notification.linkid] += 1 
    end
    
    @map
  end
end
