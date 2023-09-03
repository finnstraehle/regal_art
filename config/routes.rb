Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_scope :user do
    get 'users/artist_sign_up', to: 'devise/registrations#new_artist'
  end
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/artist_dashboard", to: "pages#artist_dashboard", as: :artist_dashboard
  get "/discover", to: "pages#discover", as: :discover
  get "/analytics", to: "pages#analytics", as: :analytics
  get "/subscribers", to: "pages#subscribers", as: :subscribers
  get "/my_events", to: "events#my_events", as: :my_events

  resources :events do
    resources :event_attendances, only: %i[new create]
  end
  resources :event_attendances, only: %i[index show]
  resources :subscriptions, only: %i[index]
  resources :users, only: %i[index show] do
    resources :subscriptions, only: %i[create destroy]
  end
  resources :conversations, only: %i[index show create] do
    resources :messages, only: %i[create]
  end
end
