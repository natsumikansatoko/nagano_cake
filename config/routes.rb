Rails.application.routes.draw do
  namespace :admin do
    get "/" => "homes#top"
    get "customers/:customer_id/orders" => "orders#index", as: "customer_orders"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end


  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get '/orders/thanks' => 'orders#thanks'
    post '/orders/confirm' => 'orders#confirm'
    resources :orders, only: [:new, :create, :index, :show]
    delete '/cart_items/:id' => 'cart_items#delete'
    delete '/cart_items/delete_all' => 'cart_items#delete_all'
    resources :cart_items, only: [:index, :update, :create]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resource :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
