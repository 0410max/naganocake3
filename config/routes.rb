Rails.application.routes.draw do
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  namespace :end_user do
    root 'homes#top'
  end
end

