Rails.application.routes.draw do

  root to: 'products#index'
  resources :orders, :only => [:show, :new, :create]
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
