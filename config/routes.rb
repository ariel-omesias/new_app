Rails.application.routes.draw do
  get 'admin', to: "admin#index"

  devise_for :users

  resources :users, only: [:edit, :update]
  # get 'users/edit/:id', to:'admin#edit', as: 'edit_user'
  # post 'users/edit/:id', to: 'admin#index', as: 'update_user'
  # endpatch 'users/:id', to:'admin#update', as: 'update_user'

  resources :stories

  get 'my_pictories', to: 'stories#my_pictories'

  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

