  Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }

  authenticated do
    root 'home#index'
    resources :users
    resources :groups

    get'/dashboard', to: 'dashboard#index'

    resources :properties do
     get 'category', on: :collection
     resources :posts

      resources :issues


    end

    resources :contacts do
      get 'autocomplete', on: :collection
      post 'inport', on: :collection
    end
   end
  end

