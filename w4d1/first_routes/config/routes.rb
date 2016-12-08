Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: [:create, :destroy, :show, :update]
  resources :contacts, only: [:index, :create, :destroy, :show, :update]
  resources :contact_share, only: [:create, :destroy]

  get 'users/:user_id/contacts' => 'contacts#index'
end
