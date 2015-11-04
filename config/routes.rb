Rails.application.routes.draw do

  get '/', to: "sessions#new"


  get '/login', to: "sessions#new"

  resources :sessions, only: [:new, :create, :destroy]


  resources :users, only: [:index, :show, :new, :create] do
    resources :sensors, only: [:index, :show] do
      resources :readings, only: [:index, :show, :new, :create]
    end
  end


end
