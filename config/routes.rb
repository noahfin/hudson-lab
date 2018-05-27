  Rails.application.routes.draw do
  get 'tasks/index'

  get 'tasks/new'

  root to: 'visitors#index'

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }



    root 'home#index'
    resources :personal_messages, only: [:create, :new]
    resources :conversations, only: [:index, :show]
    resources :users


   resources :groups
    resources :tasks
    resources :touches
    resources :leads
    resources :deals
    match "users/settheme" => "users#set_theme", as: :set_theme, via: :get
    match "users/sharegroups" => "users#sharegroups", as: :sharegroups, via: :post
    match "search" => "search#create", as: :searches, via: [:get, :post]
    match "search/prepare" => "search#prepare", as: :prepareshearch, via: :get
    get'/dashboard', to: 'dashboard#index'
    match "touches/contact/:id" => "touches#contact", as: :contact_touches, via: [:get, :post]
    resources :properties do
     get 'category', on: :collection
     resources :posts

      resources :issues


    end

    resources :contacts do
      get 'autocomplete', on: :collection
      get 'searchname', on: :collection
      post 'inport', on: :collection
    end

  end

