Rails.application.routes.draw do
  resource  :profile,  only: [:show, :create, :update, :destroy]
  resource  :session,  only: [:create]
  resources :users,    only: [:index]
  resources :ratings,  only: [:index, :create, :update]
end
