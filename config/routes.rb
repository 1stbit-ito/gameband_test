Rails.application.routes.draw do
  get 'test/test' => 'test#test'
  post 'users/login' => 'users#login'
  get 'timeline' => 'timelines#index'
  post 'entry/post' => 'entries#create'
  post 'entry/retweet' => 'entries#retweet'
  post 'entry/reply' => 'entries#reply'
  post 'follow/add' => 'follows#create'
  post 'follow/delete' => 'follows#delete'
  post 'favorite/add' => 'favorites#create'
  post 'favorite/delete' => 'favorites#delete'

  resources :timelines
  resources :entries
  resources :favorites
  resources :events
  resources :games
  resources :tags
  resources :followers
  resources :follows
  resources :game_profiles
  resources :users
  resources :yamajis
  resources :test

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
