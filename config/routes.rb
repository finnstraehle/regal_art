Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/discovery", to: "pages#discovery", as: :discovery

  resources :events, only: %i[index show new create edit update destroy]
  resources :subscriptions, only: %i[index create destroy]
  resources :users, only: %i[index show]
end
