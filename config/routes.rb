  Rails.application.routes.draw do
  resources :canvas
  resources :addresses do
      get 'autocomplete', on: :collection
    end
  resources :mainposts
  resources :comments
  resources :likes
  root to: 'visitors#index'
  match "about" => "pages#about", as: :about, via: :get


  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { registrations: 'registrations', confirmations: 'confirmations'}
    root 'home#index'
    resources :personal_messages, only: [:create, :new]
    resources :conversations, only: [:index, :show]
    resources :users
    resources :groups do
      get 'autocomplete', on: :collection
    end
    resources :tasks
    resources :companies
    resources :events do
    get 'destroy_all', on: :collection
    end
    resources :recurring_events
    resources :projects do
       get 'resources', on: :collection
       get 'description', on: :collection
       get 'budget', on: :collection
       get 'requirements', on: :collection
       get 'projected_start_time', on: :collection
       get 'actual_finshed_time', on: :collection
       get 'development', on: :collection
       get 'maintenance', on: :collection
       get 'technology', on: :collection
       get 'business', on: :collection
       get 'autocomplete', on: :collection
    end

    resources :touches
    resources :leads
    resources :deals do
      resources :posts
      resources :issues
      resources :comments
      get 'autocomplete', on: :collection
    end
    match "users/settheme" => "users#set_theme", as: :set_theme, via: :get
    match "users/sharegroups" => "users#sharegroups", as: :sharegroups, via: :post
    match "search" => "search#create", as: :searches, via: [:get, :post]
    match "search/prepare" => "search#prepare", as: :prepareshearch, via: :get
    get '/dashboard', to: 'dashboard#index'
    get '/dashboard/searchcontacts/', to: 'dashboard#contacts_search'
    match "touches/contact/:id" => "touches#contact", as: :contact_touches, via: [:get, :post]

    resources :properties do
     get 'category', on: :collection
     resources :posts
     resources :issues
     get 'autocomplete', on: :collection
    end

    resources :contacts do
      get 'autocomplete', on: :collection
      get 'searchname', on: :collection
      post 'inport', on: :collection
      get 'letter'=> 'contacts#letter'
    end

  end

