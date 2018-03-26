Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users
  resources :users
    authenticated do
    get 'contacts/index', to: 'contacts#index', as: 'contacts'
    get 'contacts/new', as: 'new_contact'
         root 'contacts#index'
   post '/contacts/index', to: 'contacts#create'

  end
end
