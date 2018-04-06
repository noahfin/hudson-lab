Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { registrations: 'registrations' }

  authenticated do
     root 'home#index'
     resources :users
     resources :groups
     get'/dashboard', to: 'dashboard#index'

    resources :contacts do
      get 'autocomplete', on: :collection
    end
  end
end
