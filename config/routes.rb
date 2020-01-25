Rails.application.routes.draw do
#get 'orders/new'
 # post 'orders/create'
  #get 'orders/:id/show', to: 'orders#show'
  resources :orders, :only => [:show, :new, :create]
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
