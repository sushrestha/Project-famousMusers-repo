Rails.application.routes.draw do


  
  resources :feedbacks

  resources :categories

  get 'messages' => 'messages#index'
  #get 'messages/new' => 'messages#new', :as => 'message'
  post 'messages' => 'messages#postMessage'


  # to list all musings
  get 'musings' => 'musings#index', :as => 'musings'

  #to create new musing
  get 'musings/new' => 'musings#new', :as => 'new_musing'
  post 'musings' => 'musings#create'

  # to show particular musing via id
  get 'musings/:id' => 'musings#show', :as => 'musing'

  # to edit particular musing via id
  get 'musings/:id/edit' => 'musings#edit', :as => 'edit_musing'
  # patch for update
  patch 'musings/:id' => 'musings#update'
  put 'musings/:id' => 'musings#update'

  # to delete or destroy
  delete 'musings/:id' => 'musings#destroy'

  # to rate musing
  get 'ratings/:id/new' => 'ratings#new', :as => 'new_rating'
  post 'ratings' => 'ratings#create'

  root 'musers#new'

  get 'signup' => 'musers#new'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  
  resources :musers do
    member do
      get :following, :followers
    end
  end

  resources :subscribes, only: [:create, :destroy]

  #resources :musings

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
