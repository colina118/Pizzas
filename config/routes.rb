Rails.application.routes.draw do
  root 'sessions#new'

  resources :managers
  resources :employees
  resources :ingridients_pizzas
  resources :orders_pizzas
  resources :orders
  resources :branches
  resources :clients
  resources :ingridients
  resources :pizzas


  get 'home/_form'
  get 'home/edit'
  get 'home/index'
  get 'home/show'
  get 'home/new'
  get 'home/create'
  get 'home/a'
  get '/menu' => 'application#index'
  get '/agregar' => 'application#agregarcliente'

  get '/signup' => 'employees#new'
  post '/users' => 'employees#create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #match ':not_found' => redirect('/signup'), :constraints => { :not_found => /.*/ }
end
