Rails.application.routes.draw do
  root 'bicycles#index'

  devise_for :users

  resources :bicycles do
    resources :suggestions, only: [:new, :create, :show, :destroy] do
      put 'accept', on: :member
    end
    resource :marks, only: [:create]
  end
  resources :categories, only: [:create]

  get 'my_bicycles', controller: :bicycles, as: :my_bicycles
end
