Rails.application.routes.draw do

  root 'fluxes#index'

  get '/content', to: 'fluxes#content'

  put '/change', to: 'elements#changeStatus'
  get '/refresh', to: 'elements#refreshElements'

  resources :fluxes
  
  
  resources :elements do
    put :changeStatus
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
