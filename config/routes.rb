Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpage#home"
  get '/signup',to: "users#new"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  
  get "users/:id/edit",to: "users#edit"

  namespace :admin do
    get "/home", to: "users#home"
    
    resources :users
    resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :answers
  end

  resources :users
  resources :sessions
  resources :categories
   
end

 

