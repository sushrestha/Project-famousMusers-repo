Rails.application.routes.draw do

  resources :feedbacks
  #resources :categories

  get 'categories' => 'categories#index', :as => 'categories'
 # get 'categories/:id/edit' => 'categories#edit', :as => 'edit_category'
  # patch 'categories/:id' => 'categories#update'
   #put 'categories/:id' => 'categories#update'
  
  post 'competition/submitPost' => 'competitions#submitPost'
  get 'competitions' => 'competitions#index'
  get 'competitions/new' => 'competitions#new'
  #see competition with :id
  get 'competitions/:id' => 'competitions#show', :as => 'competition_show'
  #get 'competitions/update' => 'competitions#update'
  post 'competitions/index' => 'competitionratings#create'
  get 'competitions/index' => 'competitionratings#index', :as => 'competition_ratings'
  get 'competitionratings/new' => 'competitionratings#new', :as => 'new_competitionrating'


  get 'messages' => 'messages#index'
  post 'messages' => 'messages#postMessage'

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

  root 'musings#index'

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
