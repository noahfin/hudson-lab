Rails.application.routes.draw do


  # root to: 'visitors#index'
  devise_for :users
  resources :users
    authenticated do
    get 'contacts/index', to: 'contacts#index', as: 'contacts'
         root 'contacts#index'

  end
end
