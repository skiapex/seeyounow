Rails.application.routes.draw do

  resources :clinicians
  resources :patients

  root to: "clinicians#index"

end
