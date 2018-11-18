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

	resources :dashboard, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
