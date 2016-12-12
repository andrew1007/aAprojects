Links::Application.routes.draw do
  resources :links
  resources :users
  resources :comments
  resource :session, only: [:new, :create, :destroy]
end
