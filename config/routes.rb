Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'application#hello'
  root 'static_pages#home'

  #get 'static_pages/home'
  #get  '/home',    to: 'static_pages#home'
  #get 'static_pages/help'
  get  '/help',    to: 'static_pages#help'
  #get 'static_pages/about'
  get  '/about',   to: 'static_pages#about'
  #get 'static_pages/contact'
  get  '/contact', to: 'static_pages#contact'

  # SIGN-UP
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # SESSIONS
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # USERS ROUTE
  #resources :users

  # GET 	/users/1/following 	following 	following_user_path(1)
  # GET 	/users/1/followers 	followers 	followers_user_path(1)
  resources :users do
    member do
      get :following, :followers
    end
  end

  # ACTIVATION
  resources :account_activations, only: [:edit]

  # Password Resets
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # Microposts
  resources :microposts,          only: [:create, :destroy]

  # Relationships
  resources :relationships,       only: [:create, :destroy]

end
