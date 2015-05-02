class AsyncController < WebsocketRails::BaseController
  before_filter{ |controller| logger.debug "Running before the #{controller.action_name} action" }
  #  puts "event happened###########################"
  #end
  
  def clearNotifications
    #puts "test cn"
    @data = message
    puts @data[:curid]
    #don't let people 
    puts current_muser.id
    #update notifications set unread='f' where muser_id='1';
    Notification.where('muser_id=?', current_muser.id).update_all(unread: 'f')
    #trigger_success
  end
end