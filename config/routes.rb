Rails.application.routes.draw do
	root to: "pages#home"
	get "profile/:id", as: :profile ,to: "profiles#show"
  	devise_for :users,controllers: {registrations: "registrations"}
  	resources :projects do
	  resources :project_users
	  resources :bugs
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
