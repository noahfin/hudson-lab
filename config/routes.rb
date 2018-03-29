Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
    authenticated do
      resources :contacts, except: [:show] do

          get 'autocomplete', on: :collection

      end

      post '/groups', to: 'groups#create'
      root 'contacts#index'
  end
end
