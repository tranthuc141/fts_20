Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'exams#index', as: :authenticated_root
  end
  root to: 'static_pages#home'

  resources :users, only: :show
  resources :exams do
    resources :results, only: [:show, :create]
  end
  
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :questions, except: :index
    resources :courses
  end
end
