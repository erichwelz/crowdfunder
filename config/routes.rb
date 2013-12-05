Crowdfunder::Application.routes.draw do


	resources :projects do 
    resources :contributions, :except => [:index]
    resources :reviews, :except => [:index]
    resources :breakpoints, :except => [:index]
  end


	
  resources :sessions
  resources :users
  resources :categories, only: [:new, :create]

  get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  

  root :to => "projects#index"
 end
