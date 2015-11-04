Rails.application.routes.draw do

  get '/', to: "users#new"

  get '/login', to: "users#new"

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:index, :show, :new, :create] do
    resources :sensors, only: [:index, :show] do
      resources :readings, only: [:index, :show, :new, :create]
    end
  end


end
