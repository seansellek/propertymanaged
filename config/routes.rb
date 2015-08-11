Rails.application.routes.draw do

  post '/signatures/callbacks',
    to: 'signatures#callbacks'


  root 'sessions#new'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'tickets/:id/close', to: 'tickets#close'
  post 'invoices/:id/close', to: 'invoices#close', as: 'invoice_payment'

  resources :comments

  resources :invoices
  resources :landlords
  resources :sessions
  # resources :invites
  resources :properties
  resources :tenants, except: :show
  # resources :dashboard
  resources :occupancy_pictures
  resources :signatures, only: [:new, :create, :index] do
    collection do
      post 'callbacks'
    end
  end
  resources :pictures



  resources :tickets do
    resources :comments
    resources :pictures
  end

  resources :property_tenants do
    resources :occupancy_pictures
  end


  get 'dashboard' => 'dashboard#show'

  get 'signup', to: 'landlords#new', as: 'signup'

  get 'properties/:property_id/invite', to: 'invites#new'
  post 'invites' => 'invites#create'
  get 'tenants/signup', to: 'tenants#new'

  get 'tickets/:id/close', to: 'tickets#close', as: 'close_ticket'








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
