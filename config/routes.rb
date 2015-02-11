Rails.application.routes.draw do

  resources :clinicians
  resources :patients
  resources :esas_assesments

  root to: "clinicians#index"

end
