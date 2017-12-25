Rails.application.routes.draw do
  root 'bicycles#index'

  resources :bicycles do
    resources :suggestions, only: [:new, :create, :show, :destroy] do
      put 'accept', on: :member
    end
  end
  resources :categories, only: [:create]

  get 'my_bicycles', controller: :bicycles, as: :my_bicycles

  devise_for :users
end
