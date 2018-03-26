Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users
  resources :users
    authenticated do
    get 'contacts/index', to: 'contacts#index', as: 'contacts'
    get 'contacts/new', as: 'new_contact'
    get 'contact/:id/edit', to: 'contacts#edit', as: 'edit_contact'
    post 'contacts/create', to: 'contacts#create', as: 'create_contact'
    patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'
    delete 'contacts/:id/destory', to: 'contacts#destroy', as: 'destroy_contact'

    root 'contacts#index'
  end
end
