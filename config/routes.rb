Crowdfunder::Application.routes.draw do

	resources :projects do 
	  resources :contributions, :except => [:index]
  end
	

	resources :sessions

resources :users 




  get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  
  resources :categories, only: [:new, :create]
  root :to => "projects#index"
 end
