Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'movies#index'
  resources :movies, only: [:index]
end
