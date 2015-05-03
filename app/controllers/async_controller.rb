class AsyncController < WebsocketRails::BaseController
  def clearNotifications
    #@data = message
    Notification.where('muser_id=?', current_muser.id).update_all(unread: 'f')
    #trigger_success
  end
end