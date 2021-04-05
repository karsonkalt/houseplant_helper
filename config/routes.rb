Rails.application.routes.draw do

  resources :users, only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :plants do
      resources :waterings
    end
  end

  resources :species, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

end
