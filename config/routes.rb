Rails.application.routes.draw do

  resources :clinicians
  resources :patients
  resources :esas_assessments
  resources :users
  resources :sessions

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "clinicians#index"

end
