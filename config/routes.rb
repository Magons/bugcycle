Rails.application.routes.draw do
  root 'bicycles#index'
  resources :bicycles
  get 'my_bicycles', controller: :bicycles, as: :my_bicycles
  devise_for :users
end
