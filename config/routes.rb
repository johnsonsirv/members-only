Rails.application.routes.draw do
  get 'posts/new'
  root 'users#new'
	
	get 		'/signup', to: 'users#new'
	get 		'/login', to: 'sessions#new'
	post 		'/login', to: 'sessions#create'
	delete 	'/logout', to: 'sessions#destroy'
	
	resources :users, only: [:new, :create]
end
