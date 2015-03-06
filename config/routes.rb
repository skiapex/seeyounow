Rails.application.routes.draw do

  resources :clinicians
  resources :patients
  resources :esas_assessments
  resources :users
  resources :sessions
  resources :comments

  get 'clinicians/:id/home', to: 'pages#clinicianhome'
  get 'clinicians/:id/profile', to: 'pages#profile'

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "clinicians#index"

end
