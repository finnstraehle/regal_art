Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/discovery", to: "pages#discovery", as: :discovery
end
