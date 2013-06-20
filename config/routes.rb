ActiveAdminFriendlyId::Application.routes.draw do
  root :to => 'posts#index'
  resources :posts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


end
