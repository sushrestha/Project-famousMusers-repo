WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.
  
  namespace :async do

    # using a Hash to specify the target
    subscribe :clearNotifications, :to => AsyncController, :with_method => :clearNotifications

    # using the same syntax as routes.rb
    #subscribe :update, 'task#update'

    # if your controller is not a top-level object
    #subscribe :create_admin, :to => Admin::TaskController, :with_method => :create

    #subscribe :update_admin, 'admin/task#update'

  end
end
