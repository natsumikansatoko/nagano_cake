Rails.application.routes.draw do
  
  devise_for :customers
  devise_for :admins
  
  namespace :admin do
   
  end
  
  root 'homes#top'
  get '/about' => 'homes#about'
  resources :items, only: [:index, :show]
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
