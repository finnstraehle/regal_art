Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/discovery", to: "pages#discovery", as: :discovery

  resources :subscriptions, only: [:index, :create]

  resources :artists, only: [:index, :show] do
    resources :artworks, only: [:index, :show]
      resources :art_details, only: [:index, :show]
  end

  resources :events, only: [:index, :show, :new, :create, :delete, :edit] do
    resources :event_attendances, only: [:create]
  end

  resources :conversations, only: :show do
    resources :messages, only: :create
  end
end
