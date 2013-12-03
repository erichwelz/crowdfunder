Crowdfunder::Application.routes.draw do

  resources :projects 
  resources :categories, only: [:new, :create]
  root :to => "projects#index"
 end
