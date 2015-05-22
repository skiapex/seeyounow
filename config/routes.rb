Rails.application.routes.draw do

  resources :clinicians
  resources :patients
  resources :esas_assessments
  resources :prfs_assessments
  resources :users
  resources :sessions
  resources :comments
  resources :notification_settings
  resources :other_symptoms
  resources :care_groups
  resources :notes

  get '/home', to: 'pages#home'

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "pages#home"

end
