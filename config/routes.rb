Rails.application.routes.draw do

  get 'musers/edit'

  get 'notifications/index'

  #get 'flagged_musings/index'

  resources :feedbacks
  #resources :categories
  
  #file upload

  get 'file_upload/:id/new' => 'upload#new', :as => 'new_file_upload'
  get 'picture/:id' => 'upload#picture'
  #get 'file_upload' => 'upload#get', :as => 'file_upload'
  post 'file_upload' => 'upload#save'

  get 'file_upload/:id' => 'upload#show', :as => 'file_show'
  
  get '/picture/:id' => 'upload#picture'
  



 get 'subscribe_categories' => 'subscribe_category#index', :as => 'subscribe_categories'
 get 'subscribe_categories/:id' => 'subscribe_category#show', :as => 'subscribe_category'
 get 'subscribe_categories/:id/new' => 'subscribe_category#new', :as => 'new_subscribe_category'
 post 'subscribe_categories' => 'subscribe_category#create'
 delete 'subscribe_categories/:id' => 'subscribe_category#destroy'
  

  get 'categories' => 'categories#index', :as => 'categories'
  get 'categories/new' => 'categories#new', :as => 'new_category'
  post 'categories' => 'categories#create'
  get 'categories/:id' => 'categories#show', :as => 'category'
  get 'categories/:id/edit' => 'categories#edit', :as => 'edit_category'
  patch 'categories/:id' => 'categories#update'
  put 'categories/:id' => 'categories#update'
  # to delete or destroy
  delete 'categories/:id' => 'categories#destroy'


  # competition index
  get 'competitions' => 'competitions#index', :as => 'competition'
  # to create new musing
  get 'competitions/new' => 'competitions#new', :as => 'new_competition'
  post 'competitions' => 'competitions#create'
  # see competition with :id
  get 'competitions/:id' => 'competitions#show', :as => 'competition_show'
  # edit competition
  get 'competitions/:id/edit' => 'competitions#edit', :as => 'edit_competition'
  patch 'competitions/:id' => 'competitions#update'
  put 'competitions/:id' => 'competitions#update'
  # delete competition
  delete 'competitions/:id' => 'competitions#destroy', :as => 'delete_competition'
  # adding musings to competition
  post 'competition/submitPost' => 'competitions#submitPost'

  get 'competitionratings/new' => 'competitionratings#new', :as => 'new_competitionrating'
  post 'competitionratings/new' => 'competitionratings#create'

  get 'messages' => 'messages#index'
  #post 'messages' => 'messages#postMessage'
  post 'messages' => 'messages#create'
  get 'messages/new' => 'messages#new', :as => 'new_message'

  get 'submit/:id' => 'competitions#submit', :as => 'competition_submission'

  # to list all musings
  get 'musings' => 'musings#index', :as => 'musings'
  get 'musings/popular' => 'musings#popular', :as => 'popular_musings'
  get 'musings/top' => 'musings#top', :as => 'top_musings'

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




  # Flagged_musings
  get 'flagged_musings' => 'flagged_musings#index', :as => 'flagged_musings'
  get 'flagged_musings/:id/new' => 'flagged_musings#new', :as => 'new_flag'
  post 'flagged_musings' => 'flagged_musings#create'
  get 'flagged_musings/:id/' => 'flagged_musings#show', :as => 'flagged_musing'

  root 'musings#index'

  get 'signup' => 'musers#new'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :musers do
    member do
      get :following, :followers, :subscribed_musers
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
