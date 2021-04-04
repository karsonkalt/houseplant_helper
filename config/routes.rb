Rails.application.routes.draw do

  resources :users do
    resources :plants do
      resouces :waterings
    end
  end

  resources :species, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
