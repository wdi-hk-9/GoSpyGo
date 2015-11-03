Rails.application.routes.draw do
  # resources :readings, only: [:index, :show, :new]

  resources :sensors, only: [:index, :show]

  resources :sensors, only: [:index, :show] do
    resources :readings, only: [:index, :show, :new, :create]
  end
  # get 'readings/index'

  # get 'readings/show'

  # get 'readings/new'

  # get 'sensors/index'

  # get 'sensors/show'

end
