Rails.application.routes.draw do

  root 'sessions#index'

  resources :users, shallow: true, only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :plants, shallow: true do
      resources :waterings, shallow: true
    end
  end

  resources :species, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'

end
