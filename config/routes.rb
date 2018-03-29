Rails.application.routes.draw do


  get 'dashboard/index'

  get 'home/index'

  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
    authenticated do
      resources :contacts, except: [:show] do

          get 'autocomplete', on: :collection

      end

      get'/dashboard', to: 'dashboard#index'
      post '/groups', to: 'groups#create'
      root 'home#index'
  end
end
