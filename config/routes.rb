Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :end_user do
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  scope module: :end_user do
    root 'homes#top'
  end
end