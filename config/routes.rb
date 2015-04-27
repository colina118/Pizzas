Rails.application.routes.draw do
  resources :managers

  resources :employees

  get 'home/_form'

  get 'home/edit'

  get 'home/index'

  get 'home/show'

  get 'home/new'

  get 'home/create'
  get 'home/a'

  get '/menu' => 'application#index'
  get '/agregar' => 'application#agregarcliente'

  resources :ingridients_pizzas

  resources :orders_pizzas

  resources :orders

  resources :branches

  resources :clients

  resources :ingridients

  resources :pizzas

  get '/signup' => 'employees#new'
  post '/users' => 'employees#create'

  get '/login' => 'sessions#new'
  root 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


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
  #     # (application/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
