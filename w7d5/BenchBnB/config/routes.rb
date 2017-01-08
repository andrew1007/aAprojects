Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end

# Test your routes using $.ajax methods in the console or with Postman before moving on. You should be able to create a user, log out, and log in.
