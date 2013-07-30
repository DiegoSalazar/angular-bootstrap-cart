CartBootstrap::Application.routes.draw do
  resources :carts

  root :to => 'products#new'
end
