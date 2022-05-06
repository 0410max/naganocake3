Rails.application.routes.draw do

  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/top'
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:edit,:create,:update,:show] do 
      get :search, on: :collection
    end
    resources :orders,only:[:index,:show,:update]
    resources :order_details,only:[:update]
  end

  scope module: :end_user do
    root 'homes#top'
    get 'items' => 'items#index'
    resources :customers,only:[:show,:edit,:update]
    post 'customer/confirm' => 'customers#confirm'
    patch 'customer/unsubscribe' => 'customers#unsubscribe'
    resources :items,only:[:index,:show] do 
      get :search, on: :collection
    end
    resources :cart_items,only:[:index,:update,:destroy,:create]
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders,only:[:new,:create]
  end

end
