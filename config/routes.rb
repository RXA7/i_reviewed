Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'books#index' #MAL
 
 resources :books do #MAL
 	resources :notes, only: [:create, :destroy] #MAL
 end				 #MAL

 resources :sessions, only: [:new, :create, :detroy]

 get "/login" => "sessions#new", as: "login"
 delete "/logout" => "sessions#destroy", as: "logout" 
end
