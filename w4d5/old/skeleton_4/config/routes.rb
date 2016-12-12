Links::Application.routes.draw do

  get 'comments/new'

  get 'comments/create'

  get 'comments/destroy'

  get 'links/new'

  get 'links/create'

  get 'links/index'

  get 'links/show'

  get 'links/edit'

  get 'links/update'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resource :session
  resources :links
  resources :comments

end
