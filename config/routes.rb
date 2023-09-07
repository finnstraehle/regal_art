Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/artist_dashboard", to: "pages#artist_dashboard", as: :artist_dashboard
  get "/discover", to: "users#discover", as: :discover
  get "/analytics", to: "pages#analytics", as: :analytics
  get "/edit_portfolio", to: "pages#edit_portfolio", as: :edit_portfolio
  get "/my_events", to: "events#my_events", as: :my_events
  get "/joined_events", to: "events#joined_events", as: :joined_events
  get "/canvas", to: "artworks#canvas", as: :canvas
  get "/canvas/new", to: "artworks#new_canvas", as: :new_canvas
  get "/banners", to: "artworks#banners", as: :banners
  post "/add_banner", to: "users#add_banner", as: :add_banner
  delete "/delete_banner/:id", to: "users#delete_banner", as: :delete_banner

  resources :events do
    resources :event_attendances, only: %i[new create]
  end
  resources :event_attendances, only: %i[index show destroy]
  resources :subscriptions, only: %i[index]
  resources :subscriber_groups, only: %i[index show create destroy] do
    post "/new_broadcast", to: "subscriber_groups#new_broadcast", as: :new_broadcast
  end
  resources :artworks, only: %i[index new create update destroy]
  resources :artworks, only: %i[edit] do
    resources :art_details, only: %i[update create destroy]
  end
  resources :users, only: %i[index show update] do
    resources :subscriptions, only: %i[create]
    resources :conversations, only: %i[create]
    resources :preferences, only: %i[create]
    member do
      get :preferences
    end
  end
  resources :subscriptions, only: %i[destroy]
  resources :conversations, only: %i[index show create] do
    resources :messages, only: %i[create]
  end
end
