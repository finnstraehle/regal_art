Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_scope :user do
    get 'users/artist_sign_up', to: 'devise/registrations#new_artist'
  end
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/discover", to: "pages#discover", as: :discover
  get "/my_events", to: "events#my_events", as: :my_events

  resources :events
  resources :subscriptions, only: %i[index create destroy]
  resources :users, only: %i[index show]
  resources :conversations # please check this
end
