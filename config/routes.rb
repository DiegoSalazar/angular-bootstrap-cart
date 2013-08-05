CartBootstrap::Application.routes.draw do
  get "cart_items/update"
  resources :variants

  resources :carts do
    resources :cart_items, only: [:update, :create, :show, :destroy]
  end

  root :to => 'products#new'
end
