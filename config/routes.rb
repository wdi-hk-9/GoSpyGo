Rails.application.routes.draw do

  get '/', to: "users#index"

  resources :users, only: [:index, :show] do
    resources :sensors, only: [:index, :show] do
      resources :readings, only: [:index, :show, :new, :create]
    end
  end


end
