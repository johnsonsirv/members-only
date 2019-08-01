Rails.application.routes.draw do
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only: [:new, :create]
	get '/login', to: 'sessions#new'
	
end
