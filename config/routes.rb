Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users
  resources :users
    authenticated do
     root 'contacts#index'
    get 'contacts/index', to: 'contacts#index'

  end
end
