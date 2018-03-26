Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users
  resources :users
    authenticated do
      resources :contacts, except: [:show]

      root 'contacts#index'
  end
end
