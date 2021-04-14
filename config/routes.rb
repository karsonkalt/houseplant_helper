Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  root 'home#index'

  resources :users, shallow: true, only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :plants, shallow: true do
      resources :waterings, shallow: true
    end
  end

  resources :species, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/signup', to: 'users#new'

end
