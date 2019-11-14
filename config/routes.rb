Rails.application.routes.draw do
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpage#home"
  get '/signup',to: "users#new"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  
  resources :users
  resources :sessions
end

 

