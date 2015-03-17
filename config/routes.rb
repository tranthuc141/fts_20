Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'

  resources :users
  
  namespace :admin do
    resources :users
  end
end
