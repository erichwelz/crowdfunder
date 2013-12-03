Crowdfunder::Application.routes.draw do


	resources :sessions

	resources :users 

  get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  resources :projects 
  resources :categories, only: [:new, :create]
  root :to => "projects#index"
 end
