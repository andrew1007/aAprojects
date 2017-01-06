Links::Application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'users/create'

  get 'users/destroy'

  get 'links/new'

  get 'links/create'

  get 'links/show'

  get 'links/update'

  get 'links/destroy'

  get 'links/edit'

  get 'links/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :links
end
