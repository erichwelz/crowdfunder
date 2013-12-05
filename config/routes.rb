Crowdfunder::Application.routes.draw do

  get "reviews/show"
  get "reviews/new"
  get "reviews/edit"
	resources :projects do 
	  resources :contributions, :except => [:index]
    resources :reviews, :except => [:index]
  end
	
  resources :sessions
  resources :users
  resources :categories, only: [:new, :create]

  get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  

  root :to => "projects#index"
 end
