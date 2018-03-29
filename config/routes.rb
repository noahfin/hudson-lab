Rails.application.routes.draw do



  root to: 'visitors#index'
    get'/dashboard', to: 'dashboard#index'
  devise_for :users, path: 'auth', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { registrations: 'registrations' }
  resources :users
    authenticated do
      resources :contacts, except: [:show] do

          get 'autocomplete', on: :collection

      end
      post '/groups', to: 'groups#create'

      root 'home#index'
  end
end
