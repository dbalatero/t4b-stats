Rails.application.routes.draw do
  resources :stats, only: [:index]

  root 'stats#index'
end
