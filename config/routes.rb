Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/artist_dashboard", to: "pages#artist_dashboard", as: :artist_dashboard
  get "/discover", to: "users#discover", as: :discover
  get "/analytics", to: "pages#analytics", as: :analytics
  get "/subscribers", to: "subscriptions#subscribers", as: :subscribers
  get "/edit_portfolio", to: "pages#edit_portfolio", as: :edit_portfolio
  get "/my_events", to: "events#my_events", as: :my_events
  get "/joined_events", to: "events#joined_events", as: :joined_events
  get "/canvas", to: "artworks#canvas", as: :canvas

  resources :events do
    resources :event_attendances, only: %i[new create]
  end
  resources :event_attendances, only: %i[index show destroy]
  resources :subscriptions, only: %i[index]
  resources :artworks, only: %i[index new create edit update destroy]
  resources :users, only: %i[index show] do
    resources :subscriptions, only: %i[create]
    resources :conversations, only: %i[create]
  end
  resources :subscriptions, only: %i[destroy]
  resources :conversations, only: %i[index show create] do
    resources :messages, only: %i[create]
  end
end
