Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    get 'users/artist_sign_up', to: 'devise/registrations#new_artist'
  end
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/discover", to: "pages#discover", as: :discover

  resources :events, only: %i[index show new create edit update destroy]
  resources :subscriptions, only: %i[index create destroy]
  resources :users, only: %i[index show]
end
