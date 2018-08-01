Rails.application.routes.draw do

  root 'fluxes#index'

  resources :fluxes
  
  resources :elements do
    put :changeStatus
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
