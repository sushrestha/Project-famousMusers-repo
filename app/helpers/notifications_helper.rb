module NotificationsHelper
  def notifications
    @notifications = Notification.where("muser_id = '?' AND unread='t'", @current_muser.id)
  end
end
