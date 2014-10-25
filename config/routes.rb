Rails.application.routes.draw do
  resources :profiles, only: [:create]
  resources :sessions, only: [:create]
  resources :users,    only: [:index]
  resources :ratings,  only: [:index, :create, :update]
end
