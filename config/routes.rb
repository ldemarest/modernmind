Rails.application.routes.draw do

  resources :users
  
  resources :minds do
    put :email, on: :member
    resources :neurons
  end

  root 'static_pages#homepage'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/about' => 'static_pages#about'
  get '/zip' => 'neurons#zip'
  get '/minds/:id/completedmind' => 'minds#completedmind', :as => :completedmind
  get '/greatminds' => 'static_pages#greatminds', :as => :greatminds
  get '/openminds' => 'static_pages#openminds', :as => :openminds
  get '/error' => 'static_pages#error', :as => :error


end
