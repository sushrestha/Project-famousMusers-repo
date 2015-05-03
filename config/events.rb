WebsocketRails::EventMap.describe do
  namespace :async do
    subscribe :clearNotifications, :to => AsyncController, :with_method => :clearNotifications
  end
end
