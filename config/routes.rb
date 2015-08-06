Rails.application.routes.draw do
  
  get 'tickets/index'

  root 'sessions#new'
 
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'tickets/:id/close', to: 'tickets#close'
  #get 'comments/:id/new', to: 'comments#new'

  resources :comments

  resources :landlords
  resources :sessions
  # resources :invites 
  resources :properties
  resources :tenants, except: :show
  # resources :dashboard
  
  resources :tickets do
    resources :comments
  end

  
  get 'dashboard' => 'dashboard#show'

  get 'signup', to: 'landlords#new', as: 'signup'

  get 'properties/:property_id/invite', to: 'invites#new'
  post 'invites' => 'invites#create'
  get 'tenants/signup', to: 'tenants#new'


  
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
