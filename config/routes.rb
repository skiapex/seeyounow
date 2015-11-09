Rails.application.routes.draw do

  resources :clinicians
  resources :patients
  resources :esas_assessments
  resources :prfs_assessments
  resources :users
  resources :sessions
  resources :password_resets
  resources :comments
  resources :notification_settings
  resources :other_symptoms
  resources :care_groups
  resources :notes
  resources :feedbacks
  resources :care_givers
  resources :specialities
  resources :occupations

  get '/information', to: 'pages#landing'

  get '/home', to: 'pages#home'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  get '/agreement', to: 'users#agreement'



  get "/login", to: "sessions#new", :as => "login"
  get "/logout", to: "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"

   get "/info", to: "sessions#information"

  root to: "pages#home"

end
