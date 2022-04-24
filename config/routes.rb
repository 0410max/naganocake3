Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:edit,:create,:update,:show] do 
      get :search, on: :collection
    end
  end
  namespace :end_user do
    resources :customers,only:[:show,:edit,:update]
    get 'customer/confirm' => 'customers#confirm'
    patch 'customer/unsubscribe' => 'customers#unsubscribe'
    resources :items,only:[:index,:show] do 
      get :search, on: :collection
    end
    resources :cart_items,only:[:index,:update,:destroy,:create]
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  scope module: :end_user do
    root 'homes#top'
    get 'items' => 'items#index'

  end
end