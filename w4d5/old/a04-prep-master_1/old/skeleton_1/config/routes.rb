Links::Application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session
  resources :links
  resources :comments
end
