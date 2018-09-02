Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  namespace :trainee do
    resources :users, only: [:show]
    get "/members", to: "users#all_users"
  end
  namespace :supervisor do
    resources :courses do
      resources :subjects do
        patch "/finish", to: "subjects#finish"
      end
      patch "/finish", to: "courses#finish"
    end
    resources :users
    get "/supervisors", to: "users#all_supervisors"
  end
end
