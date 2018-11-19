Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
	  authenticated :user do
	    root to: 'dashboard#index'
	  end
	  unauthenticated do
	    root to: 'devise/sessions#new'
	  end
	end

  # keeping dashboard resource only to index since there is no other action that we need on dashboard
	resources :dashboard, only: [:index]

  # creating resources for todos
  resources :projects do
    resources :todos, only: [:new, :create, :edit, :update, :destroy]
  end

  # creating todos for projects 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
