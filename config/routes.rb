Rails.application.routes.draw do

  root to: 'services#index'

  resources :services do
  	get "delete"
  end  

  resources :products do
	  get "delete"
	end

  resources :resumes do
    get "delete"
  end

  #match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
