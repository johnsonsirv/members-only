Rails.application.routes.draw do
  root 'users#index'
	
	get 		'/signup', to: 'users#new'
	get 		'/login', to: 'sessions#new'
	post 		'/login', to: 'sessions#create'
	delete 	'/logout', to: 'sessions#destroy'
	
	resources :users, only: [:new, :create]
	resources :posts, only: [:index, :new, :create, :destroy]
end
