Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  namespace :trainee do
    resources :users, only: [:show]
    get "/members", to: "users#all_users"
  end
  namespace :supervisor do
    resources :courses
    resources :users
  end
end
