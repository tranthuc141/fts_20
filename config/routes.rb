Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'

  resources :users
  resources :exams do
    resources :results
  end
  
  namespace :admin do
    resources :users
    resources :questions
    resources :text_questions
    resources :courses
  end
end
