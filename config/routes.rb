Rails.application.routes.draw do
  root 'bicycles#index'
  resources :bicycles
  devise_for :users
end
