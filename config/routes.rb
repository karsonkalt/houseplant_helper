Rails.application.routes.draw do

  resources :users do
    resources :plants do
      resouces :waterings
    end
  end

  resources :species, only: [:index, :show]

end
