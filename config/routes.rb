Rails.application.routes.draw do
  get 'login'=>'users#login'
  get 'users/login'=>'users#login'
  get 'tweets/login'=>'users#login'
  
  get 'login_user'=>'users#login_user'
  get 'users/login_user'=>'users#login_user'
  get 'tweets/login_user'=>'users#login_user'

  get 'logout'=>'users#logout'
  get 'users/logout'=>'users#logout'
  get 'tweets/logout'=>'users#logout'

  get 'signup'=>'users#new'


  resources :users
  resources :tweets



  get 'request_friend'=>'users#request_friend'
  get 'accept_friend'=>'users#accept_friend'
  get 'remove_friend'=>'users#remove_friend'

  get 'fullsize_image'=>'tweets#fullsize_image'

  get 'friends_tweets'=>'tweets#friends_tweets'

  get 'user_search'=> 'users#user_search'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    root 'tweets#index'
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
