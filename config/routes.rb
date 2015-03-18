Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'

  resources :users
  resources :courses
  
  namespace :admin do
    resources :users
    resources :questions
    resources :courses
  end
end
