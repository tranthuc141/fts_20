Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'exams#index', as: :authenticated_root
  end
  root to: 'static_pages#home'

  resources :users
  resources :exams do
    resources :results
  end
  
  namespace :admin do
    resources :users
    resources :questions
    resources :courses
  end
end
